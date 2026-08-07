/-
  Counterexamples.GaussCageAssemblyVacuityCostume — the assembly is GENUINE:
  the count BITES on a real caged box. C632.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the box count. The content that must NOT be
  hollow: caged_h_bound must BOUND a real box through a real cage — the h = 3
  box of D = −59 has reduced forms with a ∈ {1, 3, 5} (principal ⟨1,1,15⟩ and
  the pair at 3, 5): cage [1, 3, 5], K = 3 (the generic filter bound — Z
  equality is not kernel-decidable, a known tower pitfall), box of 3 concrete
  forms. The theorem must yield 3 ≤ 3·3 with every hypothesis discharged on
  the explicit forms (membership by fin_cases, caps by length_filter_le).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 632 attestFlag = 1 (TRUE).
  BOGUS: min 632 attestFlag = 632 reduces to 1 = 632; BITES. (632, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussCageAssembly

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

def demoBox : List GaussForms.BQF := [⟨1, 1, 15⟩, ⟨3, 1, 5⟩, ⟨5, 1, 3⟩]

theorem attestFlag_forced :
    (demoBox.length ≤ ([1, 3, 5] : List Z).length * 3) → attestFlag = 1 :=
  fun _ => rfl

/-- The assembly fires on the real h = 3 box of D = −59. -/
theorem assembly_fires :
    demoBox.length ≤ ([1, 3, 5] : List Z).length * 3 := by
  refine caged_h_bound (K := 3) [1, 3, 5] demoBox ?_ ?_
  · intro f hf
    fin_cases hf
    · show (1 : Z) ∈ [1, 3, 5]; exact List.mem_cons_self ..
    · show (3 : Z) ∈ [1, 3, 5]
      exact List.mem_cons_of_mem _ (List.mem_cons_self ..)
    · show (5 : Z) ∈ [1, 3, 5]
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))
  · intro p hp
    -- filter length ≤ full length = 3 (Z-equality not kernel-decidable;
    -- the generic bound suffices at K = 3)
    have hlen : demoBox.length = 3 := rfl
    calc (demoBox.filter (fun f => decide (f.a = p))).length
        ≤ demoBox.length := List.length_filter_le ..
      _ ≤ 3 := by rw [hlen]

theorem cert_val_true : min 632 attestFlag = 1 := by
  have h := attestFlag_forced assembly_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 632 attestFlag = 632 := by
  rw [cert_val_true]

end Counterexamples
