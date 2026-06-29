/-
  N167 — THE RECIPROCAL CHARACTERIZATION of the polar positive part (the eigenvalue-reciprocal-pair
  pin toward the isometric positive-part path).

  ── THE CHAIN POSITION ──
  N166 banked `bvIsomLin_polar_reduction_isom`: the positive-part factor `p` of the converse polar
  decomposition of an arbitrary `BvC`-isometry `S` is a positive self-adjoint `QvC`-isometry (NOT a
  generic positive operator — the N165 obstruction dissolved). The single residual closing the
  UNCONDITIONAL full `SO⁺(1,9)` identity component is `JoinedIdQvC p` — a continuous path of
  `QvC`-isometries from `1` to `p`. Two trunk-native routes to that path were MEASURED (W1/W9):
    (a) the spectral `t`-power `specOpN (fun i => cutSqrt(c i)^t) u` — needs a CONTINUOUS REAL POWER
        `cutRpow` over the derived ℝ `Cut`, GENUINELY MISSING (grep-confirmed: no `def cutRpow`);
    (b) the KAK frame-product expressing `p` as a finite product of single-axis `boostEndC` — needs
        the eigenvalues to come in RECIPROCAL PAIRS `(λ, 1/λ)` (one boost per eigenplane), glued by
        `joinedIdQvC_listProd` (N157).
  Both are heavy multi-run nodes. This node banks the precise STRUCTURAL PIN that route (b) consumes
  — the eigenvalue-reciprocal-pair characterization — and childs the full eigenframe-extraction +
  path closure (N168).

  ── THE ONE LAW REFRAME (the clean trunk lever) ──
  `p` is EvC-self-adjoint (`IsEvCSymm p`, i.e. `IsEvCAdjoint p p`) AND a `QvC`-isometry. By the
  BANKED metric-condition characterization `isQvIsom_iff_metric_condition` (N90, instantiated with
  the self-adjoint operator as its own EvC-adjoint, `h := p`), this is EQUIVALENT to the operator
  equation
      `p ∘ J ∘ p = J`        (`J = sigOpC` the signature involution)
  and hence, by the involution `J∘J = id`, to
      `(J ∘ p ∘ J) ∘ p = id`   i.e. `J p J = p⁻¹`.
  Conjugating a positive self-adjoint isometry by the signature involution INVERTS it — exactly the
  reciprocal-eigenvalue-pair structure of a pure boost on the indefinite form. This is the structural
  fact distinguishing the positive part (a product of boosts) from a generic positive operator: a
  generic positive `q` does NOT satisfy `q J q = J`. The self-adjointness — UNUSED by N166 — is now
  load-bearing, and the characterization is the precise input the eigenframe boost-product closure
  requires.

  ── WHAT THIS NODE BANKS ──
    ★★ evCSymm_isQvIsomC_recip       — THE RECIPROCAL CHARACTERIZATION (the engine): an EvC-self-
                                        adjoint `QvC`-isometry `p` satisfies `p ∘ J ∘ p = J`.
    ★★ evCSymm_isQvIsomC_Jconj_inv   — THE J-CONJUGATION INVERSION: `(J ∘ p ∘ J) ∘ p = id`
                                        (`J p J = p⁻¹`) — the reciprocal-eigenvalue-pair form.
    ★★ bvIsomLin_polar_part_recip    — THE APPLICATION: the positive-part factor `p` of the converse
                                        polar decomposition of a `BvC`-isometry satisfies both.
    W8 polarPart_recip_nonvac        — the positive part of the concrete boost `(5/3,4/3)` satisfies
                                        the reciprocal characterization with a genuine operator.

  ── THE FORWARD REMAINDER (childed N168) ──
  Closing `JoinedIdQvC p` still needs the eigenframe extraction: read the reciprocal-pair structure
  off `p = specOpN (cutSqrt∘c) u` to express `p` as a finite product of single-axis `boostEndC`,
  each `JoinedIdQvC` by N164's `boostPath`, glued by `joinedIdQvC_listProd`; OR build `cutRpow` over
  the derived `Cut` for the continuous spectral path. Both are substantial — the dedicated W1
  dissolution childed N168.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete every physics word (Lorentz / boost / reciprocal / pure-boost / self-adjoint / isometry /
  positive-part / polar / KAK / eigenvalue / eigenplane / signature / metric / Minkowski / spectral):
  the statements stand as pure mathematics over the derived ℝ `Cut` and the terminal algebra `O Cut`
  — if a `Module.End Cut STVC` operator `p` is symmetric for the form `EvC` (`∀ p q, EvC (p p) q =
  EvC p (p q)`) and preserves the form `QvC` (`∀ q, QvC (p q) = QvC q`), then `p ∘ sigOpC ∘ p =
  sigOpC` and `(sigOpC ∘ p ∘ sigOpC) ∘ p = id`. NO theorem STATEMENT needs a physics word.

  DERIVED from the banked N49–N166 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the forms `QvC`/`EvC`/`BvC` + the involution `sigOpC` + the metric-condition
  characterization `isQvIsom_iff_metric_condition` (N90) + the strengthened polar reduction
  `bvIsomLin_polar_part_isQvIsomC` (N166). Foundations-only `[propext, Classical.choice, Quot.sound]`.

  NO posited Lorentz / Pin / Spin / gauge / G₂ group, NO posited topology / connectedness, NO
  posited KAK / polar product, NO posited boost flow / rapidity, NO posited eigenframe, NO posited
  continuous power (`cutRpow` is the childed remainder, NOT imported as content), NO regression to
  the vacuous `JoinedIdC`, NO Mathlib ℝ/ℂ as content, NO bridge.
