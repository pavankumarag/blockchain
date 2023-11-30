const SHA256 = require('crypto-js/sha256');
const TARGET_DIFFICULTY = BigInt(0x0fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
const MAX_TRANSACTIONS = 10;

const mempool = [];
const blocks = [];

function addTransaction(transaction) {
    // TODO: add transaction to mempool
    mempool.push(transaction)
}

function mine() {
    // TODO: mine a block
    var _id = 0;
    if(blocks.length != 0){
        last_block = blocks[blocks.length - 1];
        _id = blocks.length;
    };
    const transactions= [];
    while (transactions.length < MAX_TRANSACTIONS && mempool.length > 0) {
        transactions.push(mempool.pop());
    }


    const block_obj = {
        id: _id,
        transactions
    };
    
    block_obj_str = JSON.stringify(block_obj);
    block_hash = SHA256(block_obj_str);
    block_obj.hash = block_hash;
    blocks.push(block_obj)
}

module.exports = {
    TARGET_DIFFICULTY,
    MAX_TRANSACTIONS,
    addTransaction, 
    mine, 
    blocks,
    mempool
};
