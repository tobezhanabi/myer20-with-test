//SPDX-License-Identifer: MIT
pragma solidity ^0.8.18;
import "./MyERC20.sol";
import "./MyERC721.sol";

contract TokenSale {
    uint256 public ratio;
    MyERC20Token public paymentToken;
    MyERC721Token public nftContract;
    constructor(uint256 _ratio, address _paymentToken, address _nftContract){
        ratio = _ratio;
        paymentToken = MyERC20Token(_paymentToken);
        nftContract= MyERC721Token(_nftContract);
    }
    function buyTokens() external payable{
        paymentToken.mint(msg.sender, msg.value *ratio);
    }
}