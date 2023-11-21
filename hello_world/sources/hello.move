module hello_world::hello {

  // imports
  use std::string;
  use sui::object::{Self, UID};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};

  // define struct
  struct Swords has key, store {
    id: UID,
    message: string::String
  }

  // init
  fun init(ctx: &mut TxContext) {
    let object = Swords{
      id: object::new(ctx),
      message: string::utf8(b"hello world")
    };

    transfer::public_transfer(object, tx_context::sender(ctx));
  }
}