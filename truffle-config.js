module.exports = {
  networks: {
    local: {
      host: 'localhost',
      port: 9545,
      gas: 5000000,
      gasPrice: 5e9,
      network_id: '*',
    },
    rinkeby: {
      provider: function () {
        return new HDWalletProvider(
            mnemonic,
            process.env.RINKEBY
        );
    },
    gas: 5000000,
    }
  }
}
