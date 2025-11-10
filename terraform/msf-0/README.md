# sepsf-0 Configuration

## Overview
sepsf-0 consists of 1500 nodes distributed across DigitalOcean and Hetzner cloud providers with a specific client distribution to test network diversity.

## Node Distribution

### Total Nodes: 1500
- **Hetzner ARM: 50 nodes** (validators 0-400)
  - 50 ARM fullnodes (8 validators each = 400 validators)

- **DigitalOcean: 1450 nodes** (validators 400-55,600)
  - 10 bootnodes (non-validating supernodes)
  - 140 supernodes (320 validators each = 44,800 validators)
  - 1300 fullnodes (8 validators each = 10,400 validators)

**Total validators: 55,600**

### Validator Range Organization:
1. **Hetzner ARM Fullnodes**: 0 → 400 (400 validators)
2. **DigitalOcean Supernodes**: 400 → 45,200 (44,800 validators)
3. **DigitalOcean Fullnodes**: 45,200 → 55,600 (10,400 validators)
   - Prysm, Nimbus, Lodestar, Grandine, **Lighthouse, Teku** (Lighthouse and Teku at end)

## Client Distribution

### Consensus Layer (CL) Distribution
| Client | Percentage | Node Count |
|--------|------------|------------|
| Lighthouse | 30% | 447 |
| Prysm | 30% | 447 |
| Teku | 15% | 225 |
| Nimbus | 10% | 149 |
| Lodestar | 7.5% | 112 |
| Grandine | 7.4% | 110 |
| **Total** | **100%** | **1490** |

### Execution Layer (EL) Distribution
| Client | Percentage | Node Count |
|--------|------------|------------|
| Geth | 30% | 449 |
| Nethermind | 30% | 449 |
| Besu | 20% | 295 |
| Erigon | 10% | 148 |
| Reth | 10% | 149 |
| **Total** | **100%** | **1490** |

*Note: NimbusEL has been removed from msf-0.*

## CL-EL Combination Matrix

| CL/EL | Geth | Nethermind | Besu | Erigon | Reth | Total |
|-------|------|------------|------|--------|------|-------|
| **Lighthouse** (447) | 135 | 135 | 89 | 44 | 44 | 447 |
| **Prysm** (447) | 135 | 135 | 89 | 44 | 44 | 447 |
| **Teku** (225) | 68 | 68 | 44 | 22 | 23 | 225 |
| **Nimbus** (149) | 45 | 45 | 30 | 15 | 14 | 149 |
| **Lodestar** (112) | 33 | 33 | 22 | 12 | 12 | 112 |
| **Grandine** (110) | 33 | 33 | 21 | 11 | 12 | 110 |
| **Total** | 449 | 449 | 295 | 148 | 149 | 1490 |

*Note: Bootnodes (10 nodes) are excluded from the percentage calculations as they are non-validating nodes.*

## CL-EL Combination Matrix (Full/Super Split)

### Supernodes (140 total, 320 validators each)

| CL/EL | Geth | Nethermind | Besu | Erigon | Reth | **Total** |
|-------|------|------------|------|--------|------|-----------|
| **Lighthouse** (42) | 13 | 13 | 8 | 4 | 4 | 42 |
| **Prysm** (42) | 13 | 13 | 8 | 4 | 4 | 42 |
| **Teku** (21) | 6 | 6 | 4 | 2 | 3 | 21 |
| **Nimbus** (14) | 4 | 4 | 3 | 2 | 1 | 14 |
| **Lodestar** (11) | 3 | 3 | 2 | 2 | 1 | 11 |
| **Grandine** (10) | 3 | 3 | 2 | 1 | 1 | 10 |
| **Total** | **42** | **42** | **27** | **15** | **14** | **140** |

### DigitalOcean Fullnodes (1300 total, 8 validators each)

| CL/EL | Geth | Nethermind | Besu | Erigon | Reth | **Total** |
|-------|------|------------|------|--------|------|-----------|
| **Lighthouse** (390) | 117 | 117 | 78 | 39 | 39 | 390 |
| **Prysm** (390) | 117 | 117 | 78 | 39 | 39 | 390 |
| **Teku** (196) | 59 | 59 | 39 | 20 | 19 | 196 |
| **Nimbus** (130) | 39 | 39 | 26 | 13 | 13 | 130 |
| **Lodestar** (97) | 29 | 29 | 19 | 10 | 10 | 97 |
| **Grandine** (97) | 29 | 29 | 19 | 10 | 10 | 97 |
| **Total** | **390** | **390** | **259** | **131** | **130** | **1300** |

### Hetzner ARM Fullnodes (50 total, 8 validators each)

