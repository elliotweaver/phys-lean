/-
  Phys.Algebra.SpacetimeEinsteinTensor — N354 (arc-E E1-Einstein): THE EINSTEIN TENSOR
  `G_μν = Ric_μν − ½ R g_μν`, and its DIMENSION-FORCED trace-reversal, over the derived ℝ `Cut`.
  ===========================================================================
  DIRECTED SINGLE SUCCESSOR of N353 (E1-Ricci-Scalar, `Phys/Algebra/SpacetimeRicciScalar.lean`), which
  banked the RICCI SCALAR `ricciScalar G = trace (g⁻¹ Ric)` — the metric (`BvC`) trace of the genuine
  tensorial Ricci — closing the N349→N352→N353 arc (fiber trace BLIND → soldered Ricci FAITHFUL → its
  metric trace CONTENTFUL). With `ricci` (N352), `ricciScalar` (N353), and the derived metric `BvC` all
  banked, the EINSTEIN TENSOR `G_μν = Ric_μν − ½ R g_μν` becomes stateable on the SAME banked derived-ℝ
  carrier `MetricEnd = Module.End Cut STVC`, toward E2 (Einstein's equations unique via Lovelock — a
  LITERATURE IMPORT / HIDDEN JOINT, childed).

  ── THE THEORY-NATIVE ANCHOR (the QUIET-DRIFT catch: what does the FOLD say the textbook does not?) ──
  Toward E2, the standard route needs the Einstein tensor `G_μν = Ric_μν − ½ R g_μν`. The QUIET-DRIFT
  trap: "just define `G`, prove bilinear + symmetric by routine machinery from the banked `ricci` +
  `BvC` bilinearity, and move on" — proving the routine adjacent properties of a derived object. The
  bilinearity/symmetry ARE banked (they fall out of the N352 tensor structure + `BvC` bilinearity) and
  are recorded here, but they are NOT the theory-native content.

  THE THEORY-NATIVE CONTENT IS THE TRACE-REVERSAL, AND IT IS DIMENSION-FORCED. In the textbook, the
  metric trace of the Einstein tensor is `g^μν G_μν = R·(1 − d/2)`, and "d = 4" is put in BY HAND as the
  spacetime dimension. On the DERIVED carrier, the "d/2" is literally `½·trace(id_STVC)`, because the
  metric-raise of the metric `g` itself is the IDENTITY endomorphism (`BvC Y (id Z) = BvC Y Z = g(Y,Z)`),
  and `trace (id_STVC) = finrank_Cut STVC` (`LinearMap.trace_id`). And `finrank_Cut STVC = 10` is a
  BANKED DERIVED fact (`finrank_STVC`, N-SO8FinrankTower — the `(1,9) = 1 + 1 + 8` split, the octonion
  block forced by the terminal algebra). So the trace-reversal factor `1 − dim/2 = 1 − 5 = −4` is FORCED
  by the DERIVED spacetime dimension — NOT chosen, NOT the textbook `−1`. The spin-2 trace-reversal that
  the standard `8πG = 2·4π·G` normalization (E3) leans on is DIMENSION-LOCKED to the derived `(1,9)`
  carrier: a fact the textbook flattens by fixing `d = 4` as an input.

  ── THE ONE FORCED FACT (the heart) ──
  `einsteinScalar G = R − ½·(finrank_Cut STVC)·R` (`einstein_traceReversal`) — the metric trace of the
  Einstein endomorphism, with the trace of the metric's own raise = the derived dimension. At the banked
  `finrank_STVC = 10`, `einsteinScalar G = −4·R` (`einstein_traceReversal_value`); concretely
  `einsteinScalar solderWit = −4·(−¼) = 1 ≠ 0` (`einsteinScalar_solder`, `einsteinScalar_solder_ne_zero`).

  ── THE EINSTEIN-RAISE IS WELL-DEFINED (same theory-native content as the Ricci raise) ──
  The Einstein endomorphism `einsteinRaiseMap G = ricciRaiseMap G − ½R·id` satisfies
  `BvC Y (T Z) = einstein G Y Z` (`einsteinRaiseMap_isRaise`), and is UNIQUE (`einsteinRaise_unique`),
  forced by the banked keystone `BvC_nondegenerate` — the derived metric separates points. The raise of
  the metric term `½R·g` is exactly `½R·id`, which is why its trace contributes `½R·finrank`.

  ── SCOPE (W3 — this beat is the EINSTEIN TENSOR + its dimension-forced trace-reversal; E2 is childed) ──
  This node banks the Einstein tensor `einstein G` as a rank-(0,2) form (bilinear + symmetric for the
  concrete soldering + the concrete mixed value + form-level non-vacuity), its well-defined metric raise
  (existence + uniqueness from `BvC_nondegenerate`), and — the heart — the DIMENSION-FORCED trace-reversal
  `einsteinScalar G = (1 − ½·finrank_STVC)·R = −4·R`. E2 (Einstein's equations unique via Lovelock's
  theorem — a LITERATURE IMPORT, a HIDDEN JOINT that is CITED as machinery, not a framework theorem) and
  the contracted Bianchi / covariant divergence `∇^μ G_μν = 0` (which would use the banked N350
  operator-derivative on the metric tensor field) are childed as the single successor. Weak-field is
  sufficient to reach E2/E3 (docs/SEED_GR_BLACKHOLE_COSMOLOGY.md §E1). A MACHINERY node: it asserts NO
  physical value; it is flagged leading-order/mechanism-grade.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N352/N353/`BvC`/finrank) ──
    einstein G Y Z             — THE EINSTEIN TENSOR `ricci G Y Z − (½·ricciScalar G)·BvC Y Z`.
    einstein_add_Y / _add_Z    — BILINEAR (additive), from banked `ricci_add_Y`/`_add_Z` + `BvC` add.
    einstein_smul_Y            — HOMOGENEOUS in `Y`, from banked `ricci_smul_Y` + `BvC` homogeneity.
    einstein_solder_symm       — SYMMETRIC for the concrete soldering (`ricci_solder_symm` + `BvC_symm`).
    einstein_solder_form       — `einstein solderWit Y Z = ¼·Y.2.1·Z.2.1 + ⅛·BvC Y Z` (mixed object).
    einstein_solder_ne_zero    — ★ form-level NON-VACUITY: `einstein solderWit (0,1,0)(0,1,0) = ⅛ ≠ 0`.
    IsEinsteinRaise G T        — the raising relation `∀ Y Z, BvC Y (T Z) = einstein G Y Z`.
    einsteinRaise_unique       — ★ the metric-raise is UNIQUE (forced by banked `BvC_nondegenerate`).
    einsteinRaiseMap G         — the Einstein endomorphism `ricciRaiseMap G − ½R·id`.
    einsteinRaiseMap_isRaise   — `einsteinRaiseMap G` satisfies `IsEinsteinRaise G`.
    einsteinScalar G           — the metric trace `trace (einsteinRaiseMap G)`.
    einstein_traceReversal     — ★★★ THE DIMENSION-FORCED trace-reversal `R − ½·finrank_STVC·R`.
    einstein_traceReversal_value — ★★★ `= −4·R` at the banked `finrank_STVC = 10`.
    einsteinScalar_solder      — ★ `einsteinScalar solderWit = 1` (`−4·(−¼)`).
    einsteinScalar_solder_ne_zero — ★★ NON-VACUITY (W8): `einsteinScalar solderWit ≠ 0`.
    einstein_traceReversal_dimension_forced — ★★★ THE HEART bundled: the trace-reversal factor is the
                                DERIVED dimension (`= (1 − ½·finrank_STVC)·R`), the raise of the metric
                                is the identity whose trace is `finrank_STVC`, so at the banked `10` the
                                factor is `−4` (not the textbook `−1`) — FORCED by the derived carrier.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N352 `ricci`/`ricci_add_Y`/`_add_Z`/`ricci_smul_Y`/
  `ricci_solder_symm`/`ricci_solder_form`/`solderWit`, the banked N353 `ricciScalar`/`ricciRaiseMap`/
  `ricciRaiseMap_isRaise`/`ricciScalar_solder`, the banked `BvC`/`BvC_nondegenerate`/`BvC_symm`/
  `BvC_sub_right`/`BvC_add_left`/`BvCBilin`, and the banked `finrank_STVC = 10` (← the `(1,9)` split ←
  the terminal algebra ← the derived ℝ `Cut` ← the fold); `LinearMap.trace`/`trace_id`/`Module.finrank`
  are Mathlib MACHINERY on the DERIVED carrier. Complete: `#print axioms ⊆ {propext, Classical.choice,
  Quot.sound}` for every declaration. Words-removable: delete "Einstein / Ricci / scalar / curvature /
  metric / gravity / spacetime": over the derived complete ordered field `Cut`, for the banked bilinear
  form `ricci G`, the banked scalar `ricciScalar G`, and the derived nondegenerate symmetric bilinear
  form `BvC`, the form `Y,Z ↦ ricci G Y Z − (½·ricciScalar G)·BvC Y Z` is bilinear (and symmetric for
  the concrete `G`); the unique endomorphism `T` with `BvC Y (T Z) = that form` exists; and its trace
  equals `ricciScalar G · (1 − ½·finrank_Cut STVC)`, which at `finrank = 10` is `−4·ricciScalar G`; pure
  linear/trace/bilinear-form algebra over the derived ℝ. NO theorem STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/linearized — flagged; `−4`, `⅛`, `1` FALL OUT of the
  banked `ricci`/`ricciScalar`/`BvC`/`finrank_STVC`). NO empirical number. NO Mathlib number-system
  content import (the field is the DERIVED `Cut`), NO Mathlib manifold/Riemannian/curvature-tensor/
  `HasDerivAt`/`deriv` API as content (`LinearMap.trace`/`trace_id`/`BilinForm.toDual`/`Module.finrank`
  are machinery on the derived carrier; the metric is the banked derived `BvC`, the Ricci the banked
  derived `ricci`, the scalar the banked derived `ricciScalar`, the dimension the banked `finrank_STVC`).
  NO posited Einstein tensor (it is the banked Ricci minus ½ the banked scalar times the banked metric;
  the trace-reversal factor is the DERIVED dimension, PROVED). NO kernel-trust bypass, NO `maxHeartbeats`
  raise, NO coordinate bash.
