import Phys.Algebra.SpacetimePageCurve

namespace Phys.AlgebraProbeN363

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- The interior-termination surface = the TIP (ρ=0) of the banked Euclidean return section. -/
def interiorClosureTip (θ : Cut) : Cut × Cut := eucPlanePoint 0 θ

/-- The tip is the origin (the fold's return / fixed point). -/
theorem closureTip_eq_origin (θ : Cut) : interiorClosureTip θ = (0, 0) := by
  unfold interiorClosureTip eucPlanePoint
  simp

/-- ★ ONE closure point: all angular ("Kasner-direction") approaches converge to the SAME single tip. -/
theorem closureTip_angle_independent (θ θ' : Cut) :
    interiorClosureTip θ = interiorClosureTip θ' := by
  rw [closureTip_eq_origin, closureTip_eq_origin]

/-- The approach map is CONSTANT — a single image. -/
theorem closureTip_constant (θ : Cut) :
    interiorClosureTip θ = interiorClosureTip 0 :=
  closureTip_angle_independent θ 0

/-- ★★ THE COORDINATE DEGENERATES EXACTLY AT THE TIP: the section is angle-independent (collapses all
    angles to one point) iff ρ = 0. Away from the tip the angular coordinate is faithful; the
    "singularity" is precisely this coordinate degeneration at ρ=0. -/
theorem section_constant_iff_tip (ρ : Cut) :
    (∀ θ θ' : Cut, eucPlanePoint ρ θ = eucPlanePoint ρ θ') ↔ ρ = 0 := by
  constructor
  · intro h
    have h0 := h 0 cutPi
    unfold eucPlanePoint at h0
    rw [cutCos_zero, cutSin_zero, cutCos_cutPi, cutSin_cutPi] at h0
    have h1 : ρ * 1 = ρ * (-1) := (Prod.ext_iff.mp h0).1
    have : ρ = -ρ := by linarith [h1]
    linarith
  · intro h θ θ'
    subst h
    unfold eucPlanePoint
    simp

/-- Off-tip the section distinguishes angles (the coordinate is faithful) — reuse banked N360. -/
theorem section_faithful_at_one :
    eucPlanePoint 1 cutPi ≠ eucPlanePoint 1 0 :=
  eucPlane_half_turn_conical

/-- Bundle: closure under ONE full turn (banked N360). -/
theorem closure_single_full_turn (ρ θ : Cut) :
    eucPlanePoint ρ (θ + azimuthalTurn) = eucPlanePoint ρ θ :=
  eucPlane_closes ρ θ

/-- Finite depth (banked N361 bit-count). -/
theorem interior_finite_depth (M : Cut) :
    bhEntropy M = (bhArea M / cellArea) * cellEntropy :=
  bhEntropy_cell_decomposition M

end

end Phys.AlgebraProbeN363
