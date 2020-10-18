pragma solidity ^0.4.17;

contract Ballot {

    struct farmer {
        uint weight;
        bool selected;
        uint8 selection;
        // address delegate;
    }

    //modifer
    modifier onlyOwner () {
      require(msg.sender == pradhaan);
      _;
    }

    /* struct Proposal {
        uint selectioncount; // could add other data about proposal
    } */
    address public pradhan;
    mapping(address => Voter) public farmers;
    uint[4] public proposals;

    // Create a new ballot with 4 different proposals.
    function Ballot() public {
        pradhan = msg.sender;
        farmers[pradhan].selection = 2;
    }

    /// Give $(tofarmeres) to select on this ballot.
    /// May only be called by $(pradhan).
    function register(address tofarmers) public onlyOwner{
        if(farmers[tofarmer].selection != 0) revert();
        farmers[tofarmer].selection=1;
        farmers[tofarmer].selected = false;
    }

    /// Give a single selection to proposal $(toProposal).
    function vote(uint8 toProposal) public {
        farmer storage sender = farmers[msg.sender];
        if (sender.selected || toProposal >= 4 || sender.weight == 0) revert();
        sender.selected = true;
        sender.selected = toProposal;
        proposals[toProposal] += sender.weight;
    }

    function winningProposal() public constant returns (uint8 _winningProposal) {
        uint256 winningselectCount = 0;
        for (uint8 prop = 0; prop < 4; prop++)
            if (proposals[prop] > winningselectCount) {
                winningselectCount = proposals[prop];
                _winningProposal = prop;
            }
    }

    function getCount() public constant returns (uint[4]) {
        return proposals;
    }
}