-/
import Phys.Algebra.SpacetimeRicciScalar
import Phys.Algebra.LorentzContinuumGenerationSO8FinrankTower

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The Einstein tensor as a rank-(0,2) form on the banked objects. -/

/-- THE EINSTEIN TENSOR as a rank-(0,2) form: `G(Y,Z) = Ric(Y,Z) − ½·R·g(Y,Z)`, the banked genuine
    Ricci (N352 `ricci`) minus half the banked Ricci scalar (N353 `ricciScalar`) times the banked
    derived signature metric (`BvC`). NOT a posited tensor. -/
def einstein (G : STVC →ₗ[Cut] MetricEnd) (Y Z : STVC) : Cut :=
  ricci G Y Z - (2⁻¹ * ricciScalar G) * BvC Y Z

/-- BILINEAR (additive in `Y`): from banked `ricci_add_Y` (N352) + `BvC_add_left`. -/
theorem einstein_add_Y (G : STVC →ₗ[Cut] MetricEnd) (Y₁ Y₂ Z : STVC) :
    einstein G (Y₁ + Y₂) Z = einstein G Y₁ Z + einstein G Y₂ Z := by
  unfold einstein
  rw [ricci_add_Y, BvC_add_left]; ring

/-- BILINEAR (additive in `Z`): from banked `ricci_add_Z` (N352) + `BvC` additivity in the 2nd slot. -/
theorem einstein_add_Z (G : STVC →ₗ[Cut] MetricEnd) (Y Z₁ Z₂ : STVC) :
    einstein G Y (Z₁ + Z₂) = einstein G Y Z₁ + einstein G Y Z₂ := by
  unfold einstein
  rw [ricci_add_Z]
  have hb : BvC Y (Z₁ + Z₂) = BvC Y Z₁ + BvC Y Z₂ := by
    rw [BvC_symm, BvC_add_left, BvC_symm Z₁ Y, BvC_symm Z₂ Y]
  rw [hb]; ring

