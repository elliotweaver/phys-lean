import Phys.Algebra.LorentzContinuumGenerationSO8PeelOracle
import Phys.Algebra.LorentzContinuumMetricCondition

namespace Phys.Algebra.N125Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

theorem BvC_add_right' (p q q' : STVC) : BvC p (q + q') = BvC p q + BvC p q' := by
  rw [BvC_symm p (q + q'), BvC_add_left, BvC_symm q p, BvC_symm q' p]

theorem BvC_smul_right' (c : Cut) (p q : STVC) : BvC p (c • q) = c * BvC p q := by
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show t * (c • t') - x * (c • x') - gFormC v (c • v') = c * (t * t' - x * x' - gFormC v v')
  rw [gFormC_smul_right]; show t * (c * t') - x * (c * x') - c * gFormC v v' = _; ring

def BvCRight (a : STVC) : STVC →ₗ[Cut] Cut where
  toFun := fun p => BvC a p
  map_add' := BvC_add_right' a
  map_smul' := fun c p => by simpa using BvC_smul_right' c a p

def fixSubmoduleM (S : Module.End Cut STVC) : Submodule Cut STVC :=
  LinearMap.ker (S - LinearMap.id)

theorem mem_fixSubmoduleM (S : Module.End Cut STVC) (p : STVC) :
    p ∈ fixSubmoduleM S ↔ S p = p := by
  unfold fixSubmoduleM
  rw [LinearMap.mem_ker, LinearMap.sub_apply, LinearMap.id_apply, sub_eq_zero]

def IsBvIsomLin (S : Module.End Cut STVC) : Prop := ∀ p q : STVC, BvC (S p) (S q) = BvC p q

theorem IsBvIsomLin.comp {R T : Module.End Cut STVC}
    (hR : IsBvIsomLin R) (hT : IsBvIsomLin T) : IsBvIsomLin (R * T) := by
  intro p q
  rw [Module.End.mul_apply, Module.End.mul_apply, hR, hT]

theorem isBvIsomLin_ne_id_has_moved {T : Module.End Cut STVC} (hid : T ≠ LinearMap.id) :
    ∃ p : STVC, T p ≠ p := by
  by_contra h
  push Not at h
  exact hid (LinearMap.ext h)

def houseHolderM (a : STVC) : Module.End Cut STVC :=
  LinearMap.id - (2 * (BvC a a)⁻¹) • (LinearMap.smulRight (BvCRight a) a)

theorem houseHolderM_apply (a p : STVC) :
    houseHolderM a p = p - (2 * (BvC a a)⁻¹ * BvC a p) • a := by
  unfold houseHolderM
  rw [LinearMap.sub_apply, LinearMap.id_apply, LinearMap.smul_apply,
      LinearMap.smulRight_apply]
  show p - (2 * (BvC a a)⁻¹) • (BvCRight a p • a) = _
  rw [smul_smul]; rfl

theorem houseHolderM_fixes_ortho {a u : STVC} (h : BvC a u = 0) :
    houseHolderM a u = u := by
  rw [houseHolderM_apply, h, mul_zero, zero_smul, sub_zero]

theorem houseHolderM_neg_self {a : STVC} (ha : BvC a a ≠ 0) :
    houseHolderM a a = -a := by
  rw [houseHolderM_apply]
  have : (2 * (BvC a a)⁻¹ * BvC a a) = 2 := by field_simp
  rw [this]; module

theorem BvC_houseterm (x y a : STVC) (s t : Cut) :
    BvC (x - s • a) (y - t • a)
      = BvC x y - t * BvC x a - s * BvC a y + s * t * BvC a a := by
  rw [BvC_sub_left, BvC_sub_right, BvC_sub_right]
  have hsa_y : BvC (s • a) y = s * BvC a y := by rw [BvC_symm, BvC_smul_right', BvC_symm]
  have hx_ta : BvC x (t • a) = t * BvC x a := by rw [BvC_smul_right']
  have hsa_ta : BvC (s • a) (t • a) = s * t * BvC a a := by
    rw [BvC_smul_right', BvC_symm (s • a) a, BvC_smul_right']; ring
  rw [hsa_y, hx_ta, hsa_ta]; ring

theorem houseHolderM_isom {a : STVC} (ha : BvC a a ≠ 0) :
    IsBvIsomLin (houseHolderM a) := by
  intro u v
  rw [houseHolderM_apply, houseHolderM_apply, BvC_houseterm, BvC_symm u a]
  field_simp; ring

theorem houseHolderM_involutive {a : STVC} (ha : BvC a a ≠ 0) :
    houseHolderM a * houseHolderM a = 1 := by
  apply LinearMap.ext
  intro v
  rw [Module.End.mul_apply, houseHolderM_apply, houseHolderM_apply]
  have hinner : BvC a (v - (2 * (BvC a a)⁻¹ * BvC a v) • a)
      = BvC a v - (2 * (BvC a a)⁻¹ * BvC a v) * BvC a a := by
    rw [BvC_sub_right, BvC_smul_right']
  rw [hinner]
  have hcoef : (2 * (BvC a a)⁻¹ * BvC a v)
      + (2 * (BvC a a)⁻¹ * (BvC a v - (2 * (BvC a a)⁻¹ * BvC a v) * BvC a a)) = 0 := by
    field_simp; ring
  rw [sub_sub, ← add_smul, hcoef, zero_smul, sub_zero]; rfl

/-! ## The reflection alphabet and the ANISOTROPIC peel oracle. -/

def houseHolderMSet : Set (Module.End Cut STVC) :=
  { R | ∃ a : STVC, BvC a a ≠ 0 ∧ R = houseHolderM a }

/-- ★★ THE ANISOTROPIC PEEL ORACLE over the 10-dim `STVC`: for a `BvC`-isometry `T ≠ id` with a
    moved vector `v` whose difference `a := T v − v` is ANISOTROPIC (`BvC a a ≠ 0`), the indefinite
    Householder reflection `R := houseHolderM a` is an involution, `R · T` is a `BvC`-isometry, and
    its fixed subspace STRICTLY contains `fixSubmoduleM T` — so the finrank grows. The reflect-back
    scalar identity `BvC a a = 2·BvC a (T v)` survives the indefinite signature UNCHANGED (pure
    bilinearity + the isometry equation `BvC (T v)(T v) = BvC v v`); positivity is replaced by the
    explicit anisotropy hypothesis the `(1,9)` signature forces. -/
theorem houseHolderM_oracle (T : Module.End Cut STVC) (hT : IsBvIsomLin T)
    {v : STVC} (hv : T v ≠ v) (haniso : BvC (T v - v) (T v - v) ≠ 0) :
    ∃ R ∈ houseHolderMSet, R * R = 1 ∧ IsBvIsomLin (R * T) ∧
      Module.finrank Cut (fixSubmoduleM T)
        < Module.finrank Cut (fixSubmoduleM (R * T)) := by
  set a : STVC := T v - v with ha_def
  have haa : BvC a a ≠ 0 := haniso
  set R : Module.End Cut STVC := houseHolderM a with hR_def
  have hTvTv : BvC (T v) (T v) = BvC v v := hT v v
  -- THE KEY scalar identity (survives the indefinite signature): BvC a a = 2 · BvC a (T v).
  have hkey : BvC a a = 2 * BvC a (T v) := by
    have e1 : BvC a (T v) = BvC (T v) (T v) - BvC v (T v) := by
      rw [ha_def, BvC_sub_left]
    have e2 : BvC a a = BvC (T v) (T v) - BvC v (T v) - BvC v (T v) + BvC v v := by
      rw [ha_def,
          show (T v - v) = (T v - (1 : Cut) • v) by rw [one_smul],
          BvC_houseterm (T v) (T v) v 1 1, BvC_symm v (T v)]
      ring
    rw [e1, e2, hTvTv]; ring
  -- O4: the reflection sends `T v` back to `v`.
  have hbne : BvC a (T v) ≠ 0 := by
    intro h; rw [h, mul_zero] at hkey; exact haa hkey
  have hO4 : R (T v) = v := by
    rw [hR_def, houseHolderM_apply]
    have hc : 2 * (BvC a a)⁻¹ * BvC a (T v) = 1 := by rw [hkey]; field_simp
    rw [hc, one_smul, ha_def]; abel
  -- O5: every `T`-fixed `u` stays `(R·T)`-fixed.
  have hO5 : ∀ u : STVC, T u = u → (R * T) u = u := by
    intro u hu
    have hortho : BvC a u = 0 := by
      rw [ha_def, BvC_sub_left]
      have hTu : BvC (T v) u = BvC v u := by
        have := hT v u; rw [hu] at this; exact this
      rw [hTu]; ring
    rw [Module.End.mul_apply, hu, hR_def, houseHolderM_fixes_ortho hortho]
  refine ⟨R, ⟨a, haa, rfl⟩, ?_, ?_, ?_⟩
  · rw [hR_def]; exact houseHolderM_involutive haa
  · exact (houseHolderM_isom haa).comp hT
  · have hsub : fixSubmoduleM T ≤ fixSubmoduleM (R * T) := by
      intro u hu
      rw [mem_fixSubmoduleM] at hu ⊢
      exact hO5 u hu
    have hvmem : v ∈ fixSubmoduleM (R * T) := by
      rw [mem_fixSubmoduleM, Module.End.mul_apply, hO4]
    have hvnotmem : v ∉ fixSubmoduleM T := by
      rw [mem_fixSubmoduleM]; exact hv
    have hlt : fixSubmoduleM T < fixSubmoduleM (R * T) :=
      lt_of_le_of_ne hsub (fun heq => hvnotmem (heq ▸ hvmem))
    exact Submodule.finrank_lt_finrank_of_lt hlt

/-! ## W8 teeth — concrete timelike + spacelike reflections (the genuinely-indefinite demo). -/

/-- The timelike unit axis `(1,0,0)` and the spacelike unit axis `(0,1,0)`. -/
def eT : STVC := (1, 0, 0)
def eX : STVC := (0, 1, 0)

theorem BvC_eT_self : BvC (eT : STVC) (eT : STVC) = 1 := by
  show (1 : Cut) * 1 - 0 * 0 - gFormC 0 0 = 1
  rw [gFormC_zero_left]; ring

theorem BvC_eX_self : BvC (eX : STVC) (eX : STVC) = -1 := by
  show (0 : Cut) * 0 - 1 * 1 - gFormC 0 0 = -1
  rw [gFormC_zero_left]; ring

/-- ★ W8 — the indefinite Householder reflection at the TIMELIKE unit axis negates it. -/
theorem houseHolderM_witness_neg_T :
    houseHolderM (eT : STVC) (eT : STVC) = -(eT : STVC) :=
  houseHolderM_neg_self (by rw [BvC_eT_self]; exact one_ne_zero)

/-- ★ W8 — the indefinite Householder reflection at the SPACELIKE (negative-norm) unit axis
    negates it. The genuinely-indefinite demonstration: a negative-`BvC`-norm vector still carries
    a clean reflection (positivity is NOT required, only anisotropy). -/
theorem houseHolderM_witness_neg_X :
    houseHolderM (eX : STVC) (eX : STVC) = -(eX : STVC) :=
  houseHolderM_neg_self (by rw [BvC_eX_self]; exact neg_ne_zero.mpr one_ne_zero)

/-- ★ W8 TEETH — the Minkowski self-overlap of the reflected timelike axis reads `1`, NOT `125`. -/
theorem houseHolderM_witness_self_overlap_T :
    BvC (houseHolderM (eT : STVC) (eT : STVC))
        (houseHolderM (eT : STVC) (eT : STVC)) = 1 := by
  rw [houseHolderM_witness_neg_T, BvC_neg_left, BvC_symm, BvC_neg_left, BvC_symm, neg_neg]
  exact BvC_eT_self

end

end Phys.Algebra.N125Probe
