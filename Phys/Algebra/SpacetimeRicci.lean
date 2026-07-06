/-
  Phys.Algebra.SpacetimeRicci — N352 (arc-E E1-Ricci): THE GENUINE TENSORIAL RICCI via the
  SOLDERING / FIELD-GRADIENT MAP, resolving the 3× deferral of the Ricci contraction.
  ===========================================================================
  DIRECTED SINGLE SUCCESSOR of N351 (E1-assembly, `Phys/Algebra/SpacetimeRiemannAssembly.lean`),
  which assembled the full linearized curvature 2-form `F = dΓ + Γ∧Γ` and PROVED the fiber trace of
  the assembled Riemann sees only the `dΓ` layer — BLIND to the commutator, extending N349's trace
  no-go. This node builds the GENUINE TENSORIAL RICCI on the SAME banked carrier
  `MetricEnd = Module.End Cut STVC`, banked `lbCurv` (N348), toward E2 (Einstein's equations unique
  via Lovelock).

  ── THE THEORY-NATIVE ANCHOR (the Ricci is the LOOP-INDEX contraction, NOT the blind fiber trace) ──
  The TENSORIAL Ricci was childed/deferred at N348, N349, AND N351 — three consecutive nodes — each
  for the SAME stated reason: "the fiber trace is blind (`trace [Γ₁,Γ₂] = 0`), so the Ricci must be
  the fold's Born form / needs the finite basis." That repeated deferral (RUNBOOK REPEATED-DEFERRAL
  SIGNAL) is DATA: the front was rejected ≥3× for one structural reason, so rather than defer a fourth
  time into an easier adjacent scalar, we NAME the blocker and BUILD the richer structure the front
  actually requires.

  A FRESH-worker SELECT MEASURED (probe1–4, all EXIT 0) that the ceiling was MIS-DIAGNOSED. The blind
  trace at N349/N351 is the ENDOMORPHISM / FIBER trace of the curvature — it contracts the curvature
  endomorphism's OWN target-vs-source index, and `trace [Γ₁,Γ₂] = 0` by `trace_mul_comm`. But the
  genuine RICCI is a DIFFERENT contraction: it contracts the LOOP-SOURCE index against the fiber
  index, `Ric(Y,Z) = trace (X ↦ R(X,Y) Z)`. That contraction is type-incoherent in the bare
  representation because the loop directions live INSIDE the metric variations `k : MetricEnd`, not as
  genuine tangent vectors. The missing structure — the one the deferral pointed to — is the
  SOLDERING / FIELD-GRADIENT map `G : STVC →ₗ[Cut] MetricEnd`, `G X = ∂_X h`: each tangent direction
  solders to "its" metric variation. This is NOT a new posit — it is the field gradient the banked
  N350 `lbConn_opderiv` (`∂(Γ∘h) = Γ(∂h)`) already grounds: the linear assignment of a metric
  variation to a tangent direction. With `G` exposed, the curvature `R(X,Y) := lbCurv (G X) (G Y)` and
  the Ricci `Ric(Y,Z) := trace (X ↦ R(X,Y) Z)` become formable.

  ── THE ONE FORCED FACT (the heart): the Ricci is nonzero where the fiber trace is blind ──
  For a rank-2 soldering `G X = X.1·(timeProj) + X.2.1·(offDiagVar)`, bilinearity of the curvature and
  `R(k,k) = 0` give `R(X,Y) = (X.1·Y.2.1 − X.2.1·Y.1) · lbCurv timeProj offDiagVar` (`lbCurv_solder`):
  the single banked curvature times the antisymmetric coefficient. The Ricci map `X ↦ R(X,Y) Z` is
  therefore RANK-1 (`ricMap_solder`), so its trace closes by `LinearMap.trace_smulRight` — no
  finite-basis brute force. The genuine Ricci `ricci solderWit (0,1,0) (0,1,0) = ¼ ≠ 0`
  (`ricci_solder_ne_zero`) — NONZERO exactly where the fiber trace is IDENTICALLY ZERO (N349
  `fiberTrace_lbCurv_zero`). The 3× deferral is RESOLVED: the Ricci was not un-formable; the loop
  index had to be soldered. `ricci_faithful_not_fiberTrace` bundles the two: the fiber trace vanishes,
  the genuine loop-index Ricci does not.

  ── SCOPE (W3 — this beat is the GENUINE RICCI (existence + tensor structure + faithfulness); the
  scalar and E2 are childed) ──
  This node banks the tensorial Ricci `ricci G Y Z` as the trace over the soldered loop index, its
  bilinearity (a genuine rank-(0,2) tensor), the rank-1 reduction for a concrete soldering, and the
  faithfulness (nonzero where the fiber trace is blind). The Ricci SCALAR (`g^μν Ric_μν`, the metric
  trace via the banked `BvC`), Ricci pair-symmetry, and E2 (Einstein's equations unique via Lovelock
  literature import, applied to this Ricci) are childed as the single successor. Weak-field is
  sufficient to reach E2/E3 (docs/SEED_GR_BLACKHOLE_COSMOLOGY.md §E1). A MACHINERY node: it asserts
  NO physical value; it is flagged leading-order/mechanism-grade.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N348 objects) ──
    lbCurvLeft                — `k ↦ lbCurv k kY` as a linear map (from `lbCurv_add_left`/`_smul_left`).
    evalAt                    — evaluation at a vector `Z`, `LinearMap.applyₗ Z`.
    ricMap                    — the loop-source curvature map `X ↦ lbCurv (G X) (G Y) Z`, over the
                                soldering `G : STVC →ₗ MetricEnd`.
    ricMap_apply              — `ricMap G Y Z X = lbCurv (G X) (G Y) Z`.
    ricMap_add_Y / _add_Z     — additive in the second loop slot and the fiber slot.
    ricMap_smul_Y / _smul_Z   — homogeneous in the second loop slot and the fiber slot.
    ricci                     — the GENUINE TENSORIAL RICCI `trace (ricMap G Y Z)` (the loop-index trace).
    ricci_add_Y / _add_Z      — ★ BILINEAR: a genuine rank-(0,2) tensor.
    ricci_smul_Y / _smul_Z    — ★ homogeneous in both slots.
    solderWit / solderWit_apply — the concrete rank-2 field-gradient soldering `X ↦ X.1·Γ-var + X.2.1·shear-var`.
    lbCurv_solder             — `R(X,Y) = (X.1·Y.2.1 − X.2.1·Y.1) · lbCurv timeProj offDiagVar` (rank-1 coeff).
    ricMap_solder             — the Ricci map is RANK-1 (`ρ.smulRight w`) for the concrete soldering.
    ricci_solder              — the computed trace via `LinearMap.trace_smulRight`.
    lbCurv_sample_comp1 / _comp2 — the concrete curvature vector's components (`¼`, `0`).
    ricci_solder_ne_zero      — ★★ NON-VACUITY (W8): `ricci solderWit (0,1,0) (0,1,0) = ¼ ≠ 0`.
    ricci_faithful_not_fiberTrace — ★★★ THE HEART: the fiber trace is `0` (N349) YET the genuine
                                loop-index Ricci is nonzero — the Ricci is the contraction over the
                                soldered loop index, not the blind fiber trace; the 3× deferral was a
                                mis-diagnosed ceiling.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N348 `lbCurv`/`lbCurv_add_left`/`_smul_left`/
  `_add_right`/`_smul_right`/`_self`/`_antisymm`/`_eq`/`timeProj`/`offDiagVar` (← N347 `lbConn` ← N90
  `sigOpC` ← the derived ℝ `Cut` ← the fold); `LinearMap.trace`/`applyₗ`/`smulRight`/`Module.Free`/
  `Module.Finite` are Mathlib MACHINERY on the DERIVED carrier. Complete: `#print axioms ⊆ {propext,
  Classical.choice, Quot.sound}` for every declaration. Words-removable: delete "curvature / Riemann /
  Ricci / soldering / gradient / tangent / loop / gravity / spacetime": over the derived complete
  ordered field `Cut`, for the involution `η` (`η²=1`), endomorphisms `Γ = ½ηk`, and a linear map
  `G : STVC →ₗ MetricEnd`, the assignment `Y,Z ↦ trace (X ↦ [Γ(GX),Γ(GY)] Z)` is bilinear, and for the
  concrete rank-2 `G` it is nonzero while the endomorphism trace of `[Γ₁,Γ₂]` is zero. Pure
  linear/trace algebra over the derived ℝ. NO theorem STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/linearized — flagged). NO empirical number. NO
  Mathlib number-system content import (the field is the DERIVED `Cut`), NO Mathlib manifold/
  Riemannian/curvature-tensor/`HasDerivAt`/`deriv` API as content (`LinearMap.trace`/`applyₗ`/
  `smulRight` are machinery on the derived carrier; the curvature is the banked commutator, the
  soldering a genuine linear map INTO the banked `MetricEnd`). NO posited Ricci tensor (it is the
  trace of the banked curvature over the soldered loop index; the faithfulness is PROVED). NO
  kernel-trust bypass, NO `maxHeartbeats` raise, NO coordinate bash.
