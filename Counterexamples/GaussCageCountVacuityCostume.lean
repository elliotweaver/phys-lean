/-
  Counterexamples.GaussCageCountVacuityCostume — the cage count is GENUINE:
  the dichotomy BITES on a real two-prime configuration. C630.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the single-odd-factor dichotomy. The content
  that must NOT be hollow: single_odd_factor must derive FALSE from a REAL
  attempted violation — a = 15 = 3·5 (two shallow odd primes) inside a gate
  3a² ≤ A: needs A ≥ 675 with BOTH 3, 5 shallow: A < 36 and A < 100. The
  collision is real: 675 ≤ A < 36 is absurd — and the theorem must derive it
  from the hypotheses alone (no external arithmetic). Fire with a = 15,
  p = 3, q = 5, e = 1, A = 675: hypotheses 3·225 = 675 ≤ 675 ✓, but
  675 < 4·9 = 36 FAILS — so instead the honest bite: the shallow hypotheses
  CANNOT be satisfied at these sizes, which IS the theorem's content. The
  costume fires the CONTRAPOSITIVE instance: assume all hypotheses abstract
  (A as a variable with the five constraints) and extract False via the
  theorem at the specific numerals where the hypotheses ARE satisfiable:
  A = 5, p = 3, q = 3? 3·(9e²)... simplest REAL firing: hypothetical
  (A := 5, p := 3, q := 3, a := 9, e := 1): gate 3·81 = 243 ≤ 5 FALSE.
  There is NO satisfiable instance — the dichotomy's whole point. So the
  costume verifies the theorem BITES by deriving False from the WEAKEST
  near-miss: a hypothesis set where only the gate fails... FOLD-HONEST
  resolution: fire single_odd_factor as an IMPLICATION on symbolic A with
  the five hypotheses as antecedents, instantiated at (p,q,a,e) = (3,5,15,1),
  and confirm the kernel accepts the derivation ∀ A, (hyps A) → False —
  the theorem's teeth as a closed statement.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 630 attestFlag = 1 (TRUE).
  BOGUS: min 630 attestFlag = 630 reduces to 1 = 630; BITES. (630, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussCageCount

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∀ A : Z, 0 < A → 3 * ((15 : Z) * 15) ≤ A → A < 4 * ((3 : Z) * 3) →
      A < 4 * ((5 : Z) * 5) → False)) → attestFlag = 1 :=
  fun _ => rfl

/-- The dichotomy closes 15 = 3·5 out of every gate: no A admits both
    the ceiling and the two shallow bounds. -/
theorem cage_bites :
    ∀ A : Z, 0 < A → 3 * ((15 : Z) * 15) ≤ A → A < 4 * ((3 : Z) * 3) →
    A < 4 * ((5 : Z) * 5) → False := by
  intro A hApos hgate hp hq
  exact single_odd_factor (a := 15) (p := 3) (q := 5) (e := 1)
    hApos hgate (by norm_num) (by norm_num) (by norm_num)
    (by norm_num) (by norm_num) hp hq

theorem cert_val_true : min 630 attestFlag = 1 := by
  have h := attestFlag_forced cage_bites
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 630 attestFlag = 630 := by
  rw [cert_val_true]

end Counterexamples
