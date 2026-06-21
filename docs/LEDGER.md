# THE LEDGER — chain status (the global view Clay never had)
*The ONE place where the whole chain's health is visible. Every node: its status, what it
proves, what (if anything) it owes. Updated on every node completion. If this file ever shows
an unproven assertion standing as "done," the project has failed its own standard — that is
exactly the invisibility (Clay root cause #3) this file exists to prevent.*

Legend: ✅ DONE (unbroken, complete, physics-words-removable, gate-green) · 🔨 IN PROGRESS ·
⛔ BLOCKED (on a dissolution/prerequisite ticket) · ⬜ NOT STARTED · 🔭 ANTICIPATED (not yet a
committed target — specified only after upstream lands).

---

## THE CHAIN

| Node | Layer | Status | Proves | Owes |
|------|-------|--------|--------|------|
| N1 fold | Foundation | ✅ | The fold = self-look-back, defined by the look-back law `look x + x = 0` on an additive group, FORCES: `look x = -x` (unique annihilating reflection), `look 0 = 0`, `look² = id` (the fold closes — NOT `-id`), and ★ SELF-BLINDNESS: on a 2-torsion-free carrier the look-back has no nonzero fixed point (`look x = x → x = 0`). Tightness/non-vacuity banked (char-2 carrier has a nonzero fixed point; ℤ witness). 8 theorems, foundations-only. `Phys/Foundation/Fold.lean`. | — |
| N2 cascade + stop | Cascade | ⬜ | — | — |
| N3+ | — | 🔭 | specified after N2 lands | — |

## OWED WORK (dissolution / prerequisite tickets — the ONLY form of unfinished work)
*There is exactly one category of unfinished work: incomplete derivation. Each entry here is a
TICKET on the board, never a "bridge" left in the source. Empty is the goal.*

(none yet)

## INVARIANTS THIS LEDGER ENFORCES
1. No node is ✅ unless the gate is green AND the STANDARD (unbroken/complete/words-removable)
   is met. Gate-green alone is 🔨, never ✅.
2. Every "owes" is a board ticket, never a source-code marker. The gate's D3 check guarantees
   no bridge/residual marker can exist in the tree — so this ledger and the tree cannot diverge.
3. The chain is LINEAR and unbroken: every node's prerequisites are ✅ before it starts.
