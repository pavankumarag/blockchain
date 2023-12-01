const SHA256 = require('crypto-js/sha256');

class Block {
    toHash() {
        return SHA256("pavan"); // a simple way to show how to compute hash!
    }
}

module.exports = Block;