-/
import Phys.Algebra.LorentzContinuumPositivePartDissolution

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## (A) THE RECIPROCAL CHARACTERIZATION — the engine. -/

/-- ★★ THE RECIPROCAL CHARACTERIZATION — an EvC-self-adjoint `QvC`-isometry `p` satisfies the
    operator equation `p ∘ J ∘ p = J` (`J = sigOpC`). Since `p` is EvC-self-adjoint it is its OWN
    EvC-adjoint (`IsEvCSymm p` is `IsEvCAdjoint p p`), so the banked metric-condition characterization
    `isQvIsom_iff_metric_condition` (N90), instantiated with `g := p`, `h := p`, turns the
    form-preservation `IsQvIsomC p` directly into `p ∘ J ∘ p = J`. The self-adjointness — UNUSED by
    N166's `bvIsomLin_polar_part_isQvIsomC` — is now load-bearing: a generic positive operator does
    NOT satisfy this equation; it is the reciprocal-eigenvalue-pair pin of a pure boost. -/
theorem evCSymm_isQvIsomC_recip {p : Module.End Cut STVC}
    (hsymm : IsEvCSymm p) (hisom : IsQvIsomC (p : STVC → STVC)) :
    p.comp (sigOpC.comp p) = sigOpC :=
  (isQvIsom_iff_metric_condition (g := p) (h := p) hsymm).mp hisom

/-- ★★ THE J-CONJUGATION INVERSION — conjugating an EvC-self-adjoint `QvC`-isometry `p` by the
    signature involution `J` INVERTS it: `(J ∘ p ∘ J) ∘ p = id`, i.e. `J p J = p⁻¹`. From the
    reciprocal characterization `p ∘ J ∘ p = J` (`evCSymm_isQvIsomC_recip`) and the involution
    `J ∘ J = id` (`sigOpC_comp_self`): applying `p ∘ J ∘ p = J` pointwise gives `p (J (p v)) = J v`,
    so `J (p (J (p v))) = J (J v) = v`. This is the precise reciprocal-eigenvalue-pair form a pure
    boost (eigenvalues `(λ, 1/λ)`) satisfies — distinguishing the positive part from a generic
    positive operator (for which `J q J ≠ q⁻¹`). -/
