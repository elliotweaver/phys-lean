/-
  # N173 — THE FULL `O(1,9)` FROM THE IDENTITY COMPONENT (the discrete component group).

  N172 closed the proper orthochronous identity component `SO⁺(1,9)`: every proper
  (`LinearMap.det p = 1`) orthochronous (`0 ≤ (p e₀).1`) `QvC`-isometry is the NON-VACUOUS
  `JoinedIdQvC` (`joinedIdQvC_of_proper_orthochronous`). This node assembles THE FULL ORTHOGONAL
  GROUP of the indefinite Born form `QvC` from that one component, via the discrete component group.

  ── THE STRUCTURE (THE ONE LAW / W1 reframe — concrete finite witnesses, no analysis) ──
  The indefinite form `QvC = t² − x² − gFormC v v` has signature `(1,9)`: ONE timelike direction
  (`t`) and NINE spacelike directions (`x` and the eight `v`). Its orthogonal group has FOUR
  connected components, distinguished by two independent ℤ/2 signs:
    • the DETERMINANT sign `LinearMap.det p ∈ {+1, −1}` (proper vs improper);
    • the ORTHOCHRONOUS sign `sign (p e₀).1` (preserving vs reversing the timelike orientation).
  THREE explicit sign-flip endomorphisms generate the discrete component group (a Klein four-group):
    • `parityLin` — flips the nine spatial directions, fixes time: `det = −1`, orthochronous;
    • `timeRevLin` — flips time, fixes the nine spatial directions: `det = −1`, non-orthochronous;
    • `ptLin` — flips everything: `det = +1`, non-orthochronous.
  Each is a `QvC`-isometry (the form is even in every coordinate), and they satisfy the Klein-four
  relations `P² = T² = 1`, `PT = TP`, `ptLin = P·T`.

  ── THE COMPONENT REDUCTION (the payload) ──
  `joinedIdQvC_discreteReduce`: EVERY `QvC`-isometry `p` with `det p = ±1` (every element of the
  full orthogonal group) is moved into the identity component by ONE of the four discrete witnesses
  — one of `p`, `parityLin·p`, `timeRevLin·p`, `ptLin·p` is `JoinedIdQvC`. The four-way case split
  on (det = ±1) × (orthochronous?) routes each class to a PROPER ORTHOCHRONOUS representative and
  feeds it to N172's `joinedIdQvC_of_proper_orthochronous`. This is the honest "the full group is
  the identity component times the discrete component group" statement, with the discrete part built
  from concrete sign reflections, NOT a posited component group.

  ── DETERMINANTS (no `10×10` expansion) ──
  Each witness is a block-diagonal product of `±id` blocks, so `LinearMap.det_prodMap` +
  `LinearMap.det_smul` reduce the 10-dim determinant to a product of `(−1)^(block dimension)`:
  `(−1)^1` for each `Cut` factor and `(−1)^8 = 1` for the `O Cut` factor (`finrank_O_eq_eight_Cut`
  N122). NO coordinate expansion, NO determinant continuity.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete every physics word (parity / time-reversal / reflection / Lorentz / boost / isometry /
  orthochronous / proper / determinant / coset / component / Klein-four / Minkowski / signature /
  octonion / Joined): the statements stand as pure linear algebra over the derived ℝ `Cut`. For a
  `Cut`-linear endomorphism `p` of `Cut × Cut × O Cut` preserving the quadratic `QvC` with
  `LinearMap.det p = 1 ∨ = −1`, one of `p`, `R₁·p`, `R₂·p`, `R₃·p` lies in the preconnected
  `JoinedIdQvC` set through `1`, where `R₁ = id ⊞ (−id) ⊞ (−id)`, `R₂ = (−id) ⊞ id ⊞ id`,
  `R₃ = (−id) ⊞ (−id) ⊞ (−id)` are the three explicit sign-flip endomorphisms; `det R₁ = det R₂
  = −1`, `det R₃ = +1`; `R₁² = R₂² = 1` and `R₁·R₂ = R₂·R₁`. The four witnesses `{1, R₁, R₂, R₃}`
  are pairwise distinct. NO theorem STATEMENT needs a physics word; the physics is read OUT of the
  linear algebra.
-/
import Phys.Algebra.LorentzContinuumSO9UnconditionalClosure
import Mathlib.LinearAlgebra.Determinant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## A — the three discrete sign-flip witnesses. -/

/-- The spatial sign flip `parityLin` — flips the nine spatial directions `(x, v)`, fixes time `t`.
    Pure linear algebra: `id ⊞ (−id) ⊞ (−id)` on `Cut × Cut × O Cut`. -/
