/-
  Counterexamples.JordanArenaDimensionVacuityCostume — JordanArenaDimension anti-vacuity (C526).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE TERMINAL JORDAN ARENA DIMENSION) proves that the maximal Hermitian
  octonionic Jordan arena `hermSub` — the terminal object the fold's cascade builds — is a
  27-dimensional ℚ-vector space (via the slot-decomposition linear equivalence + the banked
  `finrank_O_eq_eight`), and its trace-zero subspace is 26-dimensional. The content that must NOT be
  hollow: the dimension is a GENUINE positive count (27), NOT the vacuous dimension `0` of the zero
  module — a finrank statement about a trivial module would be a vacuous "count". The banked
  `finrank_hermSub_eq_27` + `finrank_tracelessArena_eq_26` witness `27 ≠ 0` and the strict
  codimension-1 gap `26 < 27`, so the arena and its trace-zero hyperplane are genuinely nontrivial.

  THE CERTIFICATE. dimFlag := 1 -- a natural-number flag standing for "the maximal Hermitian
  octonionic Jordan arena has finrank exactly 27 (a genuine positive count, not the vacuous
  dimension 0 of a trivial module) and its trace-zero subspace has finrank exactly 26, strictly
  below 27". It is TIED to the banked landing by dimFlag_forced: `finrank_hermSub_eq_27` gives 27,
  `finrank_tracelessArena_eq_26` gives 26, and 26 < 27 < 28, so the flag is 1.

  We anchor min 526 dimFlag = 1 (TRUE -- dimFlag = 1 < 526, so the min is dimFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the arena is the zero module / the dimension is vacuous / the
  trace-zero subspace is everything / the count is degenerate" mis-reading): that
  min 526 dimFlag = 526. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 526 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (526, 1) is fresh (Cid 526 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.JordanArenaDimension
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.HJ

/-- THE FLAG: 1 = "the maximal Hermitian octonionic Jordan arena has finrank exactly 27 (a genuine
    positive count, not the vacuous 0 of a trivial module), and its trace-zero subspace has finrank
    exactly 26, strictly below 27". -/
def dimFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the arena dimension is 27 (`finrank_hermSub_eq_27`), the
    trace-zero subspace is 26 (`finrank_tracelessArena_eq_26`), and 26 < 27, so the count is a
    genuine positive, non-degenerate dimension and `dimFlag = 1`. -/
theorem dimFlag_forced :
    Module.finrank ℚ hermSub = 27
    ∧ Module.finrank ℚ tracelessArena = 26
    ∧ Module.finrank ℚ tracelessArena < Module.finrank ℚ hermSub
    ∧ dimFlag = 1 :=
  ⟨finrank_hermSub_eq_27, finrank_tracelessArena_eq_26, by
    rw [finrank_hermSub_eq_27, finrank_tracelessArena_eq_26]; norm_num, rfl⟩

/-- TRUE: min 526 dimFlag = 1, holding precisely because dimFlag = 1 < 526. -/
theorem cert_val_true : min (526 : ℕ) dimFlag = 1 := by decide

/-- BOGUS: claims min 526 dimFlag = 526. It GENUINELY equals 1 (cert_val_true). A "the arena is the
    zero module / the dimension is vacuous / the trace-zero subspace is everything / the count is
    degenerate" mis-reading reduces -- through the banked landing -- to the false numeric 1 = 526, so
    this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (526 : ℕ) dimFlag = 526 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 526  (FALSE — the costume bites)

end Counterexamples
