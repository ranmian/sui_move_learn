module learn_coin::token {
  
  // imports
  use std::option;
  use sui::coin;
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};

  // define struct
  struct TOKEN has drop{}

  // init 
  fun init(witness: TOKEN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(witness, 6, b"LERAN", b"SUI LEARN COIN", b"", option::none(), ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury, tx_context::sender(ctx));
  }
}