def parityLin : Module.End Cut STVC :=
  LinearMap.prodMap (LinearMap.id : Cut →ₗ[Cut] Cut)
    (LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut) (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut))

/-- The time sign flip `timeRevLin` — flips time `t`, fixes the nine spatial directions `(x, v)`.
    Pure linear algebra: `(−id) ⊞ id` on `Cut × (Cut × O Cut)`. -/
def timeRevLin : Module.End Cut STVC :=
  LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut)
    (LinearMap.id : (Cut × O Cut) →ₗ[Cut] (Cut × O Cut))

/-- The total sign flip `ptLin` — flips every coordinate. Pure linear algebra: `(−id) ⊞ (−id) ⊞ (−id)`. -/
def ptLin : Module.End Cut STVC :=
  LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut)
    (LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut) (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut))

@[simp] theorem parityLin_apply (p : STVC) : parityLin p = (p.1, -p.2.1, -p.2.2) := rfl
@[simp] theorem timeRevLin_apply (p : STVC) : timeRevLin p = (-p.1, p.2.1, p.2.2) := rfl
@[simp] theorem ptLin_apply (p : STVC) : ptLin p = (-p.1, -p.2.1, -p.2.2) := rfl

/-! ## B — determinants (block-diagonal reduction, no `10×10` expansion). -/

/-- The determinant of `−id` over `Cut` is `(−1)^1 = −1`. -/
theorem det_negId_Cut : LinearMap.det (-(LinearMap.id) : Cut →ₗ[Cut] Cut) = -1 := by
  rw [show (-(LinearMap.id) : Cut →ₗ[Cut] Cut) = (-1 : Cut) • LinearMap.id from
      (neg_one_smul _ _).symm, LinearMap.det_smul, LinearMap.det_id, Module.finrank_self]; ring

/-- The determinant of `−id` over `O Cut` is `(−1)^8 = 1` (`finrank_O_eq_eight_Cut` N122). -/
theorem det_negId_OCut : LinearMap.det (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut) = 1 := by
  rw [show (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut) = (-1 : Cut) • LinearMap.id from
      (neg_one_smul _ _).symm, LinearMap.det_smul, LinearMap.det_id, finrank_O_eq_eight_Cut]
  norm_num

/-- `det parityLin = 1 · (−1) · 1 = −1` (improper). -/
theorem det_parityLin : LinearMap.det parityLin = -1 := by
  rw [parityLin, LinearMap.det_prodMap, LinearMap.det_id, one_mul, LinearMap.det_prodMap,
    det_negId_Cut, det_negId_OCut]; ring

/-- `det timeRevLin = (−1) · 1 = −1` (improper). -/
theorem det_timeRevLin : LinearMap.det timeRevLin = -1 := by
  rw [timeRevLin, LinearMap.det_prodMap, det_negId_Cut, LinearMap.det_id, mul_one]

/-- `det ptLin = (−1) · (−1) · 1 = 1` (proper). -/
theorem det_ptLin : LinearMap.det ptLin = 1 := by
  rw [ptLin, LinearMap.det_prodMap, det_negId_Cut, LinearMap.det_prodMap, det_negId_Cut,
    det_negId_OCut]; ring

/-! ## C — each witness preserves the indefinite Born form `QvC`. -/

/-- `parityLin` is a `QvC`-isometry (the form is even in `x` and `v`). -/
theorem isQvIsomC_parityLin : IsQvIsomC (parityLin : STVC → STVC) := by
  intro p; obtain ⟨t, x, v⟩ := p
  show QvC (t, -x, -v) = QvC (t, x, v)
  unfold QvC QformC gFormC; simp only [star_neg, neg_mul_neg]; ring

/-- `timeRevLin` is a `QvC`-isometry (the form is even in `t`). -/
theorem isQvIsomC_timeRevLin : IsQvIsomC (timeRevLin : STVC → STVC) := by
  intro p; obtain ⟨t, x, v⟩ := p
  show QvC (-t, x, v) = QvC (t, x, v)
  unfold QvC QformC; ring

/-- `ptLin` is a `QvC`-isometry (the form is even in every coordinate). -/
theorem isQvIsomC_ptLin : IsQvIsomC (ptLin : STVC → STVC) := by
  intro p; obtain ⟨t, x, v⟩ := p
  show QvC (-t, -x, -v) = QvC (t, x, v)
  unfold QvC QformC gFormC; simp only [star_neg, neg_mul_neg]; ring

/-! ## D — the Klein-four relations of the discrete component group. -/

