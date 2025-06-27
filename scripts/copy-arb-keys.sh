#!/bin/bash

# Script to distribute keys from bootnode-2 to all *-2 directories
# Uses pubkeys.json as source of truth and copies all related files
# Processes one directory at a time with individual confirmation

# Base directory paths
BASE_DIR="ansible/inventories/devnet-2/files/validator_keys"
SOURCE_DIR="$BASE_DIR/bootnode-2"

# Source subdirectories in bootnode-2 that contain keys
SOURCE_SUBDIRS=(
    "keys"
    "lodestar-secrets" 
    "nimbus-keys"
    "prysm"
    "secrets"
    "teku-keys"
    "teku-secrets"
)

# Check if we're in the right directory
if [ ! -d "$BASE_DIR" ]; then
    echo "Error: Cannot find $BASE_DIR"
    echo "Please run this script from the project root directory"
    exit 1
fi

# Check if pubkeys.json exists
if [ ! -f "$SOURCE_DIR/pubkeys.json" ]; then
    echo "Error: Cannot find $SOURCE_DIR/pubkeys.json"
    exit 1
fi

# Find all target directories ending with -2
echo "Scanning for target directories..."
TARGET_DIRS=($(find "$BASE_DIR" -maxdepth 1 -type d -name "*-2" | grep -v bootnode-2 | sort))

echo "Found ${#TARGET_DIRS[@]} target directories ending with -2"
echo

# Read pubkeys from JSON
echo "Reading keys from pubkeys.json..."
PUBKEYS=($(jq -r '.[]' "$SOURCE_DIR/pubkeys.json"))

echo "Found ${#PUBKEYS[@]} keys in pubkeys.json"
echo "Will distribute 4 keys to each directory"
echo

# Ask for global approval
echo "Do you want to approve all operations without individual prompts?"
read -p "Type 'all' to approve everything, or press Enter for individual confirmations: " -r
echo

if [[ $REPLY == "all" ]]; then
    APPROVE_ALL=true
    echo "✓ Auto-approving all operations"
else
    APPROVE_ALL=false
    echo "Will ask for confirmation for each directory"
fi
echo