/-- HOMOGENEOUS in `Y`: from banked `ricci_smul_Y` (N352) + `BvC` homogeneity in the 1st slot. -/
theorem einstein_smul_Y (G : STVC →ₗ[Cut] MetricEnd) (c : Cut) (Y Z : STVC) :
    einstein G (c • Y) Z = c * einstein G Y Z := by
  unfold einstein
  rw [ricci_smul_Y]
  have hb : BvC (c • Y) Z = c * BvC Y Z := by
    show (c • Y).1 * Z.1 - (c • Y).2.1 * Z.2.1 - gFormC (c • Y).2.2 Z.2.2 = _
    simp only [Prod.smul_fst, Prod.smul_snd, smul_eq_mul]
    rw [gFormC_smul_left]; unfold BvC; ring
  rw [hb]; ring

/-- SYMMETRIC for the concrete field-gradient soldering: from `ricci_solder_symm` (N353) + `BvC_symm`.
    The symmetric rank-(0,2) object GR uses (both the Ricci and the metric are symmetric here). -/
theorem einstein_solder_symm (Y Z : STVC) :
    einstein solderWit Y Z = einstein solderWit Z Y := by
  unfold einstein
  rw [ricci_solder_symm, BvC_symm]

/-- THE CONCRETE MIXED VALUE: `einstein solderWit Y Z = ¼·Y.2.1·Z.2.1 + ⅛·BvC Y Z`. A genuine mixed
    object — the field-gradient Ricci form (N353 `ricci_solder_form`) PLUS a metric term (from the
    banked `ricciScalar solderWit = −¼`, so `−½·(−¼) = ⅛`). -/
