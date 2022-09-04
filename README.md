# dapp-without-dns

An experiment in how to run an Ethereum dApp without an intermediary server.

1. Deploy your contract (example is `MyDapp.sol` which just makes silly on-chain random CrypToadz).
2. User calls `app(nodeUrl)` with their desired node (which must have appropriate CORS enabled, i.e `http.corsdomain=*`)
3. User pastes the resulting base64-encoded `text/html` chunk into their browser bar.
4. The dApp loads and makes web3 calls with the specified `nodeUrl`, without an intermediary server involved.

Inspired by [Pete Horne's tweet](https://twitter.com/p_s_horne/status/1565895774617337856) about Ethereum's reliance on intermediaries impacting addressability of truly chain-native dApps.
