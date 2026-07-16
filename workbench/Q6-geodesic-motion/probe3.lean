import Phys.Algebra.SpacetimeTwiceContractedBianchi
import Phys.Algebra.LorentzContinuumLieAlgebra
import Phys.Algebra.LorentzContinuumGenerationIndefiniteHouseholder
import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- === (1) velocity/acceleration orthogonality from metric compatibility ===
theorem transport_born_orthogonal (T : MetricEnd) (hT : IsInfIsomC T) (u : STVC) :
    BvC (T u) u = 0 := by
  have h := hT u u
  rw [BvC_symm u (T u)] at h
  linarith

-- === (2) the dust divergence covector ===
def dustDivCovector (contCoeff density : Cut) (u : STVC) (T : MetricEnd) :
    STVC →ₗ[Cut] Cut :=
  contCoeff • BvCRight u + density • BvCRight (T u)

theorem dustDivCovector_apply (contCoeff density : Cut) (u : STVC) (T : MetricEnd) (ν : STVC) :
    dustDivCovector contCoeff density u T ν
      = contCoeff * BvC u ν + density * BvC (T u) ν := by
  unfold dustDivCovector
  simp only [LinearMap.add_apply, LinearMap.smul_apply, smul_eq_mul]
  rfl

-- === (3) THE FORCING: conservation → geodesic + continuity ===
theorem conservation_forces_geodesic (T : MetricEnd) (hT : IsInfIsomC T) (u : STVC)
    (n contCoeff density : Cut) (hn : BvC u u = n) (hn0 : n ≠ 0) (hd : density ≠ 0)
    (hcons : ∀ ν, dustDivCovector contCoeff density u T ν = 0) :
    T u = 0 ∧ contCoeff = 0 := by
  have hA := hcons u
  rw [dustDivCovector_apply, hn, transport_born_orthogonal T hT u, mul_zero, add_zero] at hA
  have hc0 : contCoeff = 0 := by
    rcases mul_eq_zero.mp hA with h | h
    · exact h
    · exact absurd h hn0
  refine ⟨?_, hc0⟩
  apply BvC_nondegenerate
  intro ν
  have hB := hcons ν
  rw [dustDivCovector_apply, hc0, zero_mul, zero_add] at hB
  rcases mul_eq_zero.mp hB with h | h
  · exact absurd h hd
  · exact h

-- === (4) THE CROSS FACT / teeth: nongeodesic breaks conservation ===
theorem nongeodesic_breaks_conservation (T : MetricEnd) (hT : IsInfIsomC T) (u : STVC)
    (n contCoeff density : Cut) (hn : BvC u u = n) (hn0 : n ≠ 0) (hd : density ≠ 0)
    (haccel : T u ≠ 0) :
    ¬ (∀ ν, dustDivCovector contCoeff density u T ν = 0) := by
  intro hcons
  exact haccel (conservation_forces_geodesic T hT u n contCoeff density hn hn0 hd hcons).1

-- === (5) THE WELD to the banked ∇^μ G_μν = 0 (P5/P5b) ===
theorem field_equation_forces_geodesic (T : MetricEnd) (hT : IsInfIsomC T) (u : STVC)
    (n contCoeff density coupling : Cut) (gradR : STVC →ₗ[Cut] Cut)
    (hn : BvC u u = n) (hn0 : n ≠ 0) (hd : density ≠ 0) (hcoup : coupling ≠ 0)
    (hfieldeq : ∀ ν, divCov ((skewWit + metricScalarField gradR) - metricScalarField gradR) ν
        = coupling * dustDivCovector contCoeff density u T ν) :
    T u = 0 ∧ contCoeff = 0 := by
  have hcons : ∀ ν, dustDivCovector contCoeff density u T ν = 0 := by
    intro ν
    have hG := einstein_divCov_zero_concrete gradR ν
    rw [hfieldeq ν] at hG
    rcases mul_eq_zero.mp hG with h | h
    · exact absurd h hcoup
    · exact h
  exact conservation_forces_geodesic T hT u n contCoeff density hn hn0 hd hcons

-- === (6) W8 non-vacuity: concrete nonzero accel orthogonal to velocity ===
def restVel : STVC := ((1:Cut),(0:Cut),(0:O Cut))

theorem restVel_unit : BvC restVel restVel = 1 := by
  show (1:Cut)*1 - (0:Cut)*0 - gFormC (0:O Cut) 0 = 1
  rw [gFormC_zero_right']; ring

theorem boost_accel_eq : boostGenC restVel = ((0:Cut),(1:Cut),(0:O Cut)) := rfl

theorem boost_accel_ne_zero : boostGenC restVel ≠ 0 := by
  rw [boost_accel_eq]
  intro hc
  have := congrArg (fun p => p.2.1) hc
  simp at this

theorem boost_accel_orthogonal : BvC (boostGenC restVel) restVel = 0 :=
  transport_born_orthogonal boostGenC boostGenC_inf restVel

theorem boost_nongeodesic_breaks_conservation (contCoeff density : Cut) (hd : density ≠ 0) :
    ¬ (∀ ν, dustDivCovector contCoeff density restVel boostGenC ν = 0) :=
  nongeodesic_breaks_conservation boostGenC boostGenC_inf restVel 1 contCoeff density
    restVel_unit (by norm_num) hd boost_accel_ne_zero

-- === (7) capstone ===
theorem geodesic_motion (T : MetricEnd) (hT : IsInfIsomC T) (u : STVC)
    (n contCoeff density : Cut) (hn : BvC u u = n) (hn0 : n ≠ 0) (hd : density ≠ 0) :
    BvC (T u) u = 0
      ∧ ((∀ ν, dustDivCovector contCoeff density u T ν = 0) → (T u = 0 ∧ contCoeff = 0))
      ∧ (T u ≠ 0 → ¬ (∀ ν, dustDivCovector contCoeff density u T ν = 0)) :=
  ⟨transport_born_orthogonal T hT u,
   fun hcons => conservation_forces_geodesic T hT u n contCoeff density hn hn0 hd hcons,
   fun hac => nongeodesic_breaks_conservation T hT u n contCoeff density hn hn0 hd hac⟩

end
end Phys.Algebra
