"use strict";

const HDWalletProvider = require("truffle-hdwallet-provider");

const mnemonic = process.env.MNEMONIC;﻿

module.exports = {
  networks: {
    local: {
      host: "localhost",
      port: 9545,
      gas: 5000000,
      gasPrice: 5e9,
      network_id: "*"
    },
    mainnet: {
      provider: function() {
        return new HDWalletProvider(
          mnemonic,
          process.env.MAINNET
        );
      },
      gas: 200000000,
      network_id: 1
    },
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(
          mnemonic,
          process.env.RINKEBY
        );
      },
      gas: 5000000,
      gasPrice: 5e9,
      network_id: 3
    }
  },
  compilers: {
    solc: {
      version: "0.5.0"
    }
  }
};
