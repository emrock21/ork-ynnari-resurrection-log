# Ynnari Resurrection Event Log

This contract records Ork encounters with the Ynnari, the necro-mystic  
Aeldari sect devoted to Ynnead, the god of death. It captures events  
where resurrection, soul manipulation, or death-energy manifestations  
occurred during battle.

It uses fields that reflect Ynnari identity:

- `resurrectionType` — The type of resurrection or death-energy surge  
- `ynnariFigure` — Yvraine, the Visarch, the Yncarne, or other Ynnari  
- `soulEffect` — What the Orks saw happen to souls or necro-light  

These elements cannot be applied to any other Aeldari faction.

---

## Contract

Deployed on Base:  
`0xD684cE900A5BfA730874A68bDfA270Bd39eF62F1`  
https://basescan.org/address/0xd684ce900a5bfa730874a68bdfa270bd39ef62f1#code

Main file: `contracts/YnnariResurrectionLog.sol`

---

## Example encounter

```solidity
recordEncounter(
  "Soul-Burst Revival",
  "Yvraine",
  "Da boyz saw white fire an' da dead pointy-ears standin' back up.",
  "She moved calm, slicin' through da fight like she knew da end.",
  "Da scrap ended wiv da boyz panickin' as enemies dey smashed got back up glowin."
);

Voting
voteEncounter(1, true);
voteEncounter(1, false);

Essence of the Ynnari
The Ynnari embody death, rebirth, and the manipulation of souls. Their
encounters reflect:

Resurrection events witnessed by Orks

Manifestations of Yvraine, the Visarch, or the Yncarne

Necro-energy effects that defy normal Aeldari behavior

Together, these traits define the Ynnari as a faction unlike any other.
