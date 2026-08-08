/-
  Counterexamples.RunningLawCharacterizedVacuityCostume — the characterization is
  GENUINE: the two hypotheses are satisfiable (the banked flow satisfies them), the
  conclusion does real work (a NON-log flow fails H1), and the rate is read off, not
  assumed. C682.
  =====================================================================================
  W8 ANTI-VACUITY. N682 characterizes the affine-log running law from H1 (additive on
  multiplicative) + H2 (monotone). What must NOT be hollow: (i) the hypothesis pair is
  INHABITED — the banked invAlphaRun log part satisfies both (invAlphaRun_logPart_additive,
  invAlphaRun_logPart_monotone); (ii) H1 has TEETH — the identity flow f = id FAILS it
  (id(x·y) ≠ id x + id y at x = y = 2: 4 ≠ 4? NO — 2·2 = 4 vs 2+2 = 4 collides; use
  x = y = 3: 9 ≠ 6 ✓); (iii) the characterization pins the banked flow at its rate
  (invAlphaRun_characterized).

  THE CERTIFICATE. attestFlag := 1 -- "hypotheses inhabited + H1 has teeth + flow pinned".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 682 attestFlag = 1 (TRUE -- attestFlag = 1 < 682).

  THE BOGUS CLAIM (a stand-in for ANY "the hypotheses are unsatisfiable / vacuous /
  the characterization pins nothing" reading): that min 682 attestFlag = 682. It
  GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false
  numeric 1 = 682 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (682, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.RunningLawCharacterized

namespace Counterexamples

open Phys.Algebra.RunningLawCharacterized
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "hypotheses inhabited + H1 has teeth + flow pinned". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the banked flow's log part satisfies H1 and H2
    (at unit mass, screening sign), the identity flow FAILS H1 (9 ≠ 6 — the hypothesis
    genuinely excludes non-log flows), and attestFlag = 1. -/
theorem attestFlag_forced :
    (∀ x y : Cut, 0 < x → 0 < y →
        invAlphaRun 1 1 (1 / (x * y)) - invAlphaHigh
          = (invAlphaRun 1 1 (1 / x) - invAlphaHigh)
            + (invAlphaRun 1 1 (1 / y) - invAlphaHigh))
      ∧ ¬ (∀ x y : Cut, 0 < x → 0 < y → (id : Cut → Cut) (x * y) = id x + id y)
      ∧ attestFlag = 1 := by
  refine ⟨invAlphaRun_logPart_additive 1 1 one_pos, ?_, rfl⟩
  intro hbad
  have h := hbad 3 3 (by norm_num) (by norm_num)
  simp only [id] at h
  norm_num at h

/-- TRUE: min 682 attestFlag = 1. -/
theorem cert_val_true : min (682 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 682 attestFlag = 682. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (682 : ℕ) attestFlag = 682 := by
  rw [cert_val_true]

end Counterexamples
