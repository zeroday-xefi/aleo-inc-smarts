program auction.aleo;

record Bid:
    owner as address.private;
    bidder as address.private;
    amount as u64.private;
    is_winner as boolean.private;


function place_bid:
    input r0 as address.private;
    input r1 as u64.private;
    assert.eq self.caller r0;
    cast self.caller r0 r1 false into r2 as Bid.record;
    output r2 as Bid.record;
