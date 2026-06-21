# N2d-MIDDLE-core — RUN 32 FINDINGS (verification log, pre-production)

## DECISIVE SCOPE (the reframe — THE ONE LAW pays off)
1. ABSTRACT IFF IS FALSE over a bare base. scope_iff.py/scope_map.py: B=UT (upper-tri
   2×2, non-comm assoc *-ring) → CD UT non-assoc, yet Nrm MULTIPLICATIVE on CD(CD UT)
   (0/400 fail). Cause: UT self-overlap form DEGENERATE (nilpotent radical n=(0,1,0),
   n·star n=0). So the iff requires ANISOTROPY (Born positivity), the home is the
   cascade's bases — exactly "for the cascade's bases" in the task body. UT is a
   costume-grade refutation of the over-general claim.
2. H FORCES the adjoint. H_forces_adj.py: NO base has H-true & adjoint-false. So abstract
   Hcore = (H ∧ Aniso ⟹ scaling) is clean; adjoint is derived, not posited.
3. adj_level.py: adjoint holds ⟺ self-overlaps + traces CENTRAL (Q,C,H,O,UT → 0; M2 →
   fails). The trunk's central positivity is the precise switch.

## STRUCTURAL PIECES VERIFIED FOUNDATIONS-ONLY IN LEAN THIS RUN [propext,(Quot.sound)]
- scaling_doubled_base: x·(star x·y)=ι(Nrm x)·y UNCONDITIONAL ext+ring on CD(CD B). (10s)
- adjoint_doubled: bilin(uv,w)=bilin(v,star u·w) UNCONDITIONAL ext+ring on CD(CD B). (7s)
- adjoint_triple: same on CD(CD(CD B)) = shape of S ℚ. (27s)  ← the feared piece is CHEAP
- Nrm_star_doubled: Nrm(star z)=Nrm z on CD(CD(CD B)) ext+ring. (7s)
- Part A ports to [NonAssocRing A]: add_mul'', mul_add'', Nrm_add'', bilin_add_left'',
  P2'' all foundations-only over [NonAssocRing A][StarRing A]. (8s)
- narCD: NonAssocRing (CD A) over [Ring A][StarRing A], foundations-only. (8s)
- srCD: StarRing (CD A) on top, foundations-only. (9s)
- COMPOSITION: letI narCD/srCD at base H ℚ gives instances on O ℚ; assoc_of_scaling
  applies at base O ℚ → O ℚ associative. Full architecture typechecks. (16s)
- Anisotropy on H ℚ (4 squares): (z·star z).re.re=0 → z=0, via nlinarith+sq_nonneg. (7s)
- VERIFIED bricks re-verified: star_add_self, P2_polar [propext,Quot.sound]. ✓

## CLEANER FRAMING (assoc_framing.py, 0/300 all rungs)
Via banked selfMul (x·star x = ι(Nrm x)), the scaling defect
  L(x,y) = x·(star x·y) − ι(Nrm x)·y  =  x·(star x·y) − (x·star x)·y  =  [x, star x, y]
IS the LEFT ASSOCIATOR. The scaling law is LEFT-ALTERNATIVITY x·(star x·y)=(x·star x)·y.

## iota-central (iota_left.py): bilin(ι t·y,w)=t·bilin(y,w) holds ONLY for t=Nrm x
(central+self-conjugate self-overlap), fails 249-300/300 for general t. The trunk's
central positivity — must specialize to t=Nrm x, never assert for general t.

## THE Hcore CHAIN (pinned, pin_H.py re-verified: bilin(L,w)=0 on O 0/300, S 300/300)
For all w:  bilin(L(x,y),w)
  = bilin(x·(star x·y),w) − bilin((x·star x)·y, w)            [selfMul]
  = [adjoint u=x]      bilin(star x·y, star x·w)
    − [adjoint u=x·star x] bilin(y, (x·star x)·w)             [star(x·star x)=x·star x]
  = [P2 z=star x, H]   Nrm(star x)·bilin(y,w) − [ι-right central, t=Nrm x] Nrm x·bilin(y,w)
  = [Nrm_star]         (Nrm x − Nrm x)·bilin(y,w) = 0.
Then w=L: bilin(L,L)=Nrm L+Nrm L (banked bilin_diag)=0 ⟹ Nrm L=0 ⟹ [ANISOTROPY] L=0.
⟹ scaling law. Compose assoc_of_scaling (banked) ⟹ A assoc. Assemble iff with
Nrm_mul_of_doubled_base. genNrm_not_mul_at_S = contrapositive corollary (forced law).

## ARCHITECTURE DECISION
Prove Hcore over the DOUBLED-BASE structure A = CD(CD B), B CommRing (the cascade shape:
S ℚ = CD(O ℚ) = CD(CD(CD(Dbl ℚ)))... actually O ℚ = CD(CD(Dbl ℚ)) so A=O ℚ IS CD(CD B)
with B = Dbl ℚ). There the adjoint, Nrm_star, ι-central are STRUCTURAL ext+ring
(derived over the doubling, never posited — W5). The ONLY H-step is banked P2''. Anisotropy
reduces to a sum of squares over ℚ. Non-vacuous: O ℚ is non-associative (banked
not_associative), so Hcore's contrapositive at A=O ℚ is the FORCED genNrm_not_mul_at_S.

## RISK / DECISION RULE
Anisotropy on the 16-dim S ℚ (sum of 16 squares, nlinarith) is the cost risk. If it
fights/times out → DECOMPOSE: bank the structural pieces + the abstract bilin(L,w)=0 +
the H ℚ-rung anisotropy, child the S ℚ anisotropy. NEVER posit aniso/adjoint abstractly.
