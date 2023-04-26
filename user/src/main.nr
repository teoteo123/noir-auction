// @title: User Circuit
// @author: Theo Wallace 
// @date: 2023-04-26
//
// The user portion of the auction.  Proves that the
// bid is greater than MIN_BID
// 
// @return a Pedersen commitment to the bid
//

use dep::std;

global MIN_BID = 0;

//user circuit
fn main(
    secret: Field,
    bid_price: u32
) -> pub Field {
    constrain bid_price > MIN_BID;
    let mut pre_commit: [Field; 2] = [secret, bid_price as Field];
    std::hash::pedersen(pre_commit)[0]
}