# N2d-MIDDLE-core — RUN 33 FINDINGS (the close)

Run 32 did full recon (all structural pieces verified foundations-only) but timed
out on FLAT ASSEMBLY (same failure mode as run 29). Run 33 = decisive close: test
the two cost-risks IN ISOLATION first, then assemble.

## COST-RISKS DISSOLVED (both compile foundations-only, isolated)
1. S ℚ ANISOTROPY (the documented decompose trigger): (Nrm v).re.re.re is LITERALLY
   the sum of 16 squares of v's coords (ScrAniso1, 15s, ring). Hence
   `aniso_S : Nrm z = 0 → z = 0` on S ℚ via per-square nlinarith (ScrAnisoS, 2min,
   [propext,Classical.choice,Quot.sound]). The 2-torsion form `Nrm z + Nrm z = 0 → z=0`
   is the same nlinarith. THE RISK IS GONE — no decompose needed.
2. THE bilin(L,w)=0 CHAIN over the non-vacuous home A=CD(CD B): compiles foundations-only
   (ScrAssembleBig, [propext,Quot.sound]). `bilin_L_zero` + `scaling_of_aniso2` (Hcore).

## THE INSTANCE MAZE (what ate runs 29/32) — SOLVED
- narCD : NonAssocRing (CD A) over [NonAssocRing A][StarRing A] — CHAINS (gives instances
  on BOTH O-shape CD(CD B) AND S-shape CD(CD(CD B)) via attribute [local instance]).
  srCD similarly. Verified chaining (ScrDerisk): example NonAssocRing(CD(CD(CD B))) := narCD ✓.
- Part-A bricks PORT to [NonAssocRing A]: mul_add_na, Nrm_add_na, bilin_add_left_na,
  bilin_zero_left_na, bilin_neg_left_na (via add_left+zero, NOT smul — that was the bug),
  P2_na, bilin_diag_na. All [propext,Quot.sound].
- Structural ext+ring identities at S-shape CD(CD(CD B)): adjoint3 (H-FREE, bottoms to
  CommRing B), Nrm_star3, bilin_iotaNrm3. Each ~10-25s, [propext,Quot.sound].
- L expressed as a + (-b) (raw Neg) — avoids needing Sub on the bare-NA carrier.
- final step of bilin_L_zero: `add_neg_cancel` (values live in O-base NonAssocRing, NOT ring).

## THE Hcore CHAIN (proved, ScrAssembleBig)
bilin(L x y, w) = bilin_add_left_na + bilin_neg_left_na, then
  bilin(x·(x̄·y),w) = [adjoint3, u=x] bilin(x̄·y, x̄·w) = [P2_na, z=x̄] Nrm(x̄)·bilin(y,w)
                   = [Nrm_star3] Nrm x·bilin(y,w);
  bilin(ι(Nrm x)·y,w) = [bilin_iotaNrm3] Nrm x·bilin(y,w);  difference = 0.
Then w=L: bilin(L,L) = [bilin_diag_na] Nrm L + Nrm L = 0 ⟹ [aniso2] L=0 ⟹ scaling law.
NO A-valued nondegeneracy needed (the PREREG dissolution): w=L collapses it to scalar aniso.

## ASSEMBLY (production plan)
1. Generic core: bilin_L_zero, scaling_of_aniso2 (Hcore: H + aniso2 ⟹ scaling law).
2. assoc_of_H: scaling_of_aniso2 ∘ banked assoc_of_scaling = H + aniso2 ⟹ A=CD(CD B) assoc.
3. Concrete aniso on S ℚ (B=Dbl ℚ): aniso_S2.
4. Nrm_not_mul_on_S (FORCED LAW): assume H on S ℚ; assoc_of_H + aniso_S2 ⟹ O ℚ assoc;
   contradicts banked not_associative ⟹ ¬H. Recovers genNrm_not_mul_at_S as corollary.
5. forced_iff: Nrm mult on CD A ⟺ A assoc over doubled-base + aniso. Forward (⟸):
   A=CD(CD B) assoc ⟹ [iota_iota_e2_assoc_iff] CD B comm ⟹ letI CommRing(CD B) ⟹
   Nrm_mul_of_doubled_base (B:=CD B). Backward (⟹) = assoc_of_H. RISK: instance diamond
   (narCD vs Ring-derived once CD B comm). If forward fights → bank 1-4 (gap CLOSED),
   state iff at the banked-forward's native home, never weaken.

## COSTUME (bites): the scaling law / adjoint asserted WITHOUT H on a non-assoc base, or
Nrm-mult on S ℚ asserted true → contradiction with not_associative. Reduce to clean false core.
