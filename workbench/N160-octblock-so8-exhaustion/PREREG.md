# N160 PREREG — frozen GO/NO-GO + KILL before compute

## Target (priority (i)): the octonion-block SO(8) exhaustion residual.
N159 banked the 2-plane rotation generators `octPlaneRot e f c s` (orthonormal e,f, circle
point) lifted to the NON-VACUOUS `JoinedIdQvC`, and `joinedIdQvC_octPlaneRotWord` (a finite
product of them is JoinedIdQvC). N124 banked `gFormC_isom_mem_closure`: every gFormC-isometry
of `O Cut` is a finite product of Householder reflections (`Submonoid.closure houseHolderSet`).

## MEASURE-FIRST findings (hand-computed, to be probe-confirmed)
1. For ORTHONORMAL a,b (gFormC a a=gFormC b b=1, gFormC a b=0):
     `houseHolder a * houseHolder b = octPlaneRot a b (-1) 0`   (THE EVEN-PAIR IDENTITY)
   i.e. an orthogonal bireflection IS the plane half-turn. Direct: houseHolder a v =
   v - 2(gFormC a v)a (unit a); composing two orthogonal reflections gives v - 2(gFormC a v)a
   - 2(gFormC b v)b = octPlaneRot a b (-1) 0 v.
2. The half-turn is at the cayley ANTIPODE (c=-1, 1+c=0) — the path can't reach it directly.
   BUT the half-turn = (quarter-turn)²:
     `octPlaneRot a b 0 1 * octPlaneRot a b 0 1 = octPlaneRot a b (-1) 0`  (orthonormal a,b)
   and the quarter-turn octPlaneRot a b 0 1 has c=0, antipode 1+0=1≠0, circle point 0²+1²=1,
   so it IS JoinedIdQvC (N159 joinedIdQvC_octBlockEndC_octPlaneRot).
3. octBlockEndC is multiplicative: octBlockEndC(R*S) = octBlockEndC R * octBlockEndC S, and
   octBlockEndC 1 = 1 (trivial, both are (t,x,Rv) componentwise).
   ⇒ octBlockEndC(houseHolder a * houseHolder b) = octBlockEndC(octPlaneRot a b 0 1)² is
     JoinedIdQvC (joinedIdQvC_mul, N157). THE EVEN-PAIR LIFTS TO JoinedIdQvC.

## WHY THE LITERAL TARGET (i) "EVERY ... is a finite octPlaneRot word" NEEDS the SO restriction
A single Householder reflection has det −1 — NOT path-connected to id, NOT JoinedIdQvC. So the
honest non-vacuous claim is about the EVEN part (products of bireflections = SO(8) rotations).
The FULL closure-induction (every even reflection word = octPlaneRot word, the SO(8) dimension
generation) is the genuine heavy group-manifold remainder Mathlib lacks over the derived Cut.

## GO / NO-GO
GO: bank the structural even-pair core THIS node —
  - octBlockEndC_mul, octBlockEndC_one (multiplicativity of the lift);
  - octPlaneRot_quarter_sq_orthonormal: (octPlaneRot a b 0 1)² = octPlaneRot a b (-1) 0;
  - houseHolder_bireflection_eq_octPlaneRot: houseHolder a * houseHolder b = octPlaneRot a b (-1) 0
    (orthonormal a,b) — THE EVEN-PAIR = HALF-TURN identity the ticket names as bankable;
  - joinedIdQvC_octBlockEndC_orthoBireflection: octBlockEndC(houseHolder a * houseHolder b) is
    JoinedIdQvC for orthonormal a,b — the even-pair lifts NON-VACUOUSLY;
  - W8 witness: the concrete e₂,je2 orthogonal bireflection is JoinedIdQvC and moves an axis.
NO-GO / DECOMPOSE: the full closure-parity / dimension-induction word (every det+1 isometry =
  octPlaneRot word) — child N161 onto the chain tail.

## KILL (instrument-failure classifier, W9)
KILL any single tactic exceeding ~30s on the smallest sub-obligation, or any maxHeartbeats
inflation. The even-pair identity is a finite `ext`+`gFormC`-bilinearity `linear_combination`/
`abel` computation (like N159's gFormC_twoaxis_expand) — if it fights, the framing is wrong
(check orthonormality usage), do NOT grind. Decompose and child the rest.
