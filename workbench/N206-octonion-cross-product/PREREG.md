# N206 PREREG — THE 7-DIMENSIONAL CROSS PRODUCT ON Im(O ℚ) + THE LAGRANGE NORM IDENTITY

FROZEN BEFORE COMPUTE. GO/NO-GO + KILL.

## THE FRONT (W4.5 WIDEST, measure-first)

Candidate fronts measured against what is ACTUALLY banked:

- (a) HYPERCHARGE NORMALIZATION (Q=T₃+Y/2) — REJECTED again (deferred N201–N205). Rank-2 g₂
  + N203 entanglement (colour not a Lie ideal) ⟹ no banked commuting su(3)⊕su(2)⊕u(1) Cartan
  to read a convention-free Y off; N204 −16 anchors ISOSPIN length, not the Y ratio. Writing
  Q=T₃+Y/2 still risks a posited convention (THE ONE LAW / W8). REJECT.
- (b) MALCEV-ALGEBRA structure beyond N205 (the Malcev identity proper) — REJECTED as a W4.5
  re-pin of the SAME Jacobiator object (N205) one identity over.
- (C) QUADRATIC MINIMAL POLYNOMIAL x² = 2(re x)•x − N(x)•1 — REJECTED, ALREADY BANKED as
  `octo_quadratic` (DerivationAutGroup.lean). Not new.
- ★ CHOSEN — (c) WIDEST, genuinely DIFFERENT object: THE 7-DIMENSIONAL CROSS PRODUCT on the
  imaginary subspace Im(O ℚ) (banked `ImO`, finrank 7, N26). The vector product
  `x ⊗ y := Im(x·y)` (the imaginary part of the octonion product of two imaginaries), and its
  defining **Lagrange / Pythagorean norm identity**
        gForm (x⊗y) (x⊗y) = gForm x x · gForm y y − (gForm x y)²
  — the composition-algebra Gram/Lagrange relation. This is the defining structure of the
  *vector-product algebra* whose automorphism group is EXACTLY G₂ — the SECOND, distinct
  characterization of G₂ (Aut of the cross product), vs the banked Der(O)=Lie(Aut O) the whole
  gauge arc N42/N184–N205 is built inside. The cross product as an operation on Im(O), its
  anticommutativity, its closure in Im(O), and the Lagrange norm identity were NEVER built.

## WHY GENUINELY NEW (W4.5 / W8)

- DIFFERENT OBJECT: an antisymmetric BILINEAR PRODUCT Im(O)×Im(O)→Im(O) with a QUADRATIC norm
  identity, NOT the full-algebra commutator of N205 (that is on ALL of O, lands the Jacobiator,
  is about the Lie-failure), NOT g₂=Der(O) (the derivation algebra), NOT the gForm metric alone
  (N24), NOT the (1,9) form (N43/N198/N199).
- NON-VACUOUS: the cross product is NOT identically zero (teeth: an explicit pair with
  x⊗y ≠ 0 AND the Lagrange RHS is a genuine nonzero value); the norm identity is a genuine
  quadratic relation linking THREE banked scalars (gForm x x, gForm y y, gForm x y), not a
  juxtaposition.
- NOT a mechanical consequence: requires (i) closure x⊗y ∈ ImO, (ii) the real-part identity
  re(x·y) = −gForm(x,y) on imaginaries, (iii) the composition law gForm_comp applied to x·y,
  (iv) the polarization gForm_polar to split gForm(x·y)(x·y) into the cross-norm + the
  inner-product square — none of these is a single banked lemma.
- NOT trivial-from-associativity: O ℚ is non-associative; the identity is a composition-algebra
  fact, not an associativity consequence.

## THE MECHANISM (THE ONE LAW reframe — composition law + polarization, NOT a coordinate bash)

For imaginary x, y ∈ Im(O) (star x = −x):
1. `octMul_re_eq_neg_gForm`: re(x·y) = −gForm x y for imaginary x,y. (From gForm x y =
   reQ(x · star y) = reQ(x·(−y)) = −reQ(x·y) = −re(x·y).)
2. Define `octCross x y := x*y + (gForm x y) • 1` = Im(x·y) (subtract the real part, which is
   −gForm x y, i.e. ADD gForm x y • 1). Equivalently the imaginary part.
