# PREREG — N200: THE LOSS OF LEFT-ALTERNATIVITY AT THE SEDENION RUNG (the FOURTH termination)

FROZEN BEFORE PRODUCTION. Node t_cd882776.

## THE TARGET (front (i)-LIGHT, chosen after MEASURE)
On the sedenion shape `S ℚ = CD (O ℚ)` — the rung ONE PAST the octonion stop —
the LEFT-ALTERNATIVE LAW `x·(x·y) = (x·x)·y` FAILS. This is a genuinely NEW
termination on the "one cause, many terminations" web: the same octonionic
non-associativity that (N2) stops the cascade, (N5) caps the Hermitian-Jordan
tower, and (N44) blocks the chirality extension ALSO destroys alternativity one
rung up. Until now this fact lived ONLY in a COMMENT (Alternative.lean L45–47:
"the left-alternative and Moufang laws break on CD (O ℚ)") and in a python
probe — NEVER banked as a Lean theorem.

## WHY THIS IS A DIFFERENT JOINT (not a re-pin — W4.5)
N43/N198/N199 are all faces of the (1,9) determinant FORM (a quadratic-form
object). This node is about the ALGEBRA's MULTIPLICATIVE structure (the
alternative law / associator), a completely different object. It also is NOT
the (i)-HEAVY forced-generic cascade-stop (the Hurwitz-depth "N-mult ⟹ assoc"
iff, deferred): it is the CONCRETE witnessed loss, the exact analogue of N2's
`not_associative` one rung up.

## THE DEEP PAYLOAD (the one-cause connection — what makes it NON-VACUOUS)
MEASURED (workbench/.../confirm_witness.py, exact rational arithmetic):
the minimal left-alt witness `x = e1+e10` IS the banked zero divisor `zdX`
(Sedenion.lean). With `y = zdY` (the OTHER banked zero divisor):
  • `zdX · zdY = 0`  — THE BANKED `zero_divisor_prod`.
  • hence `zdX·(zdX·zdY) = zdX·0 = 0`  (RHS of the left-alt law).
  • but `(zdX·zdX)·zdY ≠ 0`  (LHS): `zdX·zdX = -2·1` (scalar), so
    `(zdX·zdX)·zdY = -2·zdY ≠ 0` (coords 5,14 = -2).
So the SAME zero divisor that loses division and the Born/composition law (N2)
ALSO loses left-alternativity: `x·(x·y)=0` (forced by the zero divisor) while
`(x·x)·y≠0`. One cause, FOUR terminations.

## GO / NO-GO
GO if a scratch probe proves, foundations-only:
  (a) `sedenion_left_alt_witness`: `(zdX*zdX)*zdY ≠ zdX*(zdX*zdY)` (the teeth).
  (b) `sedenion_not_left_alternative`: `¬ ∀ x y : S ℚ, (x*x)*y = x*(x*y)`.
  (c) `zeroDivisor_forces_leftAlt_loss`: the connection — `zdX*(zdX*zdY) = 0`
      (via banked zero_divisor_prod) while `(zdX*zdX)*zdY ≠ 0`.
NO-GO / look wider if: the witness needs subtraction over S ℚ (no Sub instance);
the proof is W9-heavy (>KILL); or it reduces to a re-statement of a banked fact
with no new content.

## KILL (instrument budget — W9)
Per obligation: 90s wall / 1_000_000 maxHeartbeats (same envelope as the banked
`zero_divisor_prod`/`N_zdX` which use maxHeartbeats 1000000). If a single
coordinate-evaluation `simp` exceeds this, MEASURE the smallest sub-obligation,
decompose; do NOT inflate the ceiling. Use ADDITIVE/product forms ONLY — S ℚ
over the non-comm base O ℚ has NO Ring/Sub instance; never use subtraction,
never `ring`/`noncomm_ring` on S ℚ goals.

## METHOD
Mirror `not_associative_witness` (Octonion.lean) exactly: prove the product
INEQUALITY by `congrArg` on a single differing coordinate + `simp` on the
concrete literals, reusing the banked `zdX`, `zdY`, `zero_divisor_prod`. No new
elements beyond a `x*0=0` helper if needed.

## COSTUME (C232, anti-vacuity W8)
A WRONG claim about the witness that MUST fail to compile, reducing to a false
numeric DISTINCT from the battery (… C229 197=-2, C230 198=1, C231 199=0):
use `200 = 1` (claim the witness coordinate equals a wrong value, forcing 200=1
or similar). PASS_SIGNATURE ERE-escaped.

## PHYSICS-WORDS-REMOVABLE
No physics words at all — pure statement that the Cayley–Dickson double of the
double-of-a-double (the non-associative O ℚ) fails the left-alternative identity
`x(xy)=(xx)y`, witnessed by the banked zero divisor. Nothing to delete.
