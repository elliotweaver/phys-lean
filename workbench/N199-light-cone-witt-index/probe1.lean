import Phys.Algebra.SpacetimeSignatureInertia
import Mathlib.Tactic

namespace N199Probe

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- A future light-cone vector: time 1, one spatial unit, octonion block 0. -/
def lightVec : STV := ((1 : ℚ), (1 : ℚ), (0 : O ℚ))
def lightVecMinus : STV := ((1 : ℚ), (-1 : ℚ), (0 : O ℚ))

/-- A subspace on which `Qv` vanishes identically (a totally-isotropic / totally-null subspace). -/
def IsTotallyNull (W : Submodule ℚ STV) : Prop := ∀ w ∈ W, Qv w = 0

theorem lightVec_null : Qv lightVec = 0 := by
  show Qform (1 : ℚ) (1 : ℚ) (0 : O ℚ) = 0
  unfold Qform gForm reQ
  simp

theorem lightVecMinus_null : Qv lightVecMinus = 0 := by
  show Qform (1 : ℚ) (-1 : ℚ) (0 : O ℚ) = 0
  unfold Qform gForm reQ
  simp

theorem lightVec_ne_zero : lightVec ≠ 0 := by
  intro hc
  have := congrArg (fun p => p.1) hc
  simp [lightVec] at this

/-- ★ THE LIGHT CONE EXISTS — the Born determinant form is ISOTROPIC (represents zero nontrivially). -/
theorem form_isotropic : ∃ v : STV, v ≠ 0 ∧ Qv v = 0 :=
  ⟨lightVec, lightVec_ne_zero, lightVec_null⟩

theorem lightVec_not_mem_timeSub : lightVec ∉ timeSub := by
  intro h
  have := Qv_pos_on_time h lightVec_ne_zero
  rw [lightVec_null] at this
  exact lt_irrefl 0 this

theorem lightVec_not_mem_spaceSub : lightVec ∉ spaceSub := by
  intro h
  have := Qv_neg_on_space h lightVec_ne_zero
  rw [lightVec_null] at this
  exact lt_irrefl 0 this

def nullLine : Submodule ℚ STV := Submodule.span ℚ {lightVec}

/-- Scaling a null vector keeps it null: `Qv (c • lightVec) = c² · Qv lightVec = 0`. -/
theorem Qv_smul_lightVec (c : ℚ) : Qv (c • lightVec) = 0 := by
  show Qform (c * 1) (c * 1) (c • (0 : O ℚ)) = 0
  unfold Qform gForm reQ
  simp

theorem nullLine_totallyNull : IsTotallyNull nullLine := by
  intro w hw
  rw [nullLine, Submodule.mem_span_singleton] at hw
  obtain ⟨c, rfl⟩ := hw
  exact Qv_smul_lightVec c

theorem finrank_nullLine : Module.finrank ℚ nullLine = 1 := by
  rw [nullLine]
  rw [finrank_span_singleton lightVec_ne_zero]

/-- A totally-null subspace meets the negative-definite space block only at 0. -/
theorem totallyNull_inf_spaceSub_eq_bot {W : Submodule ℚ STV} (hW : IsTotallyNull W) :
    W ⊓ spaceSub = ⊥ := by
  rw [eq_bot_iff]
  intro w hw
  rw [Submodule.mem_bot]
  by_contra hne
  obtain ⟨hwW, hwS⟩ := hw
  have h0 : Qv w = 0 := hW w hwW
  have hneg : Qv w < 0 := Qv_neg_on_space hwS hne
  rw [h0] at hneg
  exact lt_irrefl 0 hneg

/-- ★★ THE WITT INDEX IS ≤ 1: every totally-null subspace has finrank ≤ 1. -/
theorem wittIndex_le_one {W : Submodule ℚ STV} (hW : IsTotallyNull W) :
    Module.finrank ℚ W ≤ 1 := by
  have hinf : W ⊓ spaceSub = ⊥ := totallyNull_inf_spaceSub_eq_bot hW
  have hkey := Submodule.finrank_sup_add_finrank_inf_eq W spaceSub
  rw [hinf, finrank_bot, add_zero, finrank_spaceSub] at hkey
  have hle : Module.finrank ℚ ↥(W ⊔ spaceSub) ≤ 10 := by
    rw [← finrank_STV]; exact Submodule.finrank_le _
  omega

theorem witt_index_eq_one :
    IsTotallyNull nullLine ∧ Module.finrank ℚ nullLine = 1 ∧
      (∀ W : Submodule ℚ STV, IsTotallyNull W → Module.finrank ℚ W ≤ 1) :=
  ⟨nullLine_totallyNull, finrank_nullLine, fun _ h => wittIndex_le_one h⟩

/-- W8: the span of two null vectors is NOT totally null — it contains lightVec+lightVecMinus=(2,0,0),
    Qv = 4 ≠ 0. The ≤ 1 bound is not about an empty set of 2-planes. -/
theorem twoNull_span_not_totallyNull :
    ¬ IsTotallyNull (Submodule.span ℚ {lightVec, lightVecMinus}) := by
  intro h
  have hmem : ((2 : ℚ), (0 : ℚ), (0 : O ℚ)) ∈ Submodule.span ℚ {lightVec, lightVecMinus} := by
    have e1 : lightVec ∈ Submodule.span ℚ {lightVec, lightVecMinus} :=
      Submodule.subset_span (by simp)
    have e2 : lightVecMinus ∈ Submodule.span ℚ {lightVec, lightVecMinus} :=
      Submodule.subset_span (by simp)
    have hsum := Submodule.add_mem _ e1 e2
    have : lightVec + lightVecMinus = ((2 : ℚ), (0 : ℚ), (0 : O ℚ)) := by
      show ((1:ℚ)+1, (1:ℚ)+(-1), (0:O ℚ)+0) = _
      norm_num
    rwa [this] at hsum
  have hval := h _ hmem
  have : Qv ((2 : ℚ), (0 : ℚ), (0 : O ℚ)) = 4 := by
    show Qform (2 : ℚ) (0 : ℚ) (0 : O ℚ) = 4
    unfold Qform gForm reQ
    simp; norm_num
  rw [this] at hval
  norm_num at hval

end

end N199Probe

#print axioms N199Probe.form_isotropic
#print axioms N199Probe.witt_index_eq_one
#print axioms N199Probe.wittIndex_le_one
#print axioms N199Probe.twoNull_span_not_totallyNull
#print axioms N199Probe.lightVec_null
