import Phys.Algebra.LorentzContinuum

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

theorem cut_add_self_zero {r : Cut} (h : r + r = 0) : r = 0 := by
  have : (2 : Cut) * r = 0 := by linear_combination h
  rcases mul_eq_zero.mp this with h2 | hr
  · exact absurd h2 two_ne_zero
  · exact hr

theorem nrm_selfconj (z : O Cut) : star (CD.Nrm z) = CD.Nrm z := by
  show star ((z * star z).re) = (z * star z).re
  rw [← CD.star_re]; congr 1; rw [star_mul, star_star]

theorem reH_mul_selfconj (a b : H Cut) (ha : star a = a) (hb : star b = b) :
    (a * b).re.re = a.re.re * b.re.re := by
  have haim : a.im = 0 := by
    have hh := congrArg CD.im ha
    simp only [CD.star_im] at hh
    have h2 : a.im + a.im = 0 := by linear_combination -hh
    exact Dbl.two_torsion_free (fun r hr => cut_add_self_zero hr) a.im h2
  have hareim : a.re.im = 0 := by
    have hh := congrArg CD.re ha
    rw [CD.star_re] at hh
    have h2 := congrArg Dbl.im hh
    simp only [Dbl.star_im'] at h2
    exact cut_add_self_zero (by linear_combination -h2)
  show ((a * b).re).re = _
  rw [CD.mul_re, haim]
  simp only [mul_zero, neg_zero, add_zero]
  rw [Dbl.mul_re, hareim]; ring

-- ★ THE Cut-PINNED BORN COMPOSITION LAW
theorem gFormC_comp (x y : O Cut) :
    gFormC (x * y) (x * y) = gFormC x x * gFormC y y := by
  -- gFormC z z = (Nrm z).re.re  (rfl)
  have key : ∀ z : O Cut, gFormC z z = (CD.Nrm z).re.re := fun _ => rfl
  rw [key, key, key]
  -- Nrm (x*y) = Nrm x * Nrm y  (generic doubled-base multiplicativity over O Cut)
  rw [CD.Nrm_mul_of_doubled_base x y]
  -- (Nrm x * Nrm y).re.re = (Nrm x).re.re * (Nrm y).re.re  via reH_mul_selfconj
  exact reH_mul_selfconj (CD.Nrm x) (CD.Nrm y) (nrm_selfconj x) (nrm_selfconj y)

-- ★ THE CONTINUUM ROTATION generator
def rotFunC (u : O Cut) : STVC → STVC := fun p => (p.1, p.2.1, u * p.2.2)

-- ★ THE ROTATION IS A QvC-ISOMETRY when gFormC u u = 1
theorem rotC_isom {u : O Cut} (hu : gFormC u u = 1) (p : STVC) :
    QvC (rotFunC u p) = QvC p := by
  obtain ⟨t, x, v⟩ := p
  show QformC _ _ _ = QformC _ _ _
  unfold QformC rotFunC
  simp only
  rw [gFormC_comp, hu, one_mul]

end

end Phys.Algebra
