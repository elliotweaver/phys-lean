/-
  Phys.Algebra.OctonionJordanGenerationAssociatorDeviation — N310 (seed target T7):
  THE ASSOCIATOR DEVIATION AND THE SEPARATION OF THE TWO GENERATION INVARIANTS.
  ===========================================================================
  SEEDED FLAVOR ROUTE T7 (docs/SEED_FLAVOR_SELF_BLINDNESS.md §2 T7, §1 step 5/6). The directed
  successor of N309 (the generation mass spectrum as a forced cubic). With the Koide balance
  Q = 2/3 banked as an EXACT δ-invariant identity of the ℤ₃-Fourier amplitude cycle (N307), this
  node derives WHY one sector is exact and another deviates, and that the two governing invariants
  are INDEPENDENT.

  THE PICTURE (the theory-native heart of T7). The three generation amplitudes are read off a line
  inside the octonions `O ℚ = CD (H ℚ)`. Two kinds of line occur:

    • THE ASSOCIATIVE ℂ-LINE — the span of the algebra unit and the banked fold-root unit `u1`
      (N6 `complexUnit_sq : u1·u1 = −1`). This line is a copy of the complex numbers: it is
      ASSOCIATIVE, so the octonion associator `[x,y,z] = (x·y)·z − x·(y·z)` VANISHES on it
      (`cline_assoc_zero`), and the calibration cross-term `assoc3` (N209, the totally
      antisymmetric 3-form `= −reQ(x·(y·z))`) also VANISHES on it (`assoc3_cline_zero`). The
      45° self=other Born balance (the `√2`, N306 `forced_sqrt2`) is therefore EXACT: Q = 2/3
      with no cross-term correction.

    • THE OCTONIONIC FANO LINE — three imaginary octonion units on a Fano-plane line (the banked
      non-associating triple `(u2, u1, u1×u2)`). This line is NON-associative: the associator is
      GENUINELY NONZERO (banked `assoc_nonvanishing`, N5b) and the calibration cross-term is
      genuinely nonzero (banked `assoc3_witness : assoc3 u2 u1 (u1×u2) = −1`, N209). So a sector
      read off a Fano line DEVIATES from the exact ℂ-line balance by the associator.

  THE SEPARATION THEOREM (`separation`, `invariants_independent`). The two invariants are
  INDEPENDENT octonion invariants:
    - Q (the Koide/norm invariant) is `Qkoide` of the amplitude magnitudes — a function of the
      NORMS ALONE (the quadratic I₂-type symmetric function). It equals 2/3 on the balanced
      amplitudes regardless of which line they sit on (banked `koide_genVec`); it never sees the
      cross-term.
    - I₃ (the CP/associator invariant) is `assoc3`, the antisymmetric triple product — a function
      of the CROSS-TERM ALONE. It is 0 on the associative ℂ-line and nonzero on the Fano line.
  The mechanism is `assoc_central_homogeneous` / `assoc3_scale`: multiplying the three arguments
  by scalars factors the product `a·b·c` OUT of the invariant. So the invariant's VANISHING is a
  pure DIRECTION property of the line, INDEPENDENT of the magnitudes that fix Q. Changing the
  magnitudes (hence Q) rescales I₃ linearly but cannot turn a vanishing cross-term nonzero or vice
  versa — Q and I₃ are separate coordinates.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "quark", "lepton", "CP", "Koide",
  "generation", "flavor": every theorem below is a pure statement about the banked octonion
  associator `Phys.Algebra.assoc` and the banked calibration 3-form `assoc3` on the ℂ-line
  (`ocR`/`u1`) versus a Fano line (`u2`/`u1`/`u1×u2`) of `O ℚ`, plus `Qkoide` of a rational
  amplitude vector. The physics names do zero logical work.

  NOT FREE-FLOATING (docs/SOUL free-floating rail). Every production type mentions the BANKED
  derived objects: `Phys.Algebra.assoc` (N5b), `assoc3` (N209), `ocR` (N5c), `u1`/`u2` (N6/N26),
  `octCross` (N206), `Qkoide`/`genVec` (N306/N307). Nothing is a generic non-associative-algebra
  statement; the associator and Fano line are the concrete banked ones on `O ℚ`.

  Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no heartbeat inflation, no
  bridge. `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}.
-/
import Phys.Algebra.Alternative
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.OctonionJordanGenerationMassRatios
import Phys.Algebra.OctonionJordanColourCentralizerCosetClosure
import Phys.Algebra.DerivationAutCompact
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

/-! ## 1. THE SEPARATION MECHANISM — central-scaling homogeneity of the associator.

    The banked central embedding `ocR : ℚ → O ℚ` (N5c) is nuclear: it reassociates and commutes
    freely (`ocR_assocL/M/R`, `ocR_comm`). Consequently the magnitudes carried by central scalars
    factor OUT of both the product and the associator. This is why "does the associator vanish?"
    is a property of the DIRECTIONS `u, v, w` alone, decoupled from the magnitudes `a, b, c` that
    fix the norm invariant Q. -/

/-- The scaled product pulls the central scalars out: `(ocR a·u)(ocR b·v) = ocR (a·b)·(u·v)`. -/
theorem scaled_mul (a b : ℚ) (u v : O ℚ) :
    (ocR a * u) * (ocR b * v) = ocR (a * b) * (u * v) := by
  rw [← ocR_assocL, ocR_assocM, ← ocR_comm b u, ← ocR_assocL, ocR_assocL, ocR_mul]

/-- ★ CENTRAL-SCALING HOMOGENEITY OF THE ASSOCIATOR: scaling the three arguments by central real
    scalars factors `ocR (a·b·c)` out of the associator. The associator's VANISHING is therefore a
    direction-only property, independent of the magnitudes — the separation of I₃ from the norms. -/
theorem assoc_central_homogeneous (a b c : ℚ) (u v w : O ℚ) :
    Phys.Algebra.assoc (ocR a * u) (ocR b * v) (ocR c * w)
      = ocR (a * b * c) * Phys.Algebra.assoc u v w := by
  unfold Phys.Algebra.assoc
  rw [scaled_mul, scaled_mul, scaled_mul, scaled_mul,
      show a * (b * c) = a * b * c by ring]
  rw [mul_sub]

/-! ## 2. THE ASSOCIATIVE ℂ-LINE — the associator vanishes (the EXACT sector). -/

/-- The associative complex line: the span of the algebra unit and the banked fold-root unit `u1`
    (`u1·u1 = −1`, N6). A copy of the complex numbers sitting inside `O ℚ`. -/
noncomputable def cline (a b : ℚ) : O ℚ := ocR a + ocR b * u1

/-- ★ ℂ-LINE CLOSURE = COMPLEX MULTIPLICATION: `cline a b · cline c d
    = cline (a·c − b·d) (a·d + b·c)`. The line is closed under the octonion product, and the
    product is the ordinary complex one — because `u1·u1 = −1` and the central scalars reassociate
    (banked `ocR_mul`, `ocR_u1_entry`, `u1_ocR_entry`, `u1_entry_prod`). -/
theorem cline_mul (a b c d : ℚ) :
    cline a b * cline c d = cline (a * c - b * d) (a * d + b * c) := by
  unfold cline
  rw [add_mul, mul_add, mul_add]
  rw [ocR_mul, ocR_u1_entry, u1_ocR_entry, u1_entry_prod]
  rw [ocR_sub, ← ocR_add (a * d) (b * c), add_mul]
  abel

/-- ★★ THE ASSOCIATOR VANISHES ON THE ℂ-LINE: three ℂ-line elements associate, so
    `[cline·, cline·, cline·] = 0`. The associative line has no octonionic distortion — the EXACT
    sector. (Both bracketings reduce, via `cline_mul`, to the same ℂ-line element; complex
    multiplication is associative, so their difference — the associator — is zero.) -/
theorem cline_assoc_zero (a₁ b₁ a₂ b₂ a₃ b₃ : ℚ) :
    Phys.Algebra.assoc (cline a₁ b₁) (cline a₂ b₂) (cline a₃ b₃) = 0 := by
  unfold Phys.Algebra.assoc
  rw [cline_mul, cline_mul, cline_mul, cline_mul]
  rw [show (a₁ * a₂ - b₁ * b₂) * a₃ - (a₁ * b₂ + b₁ * a₂) * b₃
        = a₁ * (a₂ * a₃ - b₂ * b₃) - b₁ * (a₂ * b₃ + b₂ * a₃) by ring,
      show (a₁ * a₂ - b₁ * b₂) * b₃ + (a₁ * b₂ + b₁ * a₂) * a₃
        = a₁ * (a₂ * b₃ + b₂ * a₃) + b₁ * (a₂ * a₃ - b₂ * b₃) by ring]
  rw [sub_self]

/-! ## 3. THE CROSS-TERM I₃ = assoc3 is TRILINEAR — magnitudes factor out. -/

/-- The calibration cross-term `octCross` is left-homogeneous: `octCross (c•x) y = c • octCross x y`.
    (`octCross x y = x·y + gForm x y • 1`; `qsmul_mul_left` + `gForm_smul_left`.) -/
theorem octCross_smul_left (c : ℚ) (x y : O ℚ) :
    octCross (c • x) y = c • octCross x y := by
  unfold octCross
  rw [qsmul_mul_left, gForm_smul_left, smul_add, smul_smul]

/-- The calibration cross-term `octCross` is right-homogeneous: `octCross x (c•y) = c • octCross x y`. -/
theorem octCross_smul_right (c : ℚ) (x y : O ℚ) :
    octCross x (c • y) = c • octCross x y := by
  unfold octCross
  rw [qsmul_mul_right, gForm_smul_right, smul_add, smul_smul]

/-- ★ THE CROSS-TERM `assoc3` IS TRILINEAR (fully homogeneous): scaling the three arguments by
    `a, b, c` factors `a·b·c` out of `assoc3`. So a NONZERO cross-term stays nonzero at any nonzero
    magnitudes, and a zero cross-term stays zero — the deviation cannot be created or destroyed by
    magnitude, only by direction. This is the scalar-I₃ form of `assoc_central_homogeneous`. -/
theorem assoc3_scale (a b c : ℚ) (x y z : O ℚ) :
    assoc3 (a • x) (b • y) (c • z) = a * b * c * assoc3 x y z := by
  unfold assoc3
  rw [octCross_smul_left, octCross_smul_right, smul_smul, gForm_smul_left, gForm_smul_right]
  ring

/-! ## 4. THE ℂ-LINE SCALAR CROSS-TERM I₃ vanishes (I₃ = 0, the EXACT sector). -/

/-- The calibration cross-term `octCross` of two collinear multiples of `u1` vanishes: the two
    imaginary directions are parallel, so their cross product is zero. (`u1·u1 = −1` cancels the
    metric correction `gForm u1 u1 = 1`.) -/
theorem octCross_u1_collinear (b d : ℚ) :
    octCross (b • u1) (d • u1) = 0 := by
  have hg : gForm u1 u1 = 1 := by
    unfold gForm
    simp [u1, reQ, CD.mul_re, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.star_re', Dbl.star_im']
  have hsq : (u1 : O ℚ) * u1 = -1 := Phys.Algebra.complexUnit_sq
  unfold octCross
  rw [qsmul_mul_left, qsmul_mul_right, gForm_smul_left, gForm_smul_right, smul_smul,
      hg, hsq, mul_one, smul_neg, neg_add_cancel]

/-- ★★ THE CROSS-TERM INVARIANT I₃ = `assoc3` VANISHES ON THE ℂ-LINE:
    `assoc3 x (b·u1) (d·u1) = 0`. The associative line carries NO CP-type cross-term — a sector on
    the ℂ-line is exact, no `Re(x₁x₂x₃)` deviation. -/
theorem assoc3_cline_zero (x : O ℚ) (b d : ℚ) :
    assoc3 x (b • u1) (d • u1) = 0 := by
  unfold assoc3
  rw [octCross_u1_collinear]
  show reQ (x * star (0 : O ℚ)) = 0
  rw [star_zero, mul_zero]
  simp [reQ]

/-! ## 5. THE OCTONIONIC FANO LINE — the associator/cross-term is NONZERO (the DEVIATING sector). -/

/-- ★ THE CROSS-TERM I₃ IS NONZERO ON THE FANO LINE: `assoc3 u2 u1 (u1×u2) = −1 ≠ 0` — the banked
    calibration witness (N209). A sector read off the non-associating Fano triple DEVIATES from the
    exact ℂ-line balance by the associator. -/
theorem fano_assoc3_ne_zero : assoc3 u2 u1 (octCross u1 u2) ≠ 0 :=
  assoc3_witness_ne_zero

/-- ★ THE ALGEBRA ASSOCIATOR IS NONZERO ON THE FANO LINE: at the cascade's non-associating triple
    `[ι(ιJ), ι(e₂), e₂] ≠ 0` — the banked witness (N5b). -/
theorem fano_assoc_ne_zero :
    Phys.Algebra.assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0 :=
  Phys.Algebra.assoc_nonvanishing

/-- ★ THE DEVIATION PERSISTS AT ANY MAGNITUDE: scaling the Fano triple by nonzero magnitudes
    `a, b, c` keeps the cross-term nonzero (`assoc3 (a•u2)(b•u1)(c•(u1×u2)) = −a·b·c ≠ 0`). The
    deviation is a property of the DIRECTION (the Fano line), not of the amplitudes. -/
theorem fano_scaled_ne_zero (a b c : ℚ) (ha : a ≠ 0) (hb : b ≠ 0) (hc : c ≠ 0) :
    assoc3 (a • u2) (b • u1) (c • octCross u1 u2) ≠ 0 := by
  rw [assoc3_scale, assoc3_witness]
  simp only [mul_neg, mul_one, ne_eq, neg_eq_zero]
  exact mul_ne_zero (mul_ne_zero ha hb) hc

/-! ## 6. THE SEPARATION THEOREM — Q ⟵ norms (I₂) and I₃ ⟵ cross-term are INDEPENDENT. -/

/-- ★★★ THE SEPARATION THEOREM. The two governing invariants are INDEPENDENT:

    (1) THE NORM INVARIANT Q reads only the amplitude magnitudes: on the balanced amplitudes
        (the Koide-forced `A² = 2M²` over the rational phase conic `3p²+r² = 3`), `Qkoide = 2/3`
        for EVERY phase (banked `koide_genVec`, N307). This value depends on the norms alone; it
        never sees the octonion line.

    (2) THE CROSS-TERM INVARIANT I₃ = `assoc3` VANISHES on the associative ℂ-line
        (`assoc3_cline_zero`) and is NONZERO on the Fano line (`fano_assoc3_ne_zero`). The same
        amplitude magnitudes (same Q = 2/3) give I₃ = 0 on one line and I₃ ≠ 0 on the other.

    So Q and I₃ are separate coordinates: fixing Q does NOT fix I₃, and (by `assoc3_scale`) the
    magnitudes that fix Q cannot flip I₃ between zero and nonzero. Q ⟵ I₂ (the norms) ⊥ I₃ ⟵ the
    associator cross-term. -/
theorem separation :
    (∀ (M A p r : ℚ), 3 * p ^ 2 + r ^ 2 = 3 → M ≠ 0 → A ^ 2 = 2 * M ^ 2 →
        Qkoide (genVec M A p r) = 2 / 3)
    ∧ (∀ (x : O ℚ) (b d : ℚ), assoc3 x (b • u1) (d • u1) = 0)
    ∧ assoc3 u2 u1 (octCross u1 u2) ≠ 0 :=
  ⟨koide_genVec, assoc3_cline_zero, fano_assoc3_ne_zero⟩

/-- ★★ THE INVARIANTS ARE INDEPENDENT (the sharp, magnitude-scaled form). The norm invariant is
    UNTOUCHED by the cross-term and vice versa, exhibited at matched magnitudes `(a, b, c)`:

    • the cross-term I₃ on the ℂ-line is `0` at EVERY magnitude — scaling the amplitudes (which
      changes the norm invariant Q) never makes the associative line deviate;
    • the cross-term I₃ on the Fano line is `−a·b·c`, NONZERO at every nonzero magnitude — scaling
      the amplitudes never removes the Fano deviation.

    A single family of magnitudes therefore realizes BOTH I₃ = 0 (ℂ-line) and I₃ ≠ 0 (Fano line):
    I₃ is not a function of the magnitudes/Q. Q ⟵ norms ⊥ I₃ ⟵ cross-term. -/
theorem invariants_independent (a b c : ℚ) (ha : a ≠ 0) (hb : b ≠ 0) (hc : c ≠ 0) (x : O ℚ) :
    assoc3 (a • x) (b • u1) (c • u1) = 0
      ∧ assoc3 (a • u2) (b • u1) (c • octCross u1 u2) ≠ 0 := by
  refine ⟨?_, fano_scaled_ne_zero a b c ha hb hc⟩
  exact assoc3_cline_zero (a • x) b c

end Phys.Algebra.HJ