| CL/EL | Geth | Nethermind | Besu | Erigon | Reth | **Total** |
|-------|------|------------|------|--------|------|-----------|
| **Lighthouse** (15) | 5 | 5 | 3 | 1 | 1 | 15 |
| **Prysm** (15) | 5 | 5 | 3 | 1 | 1 | 15 |
| **Teku** (8) | 3 | 3 | 1 | 0 | 1 | 8 |
| **Nimbus** (5) | 2 | 2 | 1 | 0 | 0 | 5 |
| **Lodestar** (4) | 1 | 1 | 1 | 0 | 1 | 4 |
| **Grandine** (3) | 1 | 1 | 0 | 0 | 1 | 3 |
| **Total** | **17** | **17** | **9** | **2** | **5** | **50** |

### Combined Totals (All 1490 validating nodes)

| CL/EL | Geth | Nethermind | Besu | Erigon | Reth | **Total** |
|-------|------|------------|------|--------|------|-----------|
| **Lighthouse** (447) | 135 | 135 | 89 | 44 | 44 | 447 |
| **Prysm** (447) | 135 | 135 | 89 | 44 | 44 | 447 |
| **Teku** (225) | 68 | 68 | 44 | 22 | 23 | 225 |
| **Nimbus** (149) | 45 | 45 | 30 | 15 | 14 | 149 |
| **Lodestar** (112) | 33 | 33 | 22 | 12 | 12 | 112 |
| **Grandine** (110) | 33 | 33 | 21 | 11 | 12 | 110 |
| **Total** | **449** | **449** | **295** | **148** | **149** | **1490** |

## Key Features

1. **Variable Validator Counts:**
   - Supernodes: 320 validators each
   - Fullnodes: 8 validators each
   - Bootnodes: 0 validators (non-validating)

2. **Even Region Distribution:**
   - Nodes are automatically distributed evenly across all available DigitalOcean regions
   - Regions include: nyc1, sgp1, lon1, nyc3, ams3, fra1, tor1, blr1, sfo3, syd1

3. **Supernode Detection:**
   - Nodes are automatically marked as supernodes based on:
     - Validator count (≥320 validators)
     - Name suffix containing "super"

4. **Infrastructure Sizing:**
   - Supernodes: `s-8vcpu-32gb-640gb-intel` (high performance with NVMe storage)
   - Fullnodes (DO): `s-8vcpu-16gb` (standard performance)
   - ARM Fullnodes (Hetzner): `cax11` (ARM shared CPU)
   - MEV Relay: `m3-8vcpu-64gb` (memory optimized)

5. **ARM Architecture Testing:**
   - 50 ARM-based fullnodes in Hetzner Cloud (validators 0-400)
   - Uses same client distribution as x86 nodes
   - Provides architecture diversity for client testing
   - Positioned at the beginning of validator range for easy identification

## Client Distribution Changes from Devnet-4

### Consensus Layer Updates:
- **Teku**: Increased from 10% to 15%
- **Lodestar**: Decreased from 10% to 7.5%
- **Grandine**: Decreased from 10% to 7.5%

### Execution Layer Updates:
- **NimbusEL**: Completely removed (was 1%)
- **Reth**: Increased from 9% to 10%
- All other EL clients maintain the same relative proportions

## Terraform Structure

```
terraform/msf-0/
├── README.md              # This file
├── main.tf               # Main terraform configuration
├── nodes.tf              # DigitalOcean node definitions
├── digitalocean.tf       # DigitalOcean provider and resources
├── ansible_inventory.tmpl # Ansible inventory template
└── hetzner/
    ├── main.tf          # Hetzner main configuration
    ├── nodes.tf         # Hetzner node definitions
    ├── hetzner.tf       # Hetzner provider configuration
    └── firewall.tf      # Hetzner firewall rules
```

## Deployment

To deploy this devnet:

1. Initialize terraform:
   ```bash
   cd terraform/msf-0
   terraform init
   ```

2. Review the planned changes:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

## Notes

- **Validator Range Organization**: ARM nodes (0-400) → Supernodes (400-45,200) → DO Fullnodes (45,200-55,600)
- The validator distribution ensures each node type has the appropriate number of validators
- Supernodes handle the bulk of validation (44,800 validators) with high-performance hardware
- Fullnodes provide network diversity with smaller validator sets (8 validators each)
- 50 ARM fullnodes in Hetzner replace 50 regular x86 fullnodes for architecture diversity testing
- **Special ordering**: Lighthouse and Teku DO fullnodes are positioned at the end of the validator range
- The configuration supports dynamic validator count allocation per node group
- NimbusEL execution client has been completely removed from the network configuration
- ARM nodes maintain the same client distribution ratios as x86 nodes