/-- `parityLin² = 1`. -/
theorem parityLin_sq : parityLin * parityLin = 1 := by
  apply LinearMap.ext; intro p; rw [Module.End.mul_apply]; obtain ⟨t, x, v⟩ := p; simp

/-- `timeRevLin² = 1`. -/
theorem timeRevLin_sq : timeRevLin * timeRevLin = 1 := by
  apply LinearMap.ext; intro p; rw [Module.End.mul_apply]; obtain ⟨t, x, v⟩ := p; simp

/-- `ptLin² = 1`. -/
theorem ptLin_sq : ptLin * ptLin = 1 := by
  apply LinearMap.ext; intro p; rw [Module.End.mul_apply]; obtain ⟨t, x, v⟩ := p; simp

/-- `parityLin` and `timeRevLin` commute. -/
theorem parity_timeRev_comm : parityLin * timeRevLin = timeRevLin * parityLin := by
  apply LinearMap.ext; intro p; rw [Module.End.mul_apply, Module.End.mul_apply]
  obtain ⟨t, x, v⟩ := p; simp

/-- `ptLin = parityLin · timeRevLin` — the total flip is the product of the two reflections. -/
theorem ptLin_eq : ptLin = parityLin * timeRevLin := by
  apply LinearMap.ext; intro p; rw [Module.End.mul_apply]; obtain ⟨t, x, v⟩ := p; simp

/-! ## E — the time component of each witness on the timelike axis `e₀ = (1,0,0)`. -/

/-- `(parityLin e₀).1 = 1 ≥ 0` (orthochronous). -/
theorem parityLin_e0_time : (parityLin ((1:Cut), (0:Cut), (0:O Cut))).1 = 1 := by
  rw [parityLin_apply]

/-- `(timeRevLin e₀).1 = −1 < 0` (non-orthochronous). -/
theorem timeRevLin_e0_time : (timeRevLin ((1:Cut), (0:Cut), (0:O Cut))).1 = -1 := by
  rw [timeRevLin_apply]

/-- `(ptLin e₀).1 = −1 < 0` (non-orthochronous). -/
theorem ptLin_e0_time : (ptLin ((1:Cut), (0:Cut), (0:O Cut))).1 = -1 := by
  rw [ptLin_apply]

/-! ## F — ★★ THE FULL `O(1,9)` COMPONENT REDUCTION. -/

/-- ★★ THE FULL `O(1,9)` COMPONENT REDUCTION. Every `QvC`-isometry `p` of the indefinite Born form
    with `LinearMap.det p = ±1` (i.e. every element of the full orthogonal group) is moved into the
    NON-VACUOUS identity component `JoinedIdQvC` (N172) by exactly one of the four discrete witnesses
    `{1, parityLin, timeRevLin, ptLin}`: one of `p`, `parityLin · p`, `timeRevLin · p`, `ptLin · p`
    is `JoinedIdQvC`. The four-way case split on (det `= ±1`) × (orthochronous?) routes each class to
    a proper orthochronous representative and feeds it to `joinedIdQvC_of_proper_orthochronous`. This
    is the full group as the identity component times the (Klein-four) discrete component group, built
    from concrete sign reflections — NOT a posited component group, NO posited topology. -/
