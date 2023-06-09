// @title: Auction Finalizer
// @author: Theo Wallace 
// @date: 2023-04-26
//
// A blind auction finalizer that proves the highest 
// bid value is the winner, that the bid is valid,
// 
// @return the winning commitment
//


use dep::std;

// Maximum amount of bids the auction can do
global MAX_BIDS = 64;

fn main(
    commitments: pub [Field; MAX_BIDS], // Array of valid commitments
    all_bids: [u32; MAX_BIDS], // Array of user bids
    secrets: [Field; MAX_BIDS] // Array of user secrets
) -> pub Field {
    let mut highest_bid: u32 = 0;
    let mut winning_commitment: Field = 0;

    for i in 0..MAX_BIDS {
        let bid = all_bids[i];
        let commitment = commitments[i];
        // Check if the current commitment is not zero
        if (commitment != 0) {
            // create the pre-commitment with user provided secrets and the bid
            let mut pre_commitment: [Field; 2] = [secrets[i], bid as Field];
            // re-calculate commitment using the provided info
            let recalculated_commitment = std::hash::pedersen(pre_commitment)[0];
        
            // is the current commitment equal to the recalculated commitment
            constrain commitment == recalculated_commitment;
            
            // If the newer bid is higher than the previous winner
            if (bid > highest_bid) {
                winning_commitment = commitment;
                highest_bid = bid;
            }
        }
    }
    winning_commitment
}