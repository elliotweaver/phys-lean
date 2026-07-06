/-
  Phys.Algebra.SpacetimeRicciScalar — N353 (arc-E E1-Ricci-Scalar): THE RICCI SCALAR = THE METRIC
  (BvC) TRACE OF THE GENUINE TENSORIAL RICCI, `R = gᵘᵛ Ric_μν`, over the derived ℝ `Cut`.
  ===========================================================================
  DIRECTED SINGLE SUCCESSOR of N352 (E1-Ricci, `Phys/Algebra/SpacetimeRicci.lean`), which banked the
  GENUINE TENSORIAL RICCI `ricci G Y Z = trace (X ↦ lbCurv (G X) (G Y) Z)` via the soldering /
  field-gradient map `G : STVC →ₗ MetricEnd`, resolving the 3× tensorial-Ricci deferral (the naive
  ENDOMORPHISM / FIBER trace of the curvature is blind, N349 `fiberTrace_lbCurv_zero`; the genuine
  Ricci lives on the SOLDERED loop-source index and is faithful). THIS node builds the RICCI SCALAR —
  the metric trace of the genuine Ricci — on the SAME banked derived-ℝ carrier
  `MetricEnd = Module.End Cut STVC`, toward E2 (Einstein's equations unique via Lovelock).

  ── THE THEORY-NATIVE ANCHOR (the Ricci scalar is the METRIC (BvC) trace, NOT the blind fiber trace) ──
  N349→N352→N353 is ONE arc about the SAME structural fact — the fold's self-blindness at the
  connection level:
    • N349 PROVED the naive endomorphism/FIBER trace of the curvature is BLIND (identically `0`,
      `trace [Γ₁,Γ₂] = 0`) — the "obvious" scalar-curvature index contraction is content-free.
    • N352 PROVED the genuine tensorial Ricci lives on the SOLDERED LOOP index (via the field gradient
      `G`) and is FAITHFUL — nonzero exactly where the fiber trace is blind.
    • THIS node asks the theory-native next beat: WHAT scalar does the fold read off the genuine Ricci?
      The physicist's Ricci scalar `R = gᵘᵛ Ric_μν` raises the second index with the INVERSE metric and
      traces. The theory-native content: raising with the DERIVED signature metric (the banked `BvC`,
      the fold's own indefinite Minkowski form) RESCUES the scalar contraction the blind fiber trace
      destroyed — and its SIGN is FIXED by the derived `(1,9)` signature.

  ── THE ONE FORCED FACT (the heart): the metric trace is contentful where the fiber trace is blind ──
  For the concrete field-gradient soldering, `ricci solderWit Y Z = ¼·Y.2.1·Z.2.1` (`ricci_solder_form`)
  — a rank-1 SYMMETRIC Ricci supported on the spatial `x`-slot. Its metric-RAISED endomorphism (the
  unique `T` with `BvC Y (T Z) = ricci solderWit Y Z`, uniqueness forced by the banked
  `BvC_nondegenerate`) is `T Z = (0, −¼·Z.2.1, 0)` — the DERIVED spatial signature `−` flips the `¼`.
  So the RICCI SCALAR `ricciScalar solderWit = trace T = −¼ ≠ 0` (`ricciScalar_solder`,
  `ricciScalar_solder_ne_zero`) — NONZERO precisely where the endomorphism FIBER trace of the curvature
  is IDENTICALLY ZERO (N349). Raising with the DERIVED metric rescues the scalar the blind fiber trace
  destroyed; the sign is the derived signature. `ricciScalar_contentful_not_fiberTrace` bundles the two.

  ── THE METRIC-RAISE IS WELL-DEFINED (the theory-native content of "raise the index") ──
  The "inverse metric" that raises the index is the banked DERIVED signature form `BvC`. The raise is
  well-defined EXACTLY because the derived metric is NONDEGENERATE — the banked keystone
  `BvC_nondegenerate`. `BvCBilin_nondeg` packages `BvC` (as the banked `BvCBilin`) as a nondegenerate
  Mathlib `BilinForm` (SeparatingLeft/Right from `BvC_nondegenerate` + `BvC_symm`), and Mathlib's
  musical iso `BilinForm.toDual` (on the finite-dimensional derived `STVC`, `Module.Finite Cut STVC`,
  N76) supplies the raise `ricciRaiseMap G` for every soldering `G` (`ricciRaiseMap_isRaise`);
  `ricciRaise_unique` proves it unique. The nondegeneracy of the DERIVED metric IS the theory-native
  reason the index can be raised.

  ── SCOPE (W3 — this beat is the RICCI SCALAR; the Einstein tensor + Lovelock (E2) are childed) ──
  This node banks the Ricci scalar `ricciScalar G` as the metric (BvC) trace of the genuine Ricci, its
  well-definedness (existence + uniqueness from `BvC_nondegenerate`), the concrete value `−¼`, and the
  faithfulness/contentfulness (nonzero where the fiber trace is blind). The EINSTEIN TENSOR
  `G_μν = Ric_μν − ½ R g_μν` (now stateable: `ricci` N352, `ricciScalar` + `BvC` here) and E2
  (Einstein's equations unique via Lovelock's theorem — a LITERATURE IMPORT, a HIDDEN JOINT that is
  CITED as machinery, not a framework theorem) are childed as the single successor. Weak-field is
  sufficient to reach E2/E3 (docs/SEED_GR_BLACKHOLE_COSMOLOGY.md §E1). A MACHINERY node: it asserts NO
  physical value; it is flagged leading-order/mechanism-grade.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N352/`BvC` objects) ──
    BvCBilin_nondeg           — the DERIVED metric `BvCBilin` (= `BvC`) is a nondegenerate `BilinForm`
                                (SeparatingLeft/Right from banked `BvC_nondegenerate` + `BvC_symm`).
    IsRicciRaise G T          — the raising relation `∀ Y Z, BvC Y (T Z) = ricci G Y Z`.
    ricciRaise_unique         — ★ the metric-raise is UNIQUE (forced by `BvC_nondegenerate`).
    ricciRightFun G Z         — the Ricci form's second-slot functional (linear in `Y` by `ricci_add_Y`/
                                `ricci_smul_Y`), as an element of the dual `Module.Dual Cut STVC`.
    ricciRaiseMap G           — the metric-raised Ricci endomorphism via `BvCBilin.toDual` (existence).
    ricciRaiseMap_isRaise     — `ricciRaiseMap G` satisfies `IsRicciRaise G`.
    ricciScalar G             — ★ THE RICCI SCALAR `trace (g⁻¹ Ric) = trace (ricciRaiseMap G)`.
    lbCurv_gen_comp1 / _comp2 — the general-`Z` curvature-vector components (`¼·Z.2.1`, `0`).
    ricci_solder_form         — `ricci solderWit Y Z = ¼·Y.2.1·Z.2.1` (rank-1, spatial `x`).
    ricci_solder_symm         — `Ric(Y,Z) = Ric(Z,Y)` — the Ricci is SYMMETRIC here (the object GR uses).
    xFun / xFun_apply         — the `x`-coordinate functional `Z ↦ Z.2.1`.
    solderRicciRaise          — the concrete metric-raised endomorphism `T Z = (0, −¼·Z.2.1, 0)`.
    solder_isRicciRaise       — `solderRicciRaise` satisfies `IsRicciRaise solderWit`.
    ricciRaiseMap_solder_eq   — `ricciRaiseMap solderWit = solderRicciRaise` (via uniqueness).
    ricciScalar_solder        — ★ `ricciScalar solderWit = −¼` (sign forced by the derived signature).
    ricciScalar_solder_ne_zero — ★★ NON-VACUITY (W8): `ricciScalar solderWit ≠ 0`.
    ricciScalar_contentful_not_fiberTrace — ★★★ THE HEART: the endomorphism fiber trace of the curvature
                                is `0` (N349) YET the metric-raised Ricci scalar is `−¼ ≠ 0` — raising
                                with the DERIVED metric rescues the scalar the blind fiber trace
                                destroyed; the CLOSE of the N349→N352→N353 arc.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N352 `ricci`/`ricci_add_Y`/`_add_Z`/`ricci_smul_Y`/
  `_smul_Z`/`ricci_solder`/`solderWit` (← N348 `lbCurv` ← N347 `lbConn` ← N90 `sigOpC` ← the derived ℝ
  `Cut` ← the fold), the banked `BvC`/`BvC_nondegenerate`/`BvC_symm`/`BvC_sub_right` (the derived
  signature metric), the banked `BvCBilin`/`BvCBilin_apply`, and `Module.Finite Cut STVC` (N76);
  `LinearMap.trace`/`BilinForm.toDual`/`smulRight`/`Module.Dual`/`FiniteDimensional` are Mathlib
  MACHINERY on the DERIVED carrier. Complete: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`
  for every declaration. Words-removable: delete "curvature / Riemann / Ricci / scalar / metric /
  soldering / gradient / gravity / spacetime": over the derived complete ordered field `Cut`, for
  `η²=1`, `Γ=½ηk`, a linear map `G : STVC →ₗ MetricEnd`, and the derived nondegenerate symmetric
  bilinear form `BvC`, the unique endomorphism `T` with `BvC Y (T Z) = trace (X ↦ [Γ(GX),Γ(GY)] Z)`
  exists, and its trace for the concrete `G` is `−¼`, while the endomorphism trace of `[Γ₁,Γ₂]` is `0`;
  pure linear/trace/bilinear-form algebra over the derived ℝ. NO theorem STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/linearized — flagged; `−¼` FALLS OUT of the banked
  curvature components and the derived signature). NO empirical number. NO Mathlib number-system content
  import (the field is the DERIVED `Cut`), NO Mathlib manifold/Riemannian/curvature-tensor/`HasDerivAt`/
  `deriv` API as content (`LinearMap.trace`/`BilinForm.toDual`/`smulRight`/`Module.Dual`/
  `FiniteDimensional` are machinery on the derived carrier; the metric is the banked derived `BvC`, the
  Ricci the banked derived `ricci`). NO posited Ricci scalar (it is the metric trace of the banked Ricci
  over the DERIVED nondegenerate metric; the contentfulness vs the blind fiber trace is PROVED). NO
  kernel-trust bypass, NO `maxHeartbeats` raise, NO coordinate bash.
-/
import Phys.Algebra.SpacetimeRicci
import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Phys.Algebra.LorentzContinuumCliffordSpinCover
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The derived metric is nondegenerate: the theory-native content of "raise the index". -/

/-- The DERIVED signature metric `BvC` (packaged as the banked `BvCBilin`) is a NONDEGENERATE Mathlib
    `BilinForm`. SeparatingLeft/Right both reduce to the banked keystone `BvC_nondegenerate` (with
    `BvC_symm` for the right slot). This nondegeneracy is EXACTLY the theory-native reason the Ricci
    index can be raised — the derived metric separates points, so "raise with `g⁻¹`" is well-defined. -/
theorem BvCBilin_nondeg : (BvCBilin : BilinForm Cut STVC).Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro p hp
    apply BvC_nondegenerate p
    intro q; have := hp q; simpa [BvCBilin_apply] using this
  · intro q hq
    apply BvC_nondegenerate q
    intro p; have := hq p; rw [BvC_symm]; simpa [BvCBilin_apply] using this

/-! ## (2) The metric-raise: the relation, its uniqueness, and its existence. -/

/-- THE METRIC-RAISE RELATION: `T` raises the second index of the Ricci form via the derived metric
    `BvC`, `∀ Y Z, BvC Y (T Z) = ricci G Y Z`. This is `Ric^μ_ν = gᵘᵃ Ric_aν` in coordinate-free form
    over the banked derived metric. -/
def IsRicciRaise (G : STVC →ₗ[Cut] MetricEnd) (T : MetricEnd) : Prop :=
  ∀ Y Z : STVC, BvC Y (T Z) = ricci G Y Z

/-- ★ THE METRIC-RAISE IS UNIQUE — forced by the DERIVED metric's nondegeneracy (banked
    `BvC_nondegenerate`). If `T` and `T'` both raise the Ricci index, then for every `Z` the difference
    `T Z − T' Z` is `BvC`-orthogonal to everything, so it vanishes. The raise is well-defined because the
    derived signature metric separates points. -/
