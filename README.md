# noir-auction
## An English Blind Auction
### By Theo Wallace


	Meant solely for educational purposes

#### Usage: 

Edit the arrays in yml files to switch around inputs.  In `finalizer`, there should be 64 elements in each array.  Fill missing bids with `0`, missing commitments and secrets with `"0x0000000000000000000000000000000000000000000000000000000000000000"`

To get started with this repo, deploy `Auction.sol` in order to keep track of the incoming commitments.  `plonk_vk.sol` doesn't work at the moment so the Auction contract is solely for keeping a record of the bid commitments.
