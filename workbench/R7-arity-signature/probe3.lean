import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- third-slot linearity (new)
theorem assoc_add_right' (x y z z' : O ℚ) :
    assoc x y (z + z') = assoc x y z + assoc x y z' := by
  simp only [assoc, mul_add]; abel

theorem assoc_smul_right' (c : ℚ) (x y z : O ℚ) :
    assoc x y (c • z) = c • assoc x y z := by
  simp only [assoc, qsmul_mul_right, smul_sub]

-- THE alternating-form 2-span vanishing (all THREE args in span{p,q})
theorem assoc_span2_vanishes {p q : O ℚ} {a b c : O ℚ}
    (ha : a ∈ Submodule.span ℚ {p, q}) (hb : b ∈ Submodule.span ℚ {p, q})
    (hc : c ∈ Submodule.span ℚ {p, q}) :
    assoc a b c = 0 := by
  rw [Submodule.mem_span_pair] at ha hb hc
  obtain ⟨s, t, hst⟩ := ha
  obtain ⟨u, v, huv⟩ := hb
  obtain ⟨m, n, hmn⟩ := hc
  subst hst; subst huv; subst hmn
  simp only [assoc_add_left, assoc_add_mid, assoc_add_right',
    assoc_smul_left, assoc_smul_mid, assoc_smul_right',
    alt_left, alt_right, alt_flex, smul_zero, add_zero, zero_add]

end Phys.Algebra
