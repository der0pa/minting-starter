set -ex
env_network='ic'
env_prod='true'
env_name='origyn_nft_reference_stage'
env_name_sale='origyn_sale_reference_stage'
export env_network
export env_prod
export env_name
export env_name_sale


npm install

dfx identity import mainnet-ed25519-identity --disable-encryption identity.pem || true
dfx identity use mainnet-ed25519-identity

ADMIN_PRINCIPAL=$(dfx identity get-principal)
ADMIN_ACCOUNTID=$(dfx ledger account-id)

echo $ADMIN_PRINCIPAL
echo $ADMIN_ACCOUNTID


dfx identity --network $env_network set-wallet $(dfx identity get-principal) || true


dfx canister --network ic create origyn_nft_reference || true
dfx canister --network ic create origyn_sale_reference || true
dfx canister --network $env_network create $env_name || true
dfx canister --network $env_network create $env_name_sale || true

NFT_CANISTER_ID=$(dfx canister --network $env_network id $env_name)
NFT_CANISTER_Account=$(python3 principal_to_accountid.py $NFT_CANISTER_ID)

NFT_Sale_ID=$(dfx canister --network $env_network id $env_name_sale)
NFT_Sale_Account=$(python3 principal_to_accountid.py $NFT_Sale_ID)

echo $NFT_CANISTER_ID
echo $NFT_CANISTER_Account

awk "{gsub(\"CANISTER-ID\",\"$NFT_CANISTER_ID\"); print}" ./projects/sd-ai/def.json  > ./projects/sd-ai/def_loaded_1.json
awk "{gsub(\"APP-ID\",\"$ADMIN_PRINCIPAL\"); print}" ./projects/sd-ai/def_loaded_1.json  > ./projects/sd-ai/def_loaded_2.json
awk "{gsub(\"CREATOR-PRINCIPAL-ID\",\"$ADMIN_PRINCIPAL\"); print}" ./projects/sd-ai/def_loaded_2.json  > ./projects/sd-ai/def_loaded.json

# bash ./projects/sd-ai/build-dapps.sh

awk "{gsub(\"CANISTER-ID\",\"$NFT_CANISTER_ID\"); print}" ./projects/sd-ai/def_collection_build.json  > ./projects/sd-ai/def_collection_1.json
awk "{gsub(\"APP-ID\",\"$ADMIN_PRINCIPAL\"); print}" ./projects/sd-ai/def_collection_1.json  > ./projects/sd-ai/def_collection_2.json
awk "{gsub(\"CREATOR-PRINCIPAL-ID\",\"$ADMIN_PRINCIPAL\"); print}" ./projects/sd-ai/def_collection_2.json  > ./projects/sd-ai/def_collection_loaded.json

awk "{gsub(\"XXXXXX\",\"0\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_0a.json
awk "{gsub(\"XXXXXX\",\"1\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_1a.json
awk "{gsub(\"XXXXXX\",\"2\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_2a.json
awk "{gsub(\"XXXXXX\",\"3\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_3a.json
awk "{gsub(\"XXXXXX\",\"4\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_4a.json
awk "{gsub(\"XXXXXX\",\"5\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_5a.json
awk "{gsub(\"XXXXXX\",\"6\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_6a.json
awk "{gsub(\"XXXXXX\",\"7\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_7a.json
awk "{gsub(\"XXXXXX\",\"8\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_8a.json
awk "{gsub(\"XXXXXX\",\"9\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_9a.json
awk "{gsub(\"XXXXXX\",\"10\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_10a.json
awk "{gsub(\"XXXXXX\",\"11\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_11a.json
awk "{gsub(\"XXXXXX\",\"12\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_12a.json
awk "{gsub(\"XXXXXX\",\"13\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_13a.json
awk "{gsub(\"XXXXXX\",\"14\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_14a.json
awk "{gsub(\"XXXXXX\",\"15\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_15a.json
awk "{gsub(\"XXXXXX\",\"16\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_16a.json
awk "{gsub(\"XXXXXX\",\"17\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_17a.json
awk "{gsub(\"XXXXXX\",\"18\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_18a.json
awk "{gsub(\"XXXXXX\",\"19\"); print}" ./projects/sd-ai/def_loaded.json  > ./projects/sd-ai/def_19a.json

awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_0a.json > ./projects/sd-ai/def_0.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_1a.json > ./projects/sd-ai/def_1.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_2a.json > ./projects/sd-ai/def_2.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_3a.json > ./projects/sd-ai/def_3.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_4a.json > ./projects/sd-ai/def_4.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_5a.json > ./projects/sd-ai/def_5.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_6a.json > ./projects/sd-ai/def_6.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_7a.json > ./projects/sd-ai/def_7.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_8a.json > ./projects/sd-ai/def_8.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_9a.json > ./projects/sd-ai/def_9.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_10a.json > ./projects/sd-ai/def_10.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_11a.json > ./projects/sd-ai/def_11.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_12a.json > ./projects/sd-ai/def_12.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_13a.json > ./projects/sd-ai/def_13.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_14a.json > ./projects/sd-ai/def_14.json
awk "{gsub(\"YYYYYY\",\"false\"); print}"   ./projects/sd-ai/def_15a.json > ./projects/sd-ai/def_15.json
awk "{gsub(\"YYYYYY\",\"true\"); print}"   ./projects/sd-ai/def_16a.json > ./projects/sd-ai/def_16.json
awk "{gsub(\"YYYYYY\",\"true\"); print}"   ./projects/sd-ai/def_17a.json > ./projects/sd-ai/def_17.json
awk "{gsub(\"YYYYYY\",\"true\"); print}"   ./projects/sd-ai/def_18a.json > ./projects/sd-ai/def_18.json
awk "{gsub(\"YYYYYY\",\"true\"); print}"   ./projects/sd-ai/def_19a.json > ./projects/sd-ai/def_19.json


awk "{gsub(\"XXXXXX\",\"0\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/0.html
awk "{gsub(\"XXXXXX\",\"1\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/1.html
awk "{gsub(\"XXXXXX\",\"2\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/2.html
awk "{gsub(\"XXXXXX\",\"3\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/3.html
awk "{gsub(\"XXXXXX\",\"4\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/4.html
awk "{gsub(\"XXXXXX\",\"5\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/5.html
awk "{gsub(\"XXXXXX\",\"6\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/6.html
awk "{gsub(\"XXXXXX\",\"7\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/7.html
awk "{gsub(\"XXXXXX\",\"8\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/8.html
awk "{gsub(\"XXXXXX\",\"9\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/9.html
awk "{gsub(\"XXXXXX\",\"10\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/10.html
awk "{gsub(\"XXXXXX\",\"11\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/11.html
awk "{gsub(\"XXXXXX\",\"12\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/12.html
awk "{gsub(\"XXXXXX\",\"13\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/13.html
awk "{gsub(\"XXXXXX\",\"14\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/14.html
awk "{gsub(\"XXXXXX\",\"15\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/15.html
awk "{gsub(\"XXXXXX\",\"16\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/16.html
awk "{gsub(\"XXXXXX\",\"17\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/17.html
awk "{gsub(\"XXXXXX\",\"18\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/18.html
awk "{gsub(\"XXXXXX\",\"19\"); print}" ./projects/sd-ai/def.html  > ./projects/sd-ai/19.html


dfx build --network local origyn_nft_reference
dfx build --network local origyn_sale_reference
localzip .dfx/localcal/canisters/origyn_nft_reference/origyn_nft_reference.wasm -f
gzip .dfx/local/canisters/origyn_sale_reference/origyn_sale_reference.wasm -f

#Replace below with your test principal
TEST_WALLET=$(echo "coapo-5z5t4-5azo7-idouv-jsvee-vzf6k-33ror-oncap-be2yg-6cavw-pqe")

