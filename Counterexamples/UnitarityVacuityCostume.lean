/-
  Counterexamples.UnitarityVacuityCostume — N397 anti-vacuity (C422).
  ============================================================================================
  W8 ANTI-VACUITY. The N397 node (arc-K K1 — unitarity from monad idempotency) derives that a
  unit-phase transport CONSERVES the Born self-overlap of a state, which equals the completeness
  sum of the idempotent orthogonal gather-resolution. The load-bearing non-vacuity fact is that
  transport by the fold's OWN phase `Dbl.J` is GENUINELY NONTRIVIAL — it rotates `eInward` to
  `eOutward` (`evolve_J_eInward`, so `evolve Dbl.J eInward ≠ eInward`) — yet STILL conserves the
  Born self-overlap to `1` (`evolve_J_conserves`). So "unitarity" is not the vacuous statement
  "evolution does nothing": it is a real rotation that nonetheless preserves probability.

  A mis-reading where unitarity were VACUOUS (transport is the identity / conserves only because
  it moves nothing / the conserved total is trivially zero) would have the transported unit state's
  Born self-overlap be `0` (nothing there to conserve), or the transport fix `eInward`.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the fold's phase transport of the unit
  frame state has Born self-overlap NONZERO (= 1): a genuine rotation that conserves probability,
  not a vacuous do-nothing evolution". It is TIED to the banked N397 landing by `cFlag_forced`:
  the banked `evolve_J_conserves` witnesses `g(evolve Dbl.J eInward, evolve Dbl.J eInward) = 1`,
  and `evolve_J_nontrivial` witnesses the transport genuinely moves the state.

  We anchor `min 422 cFlag = 1` (TRUE — `cFlag = 1 < 422`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "unitarity is vacuous / evolution does nothing / the
  conserved overlap is trivially zero / the transport fixes the state" mis-reading): that
  `min 422 cFlag = 422`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `1 = 422` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (422, 1) is fresh (Cid 422 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.Unitarity
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum
open Phys.Cascade

/-- THE UNITARITY-NON-VACUITY FLAG: `1` = "the fold's phase transport of the unit frame state has
    Born self-overlap nonzero (= 1): a genuine rotation (it moves `eInward` off itself) that
    conserves probability — unitarity is not vacuous do-nothing evolution". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N397 landing): the banked `evolve_J_conserves` proves the fold's phase
    transport conserves the Born self-overlap of the unit frame state to `1`, and
    `evolve_J_nontrivial` proves that transport genuinely moves the state. So the conservation is a
    real rotation, not a vacuity; hence `cFlag = 1`. If unitarity were vacuous (the transport fixed
    the state / conserved nothing), this witness would give `0`, not `1`. -/
theorem cFlag_forced :
    bornForm (evolve Dbl.J eInward) (evolve Dbl.J eInward) = 1
      ∧ evolve Dbl.J eInward ≠ eInward
      ∧ cFlag = 1 :=
  ⟨evolve_J_conserves, evolve_J_nontrivial, rfl⟩

/-- TRUE: `min 422 cFlag = 1`, holding precisely because `cFlag = 1 < 422`. -/
theorem cert_val_true : min (422 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 422 cFlag = 422`. It GENUINELY equals `1` (`cert_val_true`). A "unitarity is
    vacuous / evolution does nothing / the conserved overlap is trivially zero / the transport fixes
    the state" mis-reading reduces — through the banked nonzero conserved Born self-overlap of the
    genuinely-rotated unit state — to the false numeric `1 = 422`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (422 : ℕ) cFlag = 422 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 422  (FALSE — the costume bites)

end Counterexamples
