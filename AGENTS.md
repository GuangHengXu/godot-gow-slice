# AGENTS.md — instructions for the Devin Bot working on this repo

## Stack

- Godot 4.3, GDScript, statically typed. GL Compatibility renderer.
- No dynamic calls, no `call()` by string. Signals over direct references.

## Architecture (do not break)

- Player and enemies run node-based finite state machines (`StateMachine`, one `State` node per state). States never reference each other — they only emit `transition_requested`.
- Combat is signal-decoupled: `Hurtbox` only emits `hit_received(attack)`; `CombatManager` is the only node that decides damage and state changes. `Hitbox` carries data (`AttackData` resource), never logic.
- Combat numbers (parry window 0.15s, windup 0.5s, damage, i-frames) live in `AttackData` / `CombatStats` resources, never hardcoded.

## Workflow

- One system per PR, small diffs. Never rewrite whole files.
- Run `godot --headless --check-only` and the GUT suite before opening a PR; paste the output in the PR description.
- Tasks are GitHub issues, one per milestone, each with acceptance criteria.
