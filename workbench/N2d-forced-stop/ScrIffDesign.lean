import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
@[reducible] def narCD {A : Type*} [NonAssocRing A] [StarRing A] : NonAssocRing (CD A) where
  add := (· + ·)
  add_assoc a b c := by ext <;> simp <;> abel
  zero := 0
  zero_add a := by ext <;> simp
  add_zero a := by ext <;> simp
  add_comm a b := by ext <;> simp <;> abel
  neg := (- ·)
  neg_add_cancel a := by ext <;> simp
  nsmul := nsmulRec
  zsmul := zsmulRec
  mul := (· * ·)
  left_distrib a b c := by ext <;> simp [mul_add, add_mul] <;> abel
  right_distrib a b c := by ext <;> simp [mul_add, add_mul] <;> abel
  zero_mul a := by ext <;> simp
  mul_zero a := by ext <;> simp
  one := 1
  one_mul a := by ext <;> simp
  mul_one a := by ext <;> simp
end Phys.Cascade.CD

namespace Phys.Cascade
open CD
attribute [local instance] narCD

-- Forward direction question: does A = CD(CD B) associative ⟹ Nrm mult on CD A?
-- Nrm_mul_of_doubled_base gives Nrm mult on CD(CD B') for ANY CommRing B'. For Nrm mult
-- on CD A = CD(CD(CD B)), we'd need the base CD(CD B) to be a CD(CD B') i.e. a double of
-- a CommRing — but CD B is generally NOT commutative. So Nrm_mul_of_doubled_base does NOT
-- directly give the forward on CD(CD(CD B)).
-- HOWEVER: the genuine forward we banked is exactly "A=CD(CD B') ⟹ Nrm mult on CD A".
-- So the iff's natural home: pose the iff on CD(CD B) (i.e. A = CD B):
--   Nrm mult on CD(CD B)  ⟺  CD B associative.
-- Forward (⟸): CD B is always associative when B CommRing (Ring (CD B)), and
--   Nrm_mul_of_doubled_base gives Nrm mult on CD(CD B). TRUE unconditionally.
-- Backward (⟹): needs Hcore at level CD(CD B), i.e. base A' = CD B... but Hcore is stated
--   for base = CD(CD B). Level mismatch.
-- RESOLUTION: Hcore/base_assoc_of_H are at base CD(CD B), concluding CD(CD B) assoc.
--   The iff that ASSEMBLES is on the carrier S = CD(CD(CD B)) =: CD A with A = CD(CD B):
--   "Nrm mult on CD A (+ aniso) ⟺ A=CD(CD B) associative".
-- Forward (⟸): A=CD(CD B) associative + ... ⟹ Nrm mult on CD A. Is there a banked forward
--   for THIS? Nrm_mul_of_doubled_base needs A to be CD(CD B') of a CommRing B'. A=CD(CD B)
--   IS of that form with B'=B! So CD A = CD(CD(CD B))... no: Nrm_mul_of_doubled_base x y
--   for x y : CD(CD B') gives Nrm mult on CD(CD B'). With B'=CD B (needs CommRing(CD B) — FALSE).
-- So forward on CD(CD(CD B)) is NOT covered by the banked doubled-base lemma.

-- Let me just CHECK: is Nrm actually multiplicative on S ℚ = CD(CD(CD(Dbl ℚ)))? NO — that's
-- exactly genNrm_not_mul_at_S (it FAILS at S). So the iff at carrier S says:
--   Nrm mult on S ℚ ⟺ O ℚ associative.  RHS is FALSE (not_associative), so LHS must be
--   FALSE — consistent with genNrm_not_mul_at_S. The iff is the GENERAL law; the concrete
--   instance is the forced failure. GOOD — this is the assembly.

-- So the FORWARD (⟸) of the general iff "A assoc ⟹ Nrm mult on CD A" over the doubled-base
-- home is the genuinely needed forward. Test whether it's provable gener ically OR whether
-- we state the iff with the forward as the banked Nrm_mul_of_doubled_base at the RIGHT level.

-- Cleanest: state the iff at carrier CD(CD B) (A = CD B):
--   (∀ x y : CD(CD B), Nrm(xy)=Nrm x·Nrm y) ⟺ (∀ a b c : CD B, assoc).
-- Forward: CD B is a Ring (assoc always), and Nrm_mul_of_doubled_base gives LHS. Both sides TRUE.
--   VACUOUS-ish (CD B always assoc). Not the bite.
-- The NON-vacuous iff is at carrier S where O ℚ is non-assoc. That requires Hcore at base O ℚ
--   = CD(CD(Dbl ℚ)) = CD(CD B) with B=Dbl ℚ. base_assoc_of_H concludes O ℚ assoc. ✓ (backward)
--   Forward at carrier S: O ℚ assoc ⟹ Nrm mult on S. But O ℚ is NOT assoc, so forward is
--   vacuously about a false hypothesis at the concrete level — for the GENERAL iff we still
--   want the forward implication proved generically.

#check @Nrm_mul_of_doubled_base
#check @Nrm_mul_of_comm
end Phys.Cascade
