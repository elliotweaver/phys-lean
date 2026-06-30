/-
  Phys.Algebra.DerivationRep7SU2SBranching — N193: THE su(2)_S ACTION ON THE `7` + THE JOINT
  so(4) BIGRADING `7 = (3,1) ⊕ (2,2)`, with the DIAGONAL SINGLET-FIXING as an EXACT CANCELLATION.
  ===========================================================================
  N191 banked the `so(4) = su(2)_S × su(2)_T` inside `g₂ = Der(O ℚ)` (two MUTUALLY COMMUTING
  `su(2)`'s, of which the embedded weak-isospin `su(2)` N187 is the DIAGONAL), via the second-slot
  family `leftImDeriv Q ⟨a,b⟩ = ⟨0, Q·b⟩` (`su(2)_T`) and the difference family
  `secondSU2 P := innerDeriv P − leftImDeriv P` (`su(2)_S`). But N191 banked only the BRACKET
  structure of `su(2)_S` (`secondSU2_bracket`, `secondSU2_commutes_leftImDeriv`) — never how
  `secondSU2` ACTS on the `7` (`ImO`, N22). N189/N190 banked the branching under the DIAGONAL
  (`7 = 1 ⊕ 3 ⊕ 3`); N192 banked the branching under `su(2)_T` (`7 = 3·1 ⊕ 4`). THIS node banks
  the THIRD piece — the `su(2)_S` action on the `7` — and assembles all three into the JOINT
  `so(4)` bigrading from which BOTH banked branchings DESCEND.

  ★ THE MECHANISM (W9.4 structure-over-coordinate-expansion; THE ONE LAW reframe — the action
  reduces to BANKED intertwiners, NO octonion-coordinate expansion). With
  `secondSU2 P = innerDeriv P − leftImDeriv P` (N191), subtract the two banked actions on each
  coordinate copy of `O ℚ = CD (H ℚ) = ⟨H, H⟩`:
    • `secondSU2 P (ιO a) = innerDeriv P (ιO a) − leftImDeriv P (ιO a) = ιO(ad_P a) − 0`
        (`secondSU2_iotaO`) — `su(2)_S` acts on the OLD line `ιO` by the ADJOINT `ad_P`
        (N190 `innerDeriv_iotaO`), where `su(2)_T` ANNIHILATES it (N192 `leftImDeriv_iotaO`).
    • `secondSU2 P (κO b) = κO(ad_P b) − κO(P·b) = κO((P·b − b·P) − P·b) = κO(−(b·P))`
        (`secondSU2_kappaO`) — `su(2)_S` acts on the NEW plane `κO` by RIGHT multiplication
        `R_P : b ↦ −(b·P)` (N190 `innerDeriv_kappaO_full` + N192 `leftImDeriv_kappaO`), where
        `su(2)_T` acts by LEFT multiplication `L_Q : b ↦ Q·b`.
  So `su(2)_S` carries a NEW intertwiner family DISTINCT from both `leftImDeriv` (left-mult, kills
  `ιO`) and the diagonal `innerDeriv` (adjoint on both slots): the right-regular action on the new
  plane and the adjoint on the old line.

  ★★ THE JOINT `so(4)` BIGRADING `7 = (3,1) ⊕ (2,2)`. The SAME two su(2)_T-invariant pieces of N192
  carry DISTINCT `(j_S, j_T)` signatures, and BOTH are invariant under BOTH factors
  (`so4_pieces_invariant`):
    • `ιO(ImH)` (dim `3`, N190): `su(2)_S`-NONTRIVIAL (adjoint, `secondSU2_invariant_iotaImH`),
      `su(2)_T`-TRIVIAL (annihilated, `leftImDeriv_invariant_iotaImH`) → the `(3,1)`.
    • `κO(⊤)` (dim `4`, N192): `su(2)_T` by `L` (N192 `invariant_kappaTop`), `su(2)_S` by `R`
      (`secondSU2_invariant_kappaTop`) → the `(2,2)` `H`-bimodule.
  With `ιO(ImH) ⊔ κO(⊤) = ImO` (N192 `branchingT_sup_eq_ImO`) and dims `3 + 4 = 7`
  (N192 `branchingT_dim_sum`), this is the COMMON REFINEMENT: N192's `su(2)_T` branching `3·1 ⊕ 4`
  reads off the `j_T`-content (`(3,1)` is three `su(2)_T`-trivials, `(2,2)` is the `4`), and N190's
  diagonal branching `1 ⊕ 3 ⊕ 3` reads off the diagonal-content. NOT a mechanical intersection: the
  descent is a PROVED relation (below).

  ★★ THE RELATIONAL PUNCHLINE — THE DIAGONAL SINGLET-FIXING IS AN EXACT CANCELLATION. On the
  diagonal singlet `e₄ = κO 1` (N189), the two `so(4)` factors act as EXACT NEGATIVES:
    `secondSU2 hI (κO 1) = κO(−(1·hI)) = −κO hI`,  `leftImDeriv hI (κO 1) = κO(hI·1) = +κO hI`,
  so `secondSU2 hI (κO 1) = − leftImDeriv hI (κO 1)` (`secondSU2_singlet_eq_neg_leftImDeriv`).
  Hence the DIAGONAL `innerDeriv hI = secondSU2 hI + leftImDeriv hI` (N191 `innerDeriv_eq_diagonal`)
  FIXES `e₄` by cancellation: `innerDeriv hI (κO 1) = −κO hI + κO hI = 0`
  (`diagonal_fixes_singlet_via_cancellation`) — N189's `singlet_fixed_by_isospin` (the `hI`
  component) DERIVED FORWARD as the cancellation of the two bigrading factors. The diagonal singlet
  is precisely the `su(2)_S/su(2)_T` cancellation locus inside the `(2,2)`.

  ★ W8 NON-VACUITY: `su(2)_S` MOVES the singlet `e₄` too (`secondSU2_moves_singlet`,
  `secondSU2 hI (κO 1) = −κO hI ≠ 0`, witness coord `−1`), and acts NONTRIVIALLY on the OLD `3`
  (`secondSU2_acts_on_iotaImH_ne_zero`, `adHom hI hJ = 2hK ≠ 0`). So `su(2)_S` is a genuine
  nonzero action on each piece — a THIRD distinct intertwiner family, not a vacuous/zero or
  duplicate decomposition.

  THE MOAT — THE UNBROKEN-STRAND NOVELTY (docs/STANDARD.md §0). The division-algebra-physics field
  reads each `su(2)` action and branching off the octonions BY HAND. Here ALL THREE actions on the
  `7` — the diagonal (N189/N190), `su(2)_T` (N192), and now `su(2)_S` — are DERIVED from the SAME
  doubling `O ℚ = CD (H ℚ) = ⟨H,H⟩`, assembled into the joint `(3,1) ⊕ (2,2)` bigrading, and the
  descent of the diagonal singlet-fixing to a PROVED exact cancellation is genuine new relational
  content. One cause (the doubling), several consequences.

  NO posited su(2)/so(4)/g₂/SU(2)/G₂/Lie-group/rep as content, NO Mathlib ℝ/ℂ as content (ℚ/ℤ are
  the coefficient systems the `Module.End`/`Submodule`/`LinearMap`/`finrank` statements are WRITTEN
  IN — the N6/N16/N19/N22/N25/N42/N184–N192 precedent; the OBJECTS are the derived rungs `H ℚ`
  (N3), `O ℚ = CD (H ℚ)` (N4), the imaginary subspaces `ImO` (N22) and `ImH` (N190), and the
  difference family `secondSU2` (N191)).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "colour / isospin / 7 / g₂ / su(2) / so(4) /
  singlet / adjoint / branching / bigrading / rep / gauge / diagonal": what remains is the pure
  statement that for the Cayley–Dickson double `O ℚ = CD (H ℚ)`, the difference family
  `innerDeriv P − leftImDeriv P` acts on the first coordinate embedding `a ↦ ⟨a,0⟩` by the adjoint
  `a ↦ P·a − a·P` and on the second embedding `b ↦ ⟨0,b⟩` by `b ↦ −(b·P)`; both coordinate
  subspaces are preserved by this family AND by the second-slot family; and on the second-slot unit
  `⟨0,1⟩` it acts as the exact negative of the second-slot family, so the sum of the two families
  (the inner derivation) annihilates `⟨0,1⟩`. No theorem statement needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationRep7SU2TBranching