-/
import Phys.Algebra.SpacetimeCurvatureScalar
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The curvature over a soldering map: `k ↦ lbCurv k kY` linear, evaluation, the Ricci map. -/

/-- The curvature with the SECOND loop slot fixed, as a linear map in the FIRST slot:
    `lbCurvLeft kY : k ↦ lbCurv k kY`. Linear by the banked bilinearity of `lbCurv`
    (`lbCurv_add_left`, `lbCurv_smul_left`). -/
def lbCurvLeft (kY : MetricEnd) : MetricEnd →ₗ[Cut] MetricEnd where
  toFun k := lbCurv k kY
  map_add' k₁ k₂ := lbCurv_add_left k₁ k₂ kY
  map_smul' c k := by simp only [RingHom.id_apply]; exact lbCurv_smul_left c k kY

/-- Evaluation of an endomorphism at a fixed vector `Z`, as a linear map `MetricEnd →ₗ STVC`
    (`LinearMap.applyₗ Z`). -/
def evalAt (Z : STVC) : MetricEnd →ₗ[Cut] STVC := LinearMap.applyₗ Z

/-- THE RICCI (LOOP-SOURCE) CURVATURE MAP: over a SOLDERING map `G : STVC →ₗ MetricEnd` (the
    field gradient `G X = ∂_X h`, banked-grounded by N350 `lbConn_opderiv`), the map
    `X ↦ lbCurv (G X) (G Y) Z`, sending the loop-source direction `X` to the curvature endomorphism
    `R(X,Y) = [Γ(GX),Γ(GY)]` evaluated at the fiber vector `Z`. This is the map whose TRACE is the
    genuine tensorial Ricci — the contraction over the SOLDERED loop index (NOT the blind endomorphism
    fiber trace, N349). -/
