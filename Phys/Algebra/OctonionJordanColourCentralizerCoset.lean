import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

/-
  Phys.Algebra.OctonionJordanColourCentralizerCoset —
  N292: THE FOLD-ROOT-DRESSED FAMILY-BREAKING COSET of the derived colour-centralizer in f₄.

  ------------------------------------------------------------------------------
  THE STORY (theory-native; the ★5↔★4↔★2 forward beat).

  N287 measured (never banked) that the centralizer of the derived colour su(3) inside the derived
  `f₄ = Der(H₃(O))` is a dim-8 SIMPLE su(3), of which the banked family `so(3)` (N288/N289) is the
  maximal compact and a 5-dim COSET is the symmetric complement. N291 built ONE member of that
  complement (`Mc = innerMul (slotA u1)(slotB 1)`, the fold-root-dressed family-breaking coupling).

  THIS node builds the full off-diagonal coset as the fold-root DRESSING of the three family
  generators, and shows it is the family-symmetry-BREAKING sector:

      kAB := innerMul (slotA u1)(slotB 1)   [= N291's Mc],
      kBC := innerMul (slotB u1)(slotC 1),
      kCA := innerMul (slotC u1)(slotA 1),

  each obtained from a family generator `famC = innerMul (slotA 1)(slotB 1)` (etc.) by replacing the
  first real-unit slot with the fold-root `u1`. Where the family generators are gauge-CENTRAL and
  ROTATE the three matter slots cleanly (N288: `famC (slotB b) = slotA b`), the fold-root-dressed
  members are colour-NEUTRAL (the fold-root is colour-blind, N266/N291) and rotate the slots with a
  fold-root DRESSING:

      ★  kAB (slotA 1) = slotB u1,   kAB (slotB 1) = slotA u1,   kAB (slotC 1) = 0.

  So the family-breaking coset MOVES the three generations exactly like the family symmetry, but
  through the fold's own √−1 — it is the "square-root" of the family rotation (the u1-dressing that
  enhances the observed family `so(3)` to the full derived `su(3) = Z_{f4}(colour)`).

  ------------------------------------------------------------------------------
  THE DISSOLUTION / MOAT.

  The field POSITS `F₄ ⊃ SU(3)_c × SU(3)_flavour` and CHOOSES the SU(3)_flavour → SO(3) breaking
  pattern by hand (a flavour spurion). The theory DERIVES `SU(3)_flavour = Z_{f4}(colour)` (the
  centralizer of derived colour inside derived f₄) and its breaking to the observed family `so(3)`
  as the FOLD-ROOT `u1` dressing — the coset IS `u1·(family)`, colour-neutral because `u1` is
  colour-blind. No embedding chosen, no breaking posited.

  ------------------------------------------------------------------------------
  THE ONE CAUSE MANY TERMINATIONS.

  The SAME octonion non-associativity that stops the cascade (N2c), caps the Hermitian Jordan tower
  at 3 (N5) — furnishing three matter slots (N267), the family `so(3)` (N288/N289) and its
  self-blindness (N290) — furnishes the derived `f₄` with the fold-root-dressed family-breaking
  coset that moves the generations through the fold's own √−1.

  ------------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE. Delete colour/family/generation/flavour/breaking: the three members
  `innerMul (slotA u1)(slotB 1)`, `innerMul (slotB u1)(slotC 1)`, `innerMul (slotC u1)(slotA 1)`
  of the `LieSubalgebra derH3` are annihilated by every derivation killing `u1` (colour), and act on
  the real-unit slots by `innerMul (slotA u1)(slotB 1)(slotA 1) = slotB u1` etc. Pure mathematics.

  SCOPE. Banks the three fold-root-dressed coset members + their derH3 membership + colour-neutrality
  + their generation-slot (u1-dressed rotation) actions + non-vacuity. NOT the su(3)/so(3)
  symmetric-pair CLOSURE `⁅kAB, kBC⁆ = famB` (the heavier operator identity — CHILDED as a directed
  W1 dissolution node, the exact N288→N289 analog); NOT the full 8-dim su(3) as a bundled
  LieSubalgebra; NOT the ★2 mixing-angle VALUE (route-not-yet-found); NOT "= physical SU(3)_flavour".
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The three fold-root-dressed coset members and their derH3 membership. -/

/-- The second coset member `kBC = innerMul (slotB u1)(slotC 1) ∈ derH3`: `slotB u1 = Xz 0 u1 0`
    and `slotC 1` are Hermitian, so their inner-multiplication commutator is a Jordan derivation of
    the Hermitian arena (banked `innerMul_mem_derH3`, N286). -/
theorem cosetBC_mem_derH3 :
    innerMul (slotB u1) (slotC (1:O ℚ)) ∈ derH3 :=
  innerMul_mem_derH3 (Xz_herm 0 u1 0) slotC_one_herm

