import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

/-
  Phys.Algebra.OctonionJordanFamilyRotationGenerators —
  N288: THE DERIVED FAMILY-ROTATION GENERATORS OF THE GAUGE-NEUTRAL ROOM OF `f₄ = Der(H₃(O))` —
        the three inner-multiplication commutators of the REAL-UNIT matter slots are gauge-central
        members of `f₄` that ROTATE the three cap-forced generation slots.

  ------------------------------------------------------------------------------
  THE STORY (theory-native; the ★4↔★2 turn).
  N287 proved the fold-forced arena `f₄ = Der(H₃(O)) = derH3` SUPPLIES a nonzero member `M0 =
  innerMul (slotA 1)(slotB 1)` of the inner-derivation complement that COMMUTES with the entire
  derived gauge `g₂ = Der(O ℚ)` — banked as a single anonymous "gauge-neutral member," with the
  dim-3 room it lives in SCOPED OUT. THIS node identifies that room.

  MEASURED (workbench/N288-select/, exact-Fraction octonion table + numpy nullspaces): the
  centralizer of the WHOLE derived gauge inside `f₄` is EXACTLY 3-dimensional, spanned by the three
  inner-multiplication commutators of the REAL-UNIT matter slots

      famA = innerMul (slotB 1)(slotC 1),  famB = innerMul (slotC 1)(slotA 1),
      famC = innerMul (slotA 1)(slotB 1)   (= N287's `M0`),

  which (1) each lie in `f₄ = derH3`, (2) each COMMUTE with the entire gauge (same N287 lever), and
  (3) ROTATE the three cap-forced matter-carrier slots (N267) into each other: `famC (slotB b) =
  slotA b`, `famC (slotA a) = − slotB a` (the `(1,2)`-generation-plane rotation), `famA (slotC c) =
  slotB c`. They close as `so(3)` (`⁅famA, famB⁆ = famC` cyclically, measured coefficient 1) — the
  CONTINUOUS Lie realization, as INNER derivations inside `f₄`, of the DISCRETE family permutation
  `framePerm` (N273). N287's anonymous `M0` is one of its generation-rotation generators.

  THE DISSOLUTION (docs/RUNBOOK.md, THE ONE LAW). The field POSITS a flavour symmetry group
  (U(3)_F / SU(3)_flavour) and CHOOSES how it acts on the generations, then breaks it by hand
  (Yukawa spurions). The theory DISSOLVES the choice: the family-rotation algebra is the FORCED
  centralizer of the whole derived gauge inside the derived `f₄` — not posited, not chosen. And a
  measured REDIRECT (docs/NODE_SELECTION.md S3): the derived weak-isospin `su(2)_L` (jActL isospin)
  does NOT commute with colour (joint centralizer = 3), so the arc's "colour-commuting su(3)_ew" is
  the GUT-embedding CHOICE the theory dissolves, NOT the derived electroweak container. The honest
  forced content of N287's dim-3 room is the FAMILY-rotation algebra `so(3) = Der(J₃(ℝ))`.

  ONE CAUSE, MANY TERMINATIONS. The SAME octonion non-associativity that stops the cascade (N2c),
  caps the Hermitian Jordan tower at 3 (N5) — furnishing EXACTLY THREE matter-carrier slots (N267)
  — makes matter indivisible (N265) and the arena formally real (N270), now furnishes the arena's
  gauge-neutral room with the CONTINUOUS rotation of those three slots: the family-rotation algebra.

  SCOPE (docs/RUNBOOK.md W4.5 — SUFFICIENT; the heavy item childed, not folded in silently). BANKS
  the three gauge-central family-rotation generators (membership in `f₄`, gauge-centrality, the
  generation-rotation actions, non-vacuity). Does NOT bank: the FULL `so(3)` closure `⁅famA, famB⁆
  = famC` (an End-identity over the non-associative matrix ring — a heavy coordinate computation,
  childed as the directed next node); the bundled `= Der(J₃(ℝ))` LieHom; the S₃ ⊂ so(3) embedding
  vs N273 `framePerm`; the ★2 mixing VALUE (route-not-yet-found — a FORCED build target, NOT
  invented, NOT human-gated); and `= physical 3 generations / flavour SU(3)` (removable prose).

  PHYSICS-WORDS-REMOVABLE. Delete family/generation/flavour/gauge/colour: three members of the
  `LieSubalgebra derH3` — inner-multiplication commutators of the real-unit slots — each commute
  with the whole `jActL`-image of `derivationLieQ`, and `innerMul (slotA 1)(slotB 1)` sends
  `slotB b ↦ slotA b`, `slotA a ↦ − slotB a`. Pure math; physics lives only in identifiers/comments.
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000

variable (D : Module.End ℚ (O ℚ))

/-! ## `slotC` of the real unit is Hermitian; the real-core annihilation + slot linearity helpers. -/

/-- The third real-unit slot is Hermitian (`Xz_herm` at `(0,0,1)`). -/
theorem slotC_one_herm : (slotC (1 : O ℚ))ᴴ = slotC 1 := Xz_herm 0 0 1

/-- The entrywise gauge annihilates the third real-core matter slot: `jAct D (slotC 1) = 0`. -/
theorem jAct_slotC_one (hD : IsDerivQ D) : jAct D (slotC (1 : O ℚ)) = 0 := by
  rw [jAct_slotC D hD, derivQ_one D hD]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotC, Xz]

