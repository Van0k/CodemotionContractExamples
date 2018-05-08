# CodemotionContractExamples

Simple tokensale examples for "ICO protocols and implementations" talk at Codemotion Amsterdam 2018.

Links:

OpenZeppelin reference implementations repository:
<https://github.com/OpenZeppelin/openzeppelin-solidity/tree/master/contracts>. 
The reference implementation for an uncapped sale is in "crowdsale" directory, although I highly recommend looking through the entire thing, as these implementations are industry standard and very useful.

Reference implementation of a capped sale can be found in this Ethereum tutorial:
<https://www.ethereum.org/crowdsale>


Gnosis's Reverse Dutch Auction contract:
<https://github.com/miladmostavi/gnosis-contracts/blob/master/contracts/solidity/DAO/DAODutchAuction.sol>. 
It is quite complex, this implementation should be easier if you are having trouble:
<https://github.com/maurelian/dutch-auction/tree/master/contracts>

Aragon's tokensale with hidden cap example:
<https://github.com/aragon/aragon-network-token/blob/master/contracts/AragonTokenSale.sol>

EOS multi-round tokensale contracts (caution - very advanced stuff):
<https://github.com/EOSIO/eos-token-distribution/tree/master/src>

Interactive coin offerings:
* The original paper: <https://people.cs.uchicago.edu/~teutsch/papers/ico.pdf>
* TrueBit's library repository: <https://github.com/TrueBitFoundation/interactive-coin-offerings>

DTM Dutch Auction:
* Blogpost: <https://medium.com/@o0ragman0o/direct-to-market-reverse-dutch-auction-490210775817>
* No implementation yet, but there is the "Intrinsically Tradeable Tokens" repository that allows to implement it easily: <https://github.com/o0ragman0o/ITT>

DAICO:
* Vitalik's original post: <https://ethresear.ch/t/explanation-of-daicos/465>
* Implementation by The Abyss: <https://github.com/theabyssportal/DAICO-Smart-Contract>

Some additional theory on tokensale models:
* Here is an excellent blogpost from Vitalik which largely inspired the talk: <https://vitalik.ca/general/2017/06/09/sales.html>
* The first blogpost in the series from Nick White: <https://medium.com/@nickikwhite_5051/token-sale-models-part-1-649f8eec29fc>
* A cheatsheet on tokensales from Blockchain Review: <https://blockchainreview.io/understanding-token-sale-models-ico/>



