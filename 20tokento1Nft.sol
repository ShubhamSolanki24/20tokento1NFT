//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
//ERC20 interface decleration
interface IERC20 {
    function totalSupply() external view returns (uint _totalSupply);
    function balanceOf(address _owner) external view returns (uint balance);
    function transfer(address _to, uint _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint _value) external returns (bool success);
    function approve(address _spender, uint _value) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint remaining);
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}
//ERC721 Interface decleration
interface IERC721 {
    function balanceOf(address _owner) external view returns (uint256);
    function ownerOf(uint256 _tokenId) external view returns (address);
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes memory data) 
    external payable;
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable;
    function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
    function setApprovalForAll(address _operator, bool _approved) external;
    function getApproved(uint256 _tokenId) external view returns (address);
    function isApprovedForAll(address _owner, address _operator) external view returns (bool);
    event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);
    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);
    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
    }
    // contract function
contract Exchange {
     IERC20 token;
     IERC721 nft;
    constructor(address _ERC20token, address _ERC721nft) {
        token = IERC20(_ERC20token); //interfaces calling
        nft = IERC721(_ERC721nft);}  //interface calling
         //token balance
    function balance(address _user) public view returns(uint){
        return token.balanceOf(_user);}
    // nft number
       function nftbalance(address _user) public view returns(uint){
        return nft.balanceOf(_user);}
    //transfer function
    function nftTransfer(address _from, address _to, uint256 _nftId) public {
        require(token.balanceOf(address(this))> 20,"balance less then 20");
        require((token.allowance(_from, address(this))) >= 20, "pay 20 tokens");    
        require((nft.isApprovedForAll( _to,address(this))), "no nft to transfer");
       token.transferFrom(_from, _to, 20);
       nft.transferFrom(_to, _from, _nftId);
       }
    }
