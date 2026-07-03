# N265 PREREG — MATTER IS ONE INDIVISIBLE WHOLE (worldMap-irreducibility of O ℚ) = THE CASCADE STOP

## DECIDED TARGET (SELECT S1–S5, comments 109–112 on t_6899c9c5; anti-bullshit gate PASSED)
The derived matter carrier `O ℚ` is IRREDUCIBLE under the fold's own worldMap (left-regular action
`leftReg`): the only `leftReg(ImO)`-invariant subspaces are `⊥` and `⊤`. Equivalently `O ℚ` has NO
ZERO DIVISORS (every nonzero standpoint's worldMap is injective / a bijection). And this
indivisibility is the SAME ONE CAUSE as the cascade stop: it is exactly the property that holds while
the Born self-overlap norm is multiplicative (through the octonion rung `O ℚ`) and FAILS at the next
rung `S ℚ = CD(O ℚ)` (banked `has_zero_divisor`). The DIVISION BOUNDARY theorem pairs the two — the
exact mirror of the banked `forced_stop_boundary`. A ★3 (matter) ↔ ★15 (terminal stop) joint.

## PRODUCTION FILE
`Phys/Algebra/TowerWorldMapIndivisible.lean` (grep-clean: no `TowerWorldMapIndivisible`, no
`worldMap_irreducible`, no `octNoZeroDivisors`, no `division_boundary` anywhere in Phys/).

## DECLS (all de-risked EXIT 0 foundations-only in workbench/N265-select/ BEFORE production)
1. `octNoZeroDivisors {x y : O ℚ} (hxy : x*y = 0) (hx : x ≠ 0) : y = 0`
   — from banked `gForm_comp` (Born composition law, from `Nrm_mul_on_O`) + `gForm_self_eq_zero`.
2. `octMul_ne_zero {x y} (hx : x≠0)(hy : y≠0) : x*y ≠ 0` — contrapositive.
3. `worldMap_injective {a : O ℚ} (ha : a ≠ 0) : Function.Injective (LeftMul a)`
   — WORLD-COMPLETENESS: every nonzero standpoint opens a complete inner world (nothing collapses).
4. `star_selfMul (w : O ℚ) : star w * w = (gForm w w) • 1` — the left-conjugate norm
   (from banked `selfMul_eq_smul` at `star w` + `reQ_mul_comm`), the lever for `1 ∈ W`.
5. `im_mem (w : O ℚ) : (star w - (reQ w)•1) ∈ ImO` — the imaginary part lands in ImO
   (banked `starL_add_one_apply`, `reQ_star`, `reQ_one`; closed by `module`).
6. ⭐⭐⭐ `worldMap_irreducible (W : Submodule ℚ (O ℚ)) (hinv : ∀ a:ImO, ∀ z∈W, leftReg a z ∈ W)
   {w} (hw : w∈W)(hw0 : w≠0) : W = ⊤` — THE HEADLINE: matter is indivisible.
7. ⭐⭐⭐ `division_boundary : (∀ x y:O ℚ, x≠0→y≠0→x*y≠0) ∧ (∃ x y:S ℚ, x≠0∧y≠0∧x*y=0)`
   — THE ONE-CAUSE JOINT (mirror of banked `forced_stop_boundary`): indivisibility at O, LOST at S.
8. W8 `leftReg_nonvacuous : leftReg ⟨u1, u1_mem_ImO⟩ ≠ 0` — the worldMap genuinely acts.
9. capstone `matter_indivisible` bundling (irreducibility + no-zero-divisors + boundary + non-vacuity).

## BANKED LEVERS (all confirmed present)
- `gForm_comp` (Phys/Algebra/LorentzIsometry.lean) : `gForm (x*y)(x*y) = gForm x x * gForm y y`.
- `gForm_self_eq_zero` (DerivationCompact) : `gForm w w = 0 ↔ w = 0` (ℚ-anisotropy = fold positivity).
- `selfMul_eq_smul` (DerivationAutGroup) : `x * star x = (gForm x x) • 1`.
- `starL_add_one_apply` (DerivationRep7) : `(starL+1) x = (2*reQ x)•1`; `reQ_star`, `reQ_one`.
- `reQ_mul_comm` (OctonionAssociative3Form). `qsmul_mul_left` (DerivationFinrank).
- `Phys.Cascade.has_zero_divisor` (Cascade/Sedenion) : `∃ x y:S ℚ, x≠0∧y≠0∧x*y=0`.
- `Nrm_mul_on_O`, `forced_stop_boundary` (Cascade/ForcedStop) — the mirror precedent.
- `LeftMul`/`LeftMul_apply` (ChiralityBlock); `leftReg`/`leftReg_apply` (TowerWorldMapCliffordModule).
- `u1`, `u1_mem_ImO`, `u1_ne_zero`; `ImO` = ker(starL+1).

## COSTUME C296
`Counterexamples/TowerWorldMapIndivisibleWrongValueCostume.lean`. Anchor a load-bearing quantitative
fact of the node and claim a wrong value. The natural anchor: the no-zero-divisor property makes the
worldMap norm multiplicative; anchor `gForm (u1 * u2) (u1 * u2) = gForm u1 u1 * gForm u2 u2 = 1`
(via `gForm_comp` + `gForm_u1`/`gForm_u2_u2`/orthonormal) and claim `min 296 (...) = 296` where it is
genuinely `1`. Bite reduces to `1 = 296` (FALSE). Pair (296,1) fresh. Tie to the node's composition
law explicitly. [Refine exact anchor when writing; must BITE = exit 1.]

## COST BUDGET + KILL (W9)
All 9 decls are SHORT structural rewrites over banked lemmas — NO coordinate bash, NO decide, NO
native_decide. Each measured EXIT 0 individually. Whole-module olean expected LIGHT (<20s), comparable
to N261-264. KILL: if any single obligation exceeds ~90s compile or needs a maxHeartbeats raise, STOP —
that signals a wrong framing (the levers are all banked structural facts; a blowup = instrument wrong,
W9). Do NOT raise the proof-kernel maxHeartbeats. (synthInstance 400000 bump is instance-search only,
banked N255–N264 precedent — allowed.)

## SCOPE — HONESTY CLAUSE
Banks: matter-indivisibility (worldMap-irreducibility of the concrete banked `O ℚ`) + no-zero-divisors
+ world-completeness (worldMap injective) + the DIVISION BOUNDARY joint (indivisible at O, lost at S,
mirror of `forced_stop_boundary`) + non-vacuity. Does NOT bank: a Mathlib `IsDomain`/`DivisionRing`
instance on `O ℚ` (would need two-sided inverses / more; the raw no-zero-divisor + injective worldMap
is the honest content), NOT the classification of which SM multiplet O is, NOT parity. The CENTER OF
GRAVITY is the ★3↔★15 boundary joint, NOT the standalone irreducibility (which alone would be a
generic division-algebra fact — quiet-drift; the joint to the cascade stop is what makes it
theory-native, per S4).

## FREE-FLOATING RAIL CHECK
Every headline TYPE mentions the banked tower objects: `O ℚ`, `S ℚ`, `leftReg`, `LeftMul`, `ImO`,
`gForm`, `u1`. NOT generic over an arbitrary carrier / division algebra. The irreducibility is about
the CONCRETE `leftReg` on the banked `O ℚ`; the boundary is the CONCRETE O→S rung transition.
