# N257 PREREG — THE GATHER ISOMETRY (frozen before production)

## SELECTED TARGET (theory-native, SELECT S1–S5 passed, anti-bullshit gate passed — comment thread)

Over the fundamental 7 = ImO of the derived octonion rung `O ℚ = CD (H ℚ)`, the gather embedding
`crossEmb : ImO →ₗ End ℚ ImO` (N225, `a ↦ crossOp a`) is a SCALED ISOMETRY from the fold's Born
self-overlap form `gForm(v,w) = reQ(v · star w)` to the so(7) endomorphism trace form
`traceForm7 A C = trace(A ∘ C)`:

  **HEADLINE  `gather_isometry : ∀ a b : ImO, traceForm7 (crossOp ↑a) (crossOp ↑b) = -6 * gForm ↑a ↑b`**

i.e. `crossEmb^* B = −6 · gForm`. The scale −6 is FORCED (computed, not chosen).

## WHY (fold-causal, one arrow per step)
fold = self-look-back → Born self-overlap `gForm` is the fold's positive metric (N5b/N24) →
self-blindness forces the gather tear `crossEmb`, FAITHFUL from Born positivity (N225) → the
invariant trace form on so(7) is unique-up-to-scale (Schur, ImO g₂-irreducible N234) → `crossEmb`
pulls B back to a scalar multiple of the ONLY invariant form on the 7 = `gForm`, scale −6.

## COROLLARIES (the collapse — one cause forces several properties at once)
- `B_hyperOp_hyperOp : traceForm7 hyperOp hyperOp = -6`  (a=b=κO 1, |κO 1|²=1; hyperOp = crossOp (κO 1))
- `B_chargeOp_hyperOp : traceForm7 chargeOp hyperOp = 0`  (u1 ⟂ κO 1 in gForm; the two forced U(1)s ORTHOGONAL)
- `B_chargeOp_chargeOp_via_isometry : traceForm7 chargeOp chargeOp = -6`  (a=b=u1; re-derives N253 as an instance — unifies, the general identity is new)
- capstone `gather_isometry_structure` : isometry ∧ hyperOp length −6 ∧ charge⟂hyper ∧ both nonzero (−6 ≠ 0).

## SCOPE (HONESTY CLAUSE — respects the ≥6× hypercharge-normalization deferral)
Banks the convention-free pullback SCALE (−6) + the collapsed neutral Gram (equal length +
orthogonality of the two forced U(1)s). Does NOT claim the physical weak MIXING ANGLE / running
couplings / Gell-Mann–Nishijima (numerically FALSE as a span here: `Q ∉ span{T3,Y}`, `[Q,Y]≠0`,
workbench/N255-select/probe_gmn.py). That front stays deferred for the SAME structural reason (the
so(7) neutral plane supplies no posit-free richer structure to force the angle). This node supplies
the convention-free METRIC the angle will eventually sit in, without positing it.

## ROUTE (THE ONE LAW / W9-LIGHT — banked machinery only, mirrors N253/N256)
1. `crossOp_imBasis_eq_qI (i : Fin 7) : crossOp (imBasis i) = qI (Km i)` — ONE lemma, `fin_cases i`
   then the banked `chargeOp_eq_qI` tactic (`ext <;> simp only [crossOpO, octCross, qZ, Km, imBasis,
   c0..c7, gForm, reQ, hx0, CD/Dbl mul/add/neg/star/zero/one, Matrix.cons_val…] <;> ring`).
   Km 0..Km 6 = the 7 integer structure matrices (extracted + verified, probe_structure_matrices.py;
   Km 0 = banked Cmat byte-for-byte).
2. Reduce headline to basis by BILINEARITY of `fun a b => traceForm7 (crossOp ↑a)(crossOp ↑b)` and
   `fun a b => -6 * gForm ↑a ↑b` (both ℚ-bilinear in a,b via crossEmb linear + traceForm7/gForm
   bilinear). Use `bb`/`imBasis` basis: `bb.ext` twice (or Basis.ext_bilinear-style), reducing
   `∀ a b` to `∀ i j, LHS(bb i)(bb j) = RHS(bb i)(bb j)`. NOTE bb i = bvec i = ⟨imBasis i, _⟩.
