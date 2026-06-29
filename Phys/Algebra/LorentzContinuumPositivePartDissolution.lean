/-
  N166 — THE POSITIVE-PART DISSOLUTION (the BvC-isometric-positive-part characterization).

  ── THE CHAIN POSITION ──
  N165 banked `bvIsomLin_polar_reduction`: an ARBITRARY `BvC`-isometry `S` factors via N131's
  converse polar decomposition as `k · p = S` with `k` a `QvC`-isometry (the compact factor),
  `p = γ(1)` EvC-positive self-adjoint (the positive part), and the CONDITIONAL assembly
  `JoinedIdQvC k → JoinedIdQvC p → JoinedIdQvC S` (the engine `joinedIdQvC_mul`, N157). The single
  residual toward the unconditional full `SO⁺(1,9)` identity component is `JoinedIdQvC p`.

  ── MEASURE-FIRST / THE ONE LAW verdict ──
  N165's stated worry was: `p = γ(1) = specOpN (cutSqrt∘c) u` is a GENERAL EvC-positive
  self-adjoint operator, for which `JoinedIdQvC p` would be FALSE — a generic positive operator
  (e.g. `2·id`) preserves no indefinite form. THAT WORRY IS THE DRIFT SIGNAL; the framing was
  wrong. The reframe through the trunk: in `k · p = S` BOTH `k` and `S` are `QvC`-isometries
  (`k` by N131's `h7`; `S` by `bvIsomLin_isQvIsomC`). This FORCES `p` to be a `QvC`-isometry
  (`p = k⁻¹ S` as isometries), proved directly without an inverse:
      QvC (p q) = QvC (k (p q))    [k a QvC-isometry]
                = QvC ((k·p) q)     [Module.End.mul_apply]
                = QvC (S q)         [k·p = S]
                = QvC q             [S a QvC-isometry].
  So the positive part is NOT a generic positive operator — it is a positive self-adjoint
  ISOMETRY (a pure boost on the indefinite form). The W8 "generic positive operator" obstruction
  that blocked N165 is DISSOLVED: the residual `JoinedIdQvC p` is now the honest target — a
  continuous path of ISOMETRIES from `1` to a positive self-adjoint isometry, NOT a hopeless
  request to connect a generic positive operator (which is impossible).

  ── WHAT THIS NODE BANKS (the immediately-bankable structural piece; W3 decompose) ──
    ★★ isQvIsomC_of_mul_eq            — THE GENERAL CANCELLATION: `k`, `S` `QvC`-isometries and
                                         `k·p = S` ⟹ `p` is a `QvC`-isometry (`p = k⁻¹S`).
    ★★ bvIsomLin_polar_part_isQvIsomC — THE CHARACTERIZATION: the positive-part factor `p` of the
                                         converse polar decomposition of a `BvC`-isometry is a
                                         `QvC`-isometry — a positive self-adjoint ISOMETRY (boost),
                                         not a generic positive operator.
    ★★ bvIsomLin_polar_reduction_isom — THE STRENGTHENED POLAR REDUCTION: records `IsQvIsomC p`
                                         alongside the N165 facts (`k` isometry, `p` self-adjoint &
                                         positive, `k·p = S`, the conditional assembly). Strictly
                                         strengthens `bvIsomLin_polar_reduction`.
    W8 polarPart_isom_self_overlap    — the positive part of the concrete boost `(5/3,4/3)`
                                         preserves the indefinite self-overlap of the timelike axis.

  ── THE FORWARD REMAINDER (childed N167) ──
  Closing `JoinedIdQvC p` for the positive self-adjoint isometry `p` still needs a CONTINUOUS PATH
  of isometries from `1` to `p`. The affine `specPathOp` leaves the isometry group (N165). The
  trunk-native routes are (a) the spectral `t`-power `specOpN (fun i => cutSqrt(c i)^t) u` — which
  needs a CONTINUOUS REAL POWER `cutRpow` over the derived ℝ `Cut`, GENUINELY MISSING (N96 measure
  flagged it as a W1 heavy remainder); or (b) the KAK frame-product expressing `p` as a finite
  product of single-axis boosts (eigenframe decomposition), glued by `joinedIdQvC_listProd`. Both
  are substantial multi-run nodes — the dedicated W1 dissolution childed N167.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete every physics word (Lorentz / boost / rotation / KAK / polar / compact / SO(9) /
  orthochronous / proper / Minkowski / isometry / positive-part / self-adjoint / spectral /
  eigenframe / boost-product …): the statements stand as pure mathematics over the derived ℝ `Cut`
  and the terminal algebra `O Cut` — if `k`, `S : Module.End Cut STVC` preserve the form `QvC`
  (`∀ p, QvC (T p) = QvC p`) and `k·p = S`, then `p` preserves `QvC`; and the converse decomposition
  of a form-preserving `S` produces a self-adjoint, positive, form-preserving factor `p` with
  `k·p = S`. NO theorem STATEMENT needs a physics word.

  DERIVED from the banked N49–N165 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the Born form `QvC` + the engine `JoinedIdQvC` (N157) + the polar reduction
  `bvIsomLin_polar_reduction` (N165) + the converse polar decomposition `bvIsomLin_polar_path_decomp`
  / `bvIsomLin_isQvIsomC` (N131). Foundations-only `[propext, Classical.choice, Quot.sound]`.

  NO posited Lorentz / Pin / Spin / gauge / G₂ group, NO posited topology / connectedness, NO
  posited KAK / polar product, NO posited boost flow / rapidity, NO regression to the vacuous
  `JoinedIdC`, NO Mathlib ℝ/ℂ as content, NO bridge, NO posited spectral theory.
-/
import Phys.Algebra.LorentzContinuumSO9FullAssembly

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## (A) THE GENERAL CANCELLATION — the isometry group cancels. -/

/-- ★★ THE GENERAL CANCELLATION — if `k` and `S` are `QvC`-isometries and `k · p = S`, then `p` is a
    `QvC`-isometry. This is `p = k⁻¹ S` at the level of form-preservation, proved DIRECTLY without
    constructing an inverse: `QvC (p q) = QvC (k (p q)) = QvC ((k·p) q) = QvC (S q) = QvC q`. The
    isometry group's cancellation property — the load-bearing reframe that dissolves the N165
    "generic positive operator" obstruction (the positive part of `k·p = S` is forced into the
    group). -/
theorem isQvIsomC_of_mul_eq {k p S : Module.End Cut STVC}
    (hk : IsQvIsomC (k : STVC → STVC)) (hSisom : IsQvIsomC (S : STVC → STVC))
    (hkp : k * p = S) : IsQvIsomC (p : STVC → STVC) := by
  intro q
  show QvC (p q) = QvC q
  have h2 : S q = k (p q) := by rw [← hkp, Module.End.mul_apply]
  calc QvC (p q) = QvC (k (p q)) := (hk (p q)).symm
    _ = QvC (S q) := by rw [h2]
    _ = QvC q := hSisom q

/-! ## (B) THE BvC-ISOMETRIC-POSITIVE-PART CHARACTERIZATION. -/

/-- ★★ THE CHARACTERIZATION — the positive-part factor `p = γ(1)` of the converse polar
    decomposition of a `BvC`-isometry `S` is itself a `QvC`-isometry: a positive self-adjoint
    ISOMETRY (a pure boost on the indefinite form), NOT a generic positive operator. Obtained by
    feeding the polar reduction's `k · p = S` (with `k` a `QvC`-isometry and `S` a `QvC`-isometry
    by `bvIsomLin_isQvIsomC`) to the general cancellation `isQvIsomC_of_mul_eq`. The dissolution of
    the N165 obstruction: the positive part is constrained to the isometry group. -/
