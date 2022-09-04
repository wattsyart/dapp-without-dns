// SPDX-License-Identifier: CC0-1.0

pragma solidity ^0.8.13;

import "./Base64.sol";

contract MyDapp {
    function app(string memory nodeUrl) external pure returns (string memory) {
        return 
        string(abi.encodePacked('data:text/html;base64,', 
        Base64.encode(abi.encodePacked(
            '<html><body><div id="app"></div></body><script src="https://cdn.jsdelivr.net/npm/web3@latest/dist/web3.min.js"></script><script>function callback(result){var encoded=result.substring(29); var toad=JSON.parse(atob(encoded)); var app=document.querySelector("#app"); var svg=atob(toad.image_data.substring(26)); var div=document.createElement("div"); div.innerHTML=svg; app.appendChild(div);}; document.addEventListener("DOMContentLoaded", function (){const abi=[{"inputs": [{"internalType": "uint64", "name": "seed", "type": "uint64"}], "name": "randomTokenURIFromSeed", "outputs": [{"internalType": "string", "name": "", "type": "string"}], "stateMutability": "view", "type": "function"}]; const web3=new Web3(new Web3.providers.HttpProvider("' 
            ,nodeUrl,
            '")); const contract=new web3.eth.Contract(abi, "0xE8D8C0A6f174e08C44aB399b7CE810Bc4Dce096A"); const seed=parseInt(Math.floor(Math.random() * 9007199254740990) + 1); contract.methods.randomTokenURIFromSeed(seed).call().then(callback);});</script></html>'
        ))));
    }
}