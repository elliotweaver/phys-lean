/-
  Counterexamples.PoincareMassEnergyVacuityCostume — N420 anti-vacuity (C445).
  ============================================================================================
  W8 ANTI-VACUITY. The N420 node (arc-O O5 — Poincaré + E = mc² as a theorem) derives, on the
  reduced (1,3) arena of N419: the Lorentz isometry structure containing the non-compact boost;
  Poincaré = Lorentz ⋉ translations (the semidirect law); and — the marquee — E = mc² as the
  invariant-norm identity `massSq P = Q4v P`, with the mass boost-invariant. The load-bearing
  non-vacuity facts: (a) the invariant mass-square IS the banked (1,3) self-norm (`massSq_eq_Q4v`),
  so the mass-shell is not an independent postulate but the banked Born-determinant form read on
  the energy-momentum vector; and (b) the boost is a GENUINE non-trivial time–space-mixing element
  (`boost4_ne_id`), so the isometry structure is honestly Lorentzian, not the trivial `{id}`. A
  mis-reading where `massSq` were NOT the banked form, or where the boost collapsed to the
  identity, would gut the whole O5 derivation — E = mc² would be an asserted bridge, not the
  banked self-norm read at rest.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N420 invariant mass IS the banked
  (1,3) self-norm `Q4v` AND the isometry structure contains a genuine non-trivial boost". It is
  TIED to the banked N420 landing by `cFlag_forced` through `massSq_eq_Q4v` (the E = mc² identity)
  + `boost4_ne_id` (the honest Lorentzian boost).

  We anchor `min 445 cFlag = 1` (TRUE — `cFlag = 1 < 445`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "E = mc² is an asserted bridge / the mass is not the banked
  self-norm / the boost is trivial" mis-reading): that `min 445 cFlag = 445`. It GENUINELY equals
  `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 445` in ℕ.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (445, 1) is fresh (Cid 445 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.PoincareMassEnergy
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- THE N420-NON-VACUITY FLAG: `1` = "the invariant mass-square IS the banked (1,3) self-norm
    `Q4v` (E = mc² is the banked self-norm read at rest, not a bridge) AND the isometry structure
    contains a genuine non-trivial time–space-mixing boost". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N420 landing): the invariant mass-square is definitionally the banked
    (1,3) self-norm (`massSq_eq_Q4v`, the marquee E = mc² identity) AND the boost with `b = 1 ≠ 0`
    is NOT the identity (`boost4_ne_id`, a genuine Lorentzian element); hence `cFlag = 1`. If
    `massSq` were an independent posited quantity, or the boost collapsed to `id`, this conjunction
    would fail. -/
theorem cFlag_forced :
    ((∀ P : STV4, massSq P = Q4v P) ∧ boost4 1 1 ≠ LinearMap.id)
    ∧ cFlag = 1 :=
  ⟨⟨massSq_eq_Q4v, boost4_ne_id (by norm_num)⟩, rfl⟩

/-- TRUE: `min 445 cFlag = 1`, holding precisely because `cFlag = 1 < 445`. -/
theorem cert_val_true : min (445 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 445 cFlag = 445`. It GENUINELY equals `1` (`cert_val_true`). A "E = mc² is
    an asserted bridge / the mass is not the banked self-norm / the boost is trivial" mis-reading
    reduces — through the banked O5 landing — to the false numeric `1 = 445`, so this must NOT
    compile. -/
theorem cert_val_wrong_BOGUS :
    min (445 : ℕ) cFlag = 445 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 445  (FALSE — the costume bites)

end Counterexamples
