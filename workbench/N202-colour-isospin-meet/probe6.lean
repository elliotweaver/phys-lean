import Phys.Algebra.DerivationColourIsospinCommutator
import Phys.Algebra.DerivationColourCentralizer
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.DerivationHIntoO
import Mathlib.Algebra.Module.LinearMap.Rat
import Mathlib.Tactic

open Phys.Cascade
namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable def innerDerivQ (q : H ℚ) : Module.End ℚ (O ℚ) :=
  ((innerDeriv q).toAddMonoidHom).toRatLinearMap
theorem innerDerivQ_isDerivQ (q : H ℚ) (hq : star q = -q) : IsDerivQ (innerDerivQ q) := by
  intro x y
  show (innerDeriv q) (x * y) = (innerDeriv q) x * y + x * (innerDeriv q) y
  exact innerDeriv_isDeriv q hq x y
noncomputable def DI : derivationLieQ := ⟨innerDerivQ hI, innerDerivQ_isDerivQ hI hI_imag⟩
noncomputable def DJ : derivationLieQ := ⟨innerDerivQ hJ, innerDerivQ_isDerivQ hJ hJ_imag⟩

-- DI ≠ 0 (lift innerDeriv_hI_ne_zero)
theorem DI_ne_zero : DI ≠ 0 := by
  intro h
  apply innerDeriv_hI_ne_zero
  have hq : innerDerivQ hI = 0 := by
    have := congrArg (Subtype.val) h
    simpa [DI] using this
  refine LinearMap.ext fun z => ?_
  have hz : innerDerivQ hI z = (0 : Module.End ℚ (O ℚ)) z := by rw [hq]
  simpa [innerDerivQ] using hz

-- finrank (ℚ ∙ DI) = 1
example : Module.finrank ℚ (Submodule.span ℚ {DI}) = 1 := by
  rw [finrank_span_singleton DI_ne_zero]

-- W8 teeth: DJ ∉ colourCentralizer (off-Cartan does NOT commute with J)
theorem DJ_not_mem_colour : DJ ∉ colourCentralizer := by
  rw [mem_colourCentralizer]
  intro h
  have : (DJ : Module.End ℚ (O ℚ)) u1 = 0 := (commutes_JO_iff (isDerivQ_of_mem DJ)).mp h
  exact JO_isospin_not_commute this

#print axioms DI_ne_zero
#print axioms DJ_not_mem_colour
