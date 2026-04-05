// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Ynnari Resurrection Event Log
/// @notice Records Ork encounters with Ynnari resurrection events, necro-energy surges, and figures like Yvraine, the Visarch, or the Yncarne.
/// @dev This contract is exclusive to Ynnari culture due to its faction-specific fields.

contract YnnariResurrectionLog {

    address constant EXAMPLE_ADDRESS = 0x0000000000000000000000000000000000000001;

    struct Encounter {
        string resurrectionType;  // How da Ynnari brought someone back or unleashed death-energy
        string ynnariFigure;      // Yvraine, Visarch, Yncarne, or other Ynnari agents
        string soulEffect;        // What da Orks saw happen to souls, bodies, or necro-light
        string behavior;          // How da Ynnari acted accordin to da boyz
        string outcome;           // How da scrap ended from da Ork perspective
        address creator;
        uint256 approved;
        uint256 rejected;
        uint256 createdAt;
    }

    Encounter[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event EncounterRecorded(uint256 indexed id, string resurrectionType, address indexed creator);
    event EncounterVoted(uint256 indexed id, bool approved, uint256 approvedVotes, uint256 rejectedVotes);

    constructor() {
        logs.push(
            Encounter({
                resurrectionType: "Example Ynnari Event (Fill your own below)",
                ynnariFigure: "Name da Ynnari git (Yvraine, Visarch, Yncarne, etc.)",
                soulEffect: "Describe da weird soul-stuff da boyz saw.",
                behavior: "Describe how da death-lovin pointy-ears acted.",
                outcome: "Describe how da scrap ended accordin to da Orks.",
                creator: EXAMPLE_ADDRESS,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordEncounter(
        string calldata resurrectionType,
        string calldata ynnariFigure,
        string calldata soulEffect,
        string calldata behavior,
        string calldata outcome
    ) external {
        require(bytes(resurrectionType).length > 0, "Resurrection type required");

        logs.push(
            Encounter({
                resurrectionType: resurrectionType,
                ynnariFigure: ynnariFigure,
                soulEffect: soulEffect,
                behavior: behavior,
                outcome: outcome,
                creator: msg.sender,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );

        emit EncounterRecorded(logs.length - 1, resurrectionType, msg.sender);
    }

    function voteEncounter(uint256 id, bool approved) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Encounter storage e = logs[id];

        if (approved) {
            e.approved += 1;
        } else {
            e.rejected += 1;
        }

        emit EncounterVoted(id, approved, e.approved, e.rejected);
    }

    function totalEncounters() external view returns (uint256) {
        return logs.length;
    }
}