theorem ricciRaise_unique (G : STVC →ₗ[Cut] MetricEnd) (T T' : MetricEnd)
    (hT : IsRicciRaise G T) (hT' : IsRicciRaise G T') : T = T' := by
  refine LinearMap.ext fun Z => ?_
  have hZ : T Z - T' Z = 0 := by
    apply BvC_nondegenerate (T Z - T' Z)
    intro q; rw [BvC_symm, BvC_sub_right, hT q Z, hT' q Z, sub_self]
  exact sub_eq_zero.mp hZ

/-- The Ricci form's second-slot functional `Y ↦ ricci G Y Z`, as an element of the dual
    `Module.Dual Cut STVC`. Linear in `Y` by the banked N352 tensor structure (`ricci_add_Y`,
    `ricci_smul_Y`). This is the lowered covector whose `BvC`-dual is the raised Ricci vector. -/
def ricciRightFun (G : STVC →ₗ[Cut] MetricEnd) (Z : STVC) : Module.Dual Cut STVC where
  toFun Y := ricci G Y Z
  map_add' Y₁ Y₂ := by rw [ricci_add_Y]
  map_smul' c Y := by rw [ricci_smul_Y]; rfl

/-- THE METRIC-RAISED RICCI ENDOMORPHISM: for every soldering `G`, the raise
    `Z ↦ (BvC).toDual⁻¹ (ricciRightFun G Z)` via Mathlib's musical iso `BilinForm.toDual` (on the
    finite-dimensional derived `STVC`, `Module.Finite Cut STVC`, N76, with `BvCBilin_nondeg`). Linear in
    `Z` by the banked N352 tensor structure (`ricci_add_Z`, `ricci_smul_Z`). -/
def ricciRaiseMap (G : STVC →ₗ[Cut] MetricEnd) : MetricEnd where
  toFun Z := (BvCBilin.toDual BvCBilin_nondeg).symm (ricciRightFun G Z)
  map_add' Z₁ Z₂ := by
    rw [show ricciRightFun G (Z₁ + Z₂) = ricciRightFun G Z₁ + ricciRightFun G Z₂ from by
      refine LinearMap.ext fun Y => ?_
      simp only [ricciRightFun, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.add_apply, ricci_add_Z]]
    rw [map_add]
  map_smul' c Z := by
    rw [show ricciRightFun G (c • Z) = c • ricciRightFun G Z from by
      refine LinearMap.ext fun Y => ?_
      simp only [ricciRightFun, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.smul_apply,
        ricci_smul_Z, smul_eq_mul]]
    rw [map_smul]; rfl

/-- EXISTENCE: `ricciRaiseMap G` satisfies the raising relation `IsRicciRaise G`. From
    `BilinForm.apply_toDual_symm_apply` (the defining property of the musical iso) + `BvC_symm`. -/
theorem ricciRaiseMap_isRaise (G : STVC →ₗ[Cut] MetricEnd) :
    IsRicciRaise G (ricciRaiseMap G) := by
  intro Y Z
  show BvC Y ((BvCBilin.toDual BvCBilin_nondeg).symm (ricciRightFun G Z)) = ricci G Y Z
  rw [BvC_symm, ← BvCBilin_apply, LinearMap.BilinForm.apply_toDual_symm_apply]; rfl

/-- ★ THE RICCI SCALAR: the metric (BvC) trace of the genuine tensorial Ricci,
    `R = gᵘᵛ Ric_μν = trace (g⁻¹ Ric) = trace (ricciRaiseMap G)`. NOT a posited invariant; the trace of
    the DERIVED-metric-raised banked Ricci. -/
def ricciScalar (G : STVC →ₗ[Cut] MetricEnd) : Cut :=
  LinearMap.trace Cut STVC (ricciRaiseMap G)

/-! ## (3) The concrete field gradient: the general Ricci form and its metric trace `−¼`. -/

/-- The general-`Z` TIME component of the concrete curvature vector: `(R(timeProj,offDiagVar)·Z).1 =
    ¼·Z.2.1`. (Generalizes N352 `lbCurv_sample_comp1`, which fixed `Z = (0,1,0)`.) -/
theorem lbCurv_gen_comp1 (Z : STVC) :
    (lbCurv timeProj offDiagVar Z).1 = (4⁻¹ : Cut) * Z.2.1 := by
  rw [lbCurv_eq]
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_fst, Prod.fst_sub,
    neg_zero, sub_zero, smul_eq_mul]

/-- The general-`Z` SPACE-`x` component of the concrete curvature vector: `(R(...)·Z).2.1 = 0`. -/
theorem lbCurv_gen_comp2 (Z : STVC) :
    (lbCurv timeProj offDiagVar Z).2.1 = (0 : Cut) := by
  rw [lbCurv_eq]
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_snd, Prod.smul_fst,
    Prod.snd_sub, Prod.fst_sub, neg_zero, sub_zero, smul_eq_mul, mul_zero]

