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

-- (0) Reachability
#check @BvCRight
#check @BvC_nondegenerate
#check @IsInfIsomC
#check @boostGenC
#check @boostGenC_inf
#check @BvC_symm
#check @BvC_smul_right
#check @divCov
#check @einstein_divCov_zero_concrete
#check @skewWit

-- (1) BvCRight a ν = BvC a ν
example (a ν : STVC) : (BvCRight a) ν = BvC a ν := rfl

-- (2) ORTHOGONALITY from form-skew (metric-compatibility): BvC (T u) u = 0
theorem probe_orth (T : Module.End Cut STVC) (hT : IsInfIsomC T) (u : STVC) :
    BvC (T u) u = 0 := by
  have h := hT u u
  rw [BvC_symm u (T u)] at h
  linarith

-- (3) THE FORCING. dust divergence covector = contCoeff·u♭ + density·(Tu)♭.
def probe_dustDiv (contCoeff density : Cut) (u : STVC) (T : Module.End Cut STVC) :
    STVC →ₗ[Cut] Cut :=
  contCoeff • BvCRight u + density • BvCRight (T u)

theorem probe_dustDiv_apply (contCoeff density : Cut) (u : STVC) (T : Module.End Cut STVC)
    (ν : STVC) :
    probe_dustDiv contCoeff density u T ν = contCoeff * BvC u ν + density * BvC (T u) ν := by
  unfold probe_dustDiv
  simp only [LinearMap.add_apply, LinearMap.smul_apply, smul_eq_mul]
  rfl

theorem probe_forcing (T : Module.End Cut STVC) (hT : IsInfIsomC T) (u : STVC)
    (n contCoeff density : Cut) (hn : BvC u u = n) (hn0 : n ≠ 0) (hd : density ≠ 0)
    (hcons : ∀ ν, probe_dustDiv contCoeff density u T ν = 0) :
    T u = 0 ∧ contCoeff = 0 := by
  -- Step A: pair with u
  have hA := hcons u
  rw [probe_dustDiv_apply] at hA
  rw [hn, probe_orth T hT u, mul_zero, add_zero] at hA
  have hc0 : contCoeff = 0 := by
    rcases mul_eq_zero.mp hA with h | h
    · exact h
    · exact absurd h hn0
  refine ⟨?_, hc0⟩
  -- Step B: with contCoeff = 0, ∀ ν density·BvC(Tu,ν)=0 ⟹ Tu=0
  apply BvC_nondegenerate
  intro ν
  have hB := hcons ν
  rw [probe_dustDiv_apply, hc0, zero_mul, zero_add] at hB
  rcases mul_eq_zero.mp hB with h | h
  · exact absurd h hd
  · exact h

-- (4) The tooth: concrete non-geodesic (boostGenC on (1,0,0)) is nonzero and orthogonal
theorem probe_boost_u : boostGenC ((1:Cut),(0:Cut),(0:O Cut)) = ((0:Cut),(1:Cut),(0:O Cut)) := rfl

theorem probe_accel_ne_zero : boostGenC ((1:Cut),(0:Cut),(0:O Cut)) ≠ 0 := by
  rw [probe_boost_u]
  intro hc
  have := congrArg (fun p => p.2.1) hc
  simp at this

theorem probe_uu : BvC ((1:Cut),(0:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut)) = 1 := by
  show (1:Cut)*1 - (0:Cut)*0 - gFormC (0:O Cut) 0 = 1
  rw [gFormC_zero_right']; ring

-- (5) grounding: banked Einstein-field soldered divergence is the zero covector
theorem probe_einstein_div_zero (gradR : STVC →ₗ[Cut] Cut) (ν : STVC) :
    divCov ((skewWit + metricScalarField gradR) - metricScalarField gradR) ν = 0 :=
  einstein_divCov_zero_concrete gradR ν

end
end Phys.Algebra
