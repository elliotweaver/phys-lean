# N138 PREREG — THE EXPLICIT G₂ = Aut(O) = Der(O) GAUGE LINK (frozen before compute)

## TARGET (ROADMAP §N138 priority (i), measured against what the chain holds)
The gauge sector was OPENED at N137: the observer (t,x)-plane stabilizer `octStab` inside the
continuum Lorentz group `SO⁺(1,9)` restricts to the octonion-block `gFormC`-isometry group
(SO(8) ⊃ Spin(7) ⊃ G₂), with the section `octBlockEndC_mem_octStab : IsGFormCIsom R → IsOctStab
(octBlockEndC R)`.

N138 PINS THE G₂ IDENTITY OF THE GAUGE GROUP: an octonion ALGEBRA-automorphism of `O Cut`
(`IsAlgAutCut φ`, N41f — multiplicative + unital `Cut`-linear self-equiv) is a `gFormC`-ISOMETRY,
hence its octonion-block embedding lands in the gauge stabilizer `octStab`. This is the explicit
G₂ = Aut(O) = Der(O) ⊂ SO(8) inclusion: the gauge subgroup that ALSO fixes the octonion unit `1`
(the structure-preserving subgroup of the SO(8) block), connecting the N137 gauge content to the
banked octonion automorphism group (N31 `AutO`/N41f `IsAlgAutCut`/`expOEquiv_isAlgAut`) whose Lie
algebra is the simple type-G₂ `Der(O) = g₂` (N20, `finrank_derivationQ_eq_14`, dim 14).

## THE DERIVATION (W1 step 2 — trunk reframe, the Cut-side mirror of N31's ℚ-side `aut_gForm`)
Every step a one-rewrite reduction through banked identities — NO grind, NO brute:
1. `selfMulC_eq_smul : x * star x = (gFormC x x) • 1`  (Cut-side `selfMul_eq_smul`; from
   `octRefl_selfconj_eq_smul` of the self-conjugate `x·star x` + `gFormC = reQC(·star·)` def).
2. `octo_quadraticC : x * x = (2·reQC x) • x − (gFormC x x) • 1`  (the monic quadratic every
   element satisfies; from `octRefl_trace_id` + `smulCompat_oCut.hr` + step 1).
3. `autC_quad_diff`, `autC_reQC` (real-part preservation — the one nontrivial step, field case-split),
   `autC_star` (commutes with conjugation), `autC_gFormC` (★★ preserves `gFormC`) — mirror N31.
4. `autC_isGFormCIsom : IsAlgAutCut φ → IsGFormCIsom φ.toLinearMap`.
5. ★ `octBlockEndC_autC_mem_octStab : IsAlgAutCut φ → IsOctStab (octBlockEndC φ.toLinearMap)`
   — THE GAUGE INCLUSION (G₂ = Aut(O) ⊂ SO(8) ⊂ stabilizer of the observer plane).
6. W8 non-vacuity: `expOEquiv 0 = id` is a concrete `IsAlgAutCut` (N41f `expOEquiv_zero_isAlgAut`),
   so the inclusion is inhabited; `octBlockEndC_id_mem_octStab` exhibits a member; and the
   automorphism preserves the unit's self-overlap `gFormC (φ 1) (φ 1) = 1` (the costume anchor).

## GO / NO-GO (frozen)
- GO if: `octBlockEndC_autC_mem_octStab` PROVED foundations-only (the G₂⊂SO(8) gauge inclusion),
  + the chain `autC_gFormC` / `autC_isGFormCIsom`, derived from banked N31/N41f/N137 facts, NO new
  hypothesis, NO Mathlib ℝ/ℂ as content, NO posited G₂/Aut/gauge group. Costume C170 bites.
- NO-GO / DECOMPOSE if: any obligation exceeds the KILL budget (→ W9 instrument wall), OR the
  Cut-side transcription hits a missing banked lemma that is itself a node (→ child it, bank the
  bankable piece).

## KILL BUDGET (W9 — frozen)
- Per-obligation KILL = 90s (the chain convention). Any single `theorem` compile > 90s ⇒ declared
  an INSTRUMENT failure (NOT theory): STOP, measure the smallest sub-obligation, decompose. NO
  inflated `maxHeartbeats`, NO monolithic brute normalizer over expanded coordinates.
- Expected: LIGHT (a Cut-side transcription of N31's already-proved ℚ-side, all `simp only` /
  `linear_combination (norm:=abel/module)` / `smulCompat_oCut` rewrites over banked bilinearity).
- ANTI-TIMEOUT: checkpoint ~50% turns; bank-as-you-go; gate in BACKGROUND; child + complete with
  turns to spare.

## COSTUME C170 (W8 — must BITE, distinct false numeric)
A WRONG G₂/automorphism/gFormC/gauge claim: the octonion automorphism preserves the self-overlap
of the unit, `gFormC (φ 1) (φ 1) = gFormC 1 1 = 1`; claiming it reads `138` forces `⊢ 1 = 138`.
PASS_SIGNATURE = trailing `1 = 138` (ERE, no leading `-`), DISTINCT from C115 `1=7` … C169 `1=137`.

## PHYSICS-WORDS-REMOVABLE
Delete gauge/G₂/SO(8)/Spin(7)/automorphism/derivation/Aut/Lorentz/stabilizer/octonion/observer/
internal-symmetry/isometry → a pure-math statement: a multiplicative-and-unital `Cut`-linear
self-equiv of `O Cut` preserves the form `gFormC v w = reQC(v·star w)`, and its block embedding
into `STVC = Cut×Cut×O Cut` lies in the submonoid of `BvC`-isometries fixing `(1,0,0)` and `(0,1,0)`.
No theorem statement needs a physics word.