/-- THE CONCRETE RICCI FORM: `ricci solderWit Y Z = ¼·Y.2.1·Z.2.1` — a rank-1 SYMMETRIC Ricci supported
    on the spatial `x`-slot (from `ricci_solder` N352 + the general curvature components). -/
theorem ricci_solder_form (Y Z : STVC) :
    ricci solderWit Y Z = (4⁻¹ : Cut) * Y.2.1 * Z.2.1 := by
  rw [ricci_solder, lbCurv_gen_comp1, lbCurv_gen_comp2]; ring

/-- THE CONCRETE RICCI IS SYMMETRIC: `Ric(Y,Z) = Ric(Z,Y)` — the symmetric rank-(0,2) object GR uses. -/
theorem ricci_solder_symm (Y Z : STVC) :
    ricci solderWit Y Z = ricci solderWit Z Y := by
  rw [ricci_solder_form, ricci_solder_form]; ring

/-- The `x`-coordinate functional `Z ↦ Z.2.1` as a linear map. -/
def xFun : STVC →ₗ[Cut] Cut :=
  (LinearMap.fst Cut Cut (O Cut)).comp (LinearMap.snd Cut Cut (Cut × O Cut))

theorem xFun_apply (Z : STVC) : xFun Z = Z.2.1 := rfl

