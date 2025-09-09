# HETZNER ARM MACHINES (50 nodes with 8 validators each = 400 validators)
# Starting validator index: 0

# Bootnode
variable "bootnode" {
  default = {
    name            = "bootnode"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "mev_relay" {
  default = {
    name            = "mev-relay"
    count           = 1
    validator_start = 0
    validator_end   = 0
    size            = "ccx63"
  }
}

# Lighthouse (15 machines)
variable "lighthouse_geth" {
  default = {
    name            = "lighthouse-geth"
    count           = 5
    validator_start = 0
    validator_end   = 40
  }
}

variable "lighthouse_nethermind" {
  default = {
    name            = "lighthouse-nethermind"
    count           = 5
    validator_start = 40
    validator_end   = 80
  }
}

variable "lighthouse_besu" {
  default = {
    name            = "lighthouse-besu"
    count           = 3
    validator_start = 80
    validator_end   = 104
  }
}

variable "lighthouse_erigon" {
  default = {
    name            = "lighthouse-erigon"
    count           = 1
    validator_start = 104
    validator_end   = 112
  }
}

variable "lighthouse_reth" {
  default = {
    name            = "lighthouse-reth"
    count           = 1
    validator_start = 112
    validator_end   = 120
  }
}

# Prysm (15 machines)
variable "prysm_geth" {
  default = {
    name            = "prysm-geth"
    count           = 5
    validator_start = 120
    validator_end   = 160
  }
}

variable "prysm_nethermind" {
  default = {
    name            = "prysm-nethermind"
    count           = 5
    validator_start = 160
    validator_end   = 200
  }
}

variable "prysm_besu" {
  default = {
    name            = "prysm-besu"
    count           = 3
    validator_start = 200
    validator_end   = 224
  }
}

variable "prysm_erigon" {
  default = {
    name            = "prysm-erigon"
    count           = 1
    validator_start = 224
    validator_end   = 232
  }
}

variable "prysm_reth" {
  default = {
    name            = "prysm-reth"
    count           = 1
    validator_start = 232
    validator_end   = 240
  }
}

# Teku (8 machines)
variable "teku_geth" {
  default = {
    name            = "teku-geth"
    count           = 3
    validator_start = 240
    validator_end   = 264
  }
}

variable "teku_nethermind" {
  default = {
    name            = "teku-nethermind"
    count           = 3
    validator_start = 264
    validator_end   = 288
  }
}

variable "teku_besu" {
  default = {
    name            = "teku-besu"
    count           = 1
    validator_start = 288
    validator_end   = 296
  }
}

variable "teku_reth" {
  default = {
    name            = "teku-reth"
    count           = 1
    validator_start = 296
    validator_end   = 304
  }
}

# Nimbus (5 machines)
variable "nimbus_geth" {
  default = {
    name            = "nimbus-geth"
    count           = 2
    validator_start = 304
    validator_end   = 320
  }
}

variable "nimbus_nethermind" {
  default = {
    name            = "nimbus-nethermind"
    count           = 2
    validator_start = 320
    validator_end   = 336
  }
}

variable "nimbus_besu" {
  default = {
    name            = "nimbus-besu"
    count           = 1
    validator_start = 336
    validator_end   = 344
  }
}

# Lodestar (4 machines)
variable "lodestar_geth" {
  default = {
    name            = "lodestar-geth"
    count           = 1
    validator_start = 344
    validator_end   = 352
  }
}

variable "lodestar_nethermind" {
  default = {
    name            = "lodestar-nethermind"
    count           = 1
    validator_start = 352
    validator_end   = 360
  }
}

variable "lodestar_besu" {
  default = {
    name            = "lodestar-besu"
    count           = 1
    validator_start = 360
    validator_end   = 368
  }
}

variable "lodestar_reth" {
  default = {
    name            = "lodestar-reth"
    count           = 1
    validator_start = 368
    validator_end   = 376
  }
}

# Grandine (3 machines)
variable "grandine_geth" {
  default = {
    name            = "grandine-geth"
    count           = 1
    validator_start = 376
    validator_end   = 384
  }
}

variable "grandine_nethermind" {
  default = {
    name            = "grandine-nethermind"
    count           = 1
    validator_start = 384
    validator_end   = 392
  }
}

variable "grandine_reth" {
  default = {
    name            = "grandine-reth"
    count           = 1
    validator_start = 392
    validator_end   = 400
  }
}