/-- The third coset member `kCA = innerMul (slotC u1)(slotA 1) ∈ derH3`. -/
theorem cosetCA_mem_derH3 :
    innerMul (slotC u1) (slotA (1:O ℚ)) ∈ derH3 :=
  innerMul_mem_derH3 (Xz_herm 0 0 u1) slotA_one_herm

/-! ## Colour-neutrality of the coset (the fold-root is colour-blind). -/

/-- The second coset member is COLOUR-NEUTRAL: every colour derivation `D` kills the fold-root `u1`
    (banked `mem_colourCentralizer`/`commutes_JO_iff`, N201), so the covariance law
    `⁅jActL D, innerMul (slotB u1)(slotC 1)⁆ = innerMul (slotB (D u1))(slotC 1)` (the N287 Leibniz
    lever with only the second slot real-unit) vanishes. -/
theorem cosetBC_colour_neutral (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    ⁅jActL (D : Module.End ℚ (O ℚ)), innerMul (slotB u1) (slotC (1:O ℚ))⁆ = 0 := by
  have hu1 : (D : Module.End ℚ (O ℚ)) u1 = 0 :=
    (commutes_JO_iff (isDerivQ_of_mem D)).mp (mem_colourCentralizer.mp hD)
  rw [innerMul_gauge_leibniz _ (isDerivQ_of_mem D), jAct_slotB D (isDerivQ_of_mem D),
      jAct_slotC_one D (isDerivQ_of_mem D), hu1, slotB_zero, innerMul_zero_left,
      innerMul_zero_right, add_zero]

/-! ## The generation-slot actions — the fold-root-dressed rotation (family-VISIBLE). -/

private theorem reQ_u1 : reQ (u1 : O ℚ) = 0 := by simp [reQ, u1]

private theorem Dg000_zero : (Dg 0 0 0 : Matrix (Fin 3) (Fin 3) (O ℚ)) = 0 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [Dg, ocR, Matrix.diagonal, Matrix.zero_apply] <;> rfl

/-- ★ `kAB (slotA 1) = slotB u1`: the fold-root-dressed rotation sends the first generation slot to
    the second, dressed by the fold-root `u1`. (Contrast the family `famC (slotB 1) = slotA 1`,
    N288 — undressed.) Via `innerMul_apply` + banked `jb`-slot products. -/
theorem kAB_slotA_one :
    (innerMul (slotA u1) (slotB (1:O ℚ))) (slotA 1) = slotB u1 := by
  rw [innerMul_apply]
  -- jb (slotB 1)(slotA 1) = jb (slotA 1)(slotB 1) = slotC (star 1 * 1) = slotC 1
  rw [jb_comm (slotB 1) (slotA 1), jb_slotA_slotB 1 1]; simp only [star_one, mul_one]
  -- jb (slotA u1)(slotC 1) = jb (slotC 1)(slotA u1) = slotB (u1 * 1) = slotB u1
  rw [jb_comm (slotA u1) (slotC 1), jb_slotC_slotA u1 1]; simp only [mul_one]
  -- jb (slotB 1)(jb (slotA u1)(slotA 1))
  rw [jb_comm (slotA u1) (slotA 1), jb_slotA1_slotA u1, reQ_u1]
  simp only [mul_zero]; rw [Dg000_zero]
  rw [show jb (slotB (1:O ℚ)) (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) = 0 from by simp [jb], sub_zero]

/-- ★ `kAB (slotB 1) = slotA u1`: the fold-root-dressed rotation sends the second generation slot to
    the first, dressed by `u1`.
    `innerMul (slotA u1)(slotB 1)(slotB 1) = jb (slotA u1)(jb (slotB 1)(slotB 1)) − jb (slotB 1)(jb (slotA u1)(slotB 1))`.
    `jb (slotB 1)(slotB 1) = Dg 2 0 2`; `jb (slotA u1)(Dg 2 0 2) = jb (Dg 2 0 2)(slotA u1) = slotA (2·u1)`.
    `jb (slotA u1)(slotB 1) = slotC (star u1)`; `jb (slotB 1)(slotC (star u1)) = slotA (star (star u1)) = slotA u1`.
    `slotA (2·u1) − slotA u1 = slotA u1`. -/
theorem kAB_slotB_one :
    (innerMul (slotA u1) (slotB (1:O ℚ))) (slotB 1) = slotA u1 := by
  rw [innerMul_apply]
  have hr1 : reQ (1 : O ℚ) = 1 := by simp [reQ]
  -- first term: jb (slotA u1)(jb (slotB 1)(slotB 1)) = slotA (ocR 2 * u1)
  rw [jb_slotB1_slotB 1, hr1, jb_comm (slotA u1) (Dg (2 * 1) 0 (2 * 1)),
      jb_Dg_slotA (2 * 1) 0 (2 * 1) u1]
  -- second term: jb (slotB 1)(jb (slotA u1)(slotB 1))
  rw [jb_slotA_slotB u1 1]; simp only [mul_one]
  rw [jb_slotB_slotC 1 (star u1)]
  simp only [one_mul, star_star]
  -- goal: slotA (ocR (2*1+0) * u1) - slotA u1 = slotA u1
  rw [show (ocR (2 + 0) * u1 : O ℚ) = u1 + u1 from by
        rw [show (2 + 0 : ℚ) = 2 from by ring, ocRmulL, two_smul]]
  rw [slotA_add]
  abel

/-- ★ `kAB (slotC 1) = 0`: the third generation slot is FIXED by the coset member (it acts only on
    the A↔B slots it dresses, like the family `famC`). Via `innerMul_apply` + banked `jb`-products.
    `jb (slotB 1)(slotC 1) = slotA 1`; `jb (slotA u1)(slotA 1) = Dg 0 0 0 = 0`.
    `jb (slotA u1)(slotC 1) = slotB u1`; `jb (slotB 1)(slotB u1) = Dg 0 0 0 = 0`. -/
theorem kAB_slotC_one :
    (innerMul (slotA u1) (slotB (1:O ℚ))) (slotC 1) = 0 := by
  rw [innerMul_apply]
  rw [jb_slotB_slotC 1 1]; simp only [star_one, mul_one]
  rw [jb_comm (slotA u1) (slotA 1), jb_slotA1_slotA u1, reQ_u1]
  simp only [mul_zero]; rw [Dg000_zero]
  rw [jb_comm (slotA u1) (slotC 1), jb_slotC_slotA u1 1]
  simp only [mul_one]
  rw [jb_slotB1_slotB u1, reQ_u1]
  simp only [mul_zero]; rw [Dg000_zero, sub_zero]

/-! ## Anti-vacuity (W8) — the coset genuinely MOVES the generations (family-VISIBLE). -/

/-- W8: the coset member `kAB` is nonzero and genuinely moves the first generation slot
    (`kAB (slotA 1) = slotB u1 ≠ 0`) — it is NOT in the family-blind core (N290), so the family
    symmetry SEES it. Certifies non-vacuity of the fold-root-dressed coset. -/
theorem kAB_moves_generation :
    (innerMul (slotA u1) (slotB (1:O ℚ))) (slotA 1) ≠ 0 := by
  rw [kAB_slotA_one]
  intro h
  -- slotB u1 = 0 forces u1 = 0
  have : (slotB u1) 0 2 = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 2 := by rw [h]
  simp only [slotB, Xz, Matrix.zero_apply] at this
  exact u1_ne_zero this

/-! ## The capstone. -/

/-- ★★★ N292 — THE FOLD-ROOT-DRESSED FAMILY-BREAKING COSET. Bundles:
      (1) the two further coset members `kBC, kCA ∈ derH3` (with N291's `kAB`, the three off-diagonal
          fold-root-dressed members of the CROSS complement of gauge ⊕ family);
      (2) COLOUR-NEUTRAL — every colour derivation annihilates `kBC` (the fold-root is colour-blind);
      (3) the GENERATION-ROTATION ACTIONS — `kAB` sends `slotA 1 ↦ slotB u1`, `slotB 1 ↦ slotA u1`,
          `slotC 1 ↦ 0`: the fold-root-DRESSED analog of the family rotation (contrast the undressed
          family `famC`, N288), moving the three generations through the fold's own √−1;
      (4) FAMILY-VISIBLE (W8) — `kAB` genuinely moves a generation (NOT in N290's family-blind core).
    Carries `jordan_fails_H4` in the TYPE (cap-forced order 3). The full off-diagonal family-breaking
    coset of the derived colour-centralizer su(3), DERIVED as the fold-root dressing of the family. -/
theorem colour_centralizer_coset :
    innerMul (slotB u1) (slotC (1:O ℚ)) ∈ derH3
      ∧ innerMul (slotC u1) (slotA (1:O ℚ)) ∈ derH3
      ∧ (∀ (D : derivationLieQ), D ∈ colourCentralizer →
          ⁅jActL (D : Module.End ℚ (O ℚ)), innerMul (slotB u1) (slotC (1:O ℚ))⁆ = 0)
      ∧ (innerMul (slotA u1) (slotB (1:O ℚ))) (slotA 1) = slotB u1
      ∧ (innerMul (slotA u1) (slotB (1:O ℚ))) (slotB 1) = slotA u1
      ∧ (innerMul (slotA u1) (slotB (1:O ℚ))) (slotC 1) = 0
      ∧ (innerMul (slotA u1) (slotB (1:O ℚ))) (slotA 1) ≠ 0
      ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨cosetBC_mem_derH3, cosetCA_mem_derH3,
   fun D hD => cosetBC_colour_neutral D hD,
   kAB_slotA_one, kAB_slotB_one, kAB_slotC_one, kAB_moves_generation, jordan_fails_H4⟩

end Phys.Algebra.HJ
