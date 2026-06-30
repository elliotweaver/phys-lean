/-
  Phys.Algebra.DerivationRep7SU2TBranching — N192: THE BRANCHING OF THE `7` UNDER su(2)_T
  — `7 = 3·(trivial) ⊕ 4`, distinct from N190's diagonal branching, with a SINGLET↔ADJOINT
  ROLE SWAP.
  ===========================================================================
  N191 opened the embedded weak-isospin `su(2)` (N187, the DIAGONAL) into the full
  `so(4) = su(2)_S × su(2)_T` of two MUTUALLY COMMUTING `su(2)`'s inside `g₂ = Der(O ℚ)`. The
  second factor `su(2)_T = ⟨leftImDeriv hI/J/K⟩` is the SECOND-SLOT family
  `leftImDeriv Q : ⟨a,b⟩ ↦ ⟨0, Q·b⟩` (imaginary `Q`). N189/N190 banked the branching of the
  `7` (`ImO`, N22) under the DIAGONAL: `7 = 1 ⊕ 3 ⊕ 3`. THIS node banks the GENUINELY DIFFERENT
  branching of the SAME `7` under `su(2)_T` — and the structural CONTRAST between the two.

  ★ THE MECHANISM (W9.4 structure-over-coordinate-expansion; the ROADMAP front (i) MEASURED
  LIGHT + GENUINELY NEW). The second-slot family `leftImDeriv Q ⟨a,b⟩ = ⟨0, Q·b⟩` treats the
  two coordinate slots of `O ℚ = CD (H ℚ) = ⟨H, H⟩` completely differently from the inner
  derivations (which act componentwise, `innerDeriv q ⟨a,b⟩ = ⟨ad_q a, ad_q b⟩`, N6):
    • `leftImDeriv Q (ιO a) = leftImDeriv Q ⟨a,0⟩ = ⟨0, Q·0⟩ = 0`   (`leftImDeriv_iotaO`)
        — su(2)_T ANNIHILATES the OLD line `ιO` (N190): the whole first-slot copy of the
          quaternion rung is killed.
    • `leftImDeriv Q (κO b) = leftImDeriv Q ⟨0,b⟩ = ⟨0, Q·b⟩ = κO (Q·b)`  (`leftImDeriv_kappaO`)
        — su(2)_T acts on the NEW plane `κO` (N189) by LEFT MULTIPLICATION `L_Q`, a NEW
          intertwiner DISTINCT from the adjoint action `innerDeriv` carries on `κO`.

  ★★ THE DECOMPOSITION `ImO = ιO(ImH) ⊔ κO(⊤)` — dims `3 + 4 = 7`. The imaginary constraint
  `star x = −x` forces the FIRST coordinate `x.re ∈ ImH` (the imaginary quaternions, `finrank 3`,
  N190) but leaves the SECOND coordinate `x.im ∈ H` FREE (the full `finrank 4` quaternion rung,
  N19) — because `star⟨a,b⟩ = ⟨star a, −b⟩`, so the imaginary condition is `star a = −a` on the
  first slot and is automatic on the second. So `ImO` is the internal sup of the imaginary OLD
  line `ιO(ImH)` (the `3`, three trivials under su(2)_T) and the full NEW plane `κO(⊤)` (the
  `4`, the left-regular module of `H` under su(2)_T). Since `3 + 4 = 7 = finrank ℚ ImO` (N22)
  and the sup is everything, the sum is direct: `7 = 3·1 ⊕ 4` under su(2)_T. The full second
  slot `κO(⊤)` is su(2)_T-INVARIANT (`invariant_kappaTop`, since `leftImDeriv Q (κO b) = κO(Q·b)`).

  ★★ THE ROLE SWAP (W8 non-vacuity, and the genuine NEW relational content vs N190). Compare
  the two `su(2)` actions on the SAME `7`:
    • the DIAGONAL `su(2)` (N187) FIXES the singlet `e₄ = κO 1` (N189 `singlet_fixed_by_isospin`)
      and acts NONTRIVIALLY on the OLD adjoint `3 = ιO(ImH)` (N190 `action_on_iotaImH_ne_zero`);
    • `su(2)_T` does the OPPOSITE: it MOVES the singlet `e₄`
      (`leftImDeriv_moves_singlet`: `leftImDeriv hI (κO 1) = κO hI ≠ 0`) and ANNIHILATES the OLD
      adjoint `3` (`leftImDeriv_annihilates_iotaImH`: `leftImDeriv hI (ιO hJ) = 0`).
  So the vector that is a singlet for the diagonal is NON-trivial for su(2)_T, and the subspace
  on which the diagonal acts is killed by su(2)_T. The two commuting factors of the so(4) carve
  the `7` along complementary axes — exactly the kind of structure the field reads off the
  octonions by hand; here it is DERIVED from the cascade's OWN doubling.

  THE MOAT — THE UNBROKEN-STRAND NOVELTY (docs/STANDARD.md §0). The division-algebra-physics
  field exhibits one branching of the `7` by hand. Here BOTH branchings (diagonal `1⊕3⊕3`,
  N190; and `su(2)_T` `3·1⊕4`, this node) are DERIVED from the SAME doubling
  `O ℚ = CD (H ℚ) = ⟨H,H⟩` that stops the cascade (N2c) and embeds `su(2) ↪ g₂` (N187), and the
  structural contrast (the role swap) is a PROVED relation. One cause, several consequences.

  NO posited su(2)/so(4)/g₂/SU(2)/G₂/Lie-group/rep as content, NO Mathlib ℝ/ℂ as content
  (ℚ/ℤ are the coefficient systems the `Module.End`/`Submodule`/`LinearMap`/`finrank` statements
  are WRITTEN IN — the N6/N16/N19/N22/N25/N42/N184–N191 precedent; the OBJECTS are the derived
  rungs `H ℚ` (N3), `O ℚ = CD (H ℚ)` (N4), the imaginary subspaces `ImO` (N22) and `ImH` (N190),
  and the second-slot family `leftImDeriv` (N191)).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "colour / isospin / 7 / g₂ / su(2) /
  so(4) / singlet / adjoint / branching / rep / gauge / diagonal": what remains is the pure
  statement that for the Cayley–Dickson double `O ℚ = CD (H ℚ)`, the second-slot family
  `⟨a,b⟩ ↦ ⟨0,Q·b⟩` annihilates the first coordinate embedding `a ↦ ⟨a,0⟩` and acts on the
  second embedding `b ↦ ⟨0,b⟩` by `b ↦ Q·b`; the imaginary subspace `ker(star+1)` is the
  internal direct sum of the imaginary-first-slot image and the FULL second-slot image, with
  dimensions `3 + 4 = 7`; and this family MOVES the second-slot unit `⟨0,1⟩` (which every inner
  derivation fixes) while ANNIHILATING the first-slot imaginaries (on which the inner derivations
  act nontrivially). No theorem statement needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationSO4TwoSU2
