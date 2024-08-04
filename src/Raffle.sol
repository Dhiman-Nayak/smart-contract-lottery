// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title A sample Raffle contract
 * @author Dhiman Nayak 
 * @notice This contract is creating sample raffle
 * @dev Implement Chainlink erfv2.5
 */
contract Raffle{
    /* Errors */
    error NotEnoughtETH();
    
    /* State Var */
    uint private i_entranceFee;
    uint256 private immutable i_interval; //Duration of lottery in second
    address payable[] private s_player;
    uint256 private s_lastTimeStamp;

    /* Events */
    event RaffleEntered(address indexed player);

    /* Function */
    constructor(uint entranceFee,uint256 interval){
        i_entranceFee=entranceFee;
        i_interval=interval;
        s_lastTimeStamp=block.timestamp;
    }
    function enterRaffle( ) external payable{
        if (msg.value) {
            revert NotEnoughtETH();
        }
        s_player.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);
    }
    
    function pickWinner( ) external {
        if (block.timestamp-s_lastTimeStamp<i_interval) {
            
        }
    }
    function getEntranceFee( ) external view returns(uint256) {
        return i_entranceFee;
    }
}