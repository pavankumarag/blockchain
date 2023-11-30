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

    isValid(){
        for(let i=this.chain.length - 1; i >0; i--){
            const latestBlock = this.chain[i];
            const previousHash = this.chain[i - 1].toHash();
            if(latestBlock.previousHash.toString() !== previousHash.toString()){
                return false;
            }
        }
        return true;
    }
}

module.exports = Blockchain;
