import Phys.Algebra.OctonionJordanColourFlavourCommutingPair
import Phys.Algebra.OctonionJordanInnerDerivationLeibniz
import Phys.Algebra.OctonionJordanFormallyReal
import Mathlib.Tactic

/-
  Phys.Algebra.OctonionJordanSpectrumMovingSector —
  N295: THE SPECTRUM-MOVING SECTOR BEYOND f₄ — the traceless Jordan left-multiplications
  MOVE the identity that every derivation fixes (the first rung of the reduced structure
  algebra e₆ ⊃ f₄).

  ------------------------------------------------------------------------------
  THE STORY (theory-native; the ★5/★2 structural ceiling NAMED and its resolution BUILT).

  The N287→N294 sub-arc fully characterized the INTERNAL structure of the derived
  `f₄ = Der(H₃(O)) = derH3` (N285/N286): two derived `su(3)`'s (gauge-colour and
  family-flavour) and their commuting relation. But `f₄` has a hard STRUCTURAL CEILING that
  every mass/mixing front kept hitting (N269, N275, N290, N291): every derivation `T ∈ f₄`
  PRESERVES the arena's spectrum — the cubic norm `jN`, the spur `jS`, and (banked N269) the
  whole characteristic polynomial. In particular every derivation KILLS the identity,
  `T 1 = 0` (`derH3_kills_one`), so `f₄` fixes the maximally-degenerate spectral point
  `1 = diag(1,1,1)` (eigenvalues `{1,1,1}`). No element of `f₄` can lift that degeneracy —
  which is exactly why a mass/mixing TEXTURE (a split spectrum) cannot be forced from `f₄`.

  This node builds the object BEYOND `f₄` that DOES move the spectrum: the Jordan
  LEFT-MULTIPLICATION `Lmul A X = jb A X = A*X + X*A` (banked N274), the fold's own
  symmetric-product action. Unlike a derivation, for `A ≠ 0` it MOVES the identity:

      Lmul A 1 = A + A   (`Lmul_one`),   ≠ 0 for A = slotA 1   (`Lmul_moves_one_ne`).

  So `Lmul (slotA 1)` is NOT a derivation — it is genuinely OUTSIDE `f₄`
  (`Lmul_notMem_derH3`): the first member of the spectrum-MOVING complement. Its size is not
  arbitrary: `reQ (jTraceForm A A) = 2 * jQ A ≥ 0` (`spectrum_motion_positive`, N270), the
  fold's positive-definite trace form — the motion is measured by the Born metric.

  And the spectrum-movers CLOSE BACK into the spectrum-preservers: the commutator of two
  left-multiplications is an inner derivation, `⁅Lmul A, Lmul B⁆ = innerMul A B ∈ derH3`
  (`spectrum_movers_close_into_derH3`, banked N286). So `f₄` together with the traceless
  left-multiplications `L₀` closes to a SINGLE larger derived Lie algebra — the reduced
  structure algebra `e₆ = f₄ ⊕ L₀`, `dim 78 = 52 + 26` (measured exact; the full closure is
  CHILDED as the next rung). This node banks the FIRST spectrum-mover and the ceiling it breaks.

  ------------------------------------------------------------------------------
  THE DISSOLUTION / MOAT.

  Standard physics has `F₄ = Aut(J₃(O))` as the norm-preserving (spectrum-preserving) group,
  invokes the reduced structure group `E₆` that MOVES the norm by hand, and POSITS the
  Yukawa / mass-splitting sector as a spurion bolted onto the gauge structure. The theory
  DISSOLVES "where does the spectrum-splitting come from": the splitting generators are the
  DERIVED Jordan left-multiplications the chain already banked (`Lmul`), the fold's own
  multiplication act; that `f₄` cannot split the degenerate spectrum is a THEOREM
  (`derH3_kills_one` + N269), not an assumption; and the resolution is the rest of the derived
  reduced structure algebra `e₆ = Der ⊕ L₀`, forced, not posited.

  ------------------------------------------------------------------------------
  THE ONE CAUSE MANY TERMINATIONS.

  The SAME octonion non-associativity that stops the cascade (N2c), caps the Hermitian Jordan
  tower at order 3 (N5, `jordan_fails_H4`), furnishing the maximal matter arena `H₃(O)`, makes
  its derivations `f₄` spectrum-preserving (kill the identity) — and makes the arena's own
  multiplication operators `Lmul` the spectrum-MOVERS that lift the degeneracy the derivations
  cannot. One arena, two roles of its multiplication: the derivation part fixes the spectrum,
  the left-multiplication part moves it.

  ------------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE. Delete spectrum/mass/texture/symmetry-breaking/generation: the
  ℚ-linear left-multiplication endomorphism `Lmul A X = A*X + X*A` of `Matrix (Fin 3)(Fin 3)(O ℚ)`
  satisfies `Lmul A 1 = A + A`; every `T` in the Hermitian Jordan-derivation Lie algebra `derH3`
  satisfies `T 1 = 0` (from the Leibniz law at `(1,1)`); hence `Lmul (slotA 1) ∉ derH3` (it maps
  `1 ↦ slotA 1 + slotA 1 ≠ 0`); `⁅Lmul A, Lmul B⁆ = innerMul A B ∈ derH3` for Hermitian `A,B`; and
  `reQ (jTraceForm A A) = 2 * jQ A ≥ 0`. Pure mathematics.

  SCOPE. Banks the concrete spectrum-mover `Lmul (slotA 1)` + its identity-motion law
  (`Lmul_one`) + the derivation-kills-identity ceiling (`derH3_kills_one`) + distinctness
  (`Lmul_notMem_derH3`) + the closure of movers into derivations (`spectrum_movers_close_into_derH3`,
  N286) + the Born-positive motion size (`spectrum_motion_positive`, N270) + non-vacuity + the
  capstone. NOT the full `e₆ = f₄ ⊕ L₀` dim-78 reduced structure algebra as a bundled LieSubalgebra
  (CHILDED — needs the 78-dim span handle); NOT the ★5 mass texture VALUE (route-not-yet-found — the
  e₆ climb is the named ascent toward it); NOT the ★2 mixing VALUE (route-not-yet-found); NOT
  "= physical Yukawa / mass sector" (removable prose); NOT the deferred Z_{f4}(flavour)=colour rigidity.
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The identity-motion law — left-multiplication MOVES the identity. -/

