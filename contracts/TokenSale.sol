//SPDX-License-Identifer: MIT
pragma solidity ^0.8.18;
import "./MyERC20.sol";
import "./MyERC721.sol";

contract TokenSale {
    uint256 public ratio;
    uint256 public price;
    MyERC20Token public paymentToken;
    MyERC721Token public nftContract;
    constructor(uint256 _ratio, uint256 _price, address _paymentToken, address _nftContract){
        ratio = _ratio;
        paymentToken = MyERC20Token(_paymentToken);
        nftContract= MyERC721Token(_nftContract);
    }
    function buyTokens() external payable{
        paymentToken.mint(msg.sender, msg.value *ratio);
    }
    function returnTokens(uint256 amount) external{
        paymentToken.burnFrom(msg.sender, amount );
        payable(msg.sender).transfer(amount);
    }
    function mintNft(uint256 nftId) external {
        paymentToken.transferFrom(msg.sender, address(this), price);
        
    }
}