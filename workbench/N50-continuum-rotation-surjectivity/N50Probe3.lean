import Phys.Algebra.LorentzContinuum

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- check: gFormC (1 : O Cut) (1 : O Cut) = 1 ?
example : gFormC (1 : O Cut) (1 : O Cut) = 1 := by
  show reQC ((1 : O Cut) * star (1 : O Cut)) = 1
  rw [star_one, mul_one]
  rfl

-- membership form in qvIsomMonoidC : Submonoid (Function.End STVC)
-- IsQvIsomC T := ∀ p, QvC (T p) = QvC p ; rotFunC u ∈ qvIsomMonoidC ↔ IsQvIsomC (rotFunC u)
-- Check the carrier predicate works with rotFunC.
example (T : STVC → STVC) (h : ∀ p, QvC (T p) = QvC p) : (T : Function.End STVC) ∈ qvIsomMonoidC := h

-- W8 costume seed: a WRONG claim — rotation preserves QvC for a u with gFormC u u ≠ 1.
-- Take u = 2•1 ... but smul not available cleanly. Use u = (1+1) i.e. nonunit scalar.
-- gFormC (1+1) (1+1) = reQC((1+1)*star(1+1)) . star(1+1) = star1 + star1 = 1+1. (1+1)*(1+1)= ...
-- The WRONG claim: ∀ u p, QvC (rotFunC u p) = QvC p (no Born-unit hypothesis) is FALSE.
-- We verify a concrete counterexample arithmetic: for u with gFormC u u = 4, scaling breaks.
example : gFormC ((1:O Cut)+(1:O Cut)) ((1:O Cut)+(1:O Cut)) = 4 := by
  show reQC (((1:O Cut)+1) * star ((1:O Cut)+1)) = 4
  rw [star_add, star_one]
  -- ((1+1)*(1+1)) reQC ... compute
  have : ((1:O Cut)+1) * ((1:O Cut)+1) = (4:O Cut) := by ring
  rw [this]
  show ((4:O Cut).re.re.re) = 4
  norm_num
  rfl

end

end Phys.Algebra
