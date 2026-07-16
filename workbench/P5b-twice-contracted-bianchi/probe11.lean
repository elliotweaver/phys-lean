import Phys.Algebra.SpacetimeCovariantDivergence
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! DECISIVE CRUX MEASURE (W9): the LINEARIZED (weak-field) twice-contracted Bianchi.

  The ONE LAW route: the ½ in `∇^μ Ric_μν = ½ ∇_ν R` is NOT a free algebraic fact and NOT the deep
  4-index Riemann grind — it is the shadow of MIXED-PARTIAL SYMMETRY (∂ commute), which in THIS
  framework is the INTEGRABILITY condition N351 already proved (`dConn a a = 0`: the field's second
  variations commute). In the linearized regime (SEED §E1: weak-field is sufficient to reach E2/E3),
  the linearized Ricci and scalar are:
      Ric_μν = ½(∂_α∂_μ h^α_ν + ∂_α∂_ν h^α_μ − ∂_μ∂_ν h − □h_μν),   R = ∂_α∂_β h^{αβ} − □h,
  and the twice-contracted Bianchi `∂^μ Ric_μν = ½ ∂_ν R` collapses (after ∂ commute + dummy relabel)
  to the identity `∂_α □ h^α_ν = □ ∂^α h_{αν}` — i.e. mixed partials commute. PURE algebra + ONE
  symmetry input.

  Model the ν-covectors (linear in the free index ν) abstractly, `C = E` the commutativity input,
  and confirm the twice-contracted Bianchi closes to `divRic = ½ gradR` by `ring`/module algebra. -/

/-- Abstract model: the four ν-covectors that build the linearized twice-contracted Bianchi. Each is
    a linear functional on the free index `ν`, a genuine cubic-in-∂ / linear-in-`h` contraction:
    `A ν = ∂_ν∂_α∂_μ h^{αμ}`, `B ν = □∂_ν h`, `C ν = ∂_α□ h^α_ν`, `E ν = □∂^α h_{αν}`. -/
example (A B C E : STVC →ₗ[Cut] Cut)
    -- the linearized Ricci divergence covector (½ the sum of the four contraction terms):
    (divRic : STVC →ₗ[Cut] Cut)
    (hdivRic : divRic = (2⁻¹ : Cut) • (A + C - B - E))
    -- the scalar-curvature gradient covector:
    (gradR : STVC →ₗ[Cut] Cut)
    (hgradR : gradR = A - B)
    -- THE ONE INPUT (mixed-partial commutativity, grounds in N351 integrability): C = E:
    (hCE : C = E) :
    divRic = (2⁻¹ : Cut) • gradR := by
  rw [hdivRic, hgradR, hCE]
  -- ½(A + E - B - E) = ½(A - B)
  congr 1
  abel

end

end Phys.Algebra
