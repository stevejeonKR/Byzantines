pragma solidity ^0.4.23;


contract Voting{
    
    bytes32[] public candidateList;
    mapping (bytes32 => uint8)public votesRecived;
    constructor(bytes32[] candidateName) public {
        candidateList = candidateName;
    
}

function voteForCandidate(bytes32 candidate) public{
     require(validCandidate(candidate));
    votesRecived[candidate] += 1;
    
}
    function totalVoteFor(bytes32 candidate) view public returns(uint8){
        require(validCandidate(candidate));
        return votesRecived[candidate];
        //read only
    }
    
    function validCandidate(bytes32 candidate) view public returns(bool){
        for(uint i=0;i<candidateList.length; i++){
            if(candidateList[i] == candidate){
                return true;
            }
        }
        return false;
    }
}