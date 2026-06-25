import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

theorem oCut_prod_leaf (a b : ℕ → O Cut)
    (ha : ∀ i, Summable (fun k => |(coordOCut (a k)) i|))
    (hb : ∀ j, Summable (fun l => |(coordOCut (b l)) j|)) (i j : Fin 8) :
    Summable (fun kl : ℕ × ℕ => (coordOCut (a kl.1)) i * (coordOCut (b kl.2)) j) :=
  cut_summable_mul_of_abs (f := fun k => (coordOCut (a k)) i) (g := fun l => (coordOCut (b l)) j)
    (ha i) (hb j)

-- per-coordinate, m : Fin 8 argument; fin_cases then normalize the ⟨k,_⟩ to literal via Fin.isValue
set_option linter.unusedSimpArgs false in
example (a b : ℕ → O Cut)
    (ha : ∀ i, Summable (fun k => |(coordOCut (a k)) i|))
    (hb : ∀ j, Summable (fun l => |(coordOCut (b l)) j|)) (m : Fin 8) :
    Summable (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) m) := by
  fin_cases m <;> simp only [Fin.isValue]
  · -- m = 0
    sorry
  all_goals sorry

end
end Phys.Algebra
