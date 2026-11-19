# Combat design

## Player FSM

Idle → Run → Attack (combo chain) → Dodge (i-frames) → Parry → Hurt

- Parry is a timed state: 0.15s active window, tracked by a Timer.
- Hit lands inside the window → riposte: enemy → Stagger, hitstop (`Engine.time_scale = 0.1` for 0.08s).
- Window expires with no hit → recovery frames (vulnerable).

## Enemy FSM

Chase → Windup (telegraph) → Attack → Recover → Stagger

- Telegraph is a dedicated Windup state: weapon raise, sprite flash (`modulate`), exclamation marker, fixed 0.5s windup before the hitbox goes live.
- The parry window is timed against the windup → active transition, not a guess.

## Signal flow

Hitbox (carries `AttackData`) → Hurtbox `hit_received` → CombatManager decides damage / state changes. Player and enemy never call each other directly.

## Numbers

| Value | Amount |
|---|---|
| Parry window | 0.15s |
| Enemy windup | 0.5s |
| Hitstop | 0.08s at 0.1 time scale |
| Base damage | 10 |