def ricMap (G : STVC →ₗ[Cut] MetricEnd) (Y Z : STVC) : STVC →ₗ[Cut] STVC :=
  (evalAt Z).comp ((lbCurvLeft (G Y)).comp G)

/-- `ricMap G Y Z X = lbCurv (G X) (G Y) Z` — the curvature at loop directions `(GX, GY)` on `Z`. -/
theorem ricMap_apply (G : STVC →ₗ[Cut] MetricEnd) (Y Z X : STVC) :
    ricMap G Y Z X = lbCurv (G X) (G Y) Z := rfl

/-! ## (2) The Ricci as the loop-index trace, and its rank-(0,2) tensor structure. -/

/-- THE GENUINE TENSORIAL RICCI: the trace over the SOLDERED LOOP index of the curvature map,
    `ricci G Y Z := trace (X ↦ lbCurv (G X) (G Y) Z)`. NOT the blind endomorphism fiber trace
    (N349 `fiberTrace_lbCurv_zero`, identically zero); this is the contraction over the loop-source
    direction that the field-gradient soldering `G` exposes as a genuine tangent index. -/
def ricci (G : STVC →ₗ[Cut] MetricEnd) (Y Z : STVC) : Cut :=
  LinearMap.trace Cut STVC (ricMap G Y Z)