/-- ★★ THE IDENTITY-MOTION LAW. The Jordan left-multiplication `Lmul A` (banked N274,
    `Lmul A X = jb A X = A*X + X*A`) applied to the identity gives `A + A`: `Lmul A 1 = A + A`.
    (`jb A 1 = A*1 + 1*A = A + A`.) Unlike a derivation — which kills the identity
    (`derH3_kills_one`) — the left-multiplication MOVES it whenever `A ≠ 0`. This is the
    signature that distinguishes the spectrum-MOVING sector from the spectrum-PRESERVING `f₄`. -/
theorem Lmul_one (A : Matrix (Fin 3) (Fin 3) (O ℚ)) : Lmul A 1 = A + A := by
  rw [Lmul_apply]; unfold jb; rw [mul_one, one_mul]

/-! ## The ceiling — every derivation of `f₄ = derH3` KILLS the identity.

This is the spectrum-preserving signature of `f₄` (N269): fixing the identity means fixing the
maximally-degenerate spectral point, which is why no derivation can lift the eigenvalue degeneracy
a mass texture needs. -/

/-- ★★ THE CEILING. Every Hermitian Jordan-derivation `T ∈ derH3 = f₄` (N285/N286) annihilates the
    identity: `T 1 = 0`. Forced by the Leibniz law at `A = B = 1`: `T (jb 1 1) = jb (T 1) 1 +
    jb 1 (T 1)`, where `jb 1 1 = 1 + 1`, `jb (T 1) 1 = T 1 + T 1`, and `jb 1 (T 1) = T 1 + T 1`, so
    by ℚ-linearity `T 1 + T 1 = (T 1 + T 1) + (T 1 + T 1)`, forcing `T 1 + T 1 = 0`, hence `T 1 = 0`
    (char 0). So `f₄` fixes the identity `diag(1,1,1)` — the degenerate spectral point no derivation
    can split. -/