theorem evCSymm_isQvIsomC_Jconj_inv {p : Module.End Cut STVC}
    (hsymm : IsEvCSymm p) (hisom : IsQvIsomC (p : STVC → STVC)) :
    (sigOpC.comp (p.comp sigOpC)).comp p = LinearMap.id := by
  have hmc := evCSymm_isQvIsomC_recip hsymm hisom
  apply LinearMap.ext; intro v
  simp only [LinearMap.comp_apply, LinearMap.id_apply]
  have hpoint : p (sigOpC (p v)) = sigOpC v := by
    have := congrArg (fun (f : Module.End Cut STVC) => f v) hmc
    simpa only [LinearMap.comp_apply] using this
  rw [hpoint, ← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]

/-! ## (B) THE APPLICATION — the polar positive part satisfies the reciprocal characterization. -/

/-- ★★ THE APPLICATION — the positive-part factor `p` of the converse polar decomposition of an
    arbitrary `BvC`-isometry `S` satisfies the reciprocal characterization `p ∘ J ∘ p = J` (and
    hence the J-conjugation inversion `J p J = p⁻¹`). Obtained by feeding N166's
    `bvIsomLin_polar_part_isQvIsomC` (which supplies `IsEvCSymm p` AND `IsQvIsomC p`) to the engine
    `evCSymm_isQvIsomC_recip`. The structural pin the eigenframe boost-product closure (N168)
    consumes: the positive part has reciprocal-paired eigenvalues — it is a product of pure boosts on
    the indefinite form, not a generic positive operator. -/
theorem bvIsomLin_polar_part_recip {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (k p : Module.End Cut STVC),
      IsQvIsomC (k : STVC → STVC) ∧ IsEvCSymm p ∧ (∀ q, 0 ≤ EvC (p q) q) ∧
      IsQvIsomC (p : STVC → STVC) ∧ k * p = S ∧
      p.comp (sigOpC.comp p) = sigOpC ∧
      (sigOpC.comp (p.comp sigOpC)).comp p = LinearMap.id := by
  obtain ⟨k, p, hk, hsymm, hpos, hpisom, hkp⟩ := bvIsomLin_polar_part_isQvIsomC hS
  exact ⟨k, p, hk, hsymm, hpos, hpisom, hkp,
    evCSymm_isQvIsomC_recip hsymm hpisom, evCSymm_isQvIsomC_Jconj_inv hsymm hpisom⟩

/-! ## (C) W8 NON-VACUITY — the positive part of a concrete boost satisfies the characterization. -/

/-- ★ W8 NON-VACUITY / TEETH — the converse polar decomposition of the CONCRETE boost `(5/3, 4/3)`
    (a genuine non-identity `BvC`-isometry) produces a positive-part factor `p` that is a genuine
    `QvC`-isometry AND satisfies the reciprocal characterization `p ∘ J ∘ p = J`. The reciprocal
    characterization is not vacuous — the positive part genuinely lives on the indefinite form (a
    positive self-adjoint isometry with reciprocal-paired eigenvalues `(λ, 1/λ)`, the eigenvalues of
    a pure boost), distinguishing it from a generic positive operator (which fails `q J q = J`). -/
theorem polarPart_recip_nonvac :
    ∃ (k p : Module.End Cut STVC),
      IsQvIsomC (p : STVC → STVC) ∧ k * p = boostEndC ((5:Cut)/3) ((4:Cut)/3) ∧
      p.comp (sigOpC.comp p) = sigOpC := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  obtain ⟨k, p, _, _, _, hpisom, hkp, hrecip, _⟩ :=
    bvIsomLin_polar_part_recip (boostEndC_isBvIsomLin hab)
  exact ⟨k, p, hpisom, hkp, hrecip⟩

end

end Phys.Algebra