/-- The Ricci curvature map is ADDITIVE in the second loop slot `Y` (banked `lbCurv_add_right`). -/
theorem ricMap_add_Y (G : STVC →ₗ[Cut] MetricEnd) (Y₁ Y₂ Z : STVC) :
    ricMap G (Y₁ + Y₂) Z = ricMap G Y₁ Z + ricMap G Y₂ Z := by
  refine LinearMap.ext fun X => ?_
  simp only [ricMap_apply, LinearMap.add_apply, map_add, lbCurv_add_right, LinearMap.add_apply]

/-- The Ricci curvature map is ADDITIVE in the fiber slot `Z` (evaluation is additive). -/
theorem ricMap_add_Z (G : STVC →ₗ[Cut] MetricEnd) (Y Z₁ Z₂ : STVC) :
    ricMap G Y (Z₁ + Z₂) = ricMap G Y Z₁ + ricMap G Y Z₂ := by
  refine LinearMap.ext fun X => ?_
  simp only [ricMap_apply, LinearMap.add_apply, map_add]

/-- The Ricci curvature map is HOMOGENEOUS in the second loop slot `Y` (banked `lbCurv_smul_right`). -/
theorem ricMap_smul_Y (G : STVC →ₗ[Cut] MetricEnd) (c : Cut) (Y Z : STVC) :
    ricMap G (c • Y) Z = c • ricMap G Y Z := by
  refine LinearMap.ext fun X => ?_
  simp only [ricMap_apply, map_smul, lbCurv_smul_right, LinearMap.smul_apply]

/-- The Ricci curvature map is HOMOGENEOUS in the fiber slot `Z` (evaluation is homogeneous). -/
theorem ricMap_smul_Z (G : STVC →ₗ[Cut] MetricEnd) (c : Cut) (Y Z : STVC) :
    ricMap G Y (c • Z) = c • ricMap G Y Z := by
  refine LinearMap.ext fun X => ?_
  simp only [ricMap_apply, map_smul, LinearMap.smul_apply]

/-- ★ THE RICCI IS ADDITIVE in the second loop slot `Y` (a rank-(0,2) tensor). Trace is linear. -/
theorem ricci_add_Y (G : STVC →ₗ[Cut] MetricEnd) (Y₁ Y₂ Z : STVC) :
    ricci G (Y₁ + Y₂) Z = ricci G Y₁ Z + ricci G Y₂ Z := by
  unfold ricci; rw [ricMap_add_Y, map_add]

/-- ★ THE RICCI IS ADDITIVE in the fiber slot `Z` (a rank-(0,2) tensor). Trace is linear. -/
theorem ricci_add_Z (G : STVC →ₗ[Cut] MetricEnd) (Y Z₁ Z₂ : STVC) :
    ricci G Y (Z₁ + Z₂) = ricci G Y Z₁ + ricci G Y Z₂ := by
  unfold ricci; rw [ricMap_add_Z, map_add]

/-- ★ THE RICCI IS HOMOGENEOUS in the second loop slot `Y`. -/
theorem ricci_smul_Y (G : STVC →ₗ[Cut] MetricEnd) (c : Cut) (Y Z : STVC) :
    ricci G (c • Y) Z = c * ricci G Y Z := by
  unfold ricci; rw [ricMap_smul_Y, map_smul, smul_eq_mul]

