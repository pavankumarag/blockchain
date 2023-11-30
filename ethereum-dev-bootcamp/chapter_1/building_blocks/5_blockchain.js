const Block = require('./Block');

class Blockchain {
    constructor() {
        this.chain = [ /* TODO: Create the genesis block here */ ];
        const block = new Block("genesis block");
        this.chain.push(block);
    }
    addBlock(block){
        block.previousHash = this.chain[this.chain.length - 1].toHash();
        this.chain.push(block);
    }
}

module.exports = Blockchain;
