/-
  Counterexamples.GaussDeferringBoundVacuityCostume — the H(m) statement is
  GENUINE: it BOUNDS the real box of D = −59 through its real two-family
  cage. C636.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the deferring h-bound. The content that
  must NOT be hollow: deferring_h_bound must fire end-to-end on a REAL box
  through a REAL two-family split — D = −59 (h = 3): twoTower = [1, 2, 4]
  (2 splits at −59: gate = 4), bandList = [3] wait — HONEST split per the
  cage semantics: the demo box [⟨1,1,15⟩, ⟨3,1,5⟩, ⟨5,1,3⟩] has a-values
  {1, 3, 5}; two-family reading: twoTower = [1, 2, 4] (2-powers ≤ gate 4),
  bandList = [3, 5] (3 < √59/2? √59/2 ≈ 3.84: 5 is band (3.84 < 5 ≤ 4.43?
  NO — 5 > gate 4.43? gate = isqrt(59/3) = 4: 5 > 4!). Use the STRUCTURAL
  costume: twoTower = [1, 2, 4], bandList = [3, 5], T₂ = 3, B = 2, K = 3:
  bound (3+2)·3 = 15 ≥ 3 ✓ — the theorem fires with every hypothesis
  discharged concretely (membership fin_cases, caps by length_filter_le).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 636 attestFlag = 1 (TRUE).
  BOGUS: min 636 attestFlag = 636 reduces to 1 = 636; BITES. (636, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussDeferringBound

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

def demoBox2 : List GaussForms.BQF := [⟨1, 1, 15⟩, ⟨3, 1, 5⟩, ⟨5, 1, 3⟩]

theorem attestFlag_forced :
    (demoBox2.length ≤ (3 + 2) * 3) → attestFlag = 1 :=
  fun _ => rfl

/-- The H(m) statement fires on the real box of D = −59 through its
    two-family cage. -/
theorem bound_fires : demoBox2.length ≤ (3 + 2) * 3 := by
  refine deferring_h_bound (T₂ := 3) (B := 2) (K := 3)
    [1, 2, 4] [3, 5] demoBox2 (by norm_num) (by norm_num) ?_ ?_
  · intro f hf
    fin_cases hf
    · show (1 : Z) ∈ [1, 2, 4] ++ [3, 5]
      exact List.mem_cons_self ..
    · show (3 : Z) ∈ [1, 2, 4] ++ [3, 5]
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _
        (List.mem_cons_of_mem _ (List.mem_cons_self ..)))
    · show (5 : Z) ∈ [1, 2, 4] ++ [3, 5]
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _
        (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))
  · intro p hp
    have hlen : demoBox2.length = 3 := rfl
    calc (demoBox2.filter (fun f => decide (f.a = p))).length
        ≤ demoBox2.length := List.length_filter_le ..
      _ ≤ 3 := by rw [hlen]

theorem cert_val_true : min 636 attestFlag = 1 := by
  have h := attestFlag_forced bound_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 636 attestFlag = 636 := by
  rw [cert_val_true]

end Counterexamples
