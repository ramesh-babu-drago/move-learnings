For aptos_move_learnings.move

1. aptos move compile
2. aptos move publish
3. aptos move run --function-id "0x8caf235699f014adea623d347935ab865d0c089d8d2160a60acdc33e4b02a8f6::message::set_message" --args string:"Hello Aptos"
4. aptos move view --function-id "0x8caf235699f014adea623d347935ab865d0c089d8d2160a60acdc33e4b02a8f6::message::get_message" --args address:"0x8caf235699f014adea623d347935ab865d0c089d8d2160a60acdc33e4b02a8f6"
5. aptos move test 

1. whitelist address with mint limit
2. write faucet function
3. after withdrawal emit event(mint,faucet,whitelist)