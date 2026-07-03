/- N272 SELECT — MEASUREMENT RECORD (measure-first, de-risk).
   The candidate: THE ARENA'S JORDAN PRODUCT WEAVES THE THREE CAP-FORCED GENERATIONS CYCLICALLY.
   MEASURED CLEAN (whole file elaborated exit 0, ~48s incl. a since-removed broken probe; only
   the three cyclic laws below are kept — they compiled with only cosmetic unused-simp warnings):

     jb (slotA a) (slotB b) = slotC (star a * b)     -- (0,1)∘(0,2) share idx 0 → (1,2)=gen_C
     jb (slotB b) (slotC c) = slotA (b * star c)     -- (0,2)∘(1,2) share idx 2 → (0,1)=gen_A
     jb (slotC c) (slotA a) = slotB (a * c)          -- (1,2)∘(0,1) share idx 1 → (0,2)=gen_B

   THE FINDING: the Jordan product of two DISTINCT single-generation elements lands in the THIRD
   generation, carried by an OCTONION PRODUCT. The three cap-forced copies (N267) are NOT
   independent — the arena's own multiplication weaves them into a cyclic triangle. The GAUGE
   (N268 jAct) is diagonal/per-slot and BLIND to this coupling; the arena's PRODUCT is the first
   thing that connects the generations. The banked cubic-norm cross-term 2·reQ((a·c)·star b)
   (N215, gauge-invariant N269) is the SCALAR CONTRACTION of this operator primitive.

   FREE-FLOATING RAIL (measured): the bare coupling LAW holds for any *-ring (single-entry matrix
   mult) → SUPPORTING ingredient, NOT the headline (exactly like N268's generic jAct_mul). The
   octonion-SPECIFIC JOINT (the headline): (i) exactly THREE copies cap-forced
   (jordan_cap_pinned_at_three, carried in the capstone type); (ii) each the g₂-irreducible
   fundamental (N268); (iii) the woven-triple trace real part invokes octonion trace-associativity
   (reQ_mul_assoc3, N210 — FALSE at sedenions); (iv) the value star a * b is a genuine octonion
   product with NO zero divisors (N265). -/
import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanGaugeUniversality
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

theorem probe_AB (a b : O ℚ) : jb (slotA a) (slotB b) = slotC (star a * b) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jb, slotA, slotB, slotC, Xz, Matrix.mul_apply, Matrix.add_apply]

theorem probe_BC (b c : O ℚ) : jb (slotB b) (slotC c) = slotA (b * star c) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jb, slotA, slotB, slotC, Xz, Matrix.mul_apply, Matrix.add_apply]

theorem probe_CA (a c : O ℚ) : jb (slotC c) (slotA a) = slotB (a * c) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jb, slotA, slotB, slotC, Xz, Matrix.mul_apply, Matrix.add_apply]

end Phys.Algebra.HJ
