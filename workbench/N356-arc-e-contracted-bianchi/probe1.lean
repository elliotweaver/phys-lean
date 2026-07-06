/-
  N356 probe1 — MEASURE FIRST (the N349/N352/N353 fiber-trace lesson):
  Is the naive FIBER-TRACE contraction of the differential Bianchi (bianchi_jacobi) BLIND?

  Hypothesis: covTransport k C = ⁅Γk, C⁆ is a bracket, so trace(covTransport k C) = 0 by
  LinearMap.trace_lie. Then the fiber-trace of bianchi_jacobi is 0+0+0 = 0 — VACUOUS.
  The "obvious" divergence contraction is content-free — the N349 no-go, now at the divergence level.
-/
import Phys.Algebra.SpacetimeBianchi

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- (a) THE FIBER-TRACE NO-GO: the fiber trace of the covariant transport is IDENTICALLY ZERO.
--     covTransport k C = ⁅Γk,C⁆ (a bracket) ⟹ trace = 0 by trace_lie. BLIND.
example (k C : MetricEnd) : LinearMap.trace Cut STVC (covTransport k C) = 0 := by
  unfold covTransport
  exact LinearMap.trace_lie _ _

-- (b) So the fiber-trace contraction of the WHOLE differential Bianchi is VACUOUS 0 = 0.
example (k₁ k₂ k₃ : MetricEnd) :
    LinearMap.trace Cut STVC (covTransport k₁ (lbCurv k₂ k₃))
      + LinearMap.trace Cut STVC (covTransport k₂ (lbCurv k₃ k₁))
      + LinearMap.trace Cut STVC (covTransport k₃ (lbCurv k₁ k₂)) = 0 := by
  rw [show covTransport k₁ (lbCurv k₂ k₃) = ⁅lbConn k₁, lbCurv k₂ k₃⁆ from rfl,
      show covTransport k₂ (lbCurv k₃ k₁) = ⁅lbConn k₂, lbCurv k₃ k₁⁆ from rfl,
      show covTransport k₃ (lbCurv k₁ k₂) = ⁅lbConn k₃, lbCurv k₁ k₂⁆ from rfl]
  simp only [LinearMap.trace_lie, add_zero]

-- (c) KEY STRUCTURAL FACT: the covariant transport of the EINSTEIN endomorphism EQUALS the covariant
--     transport of the RICCI endomorphism — the ½R·id metric term DROPS because id commutes with Γk.
--     (So the divergence "sees" only the Ricci part at the transport level — but its fiber trace is
--      still blind by (a).)
example (G : STVC →ₗ[Cut] MetricEnd) (k : MetricEnd) :
    covTransport k (einsteinRaiseMap G) = covTransport k (ricciRaiseMap G) := by
  unfold covTransport einsteinRaiseMap
  rw [lie_sub, lie_smul]
  have hid : ⁅lbConn k, (LinearMap.id : MetricEnd)⁆ = 0 := by
    rw [LieRing.of_associative_ring_bracket]; simp
  rw [hid, smul_zero, sub_zero]

end

end Phys.Algebra
