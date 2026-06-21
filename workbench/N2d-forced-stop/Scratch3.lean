import Phys.Cascade.Sedenion
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD

variable {A : Type*}

def Nrm [Mul A] [Add A] [Neg A] [Star A] (z : CD A) : A := (z * star z).re

theorem Nrm_def [Ring A] [StarRing A] (z : CD A) :
    Nrm z = z.re * star z.re + star z.im * z.im := by
  simp [Nrm, mul_re, star_re, star_im, star_neg, neg_mul]

/-- EASY DIRECTION, general: on an ASSOCIATIVE base whose every element has CENTRAL
    self-overlap-trace data (a `*`-ring where `star a = t - a` won't be assumed;
    instead we assume the two algebraic facts the cascade actually provides:
    `a + star a` is central and `a * star a = star a * a` central). Test whether
    associativity + these centrality facts give multiplicativity. -/
-- First: try pure associativity (NO commutativity) to see what survives.
theorem Nrm_mul_assoc_only [Ring A] [StarRing A] (x y : CD A) :
    Nrm (x * y) = Nrm x * Nrm y := by
  simp only [Nrm_def, mul_re, mul_im, star_neg, neg_mul,
    star_mul, star_star, star_add]
  trace_state
  sorry
end CD
end Phys.Cascade
