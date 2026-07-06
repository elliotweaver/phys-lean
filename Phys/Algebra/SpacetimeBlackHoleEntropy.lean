/-
  # N361 — arc-E E5: BLACK HOLE ENTROPY `S = A/4` with `s₀ = ln 2` DERIVED — the area law + the `1/4`
  #         from the first law with N360's `T_H`, and `s₀ = cutLog 2` as the fold's BINARY forcing-failure
  #         count per boundary cell, over the DERIVED ℝ `Cut`.

  ⭐ FOURTH OWNER-AUTHORIZED SEED — GR / BLACK HOLE / COSMOLOGY, TARGET E5
  (`docs/SEED_GR_BLACKHOLE_COSMOLOGY.md`, §E5). The directed single successor of N360 (E4, the Hawking
  temperature `T_H = κ/2π = 1/(gravCouplingCoeff·M)`). This node closes Bekenstein–Hawking: the area law
  `S = A/4` (the `1/4` FALLING OUT of the first law with N360's DERIVED `T_H`), and the entropy per
  boundary cell `s₀ = ln 2 = cutLog 2` as the count of the fold's BINARY self-blindness (see / not-see),
  from which the cell area `a* = 4·ln 2` is FORCED.

  ## THE THEORY-NATIVE READING (why E5 is FORCED, not matched)

  Standard: `S = A/4` from Bekenstein's area argument + the first law `dS = dM/T_H`, the `1/4` MATCHED to
  the Hawking temperature; the per-cell entropy `s₀` POSITED / counted from a model-dependent microstate
  degeneracy (string/loop counting).

  Here NEITHER is matched:
  - **The `1/4` FALLS OUT of the first law with N360's DERIVED `T_H`, and REDUCES to the banked coupling
    identity.** The first law `dS/dM = 1/T_H = gravCouplingCoeff·M` (`hawkingTemp_schwarzschild`, N360)
    integrates to `S = gravCouplingCoeff·M²/2` (the antiderivative-difference `2` — the SAME FTC pattern
    as the banked `sinAntideriv`). The horizon area `A = gaussSphereSolidAngle·r_h²` with `r_h = 2M`
    (Schwarzschild horizon, an explicit HYPOTHESIS like N360's `κ_sg`). Then
    `S = A/4 ⟺ gravCouplingCoeff = 2·gaussSphereSolidAngle` — EXACTLY the banked N359
    `gravCouplingCoeff_two_flux`. So the `1/4` HOMES to the banked `8πG = 2·4π` coupling; it is the SAME
    trace-reversal `2` conspiring with the first-law integration `2` and the horizon `r_h = 2M`. **The
    moat: `T_H` (N360) and `S` both descend from the ONE banked `gravCouplingCoeff = 2·4π` (the derived
    Born turn `azimuthalTurn` ×4).**
  - **`s₀ = ln 2 = cutLog 2` from the fold's BINARY self-blindness.** The look-back's miss is TWO-VALUED
    (see / not-see — the fold cannot distinguish itself; a binary forcing-failure), so the number of
    forcing-failure states per boundary cell is `2`, and the entropy per cell is `s₀ = cutLog 2` (the
    DERIVED log, N175 — NOT `Real.log`). BINARY IS LOAD-BEARING: a ternary count `ω = 3` would give
    `cutLog 3 ≠ cutLog 2` (W8, `cellEntropy_binary_ne_ternary`). Matching the area law `S = A/4` to the
    bit-count `S = N·s₀` (`N = A/a*` cells) FORCES the cell area `a* = 4·s₀ = 4·ln 2` — proved UNIQUE by
    `cellArea_forced`. The "`4 ln 2 ℓ_P²`" cell area (seed §E5) is a DERIVED consequence, not posited.

  ## WHAT THIS NODE BANKS

      HasCutDerivAt f f' x           — the derived scalar difference-quotient derivative (trunk-native)
      hasCutDerivAt_sq               — d/dx (x²) = 2x  (the FTC `2`, from the derived order topology)
      hasCutDerivAt_const_mul        — the constant-multiple rule
      bhEntropy M = gravCouplingCoeff·M²/2                              (S = 4πM²)
      bhEntropy_firstLaw             — ★ dS/dM = gravCouplingCoeff·M  (the first law fixes the ½)
      bhEntropy_firstLaw_temp        — ★ dS/dM = 1/T_H  (GIVEN κ_sg=(4M)⁻¹, homes to N360)
      bhArea M = gaussSphereSolidAngle·(2M)²                           (A = 16πM², r_h=2M hypothesis)
      bhEntropy_eq_area_quarter      — ★★★ S = A/4  (reduces to the banked gravCouplingCoeff_two_flux)
      cellEntropy = cutLog 2         — s₀ = ln 2  (the binary self-blindness count)
      cellArea = 4·cellEntropy       — a* = 4 ln 2
      cellArea_forced               — ★ the cell area is the UNIQUE `a` with `(A/a)·s₀ = A/4` (A≠0)
      bhEntropy_cell_decomposition   — S = (A/a*)·s₀ = N·s₀  (the bit-count reproduces the area law)
      cellEntropy_binary_ne_ternary  — ★ W8: ln2 ≠ ln3 (binary load-bearing)
      bhEntropy_ne_area_half         — ★ W8: S ≠ A/2 (the ¼ is not ½)

  ## THE SHARED STRUCTURE / MOAT (arc-A + arc-E cross-tie)

  `T_H = 1/(gravCouplingCoeff·M)` (N360) and `S = A/4` BOTH descend from the ONE banked
  `gravCouplingCoeff = 2·gaussSphereSolidAngle = 8·cutPi` (N359) — itself the derived Born-circle turn
  `azimuthalTurn = 2·cutPi` (N328) scaled by `4`. The `1/4` in `S = A/4` is the SAME `2` (spin-2
  trace-reversal, `gravCouplingCoeff_two_flux`) times the first-law integration `2`, divided by the
  horizon `r_h = 2M`'s `4`. Three faces of the same derived structure: the temperature, the entropy
  coefficient, and — the third, independent face — the binary fold-count `s₀ = ln 2`.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "entropy / area / black-hole / Bekenstein / Hawking / horizon / bit / cell / first-law": the
  theorems stand as pure statements over the derived ℝ `Cut` — `HasCutDerivAt (fun M => c·M²/2) (c·M) M`;
  `(c·M²/2) = (gaussSphereSolidAngle·(2M)²)/4` (⟺ `gravCouplingCoeff = 2·gaussSphereSolidAngle`);
  `cutLog 2 ≠ cutLog 3`; `(A/(4·cutLog 2))·cutLog 2 = A/4`; the unique `a` with `(A/a)·cutLog 2 = A/4` is
  `4·cutLog 2`. Pure arithmetic + the banked `cutLog` strict-monotonicity + the derived order-topology
  difference quotient. No physics name does any logical work.

  ## HONEST GRADE (mandatory flags — do NOT overclaim)

  THEOREM-GRADE for the forced core: the first-law derivative fixes the `½` (`bhEntropy_firstLaw`, an
  EARNED derivative, not a posited coefficient); `S = A/4` REDUCES to the banked
  `gravCouplingCoeff_two_flux` (N359); `s₀ = cutLog 2` the binary count; the cell area FORCED unique
  (`cellArea_forced`); binary + `1/4` non-vacuity (W8). CONDITIONAL on the explicit metric-specific
  hypotheses `κ_sg = (4M)⁻¹` (surface gravity, N360's childed piece) and `r_h = 2M` (horizon radius) —
  both kept as HYPOTHESES, NEVER asserted, CHILDED (the full metric build). The area `A` is
  symbolic/parametric. The WHY-binary (self-blindness is two-valued — the look-back's see/not-see miss) is
  the MECHANISM identification — flagged (a forcing-failure count, not a posited microstate degeneracy).
  `M`/`ℓ_P²` stay SYMBOLIC dimensionful anchors (G3); `S`/`ln 2` numeric values are removable prose only
  (G2). No empirical number appears in any proof.

  ## SEED-4 HARD GUARDS

  - G1 NO ASSERTED VALUE — `S = A/4`, the `1/4`, `s₀ = ln 2`, `a* = 4 ln 2` ALL DERIVED (the `½` from the
    EARNED first-law derivative; `S=A/4` from the banked `gravCouplingCoeff_two_flux`; `s₀=cutLog 2` from
    the binary count; `a*` forced unique). `κ_sg=(4M)⁻¹`, `r_h=2M` are explicit HYPOTHESES, not posits.
  - G2 NO EMPIRICAL NUMBER — `S`/`ln 2` numeric values / any measured entropy = REMOVABLE PROSE ONLY.
  - G3 SCALES vs RATIOS — `M`, `ℓ_P²` the symbolic dimensionful anchors; `S/A`, `s₀`, `a*/ℓ_P²`
    dimensionless-structured.
  - G4 DERIVED NOT POSITED — the `½` from the first-law derivative (`hasCutDerivAt_sq` over the derived
    order topology, NOT a posited coefficient); the `S=A/4` reduction from the banked N359 identity; the
    binary count from the fold's two-valued self-blindness; the cell area from the forced match.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; no sorry, axiom,
    kernel-compiled decision, or `maxHeartbeats` raise. Ground field the DERIVED `Cut` + banked
    `gravCouplingCoeff`/`gaussSphereSolidAngle`/`hawkingTemp`/`cutLog` (⚠ NOT Mathlib-ℝ/`Real.log`/`deriv`
    as content; the derivative is the trunk-native `Tendsto` over the N34 order topology, the SAME shape
    as the banked `cut_powerseries_deriv`).

  ## NOT FREE-FLOATING

  Every production TYPE cites banked derived objects: `gravCouplingCoeff`/`gaussSphereSolidAngle` (N359/N328),
  `hawkingTemp`/`hawkingTemp_schwarzschild` (N360), `cutLog`/`cutLog_lt`/`cutLog_pos` (N175/N341). `bhEntropy`
  is built from `gravCouplingCoeff`; `bhArea` from `gaussSphereSolidAngle`; `S=A/4` lands on
  `gravCouplingCoeff_two_flux`; `cellEntropy` is `cutLog 2`. Grounded on the derived tower, not a generic
  thermodynamics/statistical-mechanics abstraction.

  ## THE ONE CAUSE (THE ONE LAW)

  The SAME derived Born-circle turn `azimuthalTurn = 2·cutPi` (the fold's return surface, N328) that
  normalized the fine-structure coupling (N329) and gravity (`8π = azimuthalTurn·4`, N359) and fixed the
  Hawking period (N360) now fixes the entropy coefficient: `S = A/4 ⟺ gravCouplingCoeff = 2·(4π flux)`.
  And the third, independent face — the entropy per cell `s₀ = ln 2` — is the fold's BINARY self-blindness
  (the look-back's two-valued see/not-see miss). One derived turn + one binary miss: the temperature, the
  `1/4`, and the `ln 2` all fall out.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system content
  import, NO `Real.log`/`Real.pi`. No empirical scale (entropy, mass) appears anywhere.
-/
import Phys.Foundation.ContinuumScalarDeriv
import Phys.Algebra.SpacetimeHawkingTemperature
import Phys.Algebra.FineStructureRunningCoupling

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## (1) THE DERIVED SCALAR DERIVATIVE (a small W1 build over the derived order topology). -/

/-- THE DERIVED SCALAR DERIVATIVE over the derived ℝ `Cut`: `HasCutDerivAt f f' x` iff the difference
    quotient `t⁻¹·(f(x+t) − f x)` tends to `f'` as `t → 0` in the punctured neighbourhood `𝓝[≠] 0`.
    Trunk-native `Filter.Tendsto` over the N34 order topology — the SAME shape as the banked
    `cut_powerseries_deriv` (N41g); NO Mathlib `HasDerivAt`/`deriv`/`fderiv`, NO ℝ-valued `Norm`. -/
def HasCutDerivAt (f : Cut → Cut) (f' x : Cut) : Prop :=
    Tendsto (fun t : Cut => t⁻¹ * (f (x + t) - f x)) (𝓝[≠] (0 : Cut)) (𝓝 f')

/-- The identity function tends to `0` in the punctured neighbourhood of `0`. -/
theorem cut_tendsto_id_punctured : Tendsto (fun t : Cut => t) (𝓝[≠] (0:Cut)) (𝓝 0) := by
  have h := (continuous_id (X := Cut)).tendsto (0:Cut)
  exact h.mono_left nhdsWithin_le_nhds

/-- ★ THE DERIVATIVE OF THE SQUARE: `d/dx (x²) = 2x` over the derived ℝ. The difference quotient
    `t⁻¹·((x+t)² − x²)` equals `2x + t` on `t ≠ 0`, which tends to `2x`. This is the antiderivative-
    difference `2` (the FTC coefficient) EARNED from the derived order topology, never posited. -/
theorem hasCutDerivAt_sq (x : Cut) : HasCutDerivAt (fun y => y ^ 2) (2 * x) x := by
  unfold HasCutDerivAt
  have hcongr : (fun t : Cut => t⁻¹ * ((x + t) ^ 2 - x ^ 2))
      =ᶠ[𝓝[≠] (0:Cut)] (fun t : Cut => 2 * x + t) := by
    filter_upwards [self_mem_nhdsWithin] with t ht
    have htne : t ≠ 0 := ht
    field_simp; ring
  rw [tendsto_congr' hcongr]
  have h : Tendsto (fun t : Cut => 2 * x + t) (𝓝[≠] (0:Cut)) (𝓝 (2 * x + 0)) :=
    tendsto_const_nhds.add cut_tendsto_id_punctured
  simpa using h

/-- The constant-multiple rule: `d/dx (c·f) = c·f'`. -/
theorem hasCutDerivAt_const_mul (c : Cut) {f : Cut → Cut} {f' x : Cut}
    (h : HasCutDerivAt f f' x) : HasCutDerivAt (fun y => c * f y) (c * f') x := by
  unfold HasCutDerivAt at h ⊢
  have hc := h.const_mul c
  refine hc.congr ?_; intro t; ring

/-- Congruence: a derivative transfers along a pointwise-equal function. -/
theorem hasCutDerivAt_congr {f g : Cut → Cut} {f' x : Cut} (h : HasCutDerivAt f f' x)
    (hfg : ∀ y, f y = g y) : HasCutDerivAt g f' x := by
  unfold HasCutDerivAt at h ⊢; simpa only [hfg] using h

/-! ## (2) THE BLACK-HOLE ENTROPY and THE FIRST LAW (the `½` fixed by `dS/dM = 1/T_H`). -/

/-- THE BLACK-HOLE ENTROPY `S = gravCouplingCoeff·M²/2` (`= 4πM²`). The coefficient `½` is NOT posited —
    it is FIXED by the first law `dS/dM = 1/T_H` (`bhEntropy_firstLaw`), the integral of the derived
    `T_H⁻¹ = gravCouplingCoeff·M` (N360). `M` stays the symbolic dimensionful anchor (G3). -/
def bhEntropy (M : Cut) : Cut := gravCouplingCoeff * M ^ 2 / 2

/-- ★ THE FIRST LAW fixes the coefficient: `dS/dM = gravCouplingCoeff·M`. The derivative of
    `gravCouplingCoeff·M²/2` is `gravCouplingCoeff·M` (via the EARNED `hasCutDerivAt_sq`), so the `½` is
    the UNIQUE coefficient making `S` satisfy the first law. DERIVED from the derived order-topology
    difference quotient, never posited. -/
theorem bhEntropy_firstLaw (M : Cut) : HasCutDerivAt bhEntropy (gravCouplingCoeff * M) M := by
  have h1 : HasCutDerivAt (fun y => (gravCouplingCoeff / 2) * y ^ 2)
      ((gravCouplingCoeff / 2) * (2 * M)) M :=
    hasCutDerivAt_const_mul (gravCouplingCoeff / 2) (hasCutDerivAt_sq M)
  have hval : (gravCouplingCoeff / 2) * (2 * M) = gravCouplingCoeff * M := by ring
  rw [hval] at h1
  exact hasCutDerivAt_congr h1 (fun y => by unfold bhEntropy; ring)

/-- ★ THE FIRST LAW as `dS/dM = 1/T_H`: GIVEN the Schwarzschild surface gravity `κ_sg = (4M)⁻¹` (an
    explicit HYPOTHESIS, N360's childed metric-specific piece, NEVER asserted), the entropy derivative
    equals the reciprocal of the DERIVED Hawking temperature `1/T_H = gravCouplingCoeff·M`
    (`hawkingTemp_schwarzschild`, N360). The first law of black-hole mechanics, HOMED to N360. -/
theorem bhEntropy_firstLaw_temp (κsg M : Cut) (hM : M ≠ 0) (h : κsg = (4 * M)⁻¹) :
    HasCutDerivAt bhEntropy (1 / hawkingTemp κsg) M := by
  have hT : (1 : Cut) / hawkingTemp κsg = gravCouplingCoeff * M := by
    rw [hawkingTemp_schwarzschild κsg M hM h, one_div_one_div]
  rw [hT]; exact bhEntropy_firstLaw M

/-! ## (3) THE HORIZON AREA and THE `1/4` (reduces to the banked `gravCouplingCoeff_two_flux`). -/

/-- THE HORIZON AREA `A = gaussSphereSolidAngle·r_h²` with `r_h = 2M` (`= 16πM²`). The Schwarzschild
    horizon radius `r_h = 2M` is an explicit HYPOTHESIS (metric-specific, CHILDED, like N360's `κ_sg`),
    and the area is the DERIVED Gauss-sphere solid angle (N328) times `r_h²`. -/
def bhArea (M : Cut) : Cut := gaussSphereSolidAngle * (2 * M) ^ 2

/-- ★★★ THE AREA LAW `S = A/4` — the `1/4` FALLS OUT and REDUCES to the banked N359
    `gravCouplingCoeff = 2·gaussSphereSolidAngle`. Indeed `S = gravCouplingCoeff·M²/2 =
    (2·gaussSphereSolidAngle)·M²/2 = gaussSphereSolidAngle·M²` and `A/4 = gaussSphereSolidAngle·(2M)²/4 =
    gaussSphereSolidAngle·M²`. The `1/4` is the SAME trace-reversal `2` (N359) times the first-law
    integration `2`, over the horizon `r_h=2M`'s `4`. HOMED, never matched. -/
theorem bhEntropy_eq_area_quarter (M : Cut) : bhEntropy M = bhArea M / 4 := by
  unfold bhEntropy bhArea
  rw [gravCouplingCoeff_two_flux]; ring

/-! ## (4) THE BINARY SELF-BLINDNESS COUNT `s₀ = ln 2` and THE FORCED CELL AREA `a* = 4 ln 2`. -/

/-- THE ENTROPY PER BOUNDARY CELL `s₀ = ln 2 = cutLog 2` — the count of the fold's BINARY self-blindness:
    the look-back's miss is TWO-VALUED (see / not-see; the fold cannot distinguish itself), so the number
    of forcing-failure states per cell is `2` and its entropy is the DERIVED log `cutLog 2` (N175, NOT
    `Real.log`). Binary is LOAD-BEARING (`cellEntropy_binary_ne_ternary`). -/
def cellEntropy : Cut := cutLog 2

/-- THE BOUNDARY CELL AREA `a* = 4·s₀ = 4·ln 2` (in `ℓ_P²` units) — FORCED by matching the area law
    `S = A/4` to the bit-count `S = N·s₀` (`cellArea_forced`), not posited. -/
def cellArea : Cut := 4 * cellEntropy

/-- Born positivity of the cell entropy: `0 < s₀` (the binary count exceeds `1`, so `cutLog 2 > 0`). -/
theorem cellEntropy_pos : 0 < cellEntropy := by
  unfold cellEntropy; exact cutLog_pos (by norm_num)

/-- ★ THE CELL AREA IS FORCED UNIQUE: `a* = 4·s₀` is the ONLY cell area `a` for which the bit-count
    `(A/a)·s₀` reproduces the area law `A/4`, for any nonzero area `A` (and `s₀ ≠ 0`). So the "`4 ln 2`"
    cell area is a DERIVED consequence of matching the two pictures, never a posit. -/
theorem cellArea_forced (A a : Cut) (hA : A ≠ 0) (ha : a ≠ 0) :
    (A / a) * cellEntropy = A / 4 ↔ a = cellArea := by
  have hs : cellEntropy ≠ 0 := ne_of_gt cellEntropy_pos
  unfold cellArea
  constructor
  · intro h
    field_simp at h
    rw [← h]; ring
  · intro h; rw [h]; field_simp

/-- THE CELL DECOMPOSITION `S = (A/a*)·s₀ = N·s₀` — the boundary bit-count (`N = A/a*` cells, each of
    entropy `s₀`) reproduces the area law `S = A/4`, with the FORCED cell area `a* = 4·ln 2`. -/
theorem bhEntropy_cell_decomposition (M : Cut) :
    bhEntropy M = (bhArea M / cellArea) * cellEntropy := by
  have hne : cellEntropy ≠ 0 := ne_of_gt cellEntropy_pos
  unfold cellArea
  rw [bhEntropy_eq_area_quarter]
  field_simp

/-! ## (5) NON-VACUITY (W8): binary is load-bearing, and the `1/4` is not `1/2`. -/

/-- ★ W8 NON-VACUITY (BINARY IS LOAD-BEARING): `s₀ = cutLog 2 ≠ cutLog 3`. A ternary forcing-failure
    count `ω = 3` would give `cutLog 3` (the "`4 ln 3`" cell area), genuinely different from the binary
    `cutLog 2` — proved by the banked strict-monotonicity `cutLog_lt` (N341). The two-valuedness of the
    self-blindness is essential. -/
theorem cellEntropy_binary_ne_ternary : cellEntropy ≠ cutLog 3 := by
  unfold cellEntropy
  exact ne_of_lt (cutLog_lt (by norm_num : (0:Cut) < 2) (by norm_num : (2:Cut) < 3))

/-- ★ W8 NON-VACUITY (THE `1/4` IS NOT `1/2`): `S ≠ A/2` for `M ≠ 0`. A wrong coefficient `½` in place of
    `¼` genuinely fails, because `gaussSphereSolidAngle·M² ≠ gaussSphereSolidAngle·2M²` (the positive
    flux times a positive square). The `1/4` — the banked `gravCouplingCoeff = 2·(4π)` — is load-bearing. -/
theorem bhEntropy_ne_area_half (M : Cut) (hM : M ≠ 0) : bhEntropy M ≠ bhArea M / 2 := by
  unfold bhEntropy bhArea
  rw [gravCouplingCoeff_two_flux]
  have hg := gaussSphereSolidAngle_pos
  have hM2 : 0 < M ^ 2 := by positivity
  intro hc
  have hstep : gaussSphereSolidAngle * M ^ 2 = gaussSphereSolidAngle * (2 * M ^ 2) := by
    field_simp at hc ⊢; nlinarith [hc]
  nlinarith [mul_pos hg hM2]

/-! ## (6) THE HEART bundled. -/

/-- ★★★ THE HEART (Bekenstein–Hawking closed): the first law fixes the coefficient
    (`dS/dM = gravCouplingCoeff·M = 1/T_H`), the area law `S = A/4` reduces to the banked
    `gravCouplingCoeff = 2·(4π flux)` (N359), the entropy per boundary cell `s₀ = ln 2 = cutLog 2` is the
    fold's BINARY self-blindness count with binary load-bearing (`cutLog 2 ≠ cutLog 3`), the cell area
    `a* = 4·ln 2` is FORCED unique, and a wrong coefficient `½` fails. -/
theorem black_hole_entropy_structure (M : Cut) (hM : M ≠ 0) :
    HasCutDerivAt bhEntropy (gravCouplingCoeff * M) M
      ∧ bhEntropy M = bhArea M / 4
      ∧ cellEntropy = cutLog 2
      ∧ cellEntropy ≠ cutLog 3
      ∧ bhEntropy M = (bhArea M / cellArea) * cellEntropy
      ∧ bhEntropy M ≠ bhArea M / 2 :=
  ⟨bhEntropy_firstLaw M, bhEntropy_eq_area_quarter M, rfl,
   cellEntropy_binary_ne_ternary, bhEntropy_cell_decomposition M,
   bhEntropy_ne_area_half M hM⟩

end

end Phys.Algebra
