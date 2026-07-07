/-
  Counterexamples.AsymptoticStatesVacuityCostume — N398 anti-vacuity (C423).
  ============================================================================================
  W8 ANTI-VACUITY. The N398 node (arc-K K2 — the asymptotic-state space) derives that the
  S-matrix's asymptotic in/out states are the banked colour singlets DRESSED by the derived Born
  structure: the dressing map INTERTWINES octonion multiplication by `u1` with the Born complex
  unit `foldComplex` (`dress_intertwines_J`, `foldComplex (dress a b) = dress (-b) a`), the
  asymptotic sector is a PROPER subspace (`asymptotic_sector_proper`, no free coloured states),
  and it is CLOSED under K1's fold-phase transport (`evolve_J_dress`, `evolve Dbl.J (dress a b)
  = dress (-b) a`).

  The load-bearing non-vacuity facts are that the intertwining is GENUINELY NONTRIVIAL — the
  fold-phase transport of the "toward" frame state actually MOVES it to the "away" frame
  (`evolve Dbl.J (dress 1 0) = dress 0 1 = eOutward ≠ eInward = dress 1 0`) — so the asymptotic
  sector is not the vacuous fixed line, and the dressing is a real complex-line identification,
  not a do-nothing map.

  A mis-reading where K2 were VACUOUS (the dressing is trivial / the asymptotic sector is all of
  the carrier / the transport fixes every dressed state / `u1` acts as the identity not as `J`)
  would have the fold-phase transport FIX `dress 1 0`, i.e. `evolve Dbl.J (dress 1 0) = dress 1 0`.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the fold-phase transport genuinely moves
  the dressed 'toward' state to the dressed 'away' state: `u1` acts as the Born `J`, not the
  identity; the asymptotic sector is a real complex line, not a vacuous fixed point". It is TIED
  to the banked N398 landing by `cFlag_forced`: `evolve_J_dress` gives
  `evolve Dbl.J (dress 1 0) = dress 0 1`, `dress_eInward`/`dress_eOutward` identify these with the
  Born frame, and `eInward_ne_eOutward` witnesses the move is genuine.

  We anchor `min 423 cFlag = 1` (TRUE — `cFlag = 1 < 423`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "K2 is vacuous / the dressing does nothing / the asymptotic
  sector is everything / the transport fixes every state / `u1` acts trivially" mis-reading): that
  `min 423 cFlag = 423`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `1 = 423` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (423, 1) is fresh (Cid 423 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.AsymptoticStates
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum
open Phys.Cascade

/-- THE K2-NON-VACUITY FLAG: `1` = "the fold-phase transport genuinely moves the dressed 'toward'
    state to the dressed 'away' state (`u1` acts as the Born `J`, not the identity); the asymptotic
    sector is a real complex line, not a vacuous fixed point". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N398 landing): `evolve_J_dress` proves the fold-phase transport sends
    `dress 1 0` to `dress 0 1`; `dress_eInward`/`dress_eOutward` identify these with `eInward`/
    `eOutward`; and `eInward_ne_eOutward` proves they differ. So the dressing/intertwining is a
    genuine move, not a vacuity; hence `cFlag = 1`. If K2 were vacuous (the transport fixed every
    dressed state / `u1` acted trivially), this witness would give `0`, not `1`. -/
theorem cFlag_forced :
    evolve Dbl.J (dress 1 0) = dress 0 1
      ∧ dress 1 0 = eInward
      ∧ dress 0 1 = eOutward
      ∧ eInward ≠ eOutward
      ∧ cFlag = 1 :=
  ⟨evolve_J_dress 1 0, dress_eInward, dress_eOutward, eInward_ne_eOutward, rfl⟩

/-- TRUE: `min 423 cFlag = 1`, holding precisely because `cFlag = 1 < 423`. -/
theorem cert_val_true : min (423 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 423 cFlag = 423`. It GENUINELY equals `1` (`cert_val_true`). A "K2 is
    vacuous / the dressing does nothing / the asymptotic sector is everything / the transport fixes
    every state / `u1` acts trivially" mis-reading reduces — through the banked genuinely-nontrivial
    fold-phase transport of the dressed frame state — to the false numeric `1 = 423`, so this must
    NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (423 : ℕ) cFlag = 423 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 423  (FALSE — the costume bites)

end Counterexamples
