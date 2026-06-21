# N2d-MIDDLE-core — PREREG (run 32). Frozen BEFORE production Lean.

## Context
Chain tail. Parts A (polarization: bilin, Nrm_add, P1, P2), B (iota reflection), C
(scaling-law reflection: assoc_of_scaling, scal_im_assoc) are BANKED gate-green.
This node closes the SINGLE forward gap: Hcore `H : Nrm mult on CD A ⟹ scaling law`,
then assembles the forced iff. Verified bricks ready: star_add_self, P2_polar.

## NUMERICS RE-VERIFIED THIS RUN (exact rational, with teeth)
- pin_H.py: bilin(L,w)=0 on O (0/300), FAILS on S (300/300); Adj-step H-free (0/300 both);
  P2-step needs H (0/300 O, 299/300 S); Nrm(star x)=Nrm x H-free (0/300 both). ✓
- adj_structure.py: adjoint FAILS 296/300 on CD(M2) (non-central self-overlaps),
  trace/norm non-central there. ✓ Confirms adjoint NEEDS centrality.
- scaling_doubled.py: scaling law on CD A holds 0/300 on C,H,O (A assoc), FAILS 300/300
  on S,SS (A non-assoc). So scaling ⟺ base associative. ✓
- nondegen_reduce.py: scalar trace form T(v,w)=2⟨v,w⟩ Euclidean on O,S. ✓

## ★ DECISIVE NEW FINDINGS THIS RUN (the reframe — THE ONE LAW pays off)
1. scope_iff.py / scope_map.py: the LITERAL abstract iff `Nrm mult on CD A ⟺ A assoc`
   over a BARE [Ring A][StarRing A] is **FALSE**. Witness B=UT (upper-tri 2×2, a
   non-commutative associative *-ring): CD UT is NON-associative, yet Nrm is
   MULTIPLICATIVE on CD(CD UT) (Nrm-mult-FAILS 0/400). Reason: UT's self-overlap form
   is DEGENERATE (nilpotent radical n=(0,1,0), n·star n = 0). So the iff requires the
   trunk's ANISOTROPY (Born positivity), not a bare ring. THE ONE LAW: the abstract-base
   instrument cannot carry the trunk's positivity; the iff lives where positivity holds.
   → The honest theorem is over the cascade's bases (anisotropic), exactly as the task
     body says ("for the cascade's bases"). UT is the costume-grade refutation of the
     over-general claim.
2. adj_level.py: the ADJOINT `bilin(u·v,w)=bilin(v,star u·w)` on CD A holds 0/400
   EXACTLY when A's self-overlaps + traces are CENTRAL (Q,C,H,O,UT all central → 0;
   M2, CD M2 non-central → fails). The trunk's central positivity is the precise cause.
3. aniso_recur.py: Nrm on the cascade is a SUM OF SQUARES (projects to (Σcᵢ²,0,...)),
   so anisotropy `Nrm v = 0 ⟹ v = 0` holds on the WHOLE tower incl. S (it is about the
   FORM, not associativity), reducing by recursion to ℚ (x²+y²=0 ⟹ x=y=0).
4. ★ THE DISSOLUTION (trunk-native): the feared "A-valued nondegeneracy of bilin"
   COLLAPSES. From bilin(L,w)=0 ∀w, set w=L: bilin(L,L)=Nrm L + Nrm L (banked bilin_diag)
   =0 ⟹ 2·Nrm L=0 ⟹ Nrm L=0 ⟹ [ANISOTROPY] L=0. No A-valued nondegeneracy needed —
   only anisotropy of the self-overlap form = the trunk's positivity, made structural.

## THE Hcore CHAIN (pinned, pin_H.py decomposition)
L(x,y) := x·(star x·y) − ι(Nrm x)·y. Then for all w:
  bilin(L(x,y),w) = bilin(x·(x̄·y),w) − bilin(ι(Nrm x)·y,w)
    = [ADJOINT u=x]  bilin(x̄·y, x̄·w) − bilin(ι(Nrm x)·y,w)
    = [P2, z=x̄]      Nrm(x̄)·bilin(y,w) − [IOTA-CENTRAL] Nrm x·bilin(y,w)
    = [Nrm star-inv]  (Nrm x − Nrm x)·bilin(y,w) = 0.
