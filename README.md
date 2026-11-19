# Godot Norse Combat Slice

An indie-scale action game inspired by God of War, built with Godot 4.3 and Devin Bots. Vertical slice first: one arena, one combat system, one boss.

## The slice

- Combo-based melee combat (light/heavy attacks, dodge, parry)
- Enemy AI with telegraphed attacks (windup → strike)
- One boss fight, dungeon arena, weapon upgrade + skill progression
- GDScript, statically typed, node-based finite state machines

## Milestones

1. Player FSM skeleton (Idle / Run / Attack / Dodge / Parry / Hurt) + combat signal plumbing
2. Parry state + 0.15s window, riposte + hitstop
3. Enemy FSM (Chase / Windup / Attack / Recover / Stagger) + telegraph
4. Boss phase one + arena
5. Playable demo

## Layout

- `scripts/` — `state.gd` / `state_machine.gd` (FSM base), `combat/` (AttackData, Hitbox, Hurtbox, CombatManager, Health), `player/states/` (Idle, Parry)
- `docs/combat.md` — state diagrams + combat numbers
- `AGENTS.md` — standing instructions for the Devin Bot

## Testing

- `godot --headless --check-only` on every PR
- GUT suite: state transitions, parry window timing, stagger on successful parry

Build log: https://x.com/DmenggeD
