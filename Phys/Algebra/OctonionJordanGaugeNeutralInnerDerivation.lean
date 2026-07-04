/-
  Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation —
  N287: THE GAUGE-NEUTRAL INNER-DERIVATION MEMBER OF `f₄ = Der(H₃(O))` — the derived arena's
        derivation Lie algebra SUPPLIES a nonzero member of the inner-derivation complement
        `f₄/g₂` that COMMUTES WITH THE ENTIRE DERIVED GAUGE `g₂ = Der(O)`.

  ------------------------------------------------------------------------------
  THE STORY (theory-native; the staircase's own terminal question).
  The fold → self-blindness → complex unit → cascade → the terminal, NON-ASSOCIATIVE octonions
  `O ℚ`, whose derivation algebra `g₂ = Der(O ℚ) = derivationLieQ` (N6) is the derived gauge. That
  same non-associativity CAPS the Hermitian Jordan tower at order 3 (N5), so `H₃(O ℚ)` is the
  maximal matter arena, and its Jordan-derivation Lie algebra `f₄ = Der(H₃(O)) = derH3` (N285) is
  the arena's symmetry. N286 proved `f₄ ⊋ g₂` PROPER: the inner-multiplication commutator
  `innerMul A B = ⁅L_A, L_B⁆` (for `L_A X = jb A X`) is a GENUINE member of `derH3` for Hermitian
  A, B, LIVING in the inner-derivation complement of the entrywise gauge `g₂`.

  THE NEXT BEAT — the whole `N281 → N286` ascent was the declared repeated-deferral STAIRCASE
  (docs/RUNBOOK.md) built to reach ONE structure: a single simple DERIVED ambient holding two
  commuting factors that the too-small vector carriers so(7)/so(8) could not (N283 measured the
  JOINT centralizer of `su(2)_L + colour` in so(8) to be ZERO — INPUT A structurally blocked). With
  the staircase's final rung laid (N286), THIS node asks the staircase's own terminal question,
  posit-free: does the fold-forced arena `f₄` actually SUPPLY a nonzero member of the
  inner-derivation complement that COMMUTES with the entire derived gauge — the colour-neutral room
  the vector carriers lacked? Measured YES: the joint centralizer jumps `0 → 3` one carrier up
  (`workbench/N287-select/`), and the banked N286 member `M0 = innerMul (slotA 1)(slotB 1)` sits in
  it, commuting with the WHOLE gauge.

  THE DISSOLUTION (docs/RUNBOOK.md, THE ONE LAW). The field POSITS the maximal-rank subgroup
  `F₄ ⊃ SU(3) × SU(3)` and CHOOSES that embedding to place the colour-neutral factor (the hypercharge
  normalization). The theory INVERTS + DISSOLVES the CHOICE: `colour = Der(O)` and `f₄ = Der(H₃(O))`
  are BOTH derived from the fold, so the colour-commuting complement member is not an embedding
  convention but the FORCED consequence of `jActL D` acting by Jordan derivations. The mechanism is
  the coordinate-free LEIBNIZ LEVER

      ⁅jActL D, innerMul A B⁆ = innerMul (jAct D A) B + innerMul A (jAct D B),

  a formal consequence of the banked `jAct_jb` (`jActL D` is a derivation of the Jordan product `jb`).
  Because every derivation kills the reals (`derivQ_one`: `D 1 = 0`), for `A, B` valued in the fold's
  own real core the two right-hand terms vanish and `jActL D` COMMUTES with `innerMul A B`. In
  particular the banked member `M0 = innerMul (slotA 1)(slotB 1)` — whose matter slots carry the real
  unit `1` — commutes with EVERY derived gauge element, with ZERO octonion coordinate expansion.

  ONE CAUSE, MANY TERMINATIONS. The SAME octonion non-associativity that stops the cascade (N2c),
  caps the Hermitian Jordan tower at 3 (N5), makes matter indivisible (N265) and the arena formally
  real (N270), furnishes the rank-4 arena symmetry `f₄` with ROOM for a gauge-commuting complement
  member that the rank-3 vector carriers so(7)/so(8) structurally lacked — the ascent's INPUT-A
  dissolution, on the fold-forced carrier.

  SCOPE (docs/RUNBOOK.md W4.5 — SUFFICIENT; each non-banked item childed, not folded in silently).
  BANKS the forced gauge-commuting inner-derivation member + the coordinate-free Leibniz lever (the
  mechanism). Does NOT bank: the FULL colour-commuting second `su(3)` as a complete simple 8-dim
  LieSubalgebra (measured dim 8, semisimple, rank 2 — the next rung, childed); the identification of
  the fully-gauge-neutral room as `so(3) = Der(J₃(ℝ))` (measured dim 3); the ★2 weak-mixing-angle
  VALUE (route-not-yet-found — a FORCED build target, NOT invented, NOT human-gated); and `= the
  physical hypercharge / F₄` (removable prose).

  PHYSICS-WORDS-REMOVABLE. Delete gauge/colour/electroweak/hypercharge/f₄/g₂: the statement is that
  a nonzero member of the `LieSubalgebra derH3` — the inner-multiplication commutator
  `innerMul (slotA 1)(slotB 1)` — commutes with every element of the `jActL`-image of `derivationLieQ`
  and moves the diagonal that image fixes. Pure math; the physics lives only in identifiers/comments.
-/
import Phys.Algebra.OctonionJordanInnerDerivationLeibniz
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

variable (D : Module.End ℚ (O ℚ))

/-! ## The coordinate-free gauge Leibniz lever. -/

/-- ★★ THE GAUGE LEIBNIZ LEVER. The entrywise gauge action `jActL D` (N268/N284) is a derivation of
    the Jordan product `jb` (`jAct_jb`), so its commutator with the inner-multiplication generator
    `innerMul A B = ⁅L_A, L_B⁆` (N274) obeys the derivation Leibniz law in the two multiplier
    arguments:

        `⁅jActL D, innerMul A B⁆ = innerMul (jAct D A) B + innerMul A (jAct D B)`.

    Proof: unfold the commutator on the arena, apply `jActL D = jAct D` through each layer of `jb`
    via `jAct_jb` (three layers on the LHS), and let the free `NonAssocRing` cancel by `abel` — ZERO
    octonion coordinate expansion. This is the mechanism by which the derived gauge determines its
    commutant with any inner multiplication. -/
theorem innerMul_gauge_leibniz (hD : IsDerivQ D) (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    ⁅jActL D, innerMul A B⁆
      = innerMul (jAct D A) B + innerMul A (jAct D B) := by
  rw [show (⁅jActL D, innerMul A B⁆ :
      Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = jActL D * innerMul A B - innerMul A B * jActL D from
      Ring.lie_def _ _]
  apply LinearMap.ext; intro X
  simp only [LinearMap.sub_apply, LinearMap.add_apply, Module.End.mul_apply,
    innerMul_apply, jActL_apply]
  rw [show jAct D (jb A (jb B X) - jb B (jb A X))
        = jAct D (jb A (jb B X)) - jAct D (jb B (jb A X)) from
      map_sub (jActL D) _ _]
  rw [jAct_jb D hD A (jb B X), jAct_jb D hD B X, jAct_jb D hD B (jb A X), jAct_jb D hD A X]
  simp only [jb, mul_add, add_mul]
  abel

/-! ## Bilinearity vanishing + the real-core gauge annihilation. -/

/-- `innerMul` vanishes when its left multiplier is `0` (bilinearity: `L_0 = 0`). -/
theorem innerMul_zero_left (B : Matrix (Fin 3) (Fin 3) (O ℚ)) : innerMul 0 B = 0 := by
  apply LinearMap.ext; intro X
  simp only [innerMul_apply, jb, Matrix.zero_mul, Matrix.mul_zero, add_zero,
    LinearMap.zero_apply, sub_self]

/-- `innerMul` vanishes when its right multiplier is `0`. -/
theorem innerMul_zero_right (A : Matrix (Fin 3) (Fin 3) (O ℚ)) : innerMul A 0 = 0 := by
  apply LinearMap.ext; intro X
  simp only [innerMul_apply, jb, Matrix.zero_mul, Matrix.mul_zero, add_zero,
    LinearMap.zero_apply, sub_self]

/-- The entrywise gauge annihilates the first real-core matter slot: `jAct D (slotA 1) = 0`, since
    `jAct D (slotA a) = slotA (D a)` (`jAct_slotA`) and `D 1 = 0` (`derivQ_one`). -/
theorem jAct_slotA_one (hD : IsDerivQ D) : jAct D (slotA (1 : O ℚ)) = 0 := by
  rw [jAct_slotA D hD, derivQ_one D hD]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotA, Xz]

/-- The entrywise gauge annihilates the second real-core matter slot: `jAct D (slotB 1) = 0`. -/
theorem jAct_slotB_one (hD : IsDerivQ D) : jAct D (slotB (1 : O ℚ)) = 0 := by
  rw [jAct_slotB D hD, derivQ_one D hD]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotB, Xz]

/-! ## THE HEADLINE — the banked N286 member is gauge-neutral. -/

/-- ★★★ THE GAUGE-NEUTRAL MEMBER. The banked N286 inner-derivation member
    `M0 = innerMul (slotA 1)(slotB 1)` — a genuine member of `f₄ = derH3` escaping `g₂` (N286) —
    COMMUTES with EVERY element of the derived gauge `g₂`:

        `⁅jActL D, innerMul (slotA 1)(slotB 1)⁆ = 0`  for every derivation `D`.

    Immediate from the Leibniz lever (`innerMul_gauge_leibniz`): the matter slots carry the REAL unit
    `1`, which every derivation kills (`jAct_slotA_one`/`jAct_slotB_one`), so both right-hand terms of
    the lever vanish (`innerMul_zero_left`/`innerMul_zero_right`). Coordinate-free.

    STRUCTURAL MEANING (docs/RUNBOOK.md, the ascent's INPUT-A dissolution): the derived `f₄` supplies
    a nonzero member of the inner-derivation complement that commutes with the WHOLE derived gauge —
    the colour-neutral room the vector carriers so(7)/so(8) provably lacked (N283 joint centralizer
    `= 0`); one carrier up, the fold-forced arena, the room appears. -/
theorem M0_gauge_central (hD : IsDerivQ D) :
    ⁅jActL D, innerMul (slotA (1 : O ℚ)) (slotB (1 : O ℚ))⁆ = 0 := by
  rw [innerMul_gauge_leibniz D hD, jAct_slotA_one D hD, jAct_slotB_one D hD,
    innerMul_zero_left, innerMul_zero_right, add_zero]

/-- ★★★ CAPSTONE — a NONZERO, GAUGE-NEUTRAL, GENUINELY-NON-GAUGE member of the derived `f₄`. Bundles:
    (1) `M0 = innerMul (slotA 1)(slotB 1) ∈ derH3` (banked `inner_derivation_in_f4`, N286 — a genuine
        member of `f₄`);
    (2) `M0` commutes with the ENTIRE derived gauge `g₂` (`∀ D, IsDerivQ D → ⁅jActL D, M0⁆ = 0` —
        `M0_gauge_central`, the gauge-neutral room);
    (3) `M0` MOVES the diagonal `Dg 0 0 1` (banked `innerMul_moves_diagonal`, N274) that every gauge
        element FIXES (`jAct_Dg`) — so `M0 ∉ g₂`: genuinely IN the inner-derivation complement `f₄/g₂`;
    (4) carries `jdef Xwit Ywit ≠ 0` (`jordan_fails_H4`) in the TYPE — the arena is genuine only at
        the cap-forced terminal order 3, NOT carrier-agnostic.

    The fold-forced arena `f₄` SUPPLIES a gauge-commuting complement member — the ascent's INPUT-A
    structural dissolution, on the correct carrier. -/
theorem gauge_neutral_inner_derivation_in_f4 :
    innerMul (slotA (1 : O ℚ)) (slotB (1 : O ℚ)) ∈ derH3
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D →
        ⁅jActL D, innerMul (slotA (1 : O ℚ)) (slotB (1 : O ℚ))⁆ = 0)
    ∧ innerMul (slotA 1) (slotB 1) (Dg 0 0 1) ≠ 0
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ d0 d1 d2, jAct D (Dg d0 d1 d2) = 0)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨innerMul_mem_derH3 slotA_one_herm slotB_one_herm,
   fun D hD => M0_gauge_central D hD,
   innerMul_moves_diagonal,
   fun D hD d0 d1 d2 => jAct_Dg D hD d0 d1 d2,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