/-- `slotB 0 = 0`. -/
theorem slotB_zero : slotB (0 : O ℚ) = 0 := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;> simp [slotB, Xz]

/-- `slotB (-a) = - slotB a` (from `slotB_sub`). -/
theorem slotB_neg (a : O ℚ) : slotB (-a) = - slotB a := by
  have := slotB_sub 0 a; rw [slotB_zero, zero_sub, zero_sub] at this; exact this

/-! ## Same-slot squares — the diagonal image of an inner multiplication (via the trace identity). -/

/-- `jb (slotA 1)(slotA a) = Dg (2 reQ a)(2 reQ a) 0` — the same-slot Jordan product lands on the
    diagonal, the real trace `star a + a = (2 reQ a) • 1` (`trace_id`). -/
theorem jb_slotA1_slotA (a : O ℚ) :
    jb (slotA (1:O ℚ)) (slotA a) = Dg (2 * reQ a) (2 * reQ a) 0 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
  first
  | (show (jb (slotA (1:O ℚ)) (slotA a)) 0 0 = _
     rw [show (jb (slotA (1:O ℚ)) (slotA a)) 0 0 = star a + a by
           simp [jb, slotA, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         add_comm, trace_id a]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (show (jb (slotA (1:O ℚ)) (slotA a)) 1 1 = _
     rw [show (jb (slotA (1:O ℚ)) (slotA a)) 1 1 = a + star a by
           simp [jb, slotA, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         trace_id a]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (simp [jb, slotA, Xz, Dg, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three,
        Matrix.diagonal, ocR_zero])

/-- `jb (slotB 1)(slotB b) = Dg (2 reQ b) 0 (2 reQ b)`. -/
theorem jb_slotB1_slotB (b : O ℚ) :
    jb (slotB (1:O ℚ)) (slotB b) = Dg (2 * reQ b) 0 (2 * reQ b) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
  first
  | (show (jb (slotB (1:O ℚ)) (slotB b)) 0 0 = _
     rw [show (jb (slotB (1:O ℚ)) (slotB b)) 0 0 = star b + b by
           simp [jb, slotB, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         add_comm, trace_id b]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (show (jb (slotB (1:O ℚ)) (slotB b)) 2 2 = _
     rw [show (jb (slotB (1:O ℚ)) (slotB b)) 2 2 = b + star b by
           simp [jb, slotB, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         trace_id b]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (simp [jb, slotB, Xz, Dg, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three,
        Matrix.diagonal, ocR_zero])

/-- `jb (slotC 1)(slotC c) = Dg 0 (2 reQ c)(2 reQ c)`. -/
theorem jb_slotC1_slotC (c : O ℚ) :
    jb (slotC (1:O ℚ)) (slotC c) = Dg 0 (2 * reQ c) (2 * reQ c) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
  first
  | (show (jb (slotC (1:O ℚ)) (slotC c)) 1 1 = _
     rw [show (jb (slotC (1:O ℚ)) (slotC c)) 1 1 = star c + c by
           simp [jb, slotC, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         add_comm, trace_id c]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (show (jb (slotC (1:O ℚ)) (slotC c)) 2 2 = _
     rw [show (jb (slotC (1:O ℚ)) (slotC c)) 2 2 = c + star c by
           simp [jb, slotC, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         trace_id c]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (simp [jb, slotC, Xz, Dg, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three,
        Matrix.diagonal, ocR_zero])

/-! ## The three family-rotation generators are members of `f₄ = derH3`. -/

/-- `famC = innerMul (slotA 1)(slotB 1) ∈ f₄` (banked `innerMul_mem_derH3`; the real-unit slots are
    Hermitian). This is N287's `M0`. -/
theorem famC_mem_derH3 : innerMul (slotA (1:O ℚ)) (slotB 1) ∈ derH3 :=
  innerMul_mem_derH3 slotA_one_herm slotB_one_herm

/-- `famA = innerMul (slotB 1)(slotC 1) ∈ f₄`. -/
theorem famA_mem_derH3 : innerMul (slotB (1:O ℚ)) (slotC 1) ∈ derH3 :=
  innerMul_mem_derH3 slotB_one_herm slotC_one_herm

/-- `famB = innerMul (slotC 1)(slotA 1) ∈ f₄`. -/
theorem famB_mem_derH3 : innerMul (slotC (1:O ℚ)) (slotA 1) ∈ derH3 :=
  innerMul_mem_derH3 slotC_one_herm slotA_one_herm

/-! ## Each family generator COMMUTES with the ENTIRE derived gauge (the N287 Leibniz lever). -/

/-- `famC` is gauge-central (N287's `M0_gauge_central`). -/
theorem famC_gauge_central (hD : IsDerivQ D) :
    ⁅jActL D, innerMul (slotA (1:O ℚ)) (slotB 1)⁆ = 0 :=
  M0_gauge_central D hD

/-- `famA` is gauge-central — both multiplier slots carry the real unit, killed by every derivation
    (`jAct_slotB_one`/`jAct_slotC_one`), so the Leibniz lever `innerMul_gauge_leibniz` vanishes. -/
theorem famA_gauge_central (hD : IsDerivQ D) :
    ⁅jActL D, innerMul (slotB (1:O ℚ)) (slotC 1)⁆ = 0 := by
  rw [innerMul_gauge_leibniz D hD, jAct_slotB_one D hD, jAct_slotC_one D hD,
    innerMul_zero_left, innerMul_zero_right, add_zero]

/-- `famB` is gauge-central. -/
theorem famB_gauge_central (hD : IsDerivQ D) :
    ⁅jActL D, innerMul (slotC (1:O ℚ)) (slotA 1)⁆ = 0 := by
  rw [innerMul_gauge_leibniz D hD, jAct_slotC_one D hD, jAct_slotA_one D hD,
    innerMul_zero_left, innerMul_zero_right, add_zero]

/-! ## THE GENERATION-ROTATION ACTIONS — the generators mix the three matter slots. -/

/-- ★★ `famC (slotB b) = slotA b`: the generation rotation sends the second matter-carrier copy to
    the first. Via the same-slot square (`jb_slotB1_slotB`) + the diagonal weight action
    (`jb_Dg_slotA`) + the banked cross-products (`jb_slotA_slotB`/`jb_slotB_slotC`, N272) +
    `trace_id`. -/
theorem famC_slotB (b : O ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotB b) = slotA b := by
  rw [innerMul_apply, jb_slotB1_slotB,
    jb_comm (slotA (1:O ℚ)) (Dg (2*reQ b) 0 (2*reQ b)), jb_Dg_slotA,
    jb_slotA_slotB, star_one, one_mul, jb_slotB_slotC, one_mul, ← slotA_sub]
  congr 1
  rw [add_zero, mul_one]
  have hb : ocR (2 * reQ b) = star b + b := by
    rw [show ocR (2 * reQ b) = (2 * reQ b) • (1:O ℚ) from by rw [← ocRmulL (2 * reQ b) 1, mul_one]]
    rw [add_comm]; exact (trace_id b).symm
  rw [hb]; abel

/-- ★★ `famC (slotA a) = − slotB a`: the generation rotation sends the first matter-carrier copy to
    minus the second. Together with `famC_slotB` this is the rotation of the `(slotA, slotB)`
    generation plane. -/
theorem famC_slotA (a : O ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotA a) = - slotB a := by
  rw [innerMul_apply, jb_comm (slotB (1:O ℚ)) (slotA a), jb_slotA_slotB, mul_one,
    jb_comm (slotA (1:O ℚ)) (slotC (star a)), jb_slotC_slotA, one_mul,
    jb_slotA1_slotA, jb_comm (slotB (1:O ℚ)) (Dg (2*reQ a) (2*reQ a) 0), jb_Dg_slotB,
    ← slotB_neg, ← slotB_sub]
  congr 1
  rw [add_zero, mul_one]
  have ha : ocR (2 * reQ a) = star a + a := by
    rw [show ocR (2 * reQ a) = (2 * reQ a) • (1:O ℚ) from by rw [← ocRmulL (2 * reQ a) 1, mul_one]]
    rw [add_comm]; exact (trace_id a).symm
  rw [ha]; abel

/-- ★★ `famA (slotC c) = slotB c`: the second generator rotates the `(slotB, slotC)` plane. -/
theorem famA_slotC (c : O ℚ) :
    innerMul (slotB (1:O ℚ)) (slotC 1) (slotC c) = slotB c := by
  rw [innerMul_apply, jb_slotC1_slotC,
    jb_comm (slotB (1:O ℚ)) (Dg 0 (2*reQ c) (2*reQ c)), jb_Dg_slotB,
    jb_slotB_slotC, one_mul, jb_slotC_slotA, mul_one, ← slotB_sub]
  congr 1
  rw [zero_add, mul_one]
  have hc : ocR (2 * reQ c) = c + star c := by
    rw [show ocR (2 * reQ c) = (2 * reQ c) • (1:O ℚ) from by rw [← ocRmulL (2 * reQ c) 1, mul_one]]
    exact (trace_id c).symm
  rw [hc]; abel

/-! ## W8 non-vacuity — the rotation genuinely mixes generations. -/

/-- `slotA (1 : O ℚ) ≠ 0` (its `(0,1)` entry is `1 ≠ 0`). -/
theorem slotA_one_ne_zero : slotA (1 : O ℚ) ≠ 0 := by
  intro h
  have hentry : (slotA (1:O ℚ)) 0 1 = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 1 := by rw [h]
  rw [slotA_entry] at hentry
  simp only [Matrix.zero_apply] at hentry
  have : reQ (1 : O ℚ) = reQ (0 : O ℚ) := by rw [hentry]
  simp only [reQ] at this; norm_num at this

/-- The generation rotation is non-vacuous: `famC (slotB 1) = slotA 1 ≠ 0` — the second generation
    is genuinely rotated into the (nonzero) first. -/
theorem famC_slotB_ne_zero : innerMul (slotA (1:O ℚ)) (slotB 1) (slotB 1) ≠ 0 := by
  rw [famC_slotB]; exact slotA_one_ne_zero

/-! ## THE CAPSTONE — the derived family-rotation generators of the gauge-neutral room. -/

/-- ★★★ CAPSTONE — THE FAMILY-ROTATION GENERATORS OF THE GAUGE-NEUTRAL ROOM. The three
    inner-multiplication commutators of the REAL-UNIT matter slots
    `famA = innerMul (slotB 1)(slotC 1)`, `famB = innerMul (slotC 1)(slotA 1)`,
    `famC = innerMul (slotA 1)(slotB 1)` (= N287's banked gauge-neutral member `M0`) are:
    (1) each a member of the derived `f₄ = derH3`;
    (2) each COMMUTES with the ENTIRE derived gauge `g₂` (for every derivation `D`);
    (3) GENERATION ROTATIONS — `famC` sends `slotB b ↦ slotA b` and `slotA a ↦ − slotB a`
        (the `(1,2)`-generation-plane rotation), `famA` sends `slotC c ↦ slotB c` — so they MIX the
        three cap-forced matter-carrier copies (N267), the continuous realization of the discrete
        family permutation `framePerm` (N273) as INNER derivations inside `f₄`;
    (4) `famC (slotB 1) = slotA 1 ≠ 0` — the rotation is genuinely non-vacuous;
    (5) carries `jdef Xwit Ywit ≠ 0` (`jordan_fails_H4`) in the TYPE — the arena is genuine only at
        the cap-forced terminal order 3, NOT carrier-agnostic.

    The gauge-neutral room of the fold-forced arena `f₄` is the derived FAMILY-ROTATION algebra;
    N287's anonymous `M0` is one of its generation-rotation generators. Its full so(3) closure
    `⁅famA, famB⁆ = famC` cyclic — a heavy End-identity over the non-associative matrix ring — is
    the directed next node. -/
theorem family_rotation_generators :
    innerMul (slotB (1:O ℚ)) (slotC 1) ∈ derH3
    ∧ innerMul (slotC (1:O ℚ)) (slotA 1) ∈ derH3
    ∧ innerMul (slotA (1:O ℚ)) (slotB 1) ∈ derH3
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D →
        ⁅jActL D, innerMul (slotA (1:O ℚ)) (slotB 1)⁆ = 0
        ∧ ⁅jActL D, innerMul (slotB (1:O ℚ)) (slotC 1)⁆ = 0
        ∧ ⁅jActL D, innerMul (slotC (1:O ℚ)) (slotA 1)⁆ = 0)
    ∧ (∀ b : O ℚ, innerMul (slotA (1:O ℚ)) (slotB 1) (slotB b) = slotA b)
    ∧ (∀ a : O ℚ, innerMul (slotA (1:O ℚ)) (slotB 1) (slotA a) = - slotB a)
    ∧ (∀ c : O ℚ, innerMul (slotB (1:O ℚ)) (slotC 1) (slotC c) = slotB c)
    ∧ innerMul (slotA (1:O ℚ)) (slotB 1) (slotB 1) ≠ 0
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨famA_mem_derH3, famB_mem_derH3, famC_mem_derH3,
   fun D hD => ⟨famC_gauge_central D hD, famA_gauge_central D hD, famB_gauge_central D hD⟩,
   famC_slotB, famC_slotA, famA_slotC, famC_slotB_ne_zero, jordan_fails_H4⟩

end Phys.Algebra.HJ
