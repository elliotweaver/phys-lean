# N116 PREREG — THE EXHAUSTION-ASSEMBLY FACTORIZATION (the inverse ninth rotation + the factorization)

FROZEN before compute. Run 300. Task t_775106d0.

## The node (chosen front: ROADMAP §N116 priority (ii), the GLOBAL EXHAUSTION ASSEMBLY)

N115 banked the deflation STEP (the SO(9)→SO(8) PEEL): for a compact QvC-isometry T with
T(0,1,0)=(0,x',v'), v'≠0, the explicit `deflateNinth x' v' := axisRotLin (r⁻¹•v') x' (−r)`
(r := cutSqrt (gFormC v' v')) satisfies `(deflateNinth x' v' · T)(0,1,0)=(0,1,0)` — the x-motion
is peeled off, leaving an x-FIXING isometry.

This node banks the **REASSEMBLY** the peel lacked: the explicit INVERSE rotation and the
FACTORIZATION. The inverse of `axisRotLin e c s` on the fixed 2-plane span{x,e} is `axisRotLin e c
(−s)` (opposite angle). Hence

    inflateNinth x' v' := axisRotLin (r⁻¹•v') x' r          (SAME c=x', OPPOSITE s=+r)

is the group-inverse of `deflateNinth x' v'`:

    inflateNinth x' v' · deflateNinth x' v' = 1             (★ inflate_deflate_id)

via the 2-plane rotation-addition with the UNIT-SPHERE law x'²+r²=1 (x'²+gFormC v' v'=1):
the composed (c,s) = (x'·x' − r·(−r), r·x' + x'·(−r)) = (x'²+r², 0) = (1,0) = identity rotation.
Reading gFormC e e = 1 (`deflateNinth_axis_unit`) closes the e-component.

THE FACTORIZATION (★★ the assembly): for T a QvC-isometry with T(0,1,0)=(0,x',v'), v'≠0,

    T = inflateNinth x' v' · (deflateNinth x' v' · T)       (★★ deflate_factorization)

where the right factor S := deflateNinth x' v' · T is x-FIXING (S(0,1,0)=(0,1,0),
`deflateNinth_step` N115), and the left factor inflateNinth x' v' is a SOUND general-axis ninth
rotation ∈ genIsomMonoidLinFamily, a QvC-isometry. So **every x-moving compact QvC-isometry is the
product of one explicit general-axis ninth rotation and one x-FIXING isometry** — the SO(9) =
(ninth rotation)·(SO(8) x-fixing stabilizer) reassembly, the explicit realization of the exhaustion
induction's reassembly step. (The inner reduction x-fixing isometry → octonion-block word — the
SO(8)-generation completeness — stays the childed remainder.)

Dual concrete witness (W8): `inflateNinth_apply_pole`: inflateNinth x' v' (0,1,0) = (0,x',v') —
inflate RE-MOVES the x-axis (the inverse of deflate's rotate-back). The concrete inflated pole
inflateNinth (3/5) ((4/5)•e₂) (0,1,0) reads x-slot 3/5.

## Decls to bank
- `inflateNinth x' v' := axisRotLin (r⁻¹•v') x' r` (the inverse rotation)
- `inflateNinth_mem` (SOUND ∈ genIsomMonoidLinFamily — unit axis + circle point (x',r), x'²+r²=1)
- `inflateNinth_isQvIsomC` (a QvC-isometry, family soundness)
- `inflateNinth_apply_pole` (inflateNinth x' v' (0,1,0) = (0,x',v') — the re-move, dual of N115's rotate-back)
- ★ `inflate_deflate_id` (inflateNinth x' v' · deflateNinth x' v' = 1 — the inverse/group law)
- ★★ `deflate_factorization` (T = inflateNinth x' v' · (deflateNinth x' v' · T))
- ★★ `deflate_factorization_stabilizer` (the right factor is x-fixing AND T = inflate·it — both pieces)
- W8: `inflate_witness_x_val` (inflateNinth (3/5) ((4/5)•e₂) (0,1,0) x-slot = 3/5)

## GO / NO-GO
- GO: all decls compile foundations-only [propext, Classical.choice, Quot.sound]; the inverse law
  `inflate_deflate_id` closes via the 2-plane rotation-addition + unit axis + unit-sphere law (pure
  gFormC bilinearity, NO brute); the factorization is mul_assoc + the inverse law; costume C148 bites.
- NO-GO: if the inverse law needs an unbanked general axisRotLin composition law that itself resists
  → DECOMPOSE: bank inflateNinth + inflateNinth_apply_pole + inflateNinth_mem/isQvIsomC (all light,
  independent of the group law) and child the inverse-law/factorization remainder.

## KILL (W9 — classify a fight as INSTRUMENT failure, not theory)
KILL = 90s per obligation. The inverse law is a bounded coordinate computation on a fixed 2-plane
(like N115's deflateNinth_apply_image, which compiled cheap). If ANY single obligation exceeds 90s:
STOP, do not inflate maxHeartbeats, do not brute — it is an instrument failure; measure the smallest
sub-obligation, decompose (prove the x-slot and v-block separately), or reframe through the structural
2-plane identity. NO native_decide, NO inflated maxHeartbeats, NO monolithic ring/simp on expanded
coordinates. If still intractable after measure+decompose → W1 dissolution ticket, NOT a grind.

## Costume C148 (W8 anti-vacuity)
The concrete inflated pole inflateNinth (3/5) ((4/5)•e₂) (0,1,0) has x-slot 3/5 (the re-moved
x-axis); the WRONG claim that it reads 107 (a stand-in for "inflate does not re-move / is not the
inverse of deflate / the factorization fails") forces `3 / 5 = 107`, which must NOT compile. The
false numeric `3 / 5 = 107` is DISTINCT from the banked battery (… C144 3/5=89, C145 4/5=97,
C146 12/13=101, C147 1=103). Reuses banked objects (inflateNinth/axisRotLin/e₂).

## Physics-words-removable
Delete rotation/axis/isometry/SO(9)/SO(8)/ninth/inverse/factorization/assembly/stabilizer/pole/
sphere/circle/peel/deflation/inflation/Spin/KAK: what remains is pure linear algebra over the
derived field Cut — for v'≠0 with x'²+gFormC v' v'=1, axisRotLin (r⁻¹•v') x' r ∘ axisRotLin (r⁻¹•v')
x' (−r) = id on Cut×Cut×O Cut (r=cutSqrt(gFormC v' v')); consequently any Cut-linear T preserving
QvC with T(0,1,0)=(0,x',v') equals axisRotLin (r⁻¹•v') x' r ∘ (axisRotLin (r⁻¹•v') x' (−r) ∘ T).
No theorem statement needs a physics word.