3. On basis: LHS = `traceForm7 (qI (Km i))(qI (Km j)) = tr7 (mul7 (Km i)(Km j))` (banked
   `traceForm7_qI`) `= -6·δ_ij` by `decide`; RHS = `-6 * gForm (imBasis i)(imBasis j) = -6·δ_ij`
   (gForm orthonormality on imBasis — prove `gForm_imBasis (i j) : gForm (imBasis i)(imBasis j) =
   if i=j then 1 else 0` via coordinate expansion, `fin_cases i j` + `simp/decide`, OR via banked
   coord_eq_gForm/coordO). Match.
   VERIFIED numerically (probe_structure_matrices.py): tr7(mul7 Km_i Km_j) = -6·δ_ij AND
   gForm(imBasis i)(imBasis j) = δ_ij, both EXACT over all 49 pairs.

## KILL BUDGET (W9)
- The 7-case bridge `crossOp_imBasis_eq_qI` mirrors banked `chargeOp_eq_qI` × 7 cases. If a single
  case exceeds ~60s in a bounded probe → MEASURE and split per-i lemmas (each a banked-precedent
  `simp;ring`). Do NOT raise proof-kernel maxHeartbeats.
- The bilinearity reduction is the one genuinely-new structural step. If `Basis.ext`/bilinear
  reduction fights → fall back to explicit coordinate: write both sides over the bb basis via
  `LinearMap.trace` bilinearity lemmas; if STILL fighting after one bounded probe, it is a W9
  decompose (bank the 49 basis identities as a matrix lemma, assemble), NOT a grind.
- NO coordinate bash of the non-associative O ℚ product beyond the banked bridge tactic. NO
  native_decide. `decide` only on integer 7×7 `tr7 (mul7 …)` (foundations-only, banked precedent).
- ≥2 runs at full budget banking nothing = STOP, W1 dissolution ticket.

## COSTUME C288 (bites at the isometry TEETH)
A WRONG reading — the pullback scale is not −6 / the two forced U(1)s are NOT orthogonal / hyperOp
length ≠ chargeOp length / crossEmb is not an isometry — reduces through the banked identity to a
false numeric. Concrete: `min (288:ℚ) (- traceForm7 hyperOp hyperOp) = 6` teeth, or
`(traceForm7 chargeOp hyperOp) = 0` witness → a wrong nonzero forces `0 = 288`. Pick a fresh (LHS/RHS)
pair distinct from prior costumes (last = C287 1=287). Use e.g. `6 = 288` (RHS 288 fresh).

## MOAT / FREE-FLOATING
Every headline TYPE mentions the banked tower objects (`crossOp`/`traceForm7`/`gForm`/`hyperOp`/
`chargeOp` on derived `O ℚ`); the CONCRETE gather embedding on the banked 7, NOT carrier-agnostic.
NOT a re-pin (N253 banked three specific values; this banks the general `∀ a b` identity they are
corollaries of, + hyperOp length + charge⟂hyper, never before stated). Imports the banked tail
(`TowerGatherUniqueIsospinFixedAxis` transitively → crossEmb/crossOp/imRep/qI/traceForm7/tr7/mul7/
Km-tactic/bb/imBasis/gForm/hyperOp/chargeOp/kap1'). Ground = derived ℚ; NO Mathlib number/algebra as
content; nothing posited but the fold; no bridge.

## FILE
`Phys/Algebra/TowerGatherIsometry.lean`  (grep-clean: gather_isometry, crossOp_imBasis_eq_qI, Km,
gForm_imBasis, B_hyperOp_hyperOp, B_chargeOp_hyperOp, gather_isometry_structure NOT previously banked).
Under the LOCK: gather-native (crossEmb = N225 tear; NOT the parked J₃(O) ascent).
