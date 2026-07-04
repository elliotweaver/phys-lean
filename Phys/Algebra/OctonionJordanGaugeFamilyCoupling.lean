import Phys.Algebra.OctonionJordanFamilyRotationGenerators
import Phys.Algebra.OctonionJordanInnerDerivationLeibniz
import Phys.Algebra.DerivationColourIsospinMeet
import Mathlib.Tactic

/-
  Phys.Algebra.OctonionJordanGaugeFamilyCoupling —
  N291: THE GAUGE-COVARIANT, COLOUR-NEUTRAL, FAMILY-VISIBLE COUPLING MEMBER OF f₄ = Der(H₃(O)).

  ------------------------------------------------------------------------------
  THE STORY (theory-native; the ★5 forward beat N290 named).

  The derived arena's Jordan-derivation Lie algebra `f₄ = Der(H₃(O)) = derH3` (N285/N286) splits,
  as a vector space, into three fold-forced pieces (MEASURED, workbench/N291-select/, exact-Fraction
  octonion + numpy nullspaces, all EXIT 0):

      dim f₄ = 52  =  jActL(g₂) [14, the entrywise gauge]
                    ⊕ family-so(3) [3, N288/N289]
                    ⊕ CROSS [35 = 7 × 5].

  N288–N290 built and characterized ONLY the family-so(3) piece and its self-blindness: N290 proved
  the family-rotation `so(3)` fixes exactly the arena's scalar-unit line (the family-invariant core),
  so the family symmetry is BLIND to all generation content — and N290 NAMED the ★5 mass/mixing
  texture's missing ingredient as a *family-symmetry-BREAKING derived object*, NOT a fixed direction
  this arena supplies.

  THIS node banks a concrete, fold-forced member of the CROSS complement — precisely that
  family-breaking object:

      Mc := innerMul (slotA u1) (slotB 1),    u1 = the fold-root √−1 (imaginary), slotA u1 Hermitian.

  Unlike the family generators (`famA/famB/famC`, which are gauge-CENTRAL, N288 `fam_gauge_central`),
  Mc is genuinely gauge-COVARIANT, with the exact DEFINING law

      ★★  ⁅jActL D, Mc⁆ = innerMul (slotA (D u1)) (slotB 1)        (`coupling_covariance`)

  — the SAME coordinate-free Leibniz lever N287 used (`innerMul_gauge_leibniz`), now with only ONE of
  the two multiplier slots carrying the real unit, so exactly one Leibniz term survives. The bracket
  therefore vanishes IFF the gauge derivation kills the fold-root (`D u1 = 0`). This has two forced
  consequences that tie ★5 to ★2:

    • COLOUR-NEUTRAL — every colour derivation kills `u1` (banked `commutes_JO_iff`/`mem_colourCentralizer`,
      the g₂-stabilizer of the fold's √−1 is exactly colour, N201), so `⁅jActL D, Mc⁆ = 0` for colour D
      (`coupling_colour_neutral`). Mc is invisible to colour.
    • ISOSPIN-COVARIANT (W8 TEETH) — the isospin generator `DJ` does NOT kill `u1`
      (`DJ u1 = ιO(−2•hK) ≠ 0`, banked `JO_isospin_not_commute`), so `⁅jActL DJ, Mc⁆ ≠ 0`
      (`coupling_isospin_covariant_ne_zero`): the coupling GENUINELY sees the electroweak sector.

  So the fold-root's colour-blindness (N266) FORCES the family-breaking coupling into the
  colour-neutral / electroweak sector — the ★5↔★2 joint, one cause (`u1`).

  ------------------------------------------------------------------------------
  THE DISSOLUTION / MOAT.

  The field POSITS a Yukawa / flavour-breaking spurion (and the G₂×SU(2) branching embedding) BY
  HAND to break the family symmetry, and CHOOSES the sector it couples to. The theory posits
  NEITHER: the coupling member is FORCED as a concrete element of the derived f₄'s complement of
  (gauge ⊕ family), its transformation law is the fold's own Leibniz lever, and its colour-neutrality
  is forced by the fold-root being colour-blind. A genuine wall (the arbitrary spurion + sector
  choice) dissolves into a forced consequence of the fold.

  ------------------------------------------------------------------------------
  THE ONE CAUSE MANY TERMINATIONS.

  The SAME octonion non-associativity that stops the cascade (N2c), caps the Hermitian Jordan tower
  at 3 (N5) — furnishing exactly THREE matter slots (N267) and their family `so(3)` rotation
  (N288/N289) — makes that rotation blind to the scalar unit (N290); and it furnishes f₄ with a
  gauge↔family COUPLING complement whose fold-root member is colour-neutral and isospin-charged. The
  family symmetry's own breaking is not a posited sector but a forced member of the derived f₄.

  ------------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE. Delete gauge/family/generation/colour/isospin/electroweak/texture: the
  member `innerMul (slotA u1)(slotB 1)` of the `LieSubalgebra derH3` satisfies
  `⁅jActL D, ·⁆ = innerMul (slotA (D u1))(slotB 1)`, which vanishes iff `D u1 = 0`; it is annihilated
  by every `D` killing `u1` and moved by `DJ` (which does not); and it moves the diagonal every
  entrywise image fixes. Pure mathematics — no theorem statement needs a physics word.

  SCOPE. Banks the concrete forced cross-member + its exact covariance law + colour-neutral /
  isospin-charged teeth + escapes-both + non-vacuity. NOT the full 35-dim CROSS complement as a
  module / the (7,5) g₂×so(3) branching character (heavy module-multiplicity, optional hardening);
  NOT the ★2 mixing-angle VALUE (route-not-yet-found — a FORCED build target); NOT the ★5 mass
  texture / CKM–PMNS / Yukawa couplings; NOT "= physical Higgs / flavour-breaking" (removable prose).
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The coupling member and its defining covariance law. -/

/-- `slotA 0 = 0` (the first matter slot is linear at the origin; `slotA a = Xz a 0 0`). -/
theorem slotA_zero : slotA (0 : O ℚ) = 0 := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;> simp [slotA, Xz]

/-- ★★ THE DEFINING COVARIANCE LAW. The entrywise gauge action `jActL D` (N268/N284) acts on the
    coupling member `Mc = innerMul (slotA u1)(slotB 1)` by the coordinate-free Leibniz lever
    `innerMul_gauge_leibniz` (N287). Because ONLY the second multiplier slot `slotB 1` carries the
    real unit (killed by every derivation, `jAct_slotB_one`), exactly one Leibniz term survives:

        ⁅jActL D, innerMul (slotA u1)(slotB 1)⁆ = innerMul (slotA (D u1))(slotB 1).

    Contrast the family generators (both slots real-unit → BOTH terms vanish → gauge-central, N288);
    here the fold-root `u1` in one slot makes the member genuinely gauge-COVARIANT. -/
theorem coupling_covariance (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) :
    ⁅jActL D, innerMul (slotA u1) (slotB (1:O ℚ))⁆
      = innerMul (slotA (D u1)) (slotB 1) := by
  rw [innerMul_gauge_leibniz D hD, jAct_slotA D hD, jAct_slotB_one D hD,
    innerMul_zero_right, add_zero]

/-- The coupling member lies in the derived `f₄ = derH3`: `slotA u1` is Hermitian (`Xz_herm`),
    `slotB 1` is Hermitian, so `innerMul (slotA u1)(slotB 1) ∈ derH3` (banked `innerMul_mem_derH3`,
    N286 — the inner-multiplication commutator of two Hermitian generators is a Jordan derivation). -/
theorem coupling_mem_derH3 :
    innerMul (slotA u1) (slotB (1:O ℚ)) ∈ derH3 :=
  innerMul_mem_derH3 (Xz_herm u1 0 0) slotB_one_herm

/-! ## The gauge-neutrality criterion, and the two forced consequences (colour-neutral, isospin-charged). -/

/-- The coupling is gauge-neutral for `D` EXACTLY when `D` kills the fold-root: substitute `D u1 = 0`
    into the covariance law and `innerMul (slotA 0) = 0` (bilinearity). This is the criterion behind
    both the colour-neutrality (colour kills `u1`) and the isospin-covariance (`DJ u1 ≠ 0`). -/
theorem coupling_gauge_neutral_of_kills_u1 (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (hu1 : D u1 = 0) :
    ⁅jActL D, innerMul (slotA u1) (slotB (1:O ℚ))⁆ = 0 := by
  rw [coupling_covariance D hD, hu1, slotA_zero, innerMul_zero_left]

/-- ★★ COLOUR-NEUTRAL. Every colour derivation kills the fold-root `u1` (banked
    `mem_colourCentralizer` + `commutes_JO_iff` — the derived colour is exactly the g₂-stabilizer of
    the fold's √−1, N201), so the coupling commutes with the entire derived colour subalgebra. Mc is
    invisible to colour — the family-breaking coupling lives in the colour-neutral (electroweak)
    sector, forced by the fold-root's colour-blindness (N266). -/
theorem coupling_colour_neutral (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    ⁅jActL (D : Module.End ℚ (O ℚ)), innerMul (slotA u1) (slotB (1:O ℚ))⁆ = 0 := by
  have hu1 : (D : Module.End ℚ (O ℚ)) u1 = 0 :=
    (commutes_JO_iff (isDerivQ_of_mem D)).mp (mem_colourCentralizer.mp hD)
  exact coupling_gauge_neutral_of_kills_u1 _ (isDerivQ_of_mem D) hu1

/-! ## The coupling genuinely sees the gauge and moves matter (anti-vacuity). -/

/-- The coupling's action on the diagonal `Dg 0 0 1`: the `(1,2)` entry is `star a` (via the banked
    `innerMul_slot_diag`, N274). Generic in the first-slot octonion `a`. -/
theorem coupling_slotA_diag_entry (a : O ℚ) :
    (innerMul (slotA a) (slotB (1:O ℚ)) (Dg 0 0 1)) 1 2 = star a * 1 := by
  rw [innerMul_slot_diag]
  simp only [sub_zero, one_smul, slotC_entry]

/-- If the first-slot octonion is nonzero, the coupling operator is nonzero — it MOVES the diagonal
    `Dg 0 0 1` in a way no zero map could (the `(1,2)` entry is `star a ≠ 0`). -/
theorem coupling_slotA_ne_zero (a : O ℚ) (ha : a ≠ 0) :
    innerMul (slotA a) (slotB (1:O ℚ)) ≠ 0 := by
  intro h
  have hentry : (innerMul (slotA a) (slotB (1:O ℚ)) (Dg 0 0 1)) 1 2
      = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1 2 := by rw [h]; simp
  rw [coupling_slotA_diag_entry, mul_one] at hentry
  simp only [Matrix.zero_apply] at hentry
  exact ha (by
    have hst : star a = 0 := hentry
    have := congrArg (star : O ℚ → O ℚ) hst
    simpa using this)

/-- ★★ W8 TEETH — ISOSPIN-COVARIANT (the coupling GENUINELY sees the gauge). The isospin generator
    `DJ` does NOT kill the fold-root (`DJ u1 = ιO(−2•hK) ≠ 0`, banked `JO_isospin_not_commute`), so
    the covariance law gives `⁅jActL DJ, Mc⁆ = innerMul (slotA (DJ u1))(slotB 1) ≠ 0`. Mc is NOT
    gauge-central like the family — it is genuinely COUPLED to the electroweak sector. -/
theorem coupling_isospin_covariant_ne_zero :
    ⁅jActL (DJ : Module.End ℚ (O ℚ)), innerMul (slotA u1) (slotB (1:O ℚ))⁆ ≠ 0 := by
  rw [coupling_covariance _ (isDerivQ_of_mem DJ)]
  exact coupling_slotA_ne_zero _ (by simpa using JO_isospin_not_commute)

/-- The coupling member MOVES the diagonal `Dg 0 0 1` (the `u1` instance of `coupling_slotA_ne_zero`)
    — an off-diagonal matter entry sourced from a diagonal split, which the entrywise gauge `jActL`
    fixes (`jAct_Dg = 0`, N268). So Mc is genuinely OUTSIDE the entrywise gauge image. -/
theorem coupling_moves_diagonal :
    innerMul (slotA u1) (slotB (1:O ℚ)) (Dg 0 0 1) ≠ 0 := by
  intro h
  have hentry : (innerMul (slotA u1) (slotB (1:O ℚ)) (Dg 0 0 1)) 1 2
      = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1 2 := by rw [h]
  rw [coupling_slotA_diag_entry, mul_one] at hentry
  simp only [Matrix.zero_apply] at hentry
  exact u1_ne_zero (by
    have hst : star u1 = 0 := hentry
    have := congrArg (star : O ℚ → O ℚ) hst
    simpa using this)

/-! ## The capstone. -/

/-- ★★★ N291 — THE GAUGE-COVARIANT, COLOUR-NEUTRAL, FAMILY-VISIBLE COUPLING MEMBER OF f₄. Bundles:
      (1) `Mc = innerMul (slotA u1)(slotB 1) ∈ derH3` (a genuine member of the derived f₄);
      (2) the DEFINING COVARIANCE LAW `⁅jActL D, Mc⁆ = innerMul (slotA (D u1))(slotB 1)` for every
          derivation D — Mc is genuinely gauge-COVARIANT (not gauge-central like the family);
      (3) COLOUR-NEUTRAL — every colour derivation annihilates it (the family-breaking coupling lives
          in the colour-neutral / electroweak sector, forced by the fold-root's colour-blindness);
      (4) ISOSPIN-COVARIANT (W8) — `⁅jActL DJ, Mc⁆ ≠ 0` (it GENUINELY sees the electroweak gauge);
      (5) it MOVES the diagonal every entrywise gauge element fixes (escapes the gauge image).
    Carries `jordan_fails_H4` in the TYPE (cap-forced at order 3, NOT carrier-agnostic). The forced
    family-symmetry-breaking derived object N290 named as ★5's missing ingredient — DERIVED. -/
theorem gauge_family_coupling_member :
    innerMul (slotA u1) (slotB (1:O ℚ)) ∈ derH3
      ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D →
          ⁅jActL D, innerMul (slotA u1) (slotB (1:O ℚ))⁆
            = innerMul (slotA (D u1)) (slotB 1))
      ∧ (∀ (D : derivationLieQ), D ∈ colourCentralizer →
          ⁅jActL (D : Module.End ℚ (O ℚ)), innerMul (slotA u1) (slotB (1:O ℚ))⁆ = 0)
      ∧ ⁅jActL (DJ : Module.End ℚ (O ℚ)), innerMul (slotA u1) (slotB (1:O ℚ))⁆ ≠ 0
      ∧ innerMul (slotA u1) (slotB (1:O ℚ)) (Dg 0 0 1) ≠ 0
      ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨coupling_mem_derH3,
   fun D hD => coupling_covariance D hD,
   fun D hD => coupling_colour_neutral D hD,
   coupling_isospin_covariant_ne_zero,
   coupling_moves_diagonal,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
