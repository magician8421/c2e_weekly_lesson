// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "hardhat/console.sol";

contract GasLeft{


    uint256 value;

    Reciver private   r  ;

    constructor(Reciver _r){
        r=_r;
    }

    function invoke() external payable  {

        r.bizMethod{gas:8000}();

    }
}

contract Reciver{
    receive() external payable { 
        console.logUint(gasleft());
    }

    function bizMethod() external{
        
       (bool r,) = address(0).call{gas:5000}("");
       require(r);
	
    }
}