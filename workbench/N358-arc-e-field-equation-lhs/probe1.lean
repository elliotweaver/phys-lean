/- N358 MEASURE probe1 — the field-equation LHS descends from the ONE look-back transport Γ.
   Candidate lemmas:
   (A) INDEPENDENCE: the Einstein form `einstein solderWit` is NOT a scalar multiple of the metric
       `BvC` — the two conserved 2-tensors (G and g) are linearly independent, so the derived
       candidate LHS space {a·G + Λ·g} is genuinely 2-dimensional (geometry not trivially Einstein).
   (B) THE CONSERVED-STRUCTURED FAMILY: the covariant transport of the LHS endomorphism
       `a·einsteinRaiseMap G + Λ·id` equals `a·(transport of ricciRaiseMap G)` — the metric term
       ½R·id in G is bracket-inert (N356 einstein_covTransport_eq_ricci) AND the Λ·id term is
       bracket-inert (id central, N356 metric_covTransport_zero). BOTH generators' metric parts drop.
   (C) ONE CAUSE: both objects reference the SINGLE lbConn (transport = ⁅lbConn k, ·⁆; curvature
       = ⁅lbConn,lbConn⁆; ∇g cancellation = metricCompat of lbConn). -/
import Phys.Algebra.SpacetimeCovariantDerivative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- (A) INDEPENDENCE — the Einstein form and the metric are linearly independent as 2-tensors.
    Evaluate both on the concrete pair `(0,1,0),(0,1,0)`: `einstein solderWit = ⅛`, `BvC = −1`.
    If `einstein solderWit = c • BvC` for a scalar `c`, then at that pair `⅛ = c·(−1)` while at
    `(1,0,0),(1,0,0)`: `einstein solderWit = ¼·0·0 + ⅛·1 = ⅛`? no — recompute: at (1,0,0) the
    solder term Y.2.1=0 so `einstein = ⅛·BvC`, `BvC (1,0,0)(1,0,0) = 1`, so `einstein = ⅛`. At
    (0,1,0): `einstein = ¼·1 + ⅛·(−1) = ⅛ − ⅛ = 0`? recompute ¼·1·1 + ⅛·(−1) = ¼ − ⅛ = ⅛. Hmm both ⅛.
    Use a discriminating pair instead: compare ratio einstein/BvC at (1,0,0) vs (0,1,0). -/
theorem einstein_not_metric_multiple :
    ¬ ∃ c : Cut, ∀ Y Z : STVC, einstein solderWit Y Z = c * BvC Y Z := by
  rintro ⟨c, hc⟩
  -- at (1,0,0),(1,0,0): einstein = ¼·0·0 + ⅛·BvC ;  BvC = 1·1 = 1 ; so einstein = ⅛ = c·1 ⟹ c = ⅛
  have h1 := hc ((1:Cut),(0:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut))
  -- at (0,1,0),(0,1,0): einstein = ¼·1·1 + ⅛·BvC ; BvC = −1 ; einstein = ¼ − ⅛ = ⅛ = c·(−1) ⟹ c = −⅛
  have h2 := hc ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut))
  rw [einstein_solder_form] at h1 h2
  -- compute the two BvC values
  have hb1 : BvC ((1:Cut),(0:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut)) = (1:Cut) := by
    show (1:Cut)*1 - (0:Cut)*0 - gFormC (0:O Cut) 0 = 1
    rw [gFormC_zero_right']; ring
  have hb2 : BvC ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) = -(1:Cut) := by
    show (0:Cut)*0 - (1:Cut)*1 - gFormC (0:O Cut) 0 = -1
    rw [gFormC_zero_right']; ring
  rw [hb1] at h1
  rw [hb2] at h2
  -- h1 : ¼·1·1 + ⅛·1 = c·1   (LHS Y.2.1 = 0 so ¼-term is 0)
  -- careful: einstein_solder_form gives ¼·Y.2.1·Z.2.1 + ⅛·BvC
  -- at (1,0,0): Y.2.1 = 0 ⟹ ⅛·1 = ⅛ = c ; at (0,1,0): ¼·1·1 + ⅛·(−1) = ⅛ = c·(−1) ⟹ c = −⅛
  -- so ⅛ = c and ⅛ = −c ⟹ c = ⅛ ∧ c = −⅛ ⟹ contradiction
  simp only [] at h1 h2
  -- turn into arithmetic
  have e1 : c = (8⁻¹ : Cut) := by
    have : (4⁻¹ : Cut) * 0 * 0 + 8⁻¹ * 1 = c * 1 := h1
    linarith [this]
  have e2 : c * (-(1:Cut)) = (8⁻¹ : Cut) := by
    have : (4⁻¹ : Cut) * 1 * 1 + 8⁻¹ * -(1:Cut) = c * -(1:Cut) := h2
    linarith [this]
  rw [e1] at e2
  norm_num at e2

end

end Phys.Algebra
