module aptos_move_learnings::create_nft {
    use std::signer;
    use std::string::{Self, String};
    use aptos_token::token;
    use aptos_token::token::TokenDataId;

    struct ModuleData has key {
        token_data_id: TokenDataId,
    }

    const ENOT_AUTHORIZED: u64 = 1;

    fun init_module(source_account: &signer) {
        
        let collection_name = string::utf8(b"KanaLabs Exclusive TTK");
        let description = string::utf8(b"A premium NFT collection by KanaLabs");
        let collection_uri = string::utf8(b"https://example.com/dummy-collection.json");
        let token_name = string::utf8(b"Kana NFT #12");
        let token_uri = string::utf8(b"https://example.com/dummy-token.json");
        let maximum_supply = 100;
        let mutate_setting = vector<bool>[ false, false, false ];

        token::create_collection(source_account, collection_name, description, collection_uri, maximum_supply, mutate_setting);

        let token_data_id = token::create_tokendata(
            source_account,
            collection_name,
            token_name,
            string::utf8(b""),
            0,
            token_uri,
            signer::address_of(source_account),
            1,
            0,
            token::create_token_mutability_config(
                &vector<bool>[ false, false, false, false, true ]
            ),
            vector<String>[string::utf8(b"given_to")],
            vector<vector<u8>>[b""],
            vector<String>[ string::utf8(b"address") ],
        );

        // **Check if ModuleData exists before calling `move_to`**
        if (!exists<ModuleData>(signer::address_of(source_account))) {
            move_to(source_account, ModuleData { token_data_id });
        }
        
    }
    // Public function to test calling the private function
        public entry fun test_init_module(source_account: &signer) {
            init_module(source_account);
        }
}