import Phys.Algebra.DerivationRep7FullBranching
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## How su(2)_T (`leftImDeriv`) treats the two coordinate slots. -/

/-- ★ su(2)_T ANNIHILATES THE OLD LINE: `leftImDeriv Q (ιO a) = 0`. The second-slot family
    `⟨a,b⟩ ↦ ⟨0,Q·b⟩` kills the first-coordinate copy `ιO a = ⟨a,0⟩` (its second slot is `0`,
    and `Q·0 = 0`). Contrast the inner derivations, which act on `ιO` by the adjoint (N190). -/
theorem leftImDeriv_iotaO (Q : H ℚ) (a : H ℚ) :
    leftImDeriv Q (iotaO a) = 0 := by
  rw [leftImDeriv_apply, iotaO_apply]
  ext <;> simp

/-- ★ su(2)_T ACTS ON THE NEW PLANE BY LEFT MULTIPLICATION: `leftImDeriv Q (κO b) = κO (Q·b)`.
    A NEW intertwiner `b ↦ Q·b` (left regular), DISTINCT from the adjoint action
    `innerDeriv q (κO b) = κO (ad_q b)` the inner derivations carry on `κO` (N190). -/
theorem leftImDeriv_kappaO (Q : H ℚ) (b : H ℚ) :
    leftImDeriv Q (kappaO b) = kappaO (Q * b) := by
  rw [leftImDeriv_apply, kappaO_apply]
  ext <;> simp [kappaO]

/-- ★ THE FULL SECOND SLOT `κO(⊤)` IS su(2)_T-INVARIANT: `leftImDeriv Q` maps it into itself
    (`b ↦ Q·b` stays in the second slot). The `4`-dimensional invariant summand. -/
theorem invariant_kappaTop (Q : H ℚ) :
    ∀ x ∈ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)),
      leftImDeriv Q x ∈ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)) := by
  rintro _ ⟨b, _, rfl⟩
  rw [leftImDeriv_kappaO]
  exact Submodule.mem_map_of_mem trivial

/-! ## The su(2)_T decomposition `ImO = ιO(ImH) ⊔ κO(⊤)` and the dimensions `3 + 4 = 7`. -/