import Phys.Algebra.DerivationRep7FullBranching
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## How su(2)_S (`secondSU2 = innerDeriv − leftImDeriv`) acts on the two coordinate slots. -/
section General
variable {B : Type*} [CommRing B] [StarRing B]

/-- ★ su(2)_S ACTS ON THE OLD LINE BY THE ADJOINT: `secondSU2 P (ιO a) = ιO (ad_P a)`. Subtracting
    the two banked actions: `innerDeriv P (ιO a) = ιO(ad_P a)` (N190) minus
    `leftImDeriv P (ιO a) = 0` (N192). Where `su(2)_T` ANNIHILATES the old line, `su(2)_S` carries
    the full adjoint action — the OLD `3` is `su(2)_S`-nontrivial, `su(2)_T`-trivial. -/
theorem secondSU2_iotaO (P a : H ℚ) :
    secondSU2 P (iotaO a) = iotaO (adHom P a) := by
  show (innerDeriv P - leftImDeriv P) (iotaO a) = iotaO (adHom P a)
  rw [LinearMap.sub_apply, innerDeriv_iotaO, leftImDeriv_iotaO, sub_zero]

/-- ★ su(2)_S ACTS ON THE NEW PLANE BY RIGHT MULTIPLICATION: `secondSU2 P (κO b) = κO (−(b·P))`.
    Subtracting the banked actions: `innerDeriv P (κO b) = κO(ad_P b) = κO(P·b − b·P)` (N190) minus
    `leftImDeriv P (κO b) = κO(P·b)` (N192) leaves `κO(−(b·P))` — the RIGHT-regular action `R_P`,
    DISTINCT from `su(2)_T`'s LEFT-regular `L_P` and from the diagonal's adjoint. -/