theorem einstein_solder_form (Y Z : STVC) :
    einstein solderWit Y Z = (4⁻¹ : Cut) * Y.2.1 * Z.2.1 + (8⁻¹ : Cut) * BvC Y Z := by
  unfold einstein
  rw [ricci_solder_form, ricciScalar_solder]; ring

/-- ★ FORM-LEVEL NON-VACUITY: the Einstein form is nonzero for a concrete pair —
    `einstein solderWit (0,1,0)(0,1,0) = ¼·1·1 + ⅛·(−1) = ⅛ ≠ 0`. -/
theorem einstein_solder_ne_zero :
    einstein solderWit ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) ≠ 0 := by
  rw [einstein_solder_form]
  show (4⁻¹ : Cut) * 1 * 1
      + (8⁻¹ : Cut) * BvC ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) ≠ 0
  have hbvc : BvC ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) = -(1:Cut) := by
    show (0:Cut) * 0 - (1:Cut) * 1 - gFormC (0:O Cut) 0 = -1
    rw [gFormC_zero_right']; ring
  rw [hbvc]; norm_num

/-! ## (2) The Einstein-raise: the relation, its uniqueness, and its existence. -/

/-- THE EINSTEIN-RAISE RELATION: `T` raises the second index of the Einstein form via the derived
    metric `BvC`, `∀ Y Z, BvC Y (T Z) = einstein G Y Z`. -/
def IsEinsteinRaise (G : STVC →ₗ[Cut] MetricEnd) (T : MetricEnd) : Prop :=
  ∀ Y Z : STVC, BvC Y (T Z) = einstein G Y Z

/-- ★ THE EINSTEIN-RAISE IS UNIQUE — forced by the DERIVED metric's nondegeneracy (banked
    `BvC_nondegenerate`). The same theory-native well-definedness as the Ricci raise (N353). -/
