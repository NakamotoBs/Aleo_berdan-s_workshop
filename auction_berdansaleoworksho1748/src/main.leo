program auction_berdansaleoworksho1748.aleo {
    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }

    
    transition place_bid(bidder: address, amount: u64) -> Bid {
        assert_eq(self.caller, bidder);
        return Bid {
            owner: aleo1w04948my50pvejy6ckn0larfxsa8gzs389gq5m2nxu44h56elypqd85rc9,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

    transition resolve(first: Bid, second: Bid) -> Bid {
        assert_eq(self.caller, aleo1w04948my50pvejy6ckn0larfxsa8gzs389gq5m2nxu44h56elypqd85rc9);
        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

  
    transition finish(bid: Bid) -> Bid {
       
        assert_eq(self.caller, aleo1w04948my50pvejy6ckn0larfxsa8gzs389gq5m2nxu44h56elypqd85rc9);
    
        return Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }
}