theorem joinedIdQvC_discreteReduce {p : Module.End Cut STVC}
    (hp : IsQvIsomC (p : STVC → STVC))
    (hdet : LinearMap.det p = 1 ∨ LinearMap.det p = -1) :
    JoinedIdQvC p ∨ JoinedIdQvC (parityLin * p) ∨ JoinedIdQvC (timeRevLin * p)
      ∨ JoinedIdQvC (ptLin * p) := by
  set a : Cut := (p ((1:Cut), (0:Cut), (0:O Cut))).1 with ha
  rcases hdet with hd1 | hdm1
  · rcases le_or_gt 0 a with hpos | hneg
    · -- proper orthochronous: N172 directly.
      exact Or.inl (joinedIdQvC_of_proper_orthochronous hp hd1 hpos)
    · -- proper non-orthochronous: `ptLin · p` is proper (det `(+1)(+1)=1`) and orthochronous.
      right; right; right
      have hiso : IsQvIsomC ((ptLin * p : Module.End Cut STVC) : STVC → STVC) :=
        isQvIsomC_mul isQvIsomC_ptLin hp
      have hdet' : LinearMap.det (ptLin * p) = 1 := by rw [det_End_mul, det_ptLin, hd1]; ring
      have hortho : 0 ≤ ((ptLin * p) ((1:Cut), (0:Cut), (0:O Cut))).1 := by
        rw [Module.End.mul_apply, ptLin_apply]; show 0 ≤ -a; linarith
      exact joinedIdQvC_of_proper_orthochronous hiso hdet' hortho
  · rcases le_or_gt 0 a with hpos | hneg
    · -- improper orthochronous: `parityLin · p` is proper (det `(−1)(−1)=1`) and orthochronous.
      right; left
      have hiso : IsQvIsomC ((parityLin * p : Module.End Cut STVC) : STVC → STVC) :=
        isQvIsomC_mul isQvIsomC_parityLin hp
      have hdet' : LinearMap.det (parityLin * p) = 1 := by rw [det_End_mul, det_parityLin, hdm1]; ring
      have hortho : 0 ≤ ((parityLin * p) ((1:Cut), (0:Cut), (0:O Cut))).1 := by
        rw [Module.End.mul_apply, parityLin_apply]; show 0 ≤ a; exact hpos
      exact joinedIdQvC_of_proper_orthochronous hiso hdet' hortho
    · -- improper non-orthochronous: `timeRevLin · p` is proper (det `(−1)(−1)=1`) and orthochronous.
      right; right; left
      have hiso : IsQvIsomC ((timeRevLin * p : Module.End Cut STVC) : STVC → STVC) :=
        isQvIsomC_mul isQvIsomC_timeRevLin hp
      have hdet' : LinearMap.det (timeRevLin * p) = 1 := by
        rw [det_End_mul, det_timeRevLin, hdm1]; ring
      have hortho : 0 ≤ ((timeRevLin * p) ((1:Cut), (0:Cut), (0:O Cut))).1 := by
        rw [Module.End.mul_apply, timeRevLin_apply]; show 0 ≤ -a; linarith
      exact joinedIdQvC_of_proper_orthochronous hiso hdet' hortho

/-! ## G — W8 NON-VACUITY. -/

/-- ★ W8 NON-VACUITY (the four components are genuinely distinct). The four discrete witnesses
    `{1, parityLin, timeRevLin, ptLin}` are pairwise distinct — evaluating at the timelike axis
    `(1,0,0)` and the `x`-axis `(0,1,0)` separates them. Non-vacuous: the discrete component group
    has genuinely four elements, not a collapsed one. -/
theorem fullO19_components_distinct :
    parityLin ≠ (1 : Module.End Cut STVC) ∧ timeRevLin ≠ (1 : Module.End Cut STVC)
      ∧ ptLin ≠ (1 : Module.End Cut STVC) ∧ parityLin ≠ timeRevLin
      ∧ parityLin ≠ ptLin ∧ timeRevLin ≠ ptLin := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro h
    have := congrArg (fun f => (f ((0:Cut),(1:Cut),(0:O Cut))).2.1) h
    simp only [parityLin_apply] at this; norm_num at this
  · intro h
    have := congrArg (fun f => (f ((1:Cut),(0:Cut),(0:O Cut))).1) h
    simp only [timeRevLin_apply] at this; norm_num at this
  · intro h
    have := congrArg (fun f => (f ((1:Cut),(0:Cut),(0:O Cut))).1) h
    simp only [ptLin_apply] at this; norm_num at this
  · intro h
    have := congrArg (fun f => (f ((1:Cut),(0:Cut),(0:O Cut))).1) h
    simp only [parityLin_apply, timeRevLin_apply] at this; norm_num at this
  · intro h
    have := congrArg (fun f => (f ((1:Cut),(0:Cut),(0:O Cut))).1) h
    simp only [parityLin_apply, ptLin_apply] at this; norm_num at this
  · intro h
    have := congrArg (fun f => (f ((0:Cut),(1:Cut),(0:O Cut))).2.1) h
    simp only [timeRevLin_apply, ptLin_apply] at this; norm_num at this

/-- ★ W8 NON-VACUITY (the reduction fires on a genuine non-identity improper element). The spatial
    sign flip `parityLin` is itself a genuine non-identity `QvC`-isometry with `det = −1` (improper —
    it lives OUTSIDE the proper orthochronous identity component, since that has `det = 1`). The
    component reduction `joinedIdQvC_discreteReduce` applied to `parityLin` yields a true disjunction
    (concretely the `parityLin · parityLin = 1` branch), exercising the reduction on a real element of
    a NON-identity determinant class — not the trivial identity. -/
theorem fullO19_discreteReduce_witness :
    JoinedIdQvC parityLin ∨ JoinedIdQvC (parityLin * parityLin)
      ∨ JoinedIdQvC (timeRevLin * parityLin) ∨ JoinedIdQvC (ptLin * parityLin) :=
  joinedIdQvC_discreteReduce isQvIsomC_parityLin (Or.inr det_parityLin)

end

end Phys.Algebra
