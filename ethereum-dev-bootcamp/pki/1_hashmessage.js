const { keccak256 } = require("ethereum-cryptography/keccak");
const { utf8ToBytes } = require("ethereum-cryptography/utils");

function hashMessage(message) {
    var bytes = utf8ToBytes(message);
    var hash = keccak256(bytes);
    return hash
}

module.exports = hashMessage;
