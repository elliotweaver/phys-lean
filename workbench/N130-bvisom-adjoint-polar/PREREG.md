# N130 PREREG — frozen before compute

## THE TARGET (specified against what the chain ACTUALLY produced)

The ROADMAP §N130 priority (i) literally names "an arbitrary BvC-isometry S FACTORS as
S = blockDiagC a b R". **MEASURE-FIRST FINDING (re-spec, THE ONE LAW):** that literal target is
FALSE as a universal claim — `blockDiagC a b R` is only the *fixed-direction* SO(8)×SO(1,1)
block-diagonal subgroup; a generic boost points along an arbitrary spatial direction, so a generic
S of SO⁺(1,9) does NOT lie in that block subgroup. Grinding a mis-framed target is drift. The
theory-native re-spec, forced by what is already banked:

**THE GENUINE MISSING JOINT: EvC-adjoint existence for an arbitrary BvC-isometry — the connector
between the N125–N129 indefinite-Householder/BvC world and the N89–N105 polar/KAK strand.**

The polar/KAK strand (N89–N105) already banks the FULL polar path decomposition for an arbitrary
isometry: `isometry_polar_path_decomp` (N97) — every `g` with `IsQvIsomC g` AND `IsEvCAdjoint g h`
factors as `g = k·γ(1)`, k a QvC-isometry (compact part), γ an affine cone-path of positive
self-adjoint operators from id to the positive part. BUT it takes `IsEvCAdjoint g h` as a
HYPOTHESIS. The indefinite world (N125–N129) works with `IsBvIsomLin S`. The two strands are NOT
connected: nothing yet supplies the EvC-adjoint of an arbitrary `IsBvIsomLin` operator. THIS node
builds that connector, and feeds it into N97 to get the polar decomposition of an ARBITRARY
BvC-isometry — the genuine converse content, DERIVED not posited.

## THE DERIVATION (theory-native, every step a banked rewrite)

1. `IsBvIsomLin S → Function.Injective S`: if `S p = S q` then for all r, `BvC (p-q) r`... actually
   directly: `S` injective because `BvC` is nondegenerate and S preserves it. Cleanest: S injective
   from `IsBvIsomLin` via `bvC_right_nondeg`: if `S x = 0` then `BvC x r = BvC (S x)(S r) ... ` —
   need S surjective for that; instead use: `S x = 0 ⟹ BvC x x = BvC (S x)(S x) = BvC 0 0 = 0` is
   not enough (BvC indefinite). Use the metric route: ker route — `S x = 0 ⟹ ∀ r, BvC x r = ?`.
   Correct injectivity: `BvC (S x) (S r) = BvC x r`; if `S x = S y`, set `d = x - y`,
   `S d = 0` (linearity), then `∀ r, BvC d r`... need `BvC d r = BvC (S d)(S' r)` — requires a
   right-preimage. The clean banked route is the SAME as N89's `linIsom_injective`: there the
   QvC-isometry-with-adjoint is injective. For pure `IsBvIsomLin` (no adjoint yet) injectivity comes
   from: `S d = 0 ⟹ ∀ r, BvC d r = BvC (S d) (S r)`?? NO — that needs S preserving the pairing on
   the LEFT slot too, which IsBvIsomLin DOES give: `BvC (S d) (S r) = BvC d r`. With `S d = 0`:
   `BvC d r = BvC (S d)(S r) = BvC 0 (S r) = 0` for ALL r ⟹ `d = 0` by `bvC_right_nondeg`. ✓✓
   (No surjectivity needed — the LEFT argument is `S d`, and `S d = 0` kills it directly.)
2. injective → surjective (finite dim `Module.Finite Cut STVC`, N76) → bijective → linear inverse
   `Sinv : Module.End Cut STVC` with `S∘Sinv = id`, `Sinv∘S = id`.
3. EvC-adjoint: set `h := sigOpC ∘ Sinv ∘ sigOpC` (J = sigOpC). Then `IsEvCAdjoint S h`:
   `EvC (S p) q = BvC (S p)(J q)` [EvC a b = BvC a (J b), since BvC a (J b) = EvC a (J(J b)) = EvC a b]
              `= BvC (S p)(S (Sinv (J q)))` [J q = S(Sinv(J q)) by S∘Sinv=id]
              `= BvC p (Sinv (J q))` [IsBvIsomLin S]
              `= EvC p (J (Sinv (J q)))` [BvC a b = EvC a (J b)]
              `= EvC p (h q)`. ✓
4. `IsBvIsomLin S → IsQvIsomC S`: `QvC (S p) = BvC (S p)(S p) = BvC p p = QvC p` (`BvC_self`). ✓
5. FEED N97: `bvIsom_polar_path_decomp` — for arbitrary `IsBvIsomLin S`, the full N97 conclusion.

## DECLS TO BANK (production: Phys/Algebra/LorentzContinuumGenerationConversePolar.lean)
- `bvIsomLin_injective`        — IsBvIsomLin S → Function.Injective S (bvC_right_nondeg).
- `bvIsomLin_isQvIsomC`        — IsBvIsomLin S → IsQvIsomC S (BvC_self).
- `evC_eq_bvC_sigOpC`          — helper: EvC p q = BvC p (sigOpC q).
- `bvIsomLin_has_evCAdjoint`   — ★★ THE JOINT: ∃ Sinv h, S∘Sinv=id ∧ Sinv∘S=id ∧ IsEvCAdjoint S h
                                  with h = sigOpC∘Sinv∘sigOpC.
- `bvIsomLin_polar_path_decomp`— ★★★ feed N97: arbitrary IsBvIsomLin S = k·γ(1), the converse polar
                                  decomposition of an ARBITRARY BvC-isometry.
- W8 witness: a concrete BvC-isometry (a banked Householder `houseHolderM` or the boost) realizes
  the adjoint/decomposition non-vacuously — its adjoint genuinely acts, the decomposition genuine.

## GO / NO-GO
- GO if: every obligation is a banked one-rewrite reduction, each probe ≤ 30s, production build
  cached, foundations-only.
- NO-GO / re-spec if: the adjoint-existence proof needs an unbanked analytic input (it should NOT —
  it is finite-dim linear algebra + banked nondegeneracy).

## KILL BUDGET (W9)
- KILL any single obligation that exceeds **90s** compile in a bounded probe → declare INSTRUMENT
  failure, decompose/reframe, do NOT inflate maxHeartbeats. Default heartbeats only. NO native_decide,
  NO monolithic brute. If the inverse construction resists, it is a W1 dissolution ticket (the
  finite-dim inverse-as-Module.End lemma), NOT a grind.
- Checkpoint at ~50% turns/iterations: the instant a lemma compiles clean, MOVE to production + wire
  + commit BEFORE chasing the full decomposition.

## COSTUME (C162) — must BITE a wrong adjoint/converse-polar claim
A WRONG converse-polar / adjoint-existence claim reduces to a false numeric DISTINCT from C115 1=7
… C161 1=129. Plan: a wrong read-off of the adjoint/decomposition of a concrete BvC-isometry forces
`1 = 130`. PASS_SIGNATURE ERE matches trailing `1 = 130`.

## ANTI-VACUITY (W8)
The decomposition witness must be a GENUINE non-identity BvC-isometry whose adjoint genuinely acts /
whose polar parts are genuine. Delete every physics word → pure linear algebra over derived Cut.
