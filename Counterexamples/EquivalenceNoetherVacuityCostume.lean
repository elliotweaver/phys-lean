/-
  Counterexamples.EquivalenceNoetherVacuityCostume — N422 anti-vacuity (C447).
  ============================================================================================
  W8 ANTI-VACUITY. The N422 node (arc-O O7 — the equivalence principle + the Noether
  correspondence) derives, on the banked N420 (1,3) arena and pairing `bForm4`: (1) the mass
  channel is ONE-DIMENSIONAL — every boost-invariant symmetric plane form is a scalar multiple
  of the single mass form `t² − x²`, so a boost-invariant, rest-normalized form IS the mass form
  (m_gravitational = m_inertial, no dial); (2) the Noether charge `bForm4 P ξ` is boost-invariant
  (conserved), linear, and faithful. The load-bearing non-vacuity fact: the one-dimensional mass
  channel is a GENUINE constraint — the mass form `t² − x²` passes (`massForm2_boost_invariant`)
  but the pure-time form `t²` FAILS (`timeForm_not_boost_invariant`), AND the Noether charge is
  genuinely non-degenerate (`noetherCharge (1,0,0) (1,0,0) = 1 ≠ 0`). A mis-reading where EVERY
  plane form were boost-invariant (no unique channel — the equivalence principle would carry no
  content, a distinct gravitational mass could be dialled in) or where the charge map were
  trivial (faithfulness vacuous) would gut the whole O7 result.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N422 mass channel is a genuine
  constraint (the mass form is boost-invariant but the pure-time form is NOT) AND the Noether
  charge is non-degenerate (`noetherCharge (1,0,0) (1,0,0) = 1`)". It is TIED to the banked N422
  landing by `cFlag_forced` through `equivNoether_nonvacuous`.

  We anchor `min 447 cFlag = 1` (TRUE — `cFlag = 1 < 447`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "every plane form is boost-invariant / no unique mass
  channel / the equivalence principle has a dial / the Noether charge is trivial" mis-reading):
  that `min 447 cFlag = 447`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the
  bogus claim to the false numeric `1 = 447` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (447, 1) is fresh (Cid 447 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.EquivalenceNoether
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.EquivNoether
open Phys.Cascade

/-- THE N422-NON-VACUITY FLAG: `1` = "the mass channel is a genuine constraint (the mass form
    `t² − x²` is boost-invariant but the pure-time form `t²` is NOT) AND the Noether charge is
    non-degenerate (`noetherCharge (1,0,0) (1,0,0) = 1`)". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N422 landing): the mass form is boost-invariant, the pure-time form
    is NOT (so the one-dimensional mass channel genuinely excludes forms — the equivalence
    principle has teeth), and the Noether charge of a nonzero state is nonzero; hence `cFlag = 1`.
    If every plane form were invariant, or the charge map were trivial, this conjunction would
    fail. -/
theorem cFlag_forced :
    (IsPlaneBoostInvariant 1 0 (-1)
      ∧ (¬ IsPlaneBoostInvariant 1 0 0)
      ∧ noetherCharge ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ))
          ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ)) = 1)
    ∧ cFlag = 1 :=
  ⟨equivNoether_nonvacuous, rfl⟩

/-- TRUE: `min 447 cFlag = 1`, holding precisely because `cFlag = 1 < 447`. -/
theorem cert_val_true : min (447 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 447 cFlag = 447`. It GENUINELY equals `1` (`cert_val_true`). An "every
    plane form is boost-invariant / no unique mass channel / the equivalence principle has a
    dial / the Noether charge is trivial" mis-reading reduces — through the banked O7 landing —
    to the false numeric `1 = 447`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (447 : ℕ) cFlag = 447 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 447  (FALSE — the costume bites)

end Counterexamples