/-- ★ THE RICCI IS HOMOGENEOUS in the fiber slot `Z`. -/
theorem ricci_smul_Z (G : STVC →ₗ[Cut] MetricEnd) (c : Cut) (Y Z : STVC) :
    ricci G Y (c • Z) = c * ricci G Y Z := by
  unfold ricci; rw [ricMap_smul_Z, map_smul, smul_eq_mul]

/-! ## (3) The concrete soldering witness (the field gradient) and the rank-1 reduction. -/

/-- THE CONCRETE RANK-2 SOLDERING (field gradient): each tangent direction solders to "its" metric
    variation — the time component to the banked `timeProj`, the space-`x` component to the banked
    shear `offDiagVar`. `solderWit X = X.1 • timeProj + X.2.1 • offDiagVar`. The genuine soldering
    the field gradient (N350 `lbConn_opderiv`) provides; used to witness the Ricci is non-vacuous. -/
def solderWit : STVC →ₗ[Cut] MetricEnd :=
  (LinearMap.fst Cut Cut (Cut × O Cut)).smulRight timeProj
    + ((LinearMap.fst Cut Cut (O Cut)).comp (LinearMap.snd Cut Cut (Cut × O Cut))).smulRight offDiagVar

theorem solderWit_apply (X : STVC) :
    solderWit X = X.1 • timeProj + X.2.1 • offDiagVar := by
  simp only [solderWit, LinearMap.add_apply, LinearMap.smulRight_apply, LinearMap.fst_apply,
    LinearMap.comp_apply, LinearMap.snd_apply]

/-- THE RANK-1 REDUCTION: for the concrete rank-2 soldering, the curvature at loop directions
    `(solderWit X, solderWit Y)` reduces to the SINGLE banked curvature `lbCurv timeProj offDiagVar`
    times the antisymmetric coefficient `X.1·Y.2.1 − X.2.1·Y.1`. Bilinearity of `lbCurv` +
    `lbCurv_self = 0` (the diagonal loops enclose no area) + `lbCurv_antisymm`. -/
theorem lbCurv_solder (X Y : STVC) :
    lbCurv (solderWit X) (solderWit Y)
      = (X.1 * Y.2.1 - X.2.1 * Y.1) • lbCurv timeProj offDiagVar := by
  rw [solderWit_apply, solderWit_apply]
  simp only [lbCurv_add_left, lbCurv_add_right, lbCurv_smul_left, lbCurv_smul_right, lbCurv_self,
    smul_zero, add_zero, zero_add]
  rw [lbCurv_antisymm offDiagVar timeProj]
  module

/-- The Ricci map for the concrete soldering is RANK-1: `X ↦ ρ(X) • w`, with the linear functional
    `ρ = Y.2.1·(fst) − Y.1·(x-of-snd)` and `w = lbCurv timeProj offDiagVar Z`. A rank-1 endomorphism,
    so its trace closes by `LinearMap.trace_smulRight` — no finite-basis brute force. -/
theorem ricMap_solder (Y Z : STVC) :
    ricMap solderWit Y Z
      = ((Y.2.1 • (LinearMap.fst Cut Cut (Cut × O Cut))
            - Y.1 • ((LinearMap.fst Cut Cut (O Cut)).comp (LinearMap.snd Cut Cut (Cut × O Cut)))
          ).smulRight (lbCurv timeProj offDiagVar Z)) := by
  refine LinearMap.ext fun X => ?_
  rw [ricMap_apply, lbCurv_solder]
  simp only [LinearMap.smulRight_apply, LinearMap.sub_apply, LinearMap.smul_apply,
    LinearMap.fst_apply, LinearMap.comp_apply, LinearMap.snd_apply, smul_eq_mul]
  congr 1
  ring

/-- THE COMPUTED RICCI for the concrete soldering: via `LinearMap.trace_smulRight` the trace of the
    rank-1 map is the functional at the vector,
    `ricci solderWit Y Z = Y.2.1·(R·Z).1 − Y.1·(R·Z).2.1` where `R = lbCurv timeProj offDiagVar`. -/
