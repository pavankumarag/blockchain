const Block = require('./Block');

class Blockchain {
    constructor() {
        this.chain = [ /* TODO: Create the genesis block here */ ];
        const block = new Block("genesis block");
        this.chain.push(block);
    }
}

module.exports = Blockchain;