# Function to find all files for a given pubkey
find_key_files() {
    local pubkey="$1"
    local files_found=()
    
    for subdir in "${SOURCE_SUBDIRS[@]}"; do
        subdir_path="$SOURCE_DIR/$subdir"
        if [ -d "$subdir_path" ]; then
            # Check for direct files matching this pubkey
            for file in "$subdir_path"/*; do
                if [ -f "$file" ]; then
                    filename=$(basename "$file")
                    # Check if this file contains or matches the pubkey
                    if [[ "$filename" == *"$pubkey"* ]]; then
                        files_found+=("$subdir:$filename")
                    fi
                fi
            done
            
            # Check for subdirectories matching this pubkey (for keys/nimbus-keys)
            for keydir in "$subdir_path"/*; do
                if [ -d "$keydir" ]; then
                    keydir_name=$(basename "$keydir")
                    # Check if this directory matches the pubkey
                    if [[ "$keydir_name" == *"$pubkey"* ]]; then
                        # Add all files in this keydir
                        for file in "$keydir"/*; do
                            if [ -f "$file" ]; then
                                filename=$(basename "$file")
                                files_found+=("$subdir/$keydir_name:$filename")
                            fi
                        done
                    fi
                fi
            done
        fi
    done
    
    printf '%s\n' "${files_found[@]}"
}

# Process each directory individually
key_index=0
total_files_copied=0
directories_processed=0

for ((dir_index=0; dir_index<${#TARGET_DIRS[@]}; dir_index++)); do
    target_dir="${TARGET_DIRS[$dir_index]}"
    target_name=$(basename "$target_dir")
    
    echo "============================================"
    echo "Directory $((dir_index + 1)) of ${#TARGET_DIRS[@]}: $target_name"
    echo "============================================"
    
    # Get 4 keys for this directory
    dir_keys=()
    for ((i=0; i<4; i++)); do
        if [ $key_index -lt ${#PUBKEYS[@]} ]; then
            dir_keys+=("${PUBKEYS[$key_index]}")
            ((key_index++))
        fi
    done
    
    if [ ${#dir_keys[@]} -eq 0 ]; then
        echo "No keys available for this directory."
        echo
        continue
    fi
    
    # Show what will be copied to this directory
    echo "Keys to copy to $target_name:"
    echo
    
    for pubkey in "${dir_keys[@]}"; do
        echo "Key: $pubkey"
        
        # Find all files for this pubkey
        file_count=0
        while IFS= read -r file_info; do
            if [ -n "$file_info" ]; then
                subdir=$(echo "$file_info" | cut -d: -f1)
                filename=$(echo "$file_info" | cut -d: -f2)
                echo "  FROM: $SOURCE_DIR/$subdir/$filename"
                echo "  TO:   $target_dir/$subdir/$filename"
                ((file_count++))
            fi
        done < <(find_key_files "$pubkey")
        
        if [ $file_count -eq 0 ]; then
            echo "  Warning: No files found for this key"
        fi
        echo
    done
    
    # Ask for confirmation for this directory (unless auto-approved)
    if [ "$APPROVE_ALL" = true ]; then
        echo "Auto-approving copy to $target_name"
    else
        read -p "Copy these ${#dir_keys[@]} keys to $target_name? [y/N/q] (q to quit) " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[Qq]$ ]]; then
            echo "Exiting..."
            break
        elif [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Skipped $target_name"
            echo
            continue
        fi
    fi
    
    # Perform the copying for this directory
    echo "Copying to $target_name..."
    
    # Create the target directory if it doesn't exist
    mkdir -p "$target_dir"
    
    dir_files_copied=0
    
    # Copy all files for each key
    for pubkey in "${dir_keys[@]}"; do
        echo "  Processing key: $pubkey"
        
        # Find and copy all files for this pubkey
        while IFS= read -r file_info; do
            if [ -n "$file_info" ]; then
                subdir=$(echo "$file_info" | cut -d: -f1)
                filename=$(echo "$file_info" | cut -d: -f2)
                
                src_path="$SOURCE_DIR/$subdir/$filename"
                dest_subdir="$target_dir/$subdir"
                dest_path="$dest_subdir/$filename"
                
                # Create destination subdirectory if needed
                mkdir -p "$dest_subdir"
                
                if [ -f "$src_path" ]; then
                    echo "    Copying: $filename (to $subdir/)"
                    cp "$src_path" "$dest_path"
                    ((dir_files_copied++))
                    ((total_files_copied++))
                else
                    echo "    Warning: $src_path not found, skipping"
                fi
            fi
        done < <(find_key_files "$pubkey")
    done
    
    echo "✓ Completed $target_name (copied ${#dir_keys[@]} keys, $dir_files_copied files)"
    ((directories_processed++))
    echo
done

echo "============================================"
echo "SUMMARY"
echo "============================================"
echo "Processed: $directories_processed/${#TARGET_DIRS[@]} directories"
echo "Total files copied: $total_files_copied"
echo "Keys used: $key_index/${#PUBKEYS[@]}"

# Handle remaining keys - copy to bootnode-1
remaining_keys=$((${#PUBKEYS[@]} - key_index))
if [ $remaining_keys -gt 0 ]; then
    echo
    echo "============================================"
    echo "REMAINING KEYS: Copy to bootnode-1"
    echo "============================================"
    echo "Found $remaining_keys remaining keys to copy to bootnode-1"
    echo
    
    # Check if bootnode-1 exists
    bootnode1_dir="$BASE_DIR/bootnode-1"
    if [ ! -d "$bootnode1_dir" ]; then
        echo "bootnode-1 directory doesn't exist. Creating it..."
        mkdir -p "$bootnode1_dir"
    fi
    
    echo "Remaining keys to copy to bootnode-1:"
    echo
    
    # Show remaining keys
    remaining_key_files=0
    for ((i=key_index; i<${#PUBKEYS[@]}; i++)); do
        pubkey="${PUBKEYS[$i]}"
        echo "Key: $pubkey"
        
        # Find all files for this pubkey
        while IFS= read -r file_info; do
            if [ -n "$file_info" ]; then
                subdir=$(echo "$file_info" | cut -d: -f1)
                filename=$(echo "$file_info" | cut -d: -f2)
                echo "  FROM: $SOURCE_DIR/$subdir/$filename"
                echo "  TO:   $bootnode1_dir/$subdir/$filename"
                ((remaining_key_files++))
            fi
        done < <(find_key_files "$pubkey")
        echo
    done
    
    # Ask for confirmation for bootnode-1 (unless auto-approved)
    if [ "$APPROVE_ALL" = true ]; then
        echo "Auto-approving copy to bootnode-1"
        proceed_bootnode1=true
    else
        read -p "Copy these $remaining_keys keys to bootnode-1? [y/N] " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            proceed_bootnode1=true
        else
            proceed_bootnode1=false
        fi
    fi
    
    if [ "$proceed_bootnode1" = true ]; then
        echo "Copying remaining keys to bootnode-1..."
        
        bootnode1_files_copied=0
        
        # Copy all remaining keys
        for ((i=key_index; i<${#PUBKEYS[@]}; i++)); do
            pubkey="${PUBKEYS[$i]}"
            echo "  Processing key: $pubkey"
            
            # Find and copy all files for this pubkey
            while IFS= read -r file_info; do
                if [ -n "$file_info" ]; then
                    subdir=$(echo "$file_info" | cut -d: -f1)
                    filename=$(echo "$file_info" | cut -d: -f2)
                    
                    src_path="$SOURCE_DIR/$subdir/$filename"
                    dest_subdir="$bootnode1_dir/$subdir"
                    dest_path="$dest_subdir/$filename"
                    
                    # Create destination subdirectory if needed
                    mkdir -p "$dest_subdir"
                    
                    if [ -f "$src_path" ]; then
                        echo "    Copying: $filename (to $subdir/)"
                        cp "$src_path" "$dest_path"
                        ((bootnode1_files_copied++))
                        ((total_files_copied++))
                    else
                        echo "    Warning: $src_path not found, skipping"
                    fi
                fi
            done < <(find_key_files "$pubkey")
        done
        
        # Create pubkeys.json for bootnode-1
        echo "  Creating pubkeys.json for bootnode-1..."
        remaining_pubkeys=()
        for ((i=key_index; i<${#PUBKEYS[@]}; i++)); do
            remaining_pubkeys+=("\"${PUBKEYS[$i]}\"")
        done
        
        # Join array elements with commas and create JSON
        IFS=','
        pubkeys_json="[${remaining_pubkeys[*]}]"
        IFS=' '
        
        echo "$pubkeys_json" > "$bootnode1_dir/pubkeys.json"
        
        echo "✓ Completed bootnode-1 (copied $remaining_keys keys, $bootnode1_files_copied files)"
        echo "✓ Created pubkeys.json with $remaining_keys keys"
    else
        echo "Skipped bootnode-1"
    fi
fi