pragma solidity ^0.8.5;
import "./IAntiBotBlacklist.sol";

abstract contract Blacklist{
    IAntiBotBlacklist _blacklist = IAntiBotBlacklist(0xd315Ba9c4e1D74e1a5E321E25a04A4857a76671C);
    modifier antiBot(address _user) {
        require( _blacklist.blacklistCheck(_user),"user is in decentralized blacklist");
        _;
    }
    modifier antiBots(address _user0,address _user1) {
        require( _blacklist.blacklistCheck(_user0),"user0 is in decentralized blacklist");
        require( _blacklist.blacklistCheck(_user1),"user1 is in decentralized blacklist");
        _;
    }
}