Then w=L ⟹ Nrm L=0 ⟹ [anisotropy] L=0. ASSEMBLE: Hcore + assoc_of_scaling = H⟹A assoc;
with forward Nrm_mul_of_doubled_base = full iff; genNrm_not_mul_at_S = corollary.

## TYPECLASS HOME (the crux — non-vacuity + provability)
The iff MUST carry anisotropy (UT kills the bare version). The structural home where
adjoint (central self-overlaps) AND anisotropy (sum of squares) are BOTH provable is the
cascade's bases over an ORDERED base with trivial involution. Plan, in priority order:
  PLAN-CONCRETE (default, most defensible, non-vacuous): prove Hcore at the cascade's
    actual base A = O ℚ (octonion rung). There CD A = S ℚ; adjoint, Nrm-star-invariance,
    iota-centrality, P2, anisotropy are PROVED facts (ext + ring + ℚ-positivity). The
    backward bite is genuine: O ℚ is NON-associative (banked), so Hcore+assoc_of_scaling
    gives the contrapositive "O ℚ non-assoc ⟹ Nrm not mult on S ℚ" = genNrm_not_mul_at_S,
    now as a FORCED LAW (not just the witnessed pair). Assemble the iff for the cascade.
  PLAN-STRUCTURAL (attempt if it compiles cheaply): state Hcore over a base A with the
    DERIVED structural hypotheses (self-overlaps central + anisotropic), each proved on
    the cascade, never posited abstractly. Prefer this ONLY if the adjoint + anisotropy
    derive cleanly over the structure; do not grind.

## GO / NO-GO (frozen)
GO to bank a piece iff it compiles foundations-only (#print axioms ⊆ {propext,
Classical.choice,Quot.sound}) AND its costume bites. Bank in order: Nrm_star, iota-central
bilin step, the adjoint (over the central-self-overlap structure), anisotropy
(Nrm v=0⟹v=0, reduce to ℚ), Hcore, the assembled iff, genNrm corollary.

## DECISION RULE (W1-step3 / W3)
Attempt the full iff THIS run. If the adjoint OR anisotropy fights after the trunk reframe
(e.g. ext+ring on S ℚ times out like run 29), DECOMPOSE: bank every foundations-only piece
that compiles + a costume that bites, child the single remaining sub-lemma, link onto the
chain tail, complete as "decomposed". NEVER weaken to a vacuous shell; NEVER posit the
adjoint/anisotropy as an abstract hypothesis; NEVER run out of turns mid-task.

## KILL (a fight = INSTRUMENT failure, return to trunk)
K1. Do NOT chase the abstract [Ring A] iff — it is FALSE (UT). The home is anisotropic.
K2. Do NOT posit adjoint/anisotropy as abstract hypotheses on a general base (W5). Derive
    over the cascade's positivity structure, or instantiate concretely.
K3. Do NOT import Mathlib Hurwitz/CompositionAlgebra/normed-division (posits the iff).
K4. Do NOT retry the single-associator-witness route (refuted 3 ways).
K5. If anisotropy fights, it IS the trunk's positivity — reduce to ℚ (x²+...=0⟹0), never
    posit "nondegenerate form".

## Costume that BITES (ONE row, scripts/costume_manifest.tsv)
A WRONG core claim must FAIL to compile. Candidates (pick what lands):
  (a) the adjoint asserted on a NON-central base (CD M2 ℚ) → false numeric core; OR
  (b) Hcore/scaling asserted WITHOUT H on a non-assoc base → false core (à la C14); OR
  (c) the iff asserted over bare base via the UT witness → Nrm-mult-on-CD(CD UT) true but
      CD UT non-assoc → contradiction. Reduce to a clean false core (e.g. n = 0 for the
      UT nilpotent, or `2 = 0`).

## Single-flight (W4): this is the chain tail (children:[] verified at orient). Do not fork.
