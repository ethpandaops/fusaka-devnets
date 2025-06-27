#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"
VALIDATOR_KEYS_DIR="$BASE_DIR/ansible/inventories/devnet-2/files/validator_keys"
WALLET_PASS_FILE="$VALIDATOR_KEYS_DIR/prysm_wallet_pass.txt"

echo "Starting Prysm validator key import process..."
echo "Base directory: $BASE_DIR"
echo "Validator keys directory: $VALIDATOR_KEYS_DIR"

for prysm_dir in "$VALIDATOR_KEYS_DIR"/prysm-*-2; do
    if [ -d "$prysm_dir" ]; then
        echo ""
        echo "Processing directory: $(basename "$prysm_dir")"
        
        keys_dir="$prysm_dir/keys"
        secrets_dir="$prysm_dir/secrets"
        wallet_dir="$prysm_dir/prysm"
        
        if [ ! -d "$keys_dir" ]; then
            echo "  Warning: Keys directory not found: $keys_dir"
            continue
        fi
        
        if [ ! -d "$secrets_dir" ]; then
            echo "  Warning: Secrets directory not found: $secrets_dir"
            continue
        fi
        
        echo "  Keys directory: $keys_dir"
        echo "  Secrets directory: $secrets_dir"
        echo "  Wallet directory: $wallet_dir"
        
        for key_dir in "$keys_dir"/*; do
            if [ -d "$key_dir" ]; then
                key_name=$(basename "$key_dir")
                account_password_file="$secrets_dir/$key_name"
                
                if [ ! -f "$account_password_file" ]; then
                    echo "    Warning: Account password file not found: $account_password_file"
                    continue
                fi
                
                echo "    Importing key: $key_name"
                echo "      Key directory: $key_dir"
                echo "      Account password file: $account_password_file"
                
                "$SCRIPT_DIR/prysm.sh" validator accounts import \
                    --keys-dir "$key_dir" \
                    --wallet-dir "$wallet_dir" \
                    --accept-terms-of-use \
                    --wallet-password-file "$WALLET_PASS_FILE" \
                    --account-password-file "$account_password_file"
                
                if [ $? -eq 0 ]; then
                    echo "       Successfully imported $key_name"
                else
                    echo "       Failed to import $key_name"
                fi
            fi
        done
    fi
done

echo ""
echo "Prysm validator key import process completed!"