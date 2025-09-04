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
    size            = "ccx53"
  }
}

# Lighthouse
variable "lighthouse_geth" {
  default = {
    name            = "lighthouse-geth"
    count           = 0
    validator_start = 576
    validator_end   = 584
  }
}

variable "lighthouse_besu" {
  default = {
    name            = "lighthouse-besu"
    count           = 0
    validator_start = 584
    validator_end   = 592
  }
}

variable "lighthouse_nethermind" {
  default = {
    name            = "lighthouse-nethermind"
    count           = 0
    validator_start = 592
    validator_end   = 600
  }
}

variable "lighthouse_erigon" {
  default = {
    name            = "lighthouse-erigon"
    count           = 0
    validator_start = 600
    validator_end   = 608
  }
}

variable "lighthouse_reth" {
  default = {
    name            = "lighthouse-reth"
    count           = 0
    validator_start = 608
    validator_end   = 616
  }
}

variable "lighthouse_nimbusel" {
  default = {
    name            = "lighthouse-nimbusel"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Prysm
variable "prysm_geth" {
  default = {
    name            = "prysm-geth"
    count           = 0
    validator_start = 616
    validator_end   = 624
  }
}

variable "prysm_besu" {
  default = {
    name            = "prysm-besu"
    count           = 0
    validator_start = 624
    validator_end   = 632
  }
}

variable "prysm_nethermind" {
  default = {
    name            = "prysm-nethermind"
    count           = 0
    validator_start = 632
    validator_end   = 640
  }
}

variable "prysm_erigon" {
  default = {
    name            = "prysm-erigon"
    count           = 0
    validator_start = 640
    validator_end   = 648
  }
}

variable "prysm_reth" {
  default = {
    name            = "prysm-reth"
    count           = 0
    validator_start = 648
    validator_end   = 656
  }
}

variable "prysm_nimbusel" {
  default = {
    name            = "prysm-nimbusel"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Lodestar
variable "lodestar_geth" {
  default = {
    name            = "lodestar-geth"
    count           = 0
    validator_start = 656
    validator_end   = 664
  }
}

variable "lodestar_nethermind" {
  default = {
    name            = "lodestar-nethermind"
    count           = 0
    validator_start = 664
    validator_end   = 672
  }
}

variable "lodestar_besu" {
  default = {
    name            = "lodestar-besu"
    count           = 0
    validator_start = 672
    validator_end   = 680
  }
}

variable "lodestar_erigon" {
  default = {
    name            = "lodestar-erigon"
    count           = 0
    validator_start = 680
    validator_end   = 688
  }
}

variable "lodestar_reth" {
  default = {
    name            = "lodestar-reth"
    count           = 0
    validator_start = 688
    validator_end   = 696
  }
}

variable "lodestar_nimbusel" {
  default = {
    name            = "lodestar-nimbusel"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Nimbus
variable "nimbus_geth" {
  default = {
    name            = "nimbus-geth"
    count           = 0
    validator_start = 696
    validator_end   = 704
  }
}

variable "nimbus_besu" {
  default = {
    name            = "nimbus-besu"
    count           = 0
    validator_start = 704
    validator_end   = 712
  }
}

variable "nimbus_nethermind" {
  default = {
    name            = "nimbus-nethermind"
    count           = 0
    validator_start = 712
    validator_end   = 720
  }
}

variable "nimbus_erigon" {
  default = {
    name            = "nimbus-erigon"
    count           = 0
    validator_start = 720
    validator_end   = 728
  }
}

variable "nimbus_reth" {
  default = {
    name            = "nimbus-reth"
    count           = 0
    validator_start = 728
    validator_end   = 736
  }
}

variable "nimbus_nimbusel" {
  default = {
    name            = "nimbus-nimbusel"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

# Teku
variable "teku_geth" {
  default = {
    name            = "teku-geth"
    count           = 0
    validator_start = 736
    validator_end   = 744
  }
}

variable "teku_besu" {
  default = {
    name            = "teku-besu"
    count           = 0
    validator_start = 744
    validator_end   = 752
  }
}

variable "teku_nethermind" {
  default = {
    name            = "teku-nethermind"
    count           = 0
    validator_start = 752
    validator_end   = 760
  }
}

variable "teku_erigon" {
  default = {
    name            = "teku-erigon"
    count           = 0
    validator_start = 760
    validator_end   = 768
  }
}

variable "teku_reth" {
  default = {
    name            = "teku-reth"
    count           = 0
    validator_start = 768
    validator_end   = 776
  }
}

variable "teku_nimbusel" {
  default = {
    name            = "teku-nimbusel"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

#Grandine
variable "grandine_geth" {
  default = {
    name            = "grandine-geth"
    count           = 0
    validator_start = 776
    validator_end   = 784
  }
}

variable "grandine_besu" {
  default = {
    name            = "grandine-besu"
    count           = 0
    validator_start = 784
    validator_end   = 792
  }
}

variable "grandine_nethermind" {
  default = {
    name            = "grandine-nethermind"
    count           = 0
    validator_start = 792
    validator_end   = 800
  }
}

variable "grandine_erigon" {
  default = {
    name            = "grandine-erigon"
    count           = 0
    validator_start = 800
    validator_end   = 808
  }
}

variable "grandine_reth" {
  default = {
    name            = "grandine-reth"
    count           = 0
    validator_start = 808
    validator_end   = 816
  }
}

variable "grandine_nimbusel" {
  default = {
    name            = "grandine-nimbusel"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}