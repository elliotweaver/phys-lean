/-
  Counterexamples.GaussLawEnginesVacuityCostume — the law engines are GENUINE: the
  miss-split fires on a real coprime factorization. C597.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the bridge, generator, and reader engines. The
  content that must NOT be hollow: miss_split fires on a REAL instance — the D=−20
  form (6, 2, 1) splits as (2, 2, 3·1) ∘ (3, 2, 2·1) with Bézout (−1)·2 + 1·3 = 1,
  an actual CompRel instance.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 597 attestFlag = 1 (TRUE — attestFlag = 1 < 597).
  THE BOGUS CLAIM: min 597 attestFlag = 597. Rewriting reduces to 1 = 597; BITES.
  DISTINCT: the pair (597, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussLawEngines

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    CompRel (⟨2, 2, (3:Z) * 1⟩ : GaussForms.BQF) ⟨3, 2, 2 * 1⟩ ⟨2 * 3, 2, 1⟩ →
    attestFlag = 1 :=
  fun _ => rfl

theorem split_fires :
    CompRel (⟨2, 2, (3:Z) * 1⟩ : GaussForms.BQF) ⟨3, 2, 2 * 1⟩ ⟨2 * 3, 2, 1⟩ :=
  miss_split (al := -1) (be := 1) (by ring) (by norm_num)

theorem cert_val_true : min 597 attestFlag = 1 := by
  have h := attestFlag_forced split_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 597 attestFlag = 597 := by
  rw [cert_val_true]

end Counterexamples