/-- ★★ THE su(2)_T BRANCHING `ImO = ιO(ImH) ⊔ κO(⊤)`. Each piece is imaginary (`⊆`); conversely
    every imaginary `x = ⟨a,b⟩` has `a ∈ ImH` (the imaginary condition `star x = −x` forces
    `star a = −a` on the FIRST slot) while the SECOND slot `b ∈ H` is FREE (`star⟨a,b⟩ = ⟨star a,
    −b⟩`, so the second slot carries no constraint), so `x = ιO a + κO b` with `a ∈ ImH`,
    `b ∈ ⊤`. The DIFFERENT decomposition of the SAME `7` (vs N190's `1 ⊕ 3 ⊕ 3`): here the OLD
    line contributes its imaginary `3` and the NEW plane contributes the FULL `4`. -/
theorem branchingT_sup_eq_ImO :
    (Submodule.map iotaO ImH) ⊔ (Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ))) = ImO := by
  apply le_antisymm
  · apply sup_le
    · rintro _ ⟨a, ha, rfl⟩
      rw [SetLike.mem_coe, mem_ImH] at ha
      rw [mem_ImO]; ext <;> simp [iotaO, CD.star_re, CD.star_im, ha]
    · rintro _ ⟨b, _, rfl⟩
      rw [mem_ImO]; ext <;> simp [kappaO, CD.star_re, CD.star_im]
  · intro x hx
    rw [mem_ImO] at hx
    have hre : star x.re = -x.re := by
      have := congrArg CD.re hx; simpa [CD.star_re, CD.neg_re] using this
    have hdecomp : x = iotaO x.re + kappaO x.im := by
      ext <;> simp [iotaO, kappaO]
    rw [hdecomp]
    apply Submodule.add_mem
    · apply Submodule.mem_sup_left
      exact Submodule.mem_map_of_mem (by rw [mem_ImH]; exact hre)
    · apply Submodule.mem_sup_right
      exact Submodule.mem_map_of_mem trivial

/-- The NEW plane `κO(⊤)` has dimension `4` — the FULL quaternion rung (`κO` injective, N190;
    `finrank ℚ (H ℚ) = 4` banked N19). The `4` of the su(2)_T branching (vs the `3` the inner
    derivations see on `κO(ImH)` at N190). -/
theorem finrank_kappaTop :
    Module.finrank ℚ (Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ))) = 4 := by
  rw [(Submodule.equivMapOfInjective kappaO kappaO_injective ⊤).symm.finrank_eq,
    finrank_top, finrank_H_eq_four]

/-- ★★ THE DIMENSION IDENTITY `3 + 4 = 7` — the `7 = 3·1 ⊕ 4` su(2)_T branching dimensions: the
    imaginary OLD line `3` and the full NEW plane `4`, summing to `finrank ℚ ImO = 7` (N22).
    Since `branchingT_sup_eq_ImO` shows the sup is all of `ImO` and the dimensions sum to its
    total dimension, the sum is an INTERNAL DIRECT SUM. -/
theorem branchingT_dim_sum :
    Module.finrank ℚ (Submodule.map iotaO ImH)
      + Module.finrank ℚ (Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)))
    = Module.finrank ℚ ImO := by
  rw [finrank_iotaImH, finrank_kappaTop, finrank_ImO]

/-! ## W8 — the ROLE SWAP: su(2)_T and the diagonal carve the `7` along complementary axes. -/

/-- ★★ su(2)_T MOVES THE SINGLET — `leftImDeriv hI (κO 1) = κO hI ≠ 0`. The vector `e₄ = κO 1`
    that the DIAGONAL `su(2)` FIXES (N189 `singlet_fixed_by_isospin`) is NON-trivial under
    su(2)_T. The deep coordinate is `(κO hI).im.re.im = hI.re.im = (Dbl.J).im = 1`. -/
theorem leftImDeriv_moves_singlet : leftImDeriv (hI : H ℚ) (kappaO 1) ≠ 0 := by
  intro h
  have hc : (leftImDeriv (hI : H ℚ) (kappaO 1)).im.re.im = (1 : ℚ) := by
    rw [leftImDeriv_apply]
    simp [kappaO, hI, CD.iota, Dbl.J]
  rw [h] at hc; simp at hc

/-- ★★ su(2)_T ANNIHILATES THE OLD ADJOINT `3` — `leftImDeriv hI (ιO hJ) = 0`. The subspace
    `ιO(ImH)` on which the DIAGONAL `su(2)` acts NONTRIVIALLY (N190 `action_on_iotaImH_ne_zero`)
    is KILLED by su(2)_T. Together with `leftImDeriv_moves_singlet`, the two commuting factors of
    the so(4) carve the `7` along complementary axes. -/
theorem leftImDeriv_annihilates_iotaImH : leftImDeriv (hI : H ℚ) (iotaO hJ) = 0 :=
  leftImDeriv_iotaO hI hJ

/-- THE COSTUME WITNESS COORDINATE: the deep coordinate of the moved singlet
    `leftImDeriv hI (κO 1) = κO hI` is `(...).im.re.im = 1` (since `hI = ιJ`, `hI.re.im = 1`). -/
theorem singlet_moved_coord :
    (leftImDeriv (hI : H ℚ) (kappaO 1)).im.re.im = 1 := by
  rw [leftImDeriv_apply]
  simp [kappaO, hI, CD.iota, Dbl.J]

end

end Phys.Algebra
