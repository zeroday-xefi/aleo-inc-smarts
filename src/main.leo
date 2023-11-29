// The 'auction' program.
program auction.aleo 
{     
    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }

    transition place_bid(bidder: address, amount: u64) -> Bid {
        // Ensure the caller is the auction bidder.
        assert_eq(self.caller, bidder);
        // Return a new 'Bid' record for the auction bidder.
        return Bid {
            owner: self.caller,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

    transition resolve(first: Bid, second: Bid) -> Bid {
        // Ensure the caller is the auctioneer.
        assert_eq(self.caller, self.caller);
        // Resolve the winner of the auction.
        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

    transition finish(bid: Bid) -> Bid {
        // Ensure the caller is the auctioneer.
        assert_eq(self.caller, aleo17vy887ts76w77ycylzsm468a8eghyu7t8h726e2scfmdulg2fvxqpmhcxw);
        // Return 'is_winner' as 'true' in the winning 'Bid'.
        return Bid {
            owner: aleo17vy887ts76w77ycylzsm468a8eghyu7t8h726e2scfmdulg2fvxqpmhcxw,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }
}