theorem ricci_solder (Y Z : STVC) :
    ricci solderWit Y Z
      = Y.2.1 * (lbCurv timeProj offDiagVar Z).1
          - Y.1 * (lbCurv timeProj offDiagVar Z).2.1 := by
  unfold ricci
  rw [ricMap_solder, LinearMap.trace_smulRight]
  simp only [LinearMap.sub_apply, LinearMap.smul_apply, LinearMap.fst_apply, LinearMap.comp_apply,
    LinearMap.snd_apply, smul_eq_mul]

/-! ## (4) NON-VACUITY (W8): the genuine Ricci is nonzero where the fiber trace is blind. -/

/-- The concrete curvature vector's TIME component: `(R(timeProj,offDiagVar)·(0,1,0)).1 = ¼`. -/
theorem lbCurv_sample_comp1 :
    (lbCurv timeProj offDiagVar ((0:Cut),(1:Cut),(0:O Cut))).1 = (4⁻¹ : Cut) := by
  rw [lbCurv_eq]
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_fst, Prod.fst_sub,
    neg_zero, sub_zero]
  norm_num

/-- The concrete curvature vector's SPACE-`x` component: `(R(timeProj,offDiagVar)·(0,1,0)).2.1 = 0`. -/
theorem lbCurv_sample_comp2 :
    (lbCurv timeProj offDiagVar ((0:Cut),(1:Cut),(0:O Cut))).2.1 = (0 : Cut) := by
  rw [lbCurv_eq]
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_snd, Prod.smul_fst,
    Prod.snd_sub, Prod.fst_sub, neg_zero, sub_zero, smul_eq_mul, mul_zero]

/-- ★★ NON-VACUITY (W8): the genuine tensorial Ricci is NONZERO —
    `ricci solderWit (0,1,0) (0,1,0) = ¼ ≠ 0`. Precisely where the endomorphism FIBER trace of the
    curvature is IDENTICALLY ZERO (N349 `fiberTrace_lbCurv_zero`), the genuine loop-index Ricci is
    nonzero. The 3× deferral of the tensorial Ricci is RESOLVED: it was not un-formable — the loop
    direction had to be soldered to a tangent vector by the field-gradient map `G`. -/
theorem ricci_solder_ne_zero :
    ricci solderWit ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) ≠ 0 := by
  rw [ricci_solder, lbCurv_sample_comp1, lbCurv_sample_comp2]
  norm_num

/-! ## (5) THE HEART: the fiber trace is blind, the genuine loop-index Ricci sees. -/

/-- ★★★ THE THEORY-NATIVE HEART — the genuine Ricci is the LOOP-INDEX contraction, not the blind
    fiber trace. The endomorphism FIBER trace of the curvature is IDENTICALLY ZERO
    (`fiberTrace_lbCurv_zero`, N349 — the "obvious" index contraction is content-free, blind to the
    non-closure), YET the genuine tensorial Ricci — the trace over the SOLDERED loop-source index — is
    NONZERO for the concrete field gradient (`ricci_solder_ne_zero`). The Ricci lives on the loop
    index the field-gradient soldering exposes as a tangent vector, NOT on the endomorphism's own
    fiber index. The 3× deferral (N348/N349/N351) was a mis-diagnosed ceiling — the RUNBOOK
    repeated-deferral protocol made a theorem: NAME the blocker, BUILD the richer structure (the
    soldering), and the front falls. -/
theorem ricci_faithful_not_fiberTrace :
    LinearMap.trace Cut STVC (lbCurv timeProj offDiagVar) = 0
      ∧ ricci solderWit ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) ≠ 0 :=
  ⟨fiberTrace_lbCurv_zero timeProj offDiagVar, ricci_solder_ne_zero⟩

end

end Phys.Algebra
