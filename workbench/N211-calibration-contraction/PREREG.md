# PREREG — N211: THE CALIBRATION CONTRACTION IDENTITY

## FRONT CHOSEN: (b) the contraction identity relating the calibration pair (phi N209, psi N210) to the metric g (N24)

## MEASURE-FIRST VERDICT (frozen before Lean compute)

Of the ROADMAP section N210-superseded FORWARD FRONTIER candidates:

- **(a) HYPERCHARGE NORMALIZATION** — REJECTED again (10th consecutive deferral N201-N210). No convention-free Y anchor inside rank-2 g2. N203 entanglement blocks a commuting-Cartan reading. N204 -16 anchors the isospin length not the Y ratio. Risks a posited convention (THE ONE LAW / W8).

- **(b) THE CONTRACTION IDENTITY** — CHOSEN. MEASURED GENUINELY NEW + LIGHT + NON-VACUOUS.

- **(c) g2 root / Cartan / triality** — re-pin/heavy risk. DEFERRED.

- **(d) WIDEST** (generation / Yukawa / CKM / Jordan) — genuinely different but heavier/from-scratch. DEFERRED.

## THE TARGET

The COASSOCIATIVE 4-FORM CONTRACTION IDENTITY: for all imaginary x,y,z,w in Im(O Q),

  coassoc4 x y z w = 2 * gForm (octCross x y) (octCross z w) - 2 * (gForm x z * gForm y w - gForm x w * gForm y z)

Equivalently (expanding the definitions):
  gForm (assoc x y z) w = 2 * gForm (octCross x y) (octCross z w) - 2 * (gForm x z * gForm y w - gForm x w * gForm y z)

This RELATES three banked objects:
  - coassoc4 (N210) = gForm (assoc x y z) w  [the 4-form psi]
  - octCross (N206) = x*y + gForm(x,y)*1      [the 7-dim cross product]
  - gForm (N24) = reQ(v * star w)              [the Born self-overlap form]

## WHY GENUINELY NEW (not a mechanical consequence / juxtaposition / re-pin)

1. It is NOT N206's Lagrange identity (degree-2 SCALAR: gForm(octCross x y)(octCross x y) = ...). The contraction is degree-4, relating the 4-form to the cross product.

2. It is NOT N208's contraction (octCross x (octCross x y) = ... — a VECTOR identity, (x,x,y) specialization). The contraction is a SCALAR identity for all (x,y,z,w), not a vector identity on a 2-fold specialization.

3. It is NOT N210's antisymmetry (a structural property of coassoc4 alone). The contraction RELATES coassoc4 to octCross and gForm.

4. It is NOT a juxtaposition of N207 + N24 (which was the REJECTED derivation-invariance front). The contraction is an ALGEBRAIC IDENTITY, not a derivation-invariance statement.

5. It is the CHARACTERIZING identity of G2: the 3-form phi and 4-form psi = *phi satisfy this contraction iff the stabilizer is G2. The factor 2 is FORCED by the algebra (not a convention).

## NON-VACUITY (W8)

The identity gives a NONZERO value on explicit witnesses:
  - coassoc4(e1, e2, e4, e7) = 2 (the contraction gives 2, not 0)
  - coassoc4(e1, e2, e4, [e1,e2,e4]) = 4 (the N210 witness, re-derived via the contraction)

## COSTUME (C243)

Bite: assert the contraction identity gives 211 on the witness (e1, e2, e4, e7), when it actually gives 2.
ERE: `= 211`

## KILL BUDGET

- The identity is a degree-4 SCALAR identity over Q on imaginary elements.
- Proof strategy: expand coassoc4 = gForm(assoc x y z) w, expand octCross, use the banked reQ-coordinate identities (reQ_mul_assoc3 N209, reQ_mul_comm N209, assoc_reQ_skew N210) + gForm bilinearity.
- Expected cost: ~15-30s per obligation (coordinate ring over Q, degree-4).
- KILL: 120s / 400000 heartbeats per obligation. If exceeded, decompose.

## PROOF ROUTE (theory-native, W9.4 structure-over-expansion)

The identity: gForm(assoc x y z) w = 2*gForm(octCross x y)(octCross z w) - 2*(gForm x z*gForm y w - gForm x w*gForm y z)

