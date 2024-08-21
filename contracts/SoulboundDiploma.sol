// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SoulboundDiploma is ERC721 {
    uint256 private _tokenIdCounter;
    address public _owner;

    string private constant baseTokenURI = "https://green-used-kangaroo-337.mypinata.cloud/ipfs/Qmdx4Ne6VetpH2AV6yvP5jdVqTZnGKVT77NWeCBAH4JGV7/";

    // Predefined list of recipient addresses
    address[] private recipients = [
        0x49D3fBD223e52D9c8212be98907E5a6E554C8c28, //1//Rotar Dan Alexandru
        0x793E5B84c472D53c0A95da96fa863665c00b6EeE, //2//Pintea Tudor
        0xfa3F3a17D1695E457E94F3Cb0EC66ac9d428EcE3, //3//ROMAN EMMA-DEONA
        0xd86121B2fA0676451f67E8d25115DF79222aB4Db, //4//Sipos Eduard
        0xE28EeBC5880D0DF42C20780CeB6623bf687A39e0, //5//Molnar Sara-Viviana
        0x6062fC80C2A5504661dC2b45dF747F297e017D66, //6//Peter Oana-Miruna
        0x6baC5086fD9398C3667e0577f6ae58af5Da52013, //7//Cristea-Zăblău Octavians
        0x7efa79D4b74D3625EE3f78eebE61ED2930740652, //8//Guita Dan
        0xe0E642B2c1f77Afcf3d0Ec086DE3C667C256c621, //9//Abrudan Bogdan-Adrian
        0xcc4297691Ea79eA9F553613b3Ee3AB1c4EfB3ec2, //10//Nicoara Paul Nicolae
        0x9C29420333620C8C37759DD2cb6aB0D9E8fEe31C, //11//Fățan Cristina
        0xFc3274ba7746A9957BbcE395480DDf8429f36Ae2, //12//Bondre Aurora Malina
        0xFA2843DaB933bf14662b7f59314A7c2557E2e056, //13//Pop George
        0x28c2f9406493a180d892DF0D14fc92008ae4285F, //14//Balea Georgiana
        0x8813064174e447bBfA94363ba2Be69DAEe5f9ada, //15//Gribnicea Bianca
        0x4ee8c0eFaC56CCeA12dF78107390De493dA35e3e //16//Mihai Cozmuta
    ];

    constructor() ERC721("Ethereum Summer School at Cluj", "ESSCluj") {
        _owner = msg.sender;
        airdrop(); // Start the airdrop immediately upon deployment
    }

    // Mint the soulbound token
    function mint(address recipient) internal {
        uint256 tokenId = _tokenIdCounter + 1;
        _tokenIdCounter += 1;
        _safeMint(recipient, tokenId);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        // Build the full token URI based on the base URI, token ID, and .json extension
        return string(abi.encodePacked(baseTokenURI, Strings.toString(tokenId), ".json"));
    }

    // Airdrop function called in the constructor
    function airdrop() internal {
        for (uint256 i = 0; i < recipients.length; i++) {
            mint(recipients[i]);
        }
    }
}
