import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {A : Type*} [Ring A] [StarRing A]

-- Bricks (re-derive here in scratch; will promote):
theorem star_add_self' (z : CD A) : z + star z = iota (bilin z 1) := by
  ext
  · simp [bilin, iota, mul_re, star_re, star_im]
  · simp [iota]

theorem Nrm_star' (z : CD A) : Nrm (star z) = Nrm z := by
  -- needs centrality - NOT structural. Mark to revisit. Try anyway:
  rw [Nrm_def, Nrm_def]
  simp only [star_star]
  sorry

-- DERIVE adjoint from H.  Strategy from pin_H: the adjoint is read from P2_polar.
-- P2_polar (H): bilin(z·x)(w·y)+bilin(w·x)(z·y) = bilin z w · bilin x y.
-- The single-step we actually need in the L-chain is:
--   bilin(x·(star x·y), w) = bilin(star x·y, star x·w)   [adjoint with u=x, specialized]
-- Let's test deriving THIS specialized form from H.
-- Actually the chain needs: bilin(x·v, w) related... let me just test the adjoint
-- bilin(u·v,w)=bilin(v,star u·w) derived from H over CD A. Hard abstractly.
-- INSTEAD: test the H-free decomposition pieces from pin_H directly.

-- (i) bilin(x·(star x·y), w) = bilin(star x·y, star x·w)  -- claimed H-FREE in pin_H
example (x y w : CD A) :
    bilin (x * (star x * y)) w = bilin (star x * y) (star x * w) := by
  sorry

#check @P2
#check @bilin_symm
end Phys.Cascade.CD
