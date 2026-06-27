import Phys.Algebra.LorentzContinuumGenerationEnlargedAlphabet

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- reQC 1 = 1 (the real octonion unit has deep-real read-off 1).
theorem reQC_one_probe : reQC (1 : O Cut) = 1 := by
  have h := gFormC_one_right (1 : O Cut)
  rw [gFormC_one] at h
  exact h.symm

-- THE HEAVIEST LEMMA — the composition law (unconditional).
theorem planeRotLin_mul_probe (c1 s1 c2 s2 : Cut) :
    planeRotLin c1 s1 * planeRotLin c2 s2
      = planeRotLin (c1 * c2 - s1 * s2) (c1 * s2 + s1 * c2) := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  show planeRotLin c1 s1 (planeRotLin c2 s2 (t, x, v))
      = planeRotLin (c1 * c2 - s1 * s2) (c1 * s2 + s1 * c2) (t, x, v)
  rw [planeRotLin_apply c2 s2, planeRotLin_apply c1 s1, planeRotLin_apply]
  set r := reQC v with hr
  -- reQC of the rotated v-block
  have hrr : reQC (v + (s2 * x + (c2 - 1) * r) • (1 : O Cut))
              = c2 * r + s2 * x := by
    rw [reQC_add, reQC_smul, reQC_one_probe]
    ring
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · -- x-coordinate
    show c1 * (c2 * x - s2 * r) - s1 * reQC (v + (s2 * x + (c2 - 1) * r) • (1 : O Cut))
        = (c1 * c2 - s1 * s2) * x - (c1 * s2 + s1 * c2) * r
    rw [hrr]; ring
  · -- v-block (the •1 collection)
    show (v + (s2 * x + (c2 - 1) * r) • (1 : O Cut))
          + (s1 * (c2 * x - s2 * r)
             + (c1 - 1) * reQC (v + (s2 * x + (c2 - 1) * r) • (1 : O Cut))) • (1 : O Cut)
        = v + ((c1 * s2 + s1 * c2) * x + ((c1 * c2 - s1 * s2) - 1) * r) • (1 : O Cut)
    rw [hrr, add_assoc, ← add_smul]
    congr 1
    ring

end
end Phys.Algebra
