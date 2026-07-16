import Phys.Algebra.SpacetimeDivergence
import Phys.Algebra.SpacetimeRicciScalar
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! CRUX MEASURE (W9), theory-native: SOLDERED contraction of the DIFFERENTIAL Bianchi
    (N355 bianchi_jacobi), exactly mirroring N352's soldered loop-index Ricci.

    bianchi_jacobi (OPERATOR identity, N355):
      covTransport k₁ (lbCurv k₂ k₃) + covTransport k₂ (lbCurv k₃ k₁)
        + covTransport k₃ (lbCurv k₁ k₂) = 0.

    Solder k₁ = G X (the DIVERGENCE/derivative direction), k₂ = G Y, k₃ = G Z (loop),
    then trace/contract to a scalar. The soldered double contraction should yield the
    twice-contracted Bianchi.

    First measure: apply bianchi_jacobi to a fiber vector `v`, take its X₁-soldered trace. -/

/-- The soldered covariant transport of curvature, over a soldering `G`, as a map in the
    derivative direction X (loop directions Y,Z fixed): `X ↦ covTransport (G X) (lbCurv (G Y) (G Z))`. -/
def solderCovTransportCurv (G : STVC →ₗ[Cut] MetricEnd) (Y Z : STVC) :
    STVC →ₗ[Cut] MetricEnd where
  toFun X := covTransport (G X) (lbCurv (G Y) (G Z))
  map_add' X₁ X₂ := by
    simp only [map_add]; rw [covTransport_add_left]
  map_smul' c X := by
    simp only [RingHom.id_apply, map_smul]; rw [covTransport_smul_left]

theorem solderCovTransportCurv_apply (G : STVC →ₗ[Cut] MetricEnd) (Y Z X : STVC) :
    solderCovTransportCurv G Y Z X = covTransport (G X) (lbCurv (G Y) (G Z)) := rfl

/-- MEASURE: the concrete soldered bianchi_jacobi. Solder with solderWit. lbCurv_solder reduces
    every curvature to the single banked `lbCurv timeProj offDiagVar`. Compute the cyclic sum. -/
example (X Y Z : STVC) :
    covTransport (solderWit X) (lbCurv (solderWit Y) (solderWit Z))
      + covTransport (solderWit Y) (lbCurv (solderWit Z) (solderWit X))
      + covTransport (solderWit Z) (lbCurv (solderWit X) (solderWit Y)) = 0 :=
  bianchi_jacobi (solderWit X) (solderWit Y) (solderWit Z)

end

end Phys.Algebra