3. `octCross_mem_ImO`: x⊗y ∈ ImO for imaginary x,y (its real part vanishes by construction).
4. `octCross_antisymm`: x⊗y = −(y⊗x) (the symmetric part of x·y is the real scalar; flipping
   leaves the imaginary part negated — uses gForm symm + the trace identity).
5. THE HEADLINE `octCross_lagrange`: gForm (x⊗y)(x⊗y) = gForm x x·gForm y y − (gForm x y)²:
   x·y = (x⊗y) − (gForm x y)•1 [from step 2], so by gForm bilinearity + gForm(·,1) machinery,
   gForm(x·y)(x·y) = gForm(x⊗y)(x⊗y) + (gForm x y)²·gForm 1 1 − 2(gForm x y)gForm(x⊗y)(1);
   x⊗y ∈ ImO ⟹ gForm(x⊗y)(1) = reQ(x⊗y · star 1)=reQ(x⊗y)=re(x⊗y)=0; gForm 1 1 = 1; and
   gForm(x·y)(x·y) = gForm x x·gForm y y by gForm_comp. Rearrange.
6. W8 TEETH: explicit imaginary witnesses (u1, u2) with octCross u1 u2 ≠ 0 and an explicit
   nonzero coordinate; the Lagrange RHS at an orthonormal pair = 1·1 − 0 = 1, witnessed.

## BANKED LEVERS (import + USE — W2)

- `gForm`/`reQ`/`gForm_symm`/`gForm_self_sum_sq` (DerivationCompact, N24)
- `gForm_add_left`/`gForm_add_right`/`gForm_smul_left`/`gForm_smul_right`/`gForm_polar`
  (DerivationAutCompact)
- `gForm_comp : gForm (x*y)(x*y) = gForm x x·gForm y y` (LorentzIsometry, the Born composition law)
- `selfMul_eq_smul`/`octo_quadratic`/`trace_id`/`reQ` (DerivationAutGroup, DerivationSkew)
- `ImO`/`mem_ImO`/`finrank_ImO=7`/`starL` (DerivationRep7, N26)
- `u1`/`u2`/`u4` (DerivationUpperBound), `star_u1`/`gForm_u1`/`complexUnit_sq` (SpinorRotation,
  DerivationStabilizer)
- `mul_neg`/`mul_add_na`/`qsmul_mul_right` on O ℚ (Cascade)

## GO / NO-GO

GO if: probe1 proves octMul_re_eq_neg_gForm + octCross_mem_ImO + octCross_antisymm clean
foundations-only; probe2 proves octCross_lagrange (the headline) clean; probe3 proves the W8
teeth (octCross u1 u2 ≠ 0 + a nonzero coordinate + the orthonormal Lagrange value). Each ≤ ~30s.

NO-GO / REFRAME if: the real-part identity or polarization fights (THE ONE LAW — return to
trunk: gForm_polar is banked, re(x·y) splits via gForm); if the Lagrange identity needs a
coordinate bash (W9 — it must go through gForm_comp + bilinearity, NOT 8-coord expansion).

## KILL

KILL any single obligation at 90s / default heartbeats. If octCross_lagrange needs a coordinate
expansion that exceeds 90s, STOP — reframe through gForm_comp + gForm_polar (structural), never
grind the coordinate form. If still intractable after the structural reframe: bank the bankable
pieces (cross product def + closure + antisymm + non-vanishing teeth), child the Lagrange
identity as a dedicated dissolution node (W1/W3).

## COSTUME (next id C238)

C238: a WRONG reading of octCross_lagrange or the cross-norm. Genuine value DISTINCT from the
battery (… C236 16=204, C237 12=205). Plan: the orthonormal Lagrange value gForm(u1⊗u2)(u1⊗u2)
= 1 (= 1·1 − 0²); WRONG claim it is 206 forces `206 = 1` in ℚ. Pair (206,1) — LHS 206 fresh;
RHS 1 reused but the PAIR is distinct from C234 (202=1). To be safe use a value-pair that is
fresh on BOTH sides if the witness affords it; finalize at costume time.
