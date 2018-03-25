/*
    Copyright 2017, Muhammad Abid

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/// @title Book Sale Contract - Allows multiple parties to purchase a book
/// @author Muhammad Abid - <mohdabid.aks@gmail.com>

pragma solidity ^0.4.11;

import "./SafeMath.sol";

contract BookSale {
	using SafeMath for uint256;
	//variables
	address private owner;
	uint256 private totalEarned;
	uint256 private balance;
	
	uint256 public price;
	bool public status;
	
	mapping(address => uint256) private Buyers;
	
	/*
		constructor of this contract, it will run once when contract created.
		It initialize variables like price and owner of the contract
	*/
	function BookSale(uint256 _price) public {
		owner = msg.sender;
		price = _price;
		totalEarned = 0;
		balance = msg.value;
		status = true;
	}
	
	/*
		Check if called by owner of the contract
	*/
	modifier onlyOwner(){
		require(msg.sender == owner);
		_;
	}
	
	/*
		Check if contract is active
	*/
	modifier isActive(){
		require(status);
		_;
	}
	
	/*
		Get the balance of this contract
		Only owner is allowed
	*/
	function getBalance() public view onlyOwner returns (uint256){
		return balance;
	}
	
	/*
		Get the total earnings of this book sale contract
		Only owner is allowed
	*/
	function totalEarnings() public view onlyOwner returns (uint256){
		return totalEarned;
	}
	
	/*
		This function is used to get payments for buyers.
		It checks if this book sale is active
	*/
	function buyBook() public payable isActive returns (bool){
		require(msg.value >= price);
		Buyers[msg.sender] = msg.value;
		totalEarned = totalEarned.add(msg.value);
		balance = balance.add(msg.value);
		return true;
	}
	
	/*
		Default method
	*/
	function () public payable returns (bool){
		return buyBook();
	}
	
	/*
		Transfer the full amount of this contract to caller address
		Only owner is allowed
	*/
	function transferFullAmount() public onlyOwner returns (bool){
		require(balance > 0);
		msg.sender.transfer(balance);
		balance = 0;
		return true;
	}
	
	/*
		Transfer the partial amount of this contract to caller address
		Only owner is allowed
	*/
	function transferAmount(uint256 _amount) public onlyOwner returns (bool){
		require(balance >= _amount);
		msg.sender.transfer(_amount);
		balance = balance.sub(_amount);
		return true;
	}
	
	/*
		Update the price of this book sale contract
		Only owner is allowed
	*/
	function updatePrice(uint256 _price) public onlyOwner returns (bool){
		require(_price > 0);
		price = _price;
	}
	
	/*
		This method toggle the status of this book sale contract
		Enable if disabled
		Disable if enabled
		Only owner is allowed
		using the same method will save some gas in creation of contract.
	*/
	function toggleStatus() public onlyOwner returns (bool){
		if(status == true){
			status = false;
		}else{
			status = true;
		}
		return true;
	}
}