theorem secondSU2_kappaO (P b : H ℚ) :
    secondSU2 P (kappaO b) = kappaO (-(b * P)) := by
  show (innerDeriv P - leftImDeriv P) (kappaO b) = kappaO (-(b * P))
  rw [LinearMap.sub_apply, innerDeriv_kappaO_full, leftImDeriv_kappaO, ← map_sub]
  congr 1
  rw [adHom_apply]; abel

end General

/-! ## The joint so(4) invariance of the two pieces `ιO(ImH)` (the `(3,1)`) and `κO(⊤)` (the `(2,2)`). -/
section Cascade

/-- ★ The OLD `3` `ιO(ImH)` is `su(2)_S`-INVARIANT: `secondSU2 P` (imaginary `P`) maps it into
    itself, via the banked `adHom_mem_ImH`. (Where `su(2)_T` annihilates it — see below.) -/
theorem secondSU2_invariant_iotaImH {P : H ℚ} (hP : star P = -P) :
    ∀ x ∈ Submodule.map iotaO ImH, secondSU2 P x ∈ Submodule.map iotaO ImH := by
  rintro _ ⟨a, ha, rfl⟩
  rw [SetLike.mem_coe] at ha
  rw [secondSU2_iotaO]
  exact Submodule.mem_map_of_mem (adHom_mem_ImH hP ha)

/-- ★ The NEW `4` `κO(⊤)` is `su(2)_S`-INVARIANT: `secondSU2 P` maps it into itself
    (`b ↦ −(b·P)` stays in the second slot). The right-regular `H`-action on the `(2,2)`. -/
theorem secondSU2_invariant_kappaTop (P : H ℚ) :
    ∀ x ∈ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)),
      secondSU2 P x ∈ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)) := by
  rintro _ ⟨b, _, rfl⟩
  rw [secondSU2_kappaO]
  exact Submodule.mem_map_of_mem trivial

/-- The OLD `3` `ιO(ImH)` is `su(2)_T`-INVARIANT — trivially, because `su(2)_T` ANNIHILATES the
    whole old line (`leftImDeriv_iotaO`, N192): `leftImDeriv Q x = 0 ∈ ιO(ImH)`. The `(3,1)`'s
    `su(2)_T`-triviality, as a (degenerate) invariance. -/
theorem leftImDeriv_invariant_iotaImH (Q : H ℚ) :
    ∀ x ∈ Submodule.map iotaO ImH, leftImDeriv Q x ∈ Submodule.map iotaO ImH := by
  rintro _ ⟨a, _, rfl⟩
  rw [leftImDeriv_iotaO]
  exact Submodule.zero_mem _

/-- ★★ THE JOINT `so(4)` INVARIANCE — both pieces of the branching `ImO = ιO(ImH) ⊔ κO(⊤)` (N192)
    are invariant under BOTH commuting factors `su(2)_S = ⟨secondSU2⟩` and `su(2)_T = ⟨leftImDeriv⟩`
    (imaginary generators). The `7` is `so(4)`-decomposed as `(3,1) ⊕ (2,2)`: `ιO(ImH)` is the
    `(3,1)` (su(2)_S adjoint, su(2)_T trivial) and `κO(⊤)` is the `(2,2)` (su(2)_T left, su(2)_S
    right). This is the COMMON REFINEMENT both banked branchings descend from. -/
theorem so4_pieces_invariant {P Q : H ℚ} (hP : star P = -P) :
    (∀ x ∈ Submodule.map iotaO ImH, secondSU2 P x ∈ Submodule.map iotaO ImH) ∧
    (∀ x ∈ Submodule.map iotaO ImH, leftImDeriv Q x ∈ Submodule.map iotaO ImH) ∧
    (∀ x ∈ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)),
        secondSU2 P x ∈ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ))) ∧
    (∀ x ∈ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)),
        leftImDeriv Q x ∈ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ))) :=
  ⟨secondSU2_invariant_iotaImH hP, leftImDeriv_invariant_iotaImH Q,
    secondSU2_invariant_kappaTop P, invariant_kappaTop Q⟩