theorem bvIsomLin_polar_part_isQvIsomC {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (k p : Module.End Cut STVC),
      IsQvIsomC (k : STVC → STVC) ∧ IsEvCSymm p ∧ (∀ q, 0 ≤ EvC (p q) q) ∧
      IsQvIsomC (p : STVC → STVC) ∧
      k * p = S := by
  obtain ⟨k, p, hk, hsymm, hpos, hkp, _⟩ := bvIsomLin_polar_reduction hS
  have hSisom : IsQvIsomC (S : STVC → STVC) := bvIsomLin_isQvIsomC hS
  exact ⟨k, p, hk, hsymm, hpos, isQvIsomC_of_mul_eq hk hSisom hkp, hkp⟩

/-- ★★ THE STRENGTHENED POLAR REDUCTION — strictly strengthens `bvIsomLin_polar_reduction` (N165)
    by recording `IsQvIsomC p` alongside its facts. For an ARBITRARY `BvC`-isometry `S`: a compact
    factor `k` (a `QvC`-isometry), a positive part `p` (EvC-self-adjoint, EvC-positive, AND a
    `QvC`-isometry — a positive self-adjoint boost), with `k · p = S`, and the conditional
    assembly `JoinedIdQvC k → JoinedIdQvC p → JoinedIdQvC S`. The residual `JoinedIdQvC p` is now
    a request about a positive self-adjoint ISOMETRY (the honest target — a path of isometries),
    not about a generic positive operator (for which it would be false). -/
theorem bvIsomLin_polar_reduction_isom {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (k p : Module.End Cut STVC),
      IsQvIsomC (k : STVC → STVC) ∧ IsEvCSymm p ∧ (∀ q, 0 ≤ EvC (p q) q) ∧
      IsQvIsomC (p : STVC → STVC) ∧
      k * p = S ∧
      (JoinedIdQvC k → JoinedIdQvC p → JoinedIdQvC S) := by
  obtain ⟨k, p, hk, hsymm, hpos, hkp, hcond⟩ := bvIsomLin_polar_reduction hS
  have hSisom : IsQvIsomC (S : STVC → STVC) := bvIsomLin_isQvIsomC hS
  exact ⟨k, p, hk, hsymm, hpos, isQvIsomC_of_mul_eq hk hSisom hkp, hkp, hcond⟩

/-! ## (C) W8 NON-VACUITY — the positive part of a concrete boost is a genuine isometry. -/

/-- ★ W8 NON-VACUITY / TEETH — the converse polar decomposition of the CONCRETE boost `(5/3, 4/3)`
    (a genuine non-identity `BvC`-isometry) produces a positive-part factor `p` that is a genuine
    `QvC`-isometry: it preserves the Born quadratic of EVERY vector, including the timelike axis,
    reading `QvC mTimeUnit`. The characterization is not vacuous — the positive part genuinely
    lives on the indefinite form (a positive self-adjoint isometry / boost), distinguishing it
    from a generic positive operator (which would change `QvC`). -/
theorem polarPart_isom_self_overlap :
    ∃ (k p : Module.End Cut STVC),
      IsQvIsomC (p : STVC → STVC) ∧ k * p = boostEndC ((5:Cut)/3) ((4:Cut)/3) ∧
      QvC (p (mTimeUnit : STVC)) = QvC (mTimeUnit : STVC) := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  obtain ⟨k, p, _, _, _, hpisom, hkp⟩ :=
    bvIsomLin_polar_part_isQvIsomC (boostEndC_isBvIsomLin hab)
  exact ⟨k, p, hpisom, hkp, hpisom mTimeUnit⟩

end

end Phys.Algebra
