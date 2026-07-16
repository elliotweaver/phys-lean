import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.Operator
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem assoc_add_right' (x y z z' : O ℚ) :
    assoc x y (z + z') = assoc x y z + assoc x y z' := by
  simp only [assoc, mul_add]; abel

theorem assoc_smul_right' (c : ℚ) (x y z : O ℚ) :
    assoc x y (c • z) = c • assoc x y z := by
  simp only [assoc, qsmul_mul_right, smul_sub]

-- swap in module form
theorem assoc_qp_eq_neg (p q x : O ℚ) : assoc q p x = - assoc p q x := by
  have h := assoc_swap12 p q x
  linear_combination (norm := abel) h

-- GENERAL 2-space vanishing in first two slots (arbitrary basis {p,q}):
theorem assoc_span2_vanishes {p q : O ℚ} {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {p, q}) (hb : b ∈ Submodule.span ℚ {p, q}) (x : O ℚ) :
    assoc a b x = 0 := by
  rw [Submodule.mem_span_pair] at ha hb
  obtain ⟨s, t, hst⟩ := ha
  obtain ⟨u, v, huv⟩ := hb
  subst hst; subst huv
  simp only [assoc_add_left, assoc_add_mid, assoc_smul_left, assoc_smul_mid,
    alt_left, smul_zero, add_zero, zero_add]
  rw [assoc_qp_eq_neg q p x]  -- hope pattern present
  simp only [smul_neg]
  abel

-- PROBE crux A: [a, b, a*b] = 0
example (a b : O ℚ) : assoc a b (a * b) = 0 := by
  -- alternating: [a,b,ab] = -[a,ab,b] (swap23), then middle-slot ab...
  sorry

-- PROBE crux B: [a,a,·]=0 and [·,b,b]=0 give repeats; but generated needs [a,b,ba] etc.
example (a b : O ℚ) : assoc a b (b * a) = 0 := by
  sorry

end Phys.Algebra
