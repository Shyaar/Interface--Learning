// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.26 and less than 0.9.0
pragma solidity ^0.8.26;

interface ICal {
    function add(uint256 _a, uint256 _b) external  returns (uint256);
    function substract(uint256 _a, uint256 _b) external returns (uint256);
    function getBal() external view returns (uint256);
}


contract Calculator is ICal {
    uint256 public balance;
    function add(uint256 _a, uint256 _b) external  returns (uint256) {
       balance = _a+_b;
       return balance;
    }

    function substract(uint256 _a, uint256 _b) external returns (uint256){
        balance = _a-_b;
        return balance;
    }
    function getBal() external view returns (uint256) {
    }
}

contract BakeryInventory {

    address calAddress = 0xd9145CCE52D386f254917e481eB44e9943F39138;

    uint256 public flour;
    uint256 public sugar;
    uint256 public eggs;

    function addFlour(uint256 _amount) public  {
        flour = ICal(calAddress).add(flour,_amount);
    }

    function addSugar(uint256 _amount) public  {
        sugar = ICal(calAddress).add(sugar,_amount);
    }

    function addEggs(uint256 _amount) public  {
        eggs = ICal(calAddress).add(eggs,_amount);
    }

        function subFlour(uint256 _amount) public  {
        flour = ICal(calAddress).substract(flour,_amount);
    }

    function subSugar(uint256 _amount) public  {
        sugar = ICal(calAddress).substract(sugar,_amount);
    }

    function subEggs(uint256 _amount) public  {
        eggs = ICal(calAddress).substract(eggs,_amount);
    }

    function getItems() public view returns(uint256 Flour_,uint256 Sugar_,uint256 Eggs_) {
        Flour_ = flour;
        Sugar_ = sugar;
        Eggs_ = eggs;
    }
}