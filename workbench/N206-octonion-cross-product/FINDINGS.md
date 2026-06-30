# N206 FINDINGS (W9 measure — frozen)

VERDICT: LIGHT node. Front (c) WIDEST CHOSEN — the 7-dim cross product on Im(O ℚ) + the
Lagrange/Pythagorean norm identity.

REJECTED fronts (measured BEFORE committing):
- (a) hypercharge normalization — REJECTED again (no convention-free Y anchor in rank-2 g₂;
  N203 entanglement; risks posited convention; deferred N201–N205).
- (b) Malcev identity proper — REJECTED as W4.5 re-pin of N205's Jacobiator.
- (C) quadratic minimal polynomial x²=2(re x)x−N(x)·1 — REJECTED, ALREADY BANKED as
  `octo_quadratic` (DerivationAutGroup).

MEASURE timings (lake env lean, clean, foundations-only [propext, Classical.choice, Quot.sound]):
- probe1 (gForm_one_right, octMul_re_eq_neg_gForm, octCross + octCross_mem_ImO): ~7.8s
- probe2 (gForm_one_one, gForm_ImO_one, octCross_lagrange — THE HEADLINE): ~8.8s
- probe3 (octMul_symm_eq, octCross_antisymm, gForm_u1_u2, gForm_u2_u2, octCross_u1_u2_coord,
  octCross_u1_u2_ne_zero, octCross_lagrange_u1_u2 — W8 teeth): ~10s
KILL=90s/obligation never approached.

KEY STRUCTURAL FACTS (no coordinate bash for the headline):
- The Lagrange identity goes through gForm_comp (Born composition law, banked) + gForm bilinearity
  (gForm_add/smul_left/right) + closure (octCross ∈ ImO) + gForm_ImO_one (Im ⊥ 1). NO 8-coord
  expansion.
- octCross x y := x*y + (gForm x y)•1 = Im(x·y), because for imaginary y, re(x·y) = −gForm x y.
- Closure needs only hy ∈ ImO; antisymmetry + Lagrange use both; kept both hypotheses to type
  the operation honestly as Im(O)×Im(O)→Im(O) (the vector-product algebra).
- W8 teeth: octCross u1 u2 = u1·u2 (orthogonal pair, gForm u1 u2 = 0), coord .re.im.im = 1
  (= e₃, the next imaginary unit, genuinely nonzero); Lagrange value at orthonormal (u1,u2) =
  1·1 − 0² = 1 (the cross product of two orthonormal imaginary units is itself a Born unit).

LEVERS (banked, import + USE): gForm/reQ/gForm_symm (DerivationCompact N24);
gForm_add_left/right, gForm_smul_left/right, gForm_polar (DerivationAutCompact);
gForm_comp (LorentzIsometry, Born composition law); trace_id/reQ_neg/reQ_add/reQ_smul/reQ_one
(DerivationSkew/DerivationAutGroup); mem_ImO/ImO/one_ne_zero_O (DerivationRep7 N26);
u1/u2/u1_mem_ImO/u2_mem_ImO (DerivationUpperBound/DerivationRep7); gForm_u1 (SpinorRotation);
star_mul/mul_neg/neg_mul_neg (Cascade).

IMPORTS NEEDED: Phys.Algebra.LorentzIsometry + Phys.Algebra.DerivationRep7 +
Phys.Algebra.DerivationAutCompact + Phys.Algebra.SpinorRotation. (DerivationAutCompact is the
one not transitively reached by LorentzIsometry/DerivationRep7 — it carries gForm bilinearity.)

NAME COLLISIONS: all 14 decls FREE across Phys/ Counterexamples/ Audits/ Phys.lean.

COSTUME C238: octCross_lagrange_u1_u2 = 1 genuine; WRONG claim 206 forces 206 = 1 in ℚ.
Pair (206,1): LHS 206 fresh; the cross-norm of two orthonormal imaginary units is 1, the WRONG
claim that it is 206 (the cross product is degenerate / the Lagrange identity fails / the cross
of two orthonormal units is not itself a unit) bites.
