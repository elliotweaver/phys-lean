import Phys.Algebra.LorentzContinuumGenerationOctonionBlockSO8

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

abbrev ii4 : O Cut :=
  (CD.iota (CD.iota (Phys.Cascade.Dbl.J : Phys.Cascade.Dbl Cut)) : O Cut)

theorem ii4_imag : star (ii4 : O Cut) = -(ii4 : O Cut) := by
  ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]
theorem ii4_sq : (ii4 : O Cut) * (ii4 : O Cut) = -1 := by
  ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]
theorem ii4_alt (v : O Cut) : (ii4 : O Cut) * ((ii4 : O Cut) * v) = -v := by
  have h := L_sq_imag (ii4 : O Cut) ii4_imag v
  rw [h]
  have hN : (CD.iota (CD.Nrm (ii4 : O Cut)) : O Cut) = 1 := by
    rw [show CD.Nrm (ii4 : O Cut) = (1 : H Cut) by
          rw [CD.Nrm_def]; ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]]
    ext <;> simp [CD.iota]
  rw [hN, one_mul]

-- ke2je2 left-square law (mirrors je2_alt)
theorem ke2je2_alt (v : O Cut) : (ke2je2 : O Cut) * ((ke2je2 : O Cut) * v) = -v := by
  have h := L_sq_imag (ke2je2 : O Cut) ke2je2_imag v
  rw [h]
  have hN : (CD.iota (CD.Nrm (ke2je2 : O Cut)) : O Cut) = 1 := by
    rw [show CD.Nrm (ke2je2 : O Cut) = (1 : H Cut) by
          rw [CD.Nrm_def]; ext <;> simp [CD.e2, CD.iota]]
    ext <;> simp [CD.iota]
  rw [hN, one_mul]

def tripleBlockLin (u w a b c d : O Cut) : Module.End Cut STVC :=
  genTwoPlaneLin c d * doubleBlockLin u w a b

theorem tripleBlock_bridge_eq (u w a b c d : O Cut) :
    endToFunEnd (tripleBlockLin u w a b c d)
      = (endToFunEnd (genTwoPlaneLin c d)) * (endToFunEnd (doubleBlockLin u w a b)) := by
  rw [tripleBlockLin, map_mul]

theorem tripleBlock_bridge_apply (u w a b c d : O Cut) (p : STVC) :
    endToFunEnd (tripleBlockLin u w a b c d) p
      = biMulFun d d (biMulFun c c
          (biMulFun b b (biMulFun a a (biMulFun w w (biMulFun u u p))))) := by
  rw [tripleBlock_bridge_eq]
  show (endToFunEnd (genTwoPlaneLin c d)) ((endToFunEnd (doubleBlockLin u w a b)) p) = _
  rw [genTwoPlaneLin_apply, doubleBlock_bridge_apply]

/-! ## THE RANK-6 WITNESS — double block fixes ii4, triple block negates it. -/

-- anticommutation facts
theorem e2_ii4_anticomm : (CD.e2 : O Cut) * ii4 = -(ii4 * (CD.e2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]
theorem je2_ii4_anticomm : (je2 : O Cut) * ii4 = -(ii4 * (je2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]
theorem ke2je2_ii4_anticomm : (ke2je2 : O Cut) * ii4 = -(ii4 * (ke2je2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

-- The DOUBLE block (u=e₂,w=ιe₂,a=ke2je2,b=e₂) FIXES ii4: all four half-turns fix it.
theorem block2_fixes_ii4 :
    biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
      (biMulFun (ke2je2 : O Cut) (ke2je2 : O Cut)
        (biMulFun (je2 : O Cut) (je2 : O Cut)
          (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
            ((0 : Cut), (0 : Cut), (ii4 : O Cut)))))
      = ((0 : Cut), (0 : Cut), (ii4 : O Cut)) := by
  rw [biMulFun_imag_fixes_anticomm (CD.e2 : O Cut) (ii4 : O Cut) e2_alt e2_ii4_anticomm]
  rw [biMulFun_imag_fixes_anticomm (je2 : O Cut) (ii4 : O Cut) je2_alt je2_ii4_anticomm]
  rw [biMulFun_imag_fixes_anticomm (ke2je2 : O Cut) (ii4 : O Cut) ke2je2_alt ke2je2_ii4_anticomm]
  rw [biMulFun_imag_fixes_anticomm (CD.e2 : O Cut) (ii4 : O Cut) e2_alt e2_ii4_anticomm]

-- THE WITNESS: triple block (third block c=ii4, d=e₂) NEGATES ii4.
theorem tripleBlock_negates_ii4 :
    endToFunEnd (tripleBlockLin (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut) (CD.e2 : O Cut)
        (ii4 : O Cut) (CD.e2 : O Cut))
        ((0 : Cut), (0 : Cut), (ii4 : O Cut))
      = ((0 : Cut), (0 : Cut), -(ii4 : O Cut)) := by
  rw [tripleBlock_bridge_apply]
  -- goal: biMulFun e₂ e₂ (biMulFun ii4 ii4 (biMulFun e₂ e₂ (biMulFun ke2je2 ke2je2
  --        (biMulFun je2 je2 (biMulFun e₂ e₂ (0,0,ii4)))))) = (0,0,-ii4)
  rw [block2_fixes_ii4]
  -- remaining: biMulFun e₂ e₂ (biMulFun ii4 ii4 (0,0,ii4)) = (0,0,-ii4)
  apply biMulComp_negates_u
  · exact ii4_sq
  · exact e2_alt
  · show (ii4 : O Cut) * (CD.e2 : O Cut) = -((CD.e2 : O Cut) * ii4)
    ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

-- coordinate read-off
theorem tripleBlock_ii4_coord :
    (endToFunEnd (tripleBlockLin (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut) (CD.e2 : O Cut)
        (ii4 : O Cut) (CD.e2 : O Cut))
        ((0 : Cut), (0 : Cut), (ii4 : O Cut))).2.2.re.re.im = (-1 : Cut) := by
  rw [tripleBlock_negates_ii4]
  simp [CD.iota, Phys.Cascade.Dbl.J]

end

end Phys.Algebra
