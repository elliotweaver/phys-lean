import Phys.Algebra.LorentzContinuumGenerationDeflationStep

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section
open scoped BigOperators

-- biMulLin n n applied to (0,0,w) reads (0,0, n*(w*n))
example (n w : O Cut) : biMulLin n n ((0:Cut),(0:Cut),w) = ((0:Cut),(0:Cut), n*(w*n)) := rfl

-- gFormC of normalized n is 1 when n = r⁻¹•(e-w):  gFormC n n = r⁻² gFormC(e-w)(e-w) = 1
theorem norm_unit {e w : O Cut} (hne : e - w ≠ 0) :
    gFormC ((cutSqrt (gFormC (e-w) (e-w)))⁻¹ • (e - w))
           ((cutSqrt (gFormC (e-w) (e-w)))⁻¹ • (e - w)) = 1 := by
  set r := cutSqrt (gFormC (e-w) (e-w)) with hrdef
  have hpos : 0 < gFormC (e - w) (e - w) := gFormC_pos_of_ne hne
  have hrr : r * r = gFormC (e - w) (e - w) := cutSqrt_sq (le_of_lt hpos)
  have hr : r ≠ 0 := ne_of_gt (cutSqrt_pos hpos)
  rw [gFormC_smul_left, gFormC_smul_right, ← hrr]; field_simp

-- single half-turn membership in genIsomMonoidLin
theorem biMulLin_self_mem {n : O Cut} (hn : gFormC n n = 1) :
    biMulLin n n ∈ genIsomMonoidLin :=
  Submonoid.subset_closure ⟨n, n, hn, hn, rfl⟩

-- QvC-isometry of the half-turn (banked: biMulLin_imag_isQvIsomC)
example {n : O Cut} (hn : gFormC n n = 1) : IsQvIsomC (biMulLin n n) :=
  biMulLin_imag_isQvIsomC n hn

end
end Phys.Algebra
