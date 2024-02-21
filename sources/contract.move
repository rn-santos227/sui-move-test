module forge::contract {
  use std::string;
  use sui::object::{Self, UID};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};

  struct Contract has key, store {
    id: UID,
    text: string::String
  }

  public entry fun mint_contract(ctx: &mut TxContext) {
    let contract_obj = Contract {
      id: object::new(ctx),
      text: string::utf8(b"This is a Test!")
    };
    transfer::public_transfer(contract_obj, tx_context::sender(ctx));
  }
}