/-- THE CONCRETE METRIC-RAISED RICCI ENDOMORPHISM: `T Z = (0, −¼·Z.2.1, 0)`. The DERIVED spatial
    signature `−` (from `BvC`'s spatial minus sign) flips the `¼` of the Ricci form; a rank-1 map
    `Z.2.1 • (0,−¼,0)`, so its trace closes by `LinearMap.trace_smulRight`. -/
def solderRicciRaise : MetricEnd := xFun.smulRight (((0:Cut), (-(4⁻¹):Cut), (0 : O Cut)) : STVC)

theorem solderRicciRaise_apply (Z : STVC) :
    solderRicciRaise Z = ((0:Cut), (-(4⁻¹):Cut) * Z.2.1, (0 : O Cut)) := by
  show Z.2.1 • (((0:Cut), (-(4⁻¹):Cut), (0 : O Cut)) : STVC) = _
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show Z.2.1 • (0:Cut) = 0; rw [smul_zero]
  · show Z.2.1 • (-(4⁻¹):Cut) = (-(4⁻¹):Cut) * Z.2.1; rw [smul_eq_mul]; ring
  · show Z.2.1 • (0:O Cut) = 0; rw [smul_zero]

/-- `solderRicciRaise` raises the concrete Ricci index: `BvC Y (T Z) = ricci solderWit Y Z`. The
    spatial `BvC` minus sign `−x·x'` cancels the `−¼` to reproduce `¼·Y.2.1·Z.2.1`. -/
theorem solder_isRicciRaise : IsRicciRaise solderWit solderRicciRaise := by
  intro Y Z
  rw [ricci_solder_form, solderRicciRaise_apply]
  show Y.1 * 0 - Y.2.1 * ((-(4⁻¹):Cut) * Z.2.1) - gFormC Y.2.2 0 = 4⁻¹ * Y.2.1 * Z.2.1
  rw [gFormC_zero_right']; ring

/-- The general metric-raise (via `toDual`) EQUALS the concrete `solderRicciRaise` on `solderWit` — by
    the uniqueness `ricciRaise_unique` (both raise the same Ricci index; the derived metric's
    nondegeneracy forces them equal). -/
theorem ricciRaiseMap_solder_eq : ricciRaiseMap solderWit = solderRicciRaise :=
  ricciRaise_unique solderWit _ _ (ricciRaiseMap_isRaise solderWit) solder_isRicciRaise

/-- ★ THE RICCI SCALAR FOR THE CONCRETE FIELD GRADIENT: `ricciScalar solderWit = −¼`. Via the
    uniqueness bridge to the rank-1 `solderRicciRaise` and `LinearMap.trace_smulRight`. The SIGN `−` is
    FORCED by the DERIVED `(1,9)` signature (the spatial minus of `BvC`); it is not chosen. -/
theorem ricciScalar_solder : ricciScalar solderWit = -(4⁻¹ : Cut) := by
  unfold ricciScalar
  rw [ricciRaiseMap_solder_eq]
  unfold solderRicciRaise
  rw [LinearMap.trace_smulRight, xFun_apply]

/-! ## (4) NON-VACUITY (W8) and THE HEART. -/

/-- ★★ NON-VACUITY (W8): the Ricci scalar is NONZERO for the concrete field gradient —
    `ricciScalar solderWit = −¼ ≠ 0`. The metric trace is not a vacuous "always zero" contraction; the
    genuine Ricci has a nonzero scalar invariant. -/
theorem ricciScalar_solder_ne_zero : ricciScalar solderWit ≠ 0 := by
  rw [ricciScalar_solder]; norm_num

/-- ★★★ THE THEORY-NATIVE HEART — the metric trace is contentful where the fiber trace is blind. The
    endomorphism FIBER trace of the curvature is IDENTICALLY ZERO (`fiberTrace_lbCurv_zero`, N349 — the
    naive scalar-curvature index contraction is content-free), YET the metric (BvC) trace of the genuine
    Ricci — the Ricci SCALAR — is `−¼ ≠ 0` for the concrete field gradient (`ricciScalar_solder_ne_zero`).
    Raising the index with the DERIVED signature metric rescues the scalar contraction the blind fiber
    trace destroyed; the sign `−` is the derived `(1,9)` signature. This CLOSES the N349→N352→N353 arc:
    fiber trace BLIND → soldered Ricci FAITHFUL → its metric trace CONTENTFUL. -/
theorem ricciScalar_contentful_not_fiberTrace :
    LinearMap.trace Cut STVC (lbCurv timeProj offDiagVar) = 0
      ∧ ricciScalar solderWit ≠ 0 :=
  ⟨fiberTrace_lbCurv_zero timeProj offDiagVar, ricciScalar_solder_ne_zero⟩

end

end Phys.Algebra