/-! ## The relational punchline: the diagonal singlet-fixing is an exact cancellation of the two factors. -/

/-- ★★ THE TWO `so(4)` FACTORS ACT AS EXACT NEGATIVES ON THE DIAGONAL SINGLET `e₄ = κO 1`:
    `secondSU2 hI (κO 1) = − leftImDeriv hI (κO 1)`. Indeed `secondSU2 hI (κO 1) = κO(−(1·hI)) =
    −κO hI` while `leftImDeriv hI (κO 1) = κO(hI·1) = κO hI`. The right-regular and left-regular
    actions on the unit coincide (up to sign) because `1·hI = hI·1`. -/
theorem secondSU2_singlet_eq_neg_leftImDeriv :
    secondSU2 (hI : H ℚ) (kappaO 1) = - leftImDeriv (hI : H ℚ) (kappaO 1) := by
  rw [secondSU2_kappaO, leftImDeriv_kappaO, ← map_neg]
  congr 1
  rw [one_mul, mul_one]

/-- ★★ THE DIAGONAL FIXES THE SINGLET BY CANCELLATION: `innerDeriv hI (κO 1) = 0`, DERIVED as the
    exact cancellation of the two `so(4)` factors. Since `innerDeriv hI = secondSU2 hI + leftImDeriv hI`
    (N191 `innerDeriv_eq_diagonal`) and the two act as negatives on `e₄`
    (`secondSU2_singlet_eq_neg_leftImDeriv`), they cancel — N189's `singlet_fixed_by_isospin` (the
    `hI` component) DERIVED FORWARD from the bigrading, not posited. The diagonal singlet is the
    `su(2)_S/su(2)_T` cancellation locus inside the `(2,2)`. -/
theorem diagonal_fixes_singlet_via_cancellation :
    innerDeriv (hI : H ℚ) (kappaO 1) = 0 := by
  rw [innerDeriv_eq_diagonal, LinearMap.add_apply, secondSU2_singlet_eq_neg_leftImDeriv]
  abel

/-! ## W8 — non-vacuity: su(2)_S acts nontrivially on both pieces (a genuine third action). -/

/-- THE COSTUME WITNESS COORDINATE: the deep coordinate of the `su(2)_S`-moved singlet
    `secondSU2 hI (κO 1) = −κO hI` is `(...).im.re.im = −1` (since `hI = ιJ`, `hI.re.im = 1`,
    negated). The exact negative of N192's `singlet_moved_coord` (`+1`). -/
theorem secondSU2_singlet_coord :
    (secondSU2 (hI : H ℚ) (kappaO 1)).im.re.im = -1 := by
  rw [secondSU2_kappaO]
  simp [kappaO, hI, CD.iota, Dbl.J]

/-- ★ W8: `su(2)_S` MOVES the diagonal singlet too — `secondSU2 hI (κO 1) = −κO hI ≠ 0`. Like
    `su(2)_T` (N192 `leftImDeriv_moves_singlet`), `su(2)_S` is nontrivial on `e₄`; the diagonal
    fixes it only because the two MOVES cancel. -/
theorem secondSU2_moves_singlet : secondSU2 (hI : H ℚ) (kappaO 1) ≠ 0 := by
  intro h
  have hc : (secondSU2 (hI : H ℚ) (kappaO 1)).im.re.im = (-1 : ℚ) := secondSU2_singlet_coord
  rw [h] at hc; simp at hc

/-- ★ W8: `su(2)_S` acts NONTRIVIALLY on the OLD `3` — `secondSU2 hI (ιO hJ) = ιO(ad_{hI} hJ) =
    ιO(2hK) ≠ 0`. So the `(3,1)` is a genuine nonzero `su(2)_S`-summand carrying the adjoint action
    (where `su(2)_T` annihilates it, N192). -/
theorem secondSU2_acts_on_iotaImH_ne_zero : secondSU2 (hI : H ℚ) (iotaO hJ) ≠ 0 := by
  rw [secondSU2_iotaO]
  intro h
  have hadj : adHom (hI : H ℚ) hJ = 0 := by
    have := congrArg CD.re h; simpa [iotaO] using this
  rw [adHom_apply, hI_hJ, hJ_hI, sub_neg_eq_add, hK_def] at hadj
  have hc := congrArg (fun z : H ℚ => z.im.im) hadj
  simp [Dbl.J, CD.add_im, Dbl.add_im] at hc

end Cascade

end

end Phys.Algebra