localfx canister --network $env_network install $env_name  --wasm .dfx/localocalcanisters/origyn_nft_reference/origyn_nft_reference.wasm.gz --mode=reinstall --argument "(record {owner =principal  \"$ADMIN_PRINCIPAL\"; storage_space = null;})"
dfx canister --network $env_network install $env_name_sale --wasm .dfx/local/canisters/origyn_sale_reference/origyn_sale_reference.wasm.gz --mode=reinstall --argument "(record {owner=principal  \"$ADMIN_PRINCIPAL\"; allocation_expiration = 450000000000; nft_gateway= opt principal \"$NFT_CANISTER_ID\"; sale_open_date=null; registration_date = null; end_date = null; required_lock_date=null})"

node ./projects/deploy.js --meta=./projects/sd-ai/def_collection_loaded.json --token_id=""  --mint_target=$TEST_WALLET --nft_canister=$NFT_CANISTER_ID --mint=true --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_0.json --token_id="sd-ai-0"  --mint_target=$TEST_WALLET --nft_canister=$NFT_CANISTER_ID --mint=true --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_1.json --token_id="sd-ai-1"  --mint_target=$ADMIN_PRINCIPAL --nft_canister=$NFT_CANISTER_ID --mint=true --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_2.json --token_id="sd-ai-2"  --mint_target=$TEST_WALLET --nft_canister=$NFT_CANISTER_ID --mint=true --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_3.json --token_id="sd-ai-3"  --mint_target=$ADMIN_PRINCIPAL --nft_canister=$NFT_CANISTER_ID --mint=true --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_4.json --token_id="sd-ai-4"  --mint_target=$TEST_WALLET --nft_canister=$NFT_CANISTER_ID --mint=true --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_5.json --token_id="sd-ai-5"  --mint_target=$ADMIN_PRINCIPAL --nft_canister=$NFT_CANISTER_ID --mint=true --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_6.json --token_id="sd-ai-6"  --mint_target=$TEST_WALLET --nft_canister=$NFT_CANISTER_ID --mint=true --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_7.json --token_id="sd-ai-7"  --mint_target=$ADMIN_PRINCIPAL --nft_canister=$NFT_CANISTER_ID --mint=true --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_8.json --token_id="sd-ai-8"  --mint_target=$TEST_WALLET --nft_canister=$NFT_CANISTER_ID --mint=false --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_9.json --token_id="sd-ai-9"  --mint_target=$ADMIN_PRINCIPAL --nft_canister=$NFT_CANISTER_ID --mint=false --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_10.json --token_id="sd-ai-10"  --mint_target=$ADMIN_PRINCIPAL --nft_canister=$NFT_CANISTER_ID --mint=false --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_11.json --token_id="sd-ai-11"  --mint_target=$TEST_WALLET --nft_canister=$NFT_CANISTER_ID --mint=false --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_12.json --token_id="sd-ai-12"  --mint_target=$ADMIN_PRINCIPAL --nft_canister=$NFT_CANISTER_ID --mint=false --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_13.json --token_id="sd-ai-13"  --mint_target=$TEST_WALLET --nft_canister=$NFT_CANISTER_ID --mint=false --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_14.json --token_id="sd-ai-14"  --mint_target=$ADMIN_PRINCIPAL --nft_canister=$NFT_CANISTER_ID --mint=false --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_15.json --token_id="sd-ai-15"  --mint_target=$TEST_WALLET --nft_canister=$NFT_CANISTER_ID --mint=false --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_16.json --token_id="sd-ai-16"  --mint_target=$ADMIN_PRINCIPAL --nft_canister=$NFT_CANISTER_ID --mint=true --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_17.json --token_id="sd-ai-17"  --mint_target=$TEST_WALLET --nft_canister=$NFT_CANISTER_ID --mint=true --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_18.json --token_id="sd-ai-18"  --mint_target=$TEST_WALLET --nft_canister=$NFT_CANISTER_ID --mint=false --prod=$env_prod
node ./projects/deploy.js --meta=./projects/sd-ai/def_19.json --token_id="sd-ai-19"  --mint_target=$ADMIN_PRINCIPAL --nft_canister=$NFT_CANISTER_ID --mint=false --prod=$env_prod

rm def_collection_build.json