theorem einsteinRaise_unique (G : STVC →ₗ[Cut] MetricEnd) (T T' : MetricEnd)
    (hT : IsEinsteinRaise G T) (hT' : IsEinsteinRaise G T') : T = T' := by
  refine LinearMap.ext fun Z => ?_
  have hZ : T Z - T' Z = 0 := by
    apply BvC_nondegenerate (T Z - T' Z)
    intro q; rw [BvC_symm, BvC_sub_right, hT q Z, hT' q Z, sub_self]
  exact sub_eq_zero.mp hZ

/-- THE EINSTEIN ENDOMORPHISM: the metric-raised Einstein tensor `ricciRaiseMap G − ½R·id`. The raise
    of the metric term `½R·g` is exactly `½R·id` (the metric's own raise is the identity), which is why
    its trace contributes `½R·(dim)` to the trace-reversal. -/
def einsteinRaiseMap (G : STVC →ₗ[Cut] MetricEnd) : MetricEnd :=
  ricciRaiseMap G - (2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd)

/-- EXISTENCE: `einsteinRaiseMap G` satisfies the raising relation. From N353 `ricciRaiseMap_isRaise`
    for the Ricci part and `BvC Y (c • Z) = c·BvC Y Z` for the metric part. -/
theorem einsteinRaiseMap_isRaise (G : STVC →ₗ[Cut] MetricEnd) :
    IsEinsteinRaise G (einsteinRaiseMap G) := by
  intro Y Z
  unfold einsteinRaiseMap einstein
  show BvC Y ((ricciRaiseMap G - (2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd)) Z) = _
  rw [LinearMap.sub_apply, LinearMap.smul_apply, LinearMap.id_apply, BvC_sub_right,
    ricciRaiseMap_isRaise G Y Z]
  congr 1
  rw [← BvCBilin_apply, map_smul, BvCBilin_apply, smul_eq_mul]

/-- THE EINSTEIN SCALAR: the metric trace of the Einstein endomorphism, `trace (einsteinRaiseMap G)`. -/
def einsteinScalar (G : STVC →ₗ[Cut] MetricEnd) : Cut :=
  LinearMap.trace Cut STVC (einsteinRaiseMap G)

/-! ## (3) THE HEART: the DIMENSION-FORCED trace-reversal. -/

/-- ★★★ THE DIMENSION-FORCED TRACE-REVERSAL. The metric trace of the Einstein endomorphism is
    `einsteinScalar G = R − ½·(finrank_Cut STVC)·R`. The metric-raise of the metric `g` is the IDENTITY
    endomorphism, whose trace is `finrank_Cut STVC` (`LinearMap.trace_id`) — the DERIVED spacetime
    dimension. So the trace-reversal factor is `1 − dim/2`, with the dimension DERIVED, not an input. -/
theorem einstein_traceReversal (G : STVC →ₗ[Cut] MetricEnd) :
    einsteinScalar G = ricciScalar G - 2⁻¹ * (Module.finrank Cut STVC : Cut) * ricciScalar G := by
  unfold einsteinScalar einsteinRaiseMap ricciScalar
  rw [map_sub, map_smul, LinearMap.trace_id, smul_eq_mul]; ring

/-- ★★★ THE TRACE-REVERSAL VALUE ON THE DERIVED CARRIER: at the banked `finrank_STVC = 10`, the
    trace-reversal is `einsteinScalar G = −4·R`. The factor `−4` (NOT the textbook `−1`) is FORCED by
    the DERIVED spacetime dimension `10` (the `(1,9) = 1 + 1 + 8` split, the octonion block from the
    terminal algebra); `1 − 10/2 = −4`. -/
theorem einstein_traceReversal_value (G : STVC →ₗ[Cut] MetricEnd) :
    einsteinScalar G = -(4 : Cut) * ricciScalar G := by
  rw [einstein_traceReversal, finrank_STVC]; push_cast; ring

/-- ★ THE EINSTEIN SCALAR FOR THE CONCRETE FIELD GRADIENT: `einsteinScalar solderWit = 1`
    (`−4·(−¼) = 1`), from the trace-reversal value and the banked `ricciScalar_solder = −¼`. -/
theorem einsteinScalar_solder : einsteinScalar solderWit = (1 : Cut) := by
  rw [einstein_traceReversal_value, ricciScalar_solder]; norm_num

/-- ★★ NON-VACUITY (W8): the Einstein scalar is nonzero for the concrete field gradient —
    `einsteinScalar solderWit = 1 ≠ 0`. The trace-reversal is not a vacuous "always zero" contraction. -/
theorem einsteinScalar_solder_ne_zero : einsteinScalar solderWit ≠ 0 := by
  rw [einsteinScalar_solder]; norm_num

/-- ★★★ THE THEORY-NATIVE HEART — the trace-reversal factor is the DERIVED spacetime dimension. The
    metric trace of the Einstein endomorphism equals the Ricci scalar times `(1 − ½·finrank_Cut STVC)`,
    because the metric-raise of the metric `g` is the identity endomorphism whose trace is exactly the
    DERIVED dimension `finrank_Cut STVC = 10` (the `(1,9)` split from the terminal algebra). So the
    trace-reversal factor is `1 − 10/2 = −4` — FORCED by the derived carrier, NOT the textbook `d = 4`
    input that gives `−1`. The spin-2 trace-reversal (feeding the `2` in the `8πG = 2·4π·G`
    normalization, E3) is DIMENSION-LOCKED to the derived `(1,9)` spacetime. -/
theorem einstein_traceReversal_dimension_forced (G : STVC →ₗ[Cut] MetricEnd) :
    einsteinScalar G = (1 - 2⁻¹ * (Module.finrank Cut STVC : Cut)) * ricciScalar G
      ∧ (Module.finrank Cut STVC : Cut) = LinearMap.trace Cut STVC (LinearMap.id : MetricEnd)
      ∧ einsteinScalar G = -(4 : Cut) * ricciScalar G := by
  refine ⟨?_, ?_, einstein_traceReversal_value G⟩
  · rw [einstein_traceReversal]; ring
  · rw [LinearMap.trace_id]

end

end Phys.Algebra
