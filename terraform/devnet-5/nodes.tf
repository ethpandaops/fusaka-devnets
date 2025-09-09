# Bootnodes (10 non-validating supernodes in DigitalOcean)
variable "bootnode" {
  default = {
    name            = "bootnode"
    count           = 10
    validator_start = 0
    validator_end   = 0
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "mev_relay" {
  default = {
    name            = "mev-relay"
    count           = 0
    validator_start = 0
    validator_end   = 0
    size            = "m3-8vcpu-64gb"
  }
}

# SUPERNODES (140 nodes with 320 validators each = 44,800 validators)
# Starting validator index: 400
# New consensus distribution: Lighthouse 30%, Prysm 30%, Teku 15%, Nimbus 10%, Lodestar 7.5%, Grandine 7.5%

# Lighthouse Supernodes (30% of 140 = 42 supernodes)
variable "lighthouse_geth_super" {
  default = {
    name            = "lighthouse-geth-super"
    count           = 13
    validator_start = 400
    validator_end   = 4560
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "lighthouse_nethermind_super" {
  default = {
    name            = "lighthouse-nethermind-super"
    count           = 13
    validator_start = 4560
    validator_end   = 8720
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "lighthouse_besu_super" {
  default = {
    name            = "lighthouse-besu-super"
    count           = 8
    validator_start = 8720
    validator_end   = 11280
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "lighthouse_erigon_super" {
  default = {
    name            = "lighthouse-erigon-super"
    count           = 4
    validator_start = 11280
    validator_end   = 12560
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "lighthouse_reth_super" {
  default = {
    name            = "lighthouse-reth-super"
    count           = 4
    validator_start = 12560
    validator_end   = 13840
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

# Prysm Supernodes (30% of 140 = 42 supernodes)
variable "prysm_geth_super" {
  default = {
    name            = "prysm-geth-super"
    count           = 13
    validator_start = 13840
    validator_end   = 18000
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "prysm_nethermind_super" {
  default = {
    name            = "prysm-nethermind-super"
    count           = 13
    validator_start = 18000
    validator_end   = 22160
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "prysm_besu_super" {
  default = {
    name            = "prysm-besu-super"
    count           = 8
    validator_start = 22160
    validator_end   = 24720
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "prysm_erigon_super" {
  default = {
    name            = "prysm-erigon-super"
    count           = 4
    validator_start = 24720
    validator_end   = 26000
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "prysm_reth_super" {
  default = {
    name            = "prysm-reth-super"
    count           = 4
    validator_start = 26000
    validator_end   = 27280
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

# Teku Supernodes (15% of 140 = 21 supernodes)
variable "teku_geth_super" {
  default = {
    name            = "teku-geth-super"
    count           = 6
    validator_start = 27280
    validator_end   = 29200
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "teku_nethermind_super" {
  default = {
    name            = "teku-nethermind-super"
    count           = 6
    validator_start = 29200
    validator_end   = 31120
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "teku_besu_super" {
  default = {
    name            = "teku-besu-super"
    count           = 4
    validator_start = 31120
    validator_end   = 32400
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "teku_erigon_super" {
  default = {
    name            = "teku-erigon-super"
    count           = 2
    validator_start = 32400
    validator_end   = 33040
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "teku_reth_super" {
  default = {
    name            = "teku-reth-super"
    count           = 3
    validator_start = 33040
    validator_end   = 34000
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

# Nimbus Supernodes (10% of 140 = 14 supernodes)
variable "nimbus_geth_super" {
  default = {
    name            = "nimbus-geth-super"
    count           = 4
    validator_start = 34000
    validator_end   = 35280
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "nimbus_nethermind_super" {
  default = {
    name            = "nimbus-nethermind-super"
    count           = 4
    validator_start = 35280
    validator_end   = 36560
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "nimbus_besu_super" {
  default = {
    name            = "nimbus-besu-super"
    count           = 3
    validator_start = 36560
    validator_end   = 37520
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "nimbus_erigon_super" {
  default = {
    name            = "nimbus-erigon-super"
    count           = 2
    validator_start = 37520
    validator_end   = 38160
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "nimbus_reth_super" {
  default = {
    name            = "nimbus-reth-super"
    count           = 1
    validator_start = 38160
    validator_end   = 38480
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

# Lodestar Supernodes (7.5% of 140 = 11 supernodes)
variable "lodestar_geth_super" {
  default = {
    name            = "lodestar-geth-super"
    count           = 3
    validator_start = 38480
    validator_end   = 39440
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "lodestar_nethermind_super" {
  default = {
    name            = "lodestar-nethermind-super"
    count           = 3
    validator_start = 39440
    validator_end   = 40400
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "lodestar_besu_super" {
  default = {
    name            = "lodestar-besu-super"
    count           = 2
    validator_start = 40400
    validator_end   = 41040
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "lodestar_erigon_super" {
  default = {
    name            = "lodestar-erigon-super"
    count           = 2
    validator_start = 41040
    validator_end   = 41680
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "lodestar_reth_super" {
  default = {
    name            = "lodestar-reth-super"
    count           = 1
    validator_start = 41680
    validator_end   = 42000
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

# Grandine Supernodes (7.5% of 140 = 10 supernodes)
variable "grandine_geth_super" {
  default = {
    name            = "grandine-geth-super"
    count           = 3
    validator_start = 42000
    validator_end   = 42960
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "grandine_nethermind_super" {
  default = {
    name            = "grandine-nethermind-super"
    count           = 3
    validator_start = 42960
    validator_end   = 43920
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "grandine_besu_super" {
  default = {
    name            = "grandine-besu-super"
    count           = 2
    validator_start = 43920
    validator_end   = 44560
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "grandine_erigon_super" {
  default = {
    name            = "grandine-erigon-super"
    count           = 1
    validator_start = 44560
    validator_end   = 44880
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

variable "grandine_reth_super" {
  default = {
    name            = "grandine-reth-super"
    count           = 1
    validator_start = 44880
    validator_end   = 45200
    size            = "s-8vcpu-32gb-640gb-intel"
  }
}

# FULLNODES (1300 nodes with 8 validators each = 10,400 validators)
# Starting validator index: 45200
# Order: Prysm, Nimbus, Lodestar, Grandine, Lighthouse, Teku (Lighthouse and Teku at end)

# Prysm Fullnodes (390 fullnodes)
variable "prysm_geth_full" {
  default = {
    name            = "prysm-geth-full"
    count           = 117
    validator_start = 45200
    validator_end   = 46136
  }
}

variable "prysm_nethermind_full" {
  default = {
    name            = "prysm-nethermind-full"
    count           = 117
    validator_start = 46136
    validator_end   = 47072
  }
}

variable "prysm_besu_full" {
  default = {
    name            = "prysm-besu-full"
    count           = 78
    validator_start = 47072
    validator_end   = 47696
  }
}

variable "prysm_erigon_full" {
  default = {
    name            = "prysm-erigon-full"
    count           = 39
    validator_start = 47696
    validator_end   = 48008
  }
}

variable "prysm_reth_full" {
  default = {
    name            = "prysm-reth-full"
    count           = 39
    validator_start = 48008
    validator_end   = 48320
  }
}

# Nimbus Fullnodes (130 fullnodes)
variable "nimbus_geth_full" {
  default = {
    name            = "nimbus-geth-full"
    count           = 39
    validator_start = 48320
    validator_end   = 48632
  }
}

variable "nimbus_nethermind_full" {
  default = {
    name            = "nimbus-nethermind-full"
    count           = 39
    validator_start = 48632
    validator_end   = 48944
  }
}

variable "nimbus_besu_full" {
  default = {
    name            = "nimbus-besu-full"
    count           = 26
    validator_start = 48944
    validator_end   = 49152
  }
}

variable "nimbus_erigon_full" {
  default = {
    name            = "nimbus-erigon-full"
    count           = 13
    validator_start = 49152
    validator_end   = 49256
  }
}

variable "nimbus_reth_full" {
  default = {
    name            = "nimbus-reth-full"
    count           = 13
    validator_start = 49256
    validator_end   = 49360
  }
}

# Lodestar Fullnodes (97 fullnodes)
variable "lodestar_geth_full" {
  default = {
    name            = "lodestar-geth-full"
    count           = 29
    validator_start = 49360
    validator_end   = 49592
  }
}

variable "lodestar_nethermind_full" {
  default = {
    name            = "lodestar-nethermind-full"
    count           = 29
    validator_start = 49592
    validator_end   = 49824
  }
}

variable "lodestar_besu_full" {
  default = {
    name            = "lodestar-besu-full"
    count           = 19
    validator_start = 49824
    validator_end   = 49976
  }
}

variable "lodestar_erigon_full" {
  default = {
    name            = "lodestar-erigon-full"
    count           = 10
    validator_start = 49976
    validator_end   = 50056
  }
}

variable "lodestar_reth_full" {
  default = {
    name            = "lodestar-reth-full"
    count           = 10
    validator_start = 50056
    validator_end   = 50136
  }
}

# Grandine Fullnodes (97 fullnodes)
variable "grandine_geth_full" {
  default = {
    name            = "grandine-geth-full"
    count           = 29
    validator_start = 50136
    validator_end   = 50368
  }
}

variable "grandine_nethermind_full" {
  default = {
    name            = "grandine-nethermind-full"
    count           = 29
    validator_start = 50368
    validator_end   = 50600
  }
}

variable "grandine_besu_full" {
  default = {
    name            = "grandine-besu-full"
    count           = 19
    validator_start = 50600
    validator_end   = 50752
  }
}

variable "grandine_erigon_full" {
  default = {
    name            = "grandine-erigon-full"
    count           = 10
    validator_start = 50752
    validator_end   = 50832
  }
}

variable "grandine_reth_full" {
  default = {
    name            = "grandine-reth-full"
    count           = 10
    validator_start = 50832
    validator_end   = 50912
  }
}

# # Lighthouse Fullnodes (390 fullnodes) Handed over keys
# variable "lighthouse_geth_full" {
#   default = {
#     name            = "lighthouse-geth-full"
#     count           = 117
#     validator_start = 50912
#     validator_end   = 51848
#   }
# }

# variable "lighthouse_nethermind_full" {
#   default = {
#     name            = "lighthouse-nethermind-full"
#     count           = 117
#     validator_start = 51848
#     validator_end   = 52784
#   }
# }

# variable "lighthouse_besu_full" {
#   default = {
#     name            = "lighthouse-besu-full"
#     count           = 78
#     validator_start = 52784
#     validator_end   = 53408
#   }
# }

# variable "lighthouse_erigon_full" {
#   default = {
#     name            = "lighthouse-erigon-full"
#     count           = 39
#     validator_start = 53408
#     validator_end   = 53720
#   }
# }

# variable "lighthouse_reth_full" {
#   default = {
#     name            = "lighthouse-reth-full"
#     count           = 39
#     validator_start = 53720
#     validator_end   = 54032
#   }
# }

# # Teku Fullnodes (196 fullnodes)
# variable "teku_geth_full" {
#   default = {
#     name            = "teku-geth-full"
#     count           = 59
#     validator_start = 54032
#     validator_end   = 54504
#   }
# }

# variable "teku_nethermind_full" {
#   default = {
#     name            = "teku-nethermind-full"
#     count           = 59
#     validator_start = 54504
#     validator_end   = 54976
#   }
# }

# variable "teku_besu_full" {
#   default = {
#     name            = "teku-besu-full"
#     count           = 39
#     validator_start = 54976
#     validator_end   = 55288
#   }
# }

# variable "teku_erigon_full" {
#   default = {
#     name            = "teku-erigon-full"
#     count           = 20
#     validator_start = 55288
#     validator_end   = 55448
#   }
# }

# variable "teku_reth_full" {
#   default = {
#     name            = "teku-reth-full"
#     count           = 19
#     validator_start = 55448
#     validator_end   = 55600
#   }
# }

