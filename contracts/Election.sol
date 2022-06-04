pragma solidity ^0.4.2;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint256 id;
        string party;
        string name;
        uint256 voteCount;
    }

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Store Candidates
    // Fetch Candidate
    mapping(uint256 => Candidate) public candidates;
    // Store Candidates Count
    uint256 public candidatesCount;

    // voted event
    event votedEvent(uint256 indexed _candidateId);

    function Election() public {
        addCandidate("Piyush Kumar", "BJP");
        addCandidate("Jatin Sharma", "AAP");
        addCandidate("Raunit Yadav", "CONGRESS");
        addCandidate("NOTA", "NOTA");
    }

    function addCandidate(string _name, string _party) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(
            candidatesCount,
            _party,
            _name,
            0
        );
    }

    function vote(uint256 _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount++;

        // trigger voted event
        votedEvent(_candidateId);
    }
}