theorem derH3_kills_one (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
    (hT : T ∈ derH3) : T 1 = 0 := by
  have hone : ((1:Matrix (Fin 3) (Fin 3) (O ℚ)))ᴴ = (1:Matrix (Fin 3) (Fin 3) (O ℚ)) :=
    Matrix.conjTranspose_one
  have hleib := hT.2 1 1 hone hone
  have hjb11 : jb (1:Matrix (Fin 3) (Fin 3) (O ℚ)) 1 = (1:Matrix (Fin 3) (Fin 3) (O ℚ)) + 1 := by
    unfold jb; rw [mul_one]
  have hjbL : jb (T 1) (1:Matrix (Fin 3) (Fin 3) (O ℚ)) = T 1 + T 1 := by
    unfold jb; rw [mul_one, one_mul]
  have hjbR : jb (1:Matrix (Fin 3) (Fin 3) (O ℚ)) (T 1) = T 1 + T 1 := by
    unfold jb; rw [mul_one, one_mul, add_comm]
  rw [hjb11, map_add, hjbL, hjbR] at hleib
  have hsum : T 1 + T 1 = 0 := by linear_combination (norm := abel) -hleib
  have h2 : (2:ℚ) • T 1 = 0 := by rw [two_smul]; exact hsum
  exact (smul_eq_zero.mp h2).resolve_left (by norm_num)

/-! ## The concrete spectrum-mover and its distinctness from `f₄`. -/

/-- The concrete spectrum-mover moves the identity to a NONZERO element: `Lmul (slotA 1) 1 =
    slotA 1 + slotA 1 ≠ 0` (its `(0,1)` entry is `1 + 1 = 2 ≠ 0`). The witness that the
    left-multiplication genuinely lifts the identity's degeneracy. -/
theorem Lmul_moves_one_ne : Lmul (slotA (1:O ℚ)) 1 ≠ 0 := by
  rw [Lmul_one]
  intro h
  -- (slotA 1 + slotA 1) 0 1 = 1 + 1 = 2 ≠ 0
  have hentry : (slotA (1:O ℚ) + slotA 1) 0 1 = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 1 := by rw [h]
  rw [Matrix.add_apply, slotA_entry] at hentry
  simp only [Matrix.zero_apply] at hentry
  -- hentry : (1:O ℚ) + 1 = 0 ; take reQ
  have : reQ ((1:O ℚ) + 1) = reQ (0 : O ℚ) := by rw [hentry]
  rw [reQ_add] at this
  simp only [reQ] at this; norm_num at this

/-- ★★ DISTINCTNESS FROM `f₄`. The concrete spectrum-mover `Lmul (slotA 1)` is genuinely OUTSIDE the
    derivation algebra `f₄ = derH3`: `Lmul (slotA 1) ∉ derH3`. If it were a derivation it would kill
    the identity (`derH3_kills_one`), but `Lmul (slotA 1) 1 = slotA 1 + slotA 1 ≠ 0`
    (`Lmul_moves_one_ne`). So the spectrum-moving sector is a genuine complement of the
    spectrum-preserving `f₄`, not contained in it. -/
theorem Lmul_notMem_derH3 : Lmul (slotA (1:O ℚ)) ∉ derH3 := by
  intro hmem
  exact Lmul_moves_one_ne (derH3_kills_one (Lmul (slotA 1)) hmem)

/-! ## The closure — the spectrum-movers' commutators are spectrum-preservers (`[L₀,L₀] ⊆ f₄`). -/

/-- ★★ CLOSURE INTO `f₄`. The commutator of two left-multiplications is an inner derivation:
    `⁅Lmul A, Lmul B⁆ = innerMul A B`, and for Hermitian `A, B` this lands in `f₄ = derH3` (banked
    N286 `innerMul_mem_derH3`). So `f₄` together with the traceless left-multiplications `L₀` closes
    under the bracket — `[L₀, L₀] ⊆ f₄` — the Lie-algebra structure of the reduced structure algebra
    `e₆ = f₄ ⊕ L₀` (the full dim-78 closure CHILDED). -/
theorem spectrum_movers_close_into_derH3 {A B : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (hA : Aᴴ = A) (hB : Bᴴ = B) :
    ⁅Lmul A, Lmul B⁆ ∈ derH3 := by
  have hbracket : ⁅Lmul A, Lmul B⁆ = innerMul A B := rfl
  rw [hbracket]; exact innerMul_mem_derH3 hA hB

/-! ## The Born tie — the size of the spectrum-motion is the positive-definite trace form. -/

/-- ★★ THE BORN-POSITIVE MOTION SIZE (N270). The size of the spectrum-motion `Lmul A` along `A` is
    measured by the fold's positive-definite trace form: `reQ (jTraceForm A A) = 2 * jQ A`
    (`reQ_jTraceForm_self`), and `jQ (Hm d0 d1 d2 a b c) ≥ 0` (`jQ_Hm_nonneg`), with `= 0` iff the
    element is zero (`jQ_Hm_eq_zero_iff`). So a nonzero spectrum-mover has strictly positive
    trace-form size — the motion is real and Born-measured, never null. -/
theorem spectrum_motion_positive (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    reQ (jTraceForm (Hm d0 d1 d2 a b c) (Hm d0 d1 d2 a b c)) = 2 * jQ (Hm d0 d1 d2 a b c)
      ∧ 0 ≤ jQ (Hm d0 d1 d2 a b c) :=
  ⟨reQ_jTraceForm_self (Hm d0 d1 d2 a b c), jQ_Hm_nonneg d0 d1 d2 a b c⟩

/-! ## The capstone — the spectrum-moving sector beyond `f₄`. -/

/-- ★★★ THE SPECTRUM-MOVING SECTOR (the ★5/★2 ceiling NAMED and its first rung BUILT). Inside the
    derived arena `H₃(O)`: the Jordan left-multiplication `Lmul (slotA 1)` MOVES the identity
    (`Lmul A 1 = A + A`) that every derivation of `f₄ = derH3` KILLS (`derH3_kills_one`), so it is
    genuinely OUTSIDE `f₄` (`Lmul (slotA 1) ∉ derH3`) — the first member of the spectrum-MOVING
    complement `L₀`; its brackets close BACK into `f₄` (`⁅Lmul A, Lmul B⁆ = innerMul A B ∈ derH3`),
    the Lie structure of the reduced structure algebra `e₆ = f₄ ⊕ L₀`; its motion size is the
    Born-positive trace form (`reQ (jTraceForm A A) = 2 * jQ A ≥ 0`); non-vacuous
    (`Lmul (slotA 1) 1 ≠ 0`); and cap-forced at the maximal Jordan order 3 (`jordan_fails_H4`, N5 —
    the whole arena exists only because the octonion tower stops). DERIVED, not a posited
    symmetry-breaking / Yukawa sector. -/
theorem spectrum_moving_sector_member :
    (∀ A : Matrix (Fin 3) (Fin 3) (O ℚ), Lmul A 1 = A + A)
    ∧ (∀ T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)), T ∈ derH3 → T 1 = 0)
    ∧ Lmul (slotA (1:O ℚ)) ∉ derH3
    ∧ (∀ A B : Matrix (Fin 3) (Fin 3) (O ℚ), Aᴴ = A → Bᴴ = B → ⁅Lmul A, Lmul B⁆ ∈ derH3)
    ∧ (∀ d0 d1 d2 : ℚ, ∀ a b c : O ℚ,
        reQ (jTraceForm (Hm d0 d1 d2 a b c) (Hm d0 d1 d2 a b c)) = 2 * jQ (Hm d0 d1 d2 a b c)
          ∧ 0 ≤ jQ (Hm d0 d1 d2 a b c))
    ∧ Lmul (slotA (1:O ℚ)) 1 ≠ 0
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨Lmul_one,
   derH3_kills_one,
   Lmul_notMem_derH3,
   fun _ _ hA hB => spectrum_movers_close_into_derH3 hA hB,
   spectrum_motion_positive,
   Lmul_moves_one_ne,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