Step 1: Expand octCross z w = z*w + gForm(z,w)*1
  gForm(octCross x y)(octCross z w) = gForm(x*y + gForm(x,y)*1)(z*w + gForm(z,w)*1)
  = gForm(x*y)(z*w) + gForm(z,w)*gForm(x*y)(1) + gForm(x,y)*gForm(1)(z*w) + gForm(x,y)*gForm(z,w)*gForm(1)(1)
  For imaginary x,y,z,w: gForm(x*y)(1) = reQ((x*y)*1) = reQ(x*y) = -gForm(x,y) (since star(1)=1, gForm v 1 = reQ(v))
  Wait, gForm v 1 = reQ(v * star(1)) = reQ(v * 1) = reQ(v).
  For imaginary x: reQ(x) = 0. But x*y may not be imaginary.
  Actually gForm(x*y)(1) = reQ((x*y)*star(1)) = reQ(x*y) = reQ(x*y). And reQ(x*y) = -gForm(x,y) (for imaginary x,y: x*y + y*x = -(gForm x y)*2... hmm).
  
  Let me use the banked identity: for imaginary x,y, reQ(x*y) = -gForm(x,y).
  Actually: gForm x y = reQ(x * star y) = reQ(x * (-y)) = -reQ(x*y) for imaginary y (star y = -y).
  So reQ(x*y) = -gForm(x,y).
  
  So: gForm(x*y)(1) = reQ(x*y) = -gForm(x,y)
  Similarly: gForm(1)(z*w) = reQ(1 * star(z*w)) = reQ(star(z*w)) = reQ(z*w) (reQ is self-conjugate) = -gForm(z,w)
  And: gForm(1)(1) = reQ(1*1) = 1.
  
  So: gForm(octCross x y)(octCross z w) = gForm(x*y)(z*w) + gForm(z,w)*(-gForm(x,y)) + gForm(x,y)*(-gForm(z,w)) + gForm(x,y)*gForm(z,w)*1
  = gForm(x*y)(z*w) - 2*gForm(x,y)*gForm(z,w) + gForm(x,y)*gForm(z,w)
  = gForm(x*y)(z*w) - gForm(x,y)*gForm(z,w)

Step 2: So the RHS becomes:
  2*(gForm(x*y)(z*w) - gForm(x,y)*gForm(z,w)) - 2*(gForm x z*gForm y w - gForm x w*gForm y z)
  = 2*gForm(x*y)(z*w) - 2*gForm(x,y)*gForm(z,w) - 2*gForm(x,z)*gForm(y,w) + 2*gForm(x,w)*gForm(y,z)

Step 3: The LHS is gForm(assoc x y z) w = gForm((x*y)*z - x*(y*z)) w = gForm((x*y)*z) w - gForm(x*(y*z)) w

Step 4: Need to show:
  gForm((x*y)*z) w - gForm(x*(y*z)) w = 2*gForm(x*y)(z*w) - 2*gForm(x,y)*gForm(z,w) - 2*gForm(x,z)*gForm(y,w) + 2*gForm(x,w)*gForm(y,z)

This is a coordinate identity in reQ. The key tools:
  - gForm a b = reQ(a * star b) = reQ(a * (-b)) = -reQ(a*b) for imaginary b
  - reQ_mul_comm: reQ(a*b) = reQ(b*a)  [N209]
  - reQ_mul_assoc3: reQ((a*b)*c) = reQ(a*(b*c))  [N209]
  - assoc_reQ_skew: reQ(assoc x y z * w) + reQ(assoc x y w * z) = 0  [N210]
  - For imaginary x: x*star(y) = -x*y, so gForm x y = -reQ(x*y)

The proof should go through reQ-coordinate manipulation using the banked trace-associativity and the associator-Born-skew.

## DECLS (target ~6-8)

1. coassoc4_contraction: the main identity (for imaginary x,y,z,w)
2. coassoc4_contraction_witness: coassoc4(e1,e2,e4,e7) = 2 (non-vacuity)
3. coassoc4_contraction_witness_ne_zero: 2 ≠ 0
4. Possibly: the equivalent form gForm(octCross x y)(octCross z w) = metric + (1/2)*coassoc4
5. Possibly: the double contraction sum_{a,b} phi*phi = 6*g (if light enough)
