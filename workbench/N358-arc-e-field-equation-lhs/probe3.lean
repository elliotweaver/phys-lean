/- N358 MEASURE probe3 — deeper content + axiom audit.
   (D) THE 2-PARAMETER LHS FAMILY is genuinely 2-dimensional: distinct (a,Λ) give distinct forms
       (as rank-(0,2) forms on the banked pair), because G and g are independent. This is the
       "candidate space {a·G + Λ·g}" that Lovelock's exhaustiveness (CITED) says is ALL of them.
   (E) BOTH conserved generators descend from lbConn, and the LHS's ∇g=0 face makes Λg conserved
       for ANY Λ (the +Λg of Lovelock, existence derived).
   Axiom audit at the end. -/
import Phys.Algebra.SpacetimeCovariantDerivative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- THE FIELD-EQUATION LHS as a rank-(0,2) FORM: `lhsForm a Λ G Y Z = a·G(Y,Z) + Λ·g(Y,Z)`. -/
def lhsForm (a Λ : Cut) (G : STVC →ₗ[Cut] MetricEnd) (Y Z : STVC) : Cut :=
  a * einstein G Y Z + Λ * BvC Y Z

/-- (D) THE CANDIDATE LHS SPACE IS GENUINELY 2-DIMENSIONAL: distinct coefficient pairs `(a,Λ)` give
    distinct LHS forms. If `lhsForm a₁ Λ₁ = lhsForm a₂ Λ₂` as forms (for the concrete soldering),
    then `a₁ = a₂ ∧ Λ₁ = Λ₂` — because `einstein solderWit` and `BvC` are linearly independent
    (evaluated on two discriminating pairs). The two conserved generators G and g are a genuine
    2-frame; the derived candidate LHS is a 2-plane (not a line), matching Lovelock's G+Λg. -/
theorem lhsForm_faithful (a₁ Λ₁ a₂ Λ₂ : Cut)
    (h : ∀ Y Z : STVC, lhsForm a₁ Λ₁ solderWit Y Z = lhsForm a₂ Λ₂ solderWit Y Z) :
    a₁ = a₂ ∧ Λ₁ = Λ₂ := by
  -- evaluate at (1,0,0): einstein = ⅛, BvC = 1 ;  at (0,1,0): einstein = ⅛, BvC = −1
  have h1 := h ((1:Cut),(0:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut))
  have h2 := h ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut))
  unfold lhsForm at h1 h2
  rw [einstein_solder_form] at h1 h2
  have hb1 : BvC ((1:Cut),(0:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut)) = (1:Cut) := by
    show (1:Cut)*1 - (0:Cut)*0 - gFormC (0:O Cut) 0 = 1
    rw [gFormC_zero_right']; ring
  have hb2 : BvC ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) = -(1:Cut) := by
    show (0:Cut)*0 - (1:Cut)*1 - gFormC (0:O Cut) 0 = -1
    rw [gFormC_zero_right']; ring
  rw [hb1] at h1
  rw [hb2] at h2
  -- h1 : a₁·(¼·0·0 + ⅛·1) + Λ₁·1 = a₂·(...) + Λ₂·1   i.e.  a₁·⅛ + Λ₁ = a₂·⅛ + Λ₂
  -- h2 : a₁·(¼·1·1 + ⅛·(−1)) + Λ₁·(−1) = ...          i.e.  a₁·⅛ − Λ₁ = a₂·⅛ − Λ₂
  -- subtract ⟹ 2Λ₁ = 2Λ₂ ; add ⟹ a₁·¼ = a₂·¼
  constructor
  · linarith [h1, h2]
  · linarith [h1, h2]

/-- (E) THE +Λg EXISTENCE, restated for the LHS: for ANY coefficient `Λ`, the cosmological term
    `Λ·g` is covariantly constant (∇(Λg)=0, N357 cosmoTerm_covDeriv_zero) — the derived generator
    the LHS family carries, forced by metricCompat of the single lbConn (η²=1), no free parameter
    posited. Bundled with the Einstein generator's bracket-inert metric part (N356). -/
theorem lhs_generators_from_lbConn (Λ : Cut) (k : MetricEnd) (G : STVC →ₗ[Cut] MetricEnd) :
    ((Λ • k) - (lbConnAdj (Λ • k) * sigOpC + sigOpC * lbConn (Λ • k)) = 0)
      ∧ covTransport k (einsteinRaiseMap G) = covTransport k (ricciRaiseMap G) :=
  ⟨(cosmoTerm_covDeriv_zero Λ k).2, einstein_covTransport_eq_ricci G k⟩

end

end Phys.Algebra

-- AXIOM AUDIT
open Phys.Algebra in
#print axioms lhsForm_faithful
open Phys.Algebra in
#print axioms lhs_generators_from_lbConn
