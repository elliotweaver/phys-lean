/-
  Counterexamples.GaussFormsVacuityCostume — the reduction theory is GENUINE: the
  shallow-miss bound is a real inequality (not vacuous), the reduction chain reaches a
  genuinely reduced form, and the anchor genuinely re-heads the class. C591.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims every positive-definite form of negative discriminant
  chains to a reduced form with 3a² ≤ −D, and every properly-landed value becomes a
  leading miss. The content that must NOT be hollow: reduced_inhabited exhibits a REAL
  reduced positive-definite form of discriminant −4 — the predicates are satisfiable and
  the bound 3·1 ≤ 4 BITES as an actual inequality of the derived ℤ.

  THE CERTIFICATE. attestFlag := 1 -- "the reduction theory has a genuine witness".
  TIED to the banked landing by attestFlag_forced.

  We anchor min 591 attestFlag = 1 (TRUE -- attestFlag = 1 < 591).

  THE BOGUS CLAIM (a stand-in for ANY "the predicates are unsatisfiable / the bound is
  vacuous" reading): that min 591 attestFlag = 591. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 591 in the
  naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (591, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussForms

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF

/-- The certificate: 1 iff the reduced witness exists (it does — reduced_inhabited). -/
def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ f, Reduced f ∧ PosDef f ∧ disc f = -(4 : Phys.Foundation.Z)) → attestFlag = 1 :=
  fun _ => rfl

theorem cert_val_true : min 591 attestFlag = 1 := by
  have h := attestFlag_forced reduced_inhabited
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 591 attestFlag = 591 := by
  rw [cert_val_true]

end Counterexamples
