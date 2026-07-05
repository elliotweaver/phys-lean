import Phys.Algebra.OctonionJordanHermTraceCoefficient

/-!
# N301 — The family-`so(3)` rotation of the mass-texture module: the mass-splitting and
# generation-mixing sectors are ONE family orbit in `L₀`, isospectrally

## What this node banks (the ★5↔★2 joint, forced)

The derived exceptional-Jordan arena `J₃(O ℚ) = H₃(O ℚ)` (dim 27, N5/N267) carries, beyond its
derivation Lie algebra `f₄ = derH3` (N285), the SPECTRUM-MOVING sector `L₀ = {Lmul A}` (N295, the
Jordan left-multiplications `Lmul A X = jb A X`), which is the mass-texture MODULE: an `f₄`-module
via the equivariance `⁅T, Lmul A⁆ B = Lmul (T A) B` (N296). Inside `f₄` sits the FAMILY `so(3)`
of gauge-neutral inner derivations `famA/famB/famC = innerMul (slotX 1)(slotY 1)` (N288/N289),
the continuous rotation of the three cap-forced matter-carrier slots (N267).

N297 exhibited the mass-SPLITTING mechanism: the genuine spectrum-splitting movers are the
TRACELESS diagonal left-mults `Lmul (Dg t)` (on the charge hyperplane `(ℚ·1)^⊥`), while the
`f₄`-central dilation `Lmul 1` is pure universal scaling (no splitting). N298/N300 proved that
EVERY `T ∈ derH3` kills the linear trace (`derH3_kills_jTr`) via the invariance of the derived
Cartan–Killing trace form (octonion `reQ_mul_assoc3`).

THIS node makes the family symmetry ACT on the mass-texture module and reveals the joint the fold
was building toward:

* **THE ROTATION.** The family generator `famC = innerMul (slotA 1)(slotB 1)` carries the DIAGONAL
  mass-splitting movers to the OFF-DIAGONAL generation-mixing movers and back:
    - `famC (Dg t0 t1 t2) = slotC ((t2 − t1) • 1)`      (`famC_diag_to_mix`, from N274 `innerMul_slot_diag`),
    - `famC (slotC c)     = Dg 0 (2·reQ c) (−(2·reQ c))` (`famC_slotC`, traceless — back into the
      diagonal sector),
  so via the N296 equivariance
    - `⁅famC, Lmul (Dg t0 t1 t2)⁆ B = Lmul (slotC ((t2 − t1) • 1)) B`  (`family_rotates_split_to_mix`),
    - `⁅famC, Lmul (slotC c)⁆ B     = Lmul (Dg 0 (2·reQ c) (−(2·reQ c))) B` (`family_rotates_mix_to_split`),
    - `⁅famC, Lmul 1⁆ B = 0`                                             (`family_fixes_dilation`, N297).
  The DIAGONAL mass-splitting sector and the OFF-DIAGONAL generation-mixing sector are ONE
  family-`so(3)` orbit inside `L₀`; the universal-mass dilation `Lmul 1` is the family SINGLET,
  fixed.

* **ISOSPECTRAL.** The family generator PRESERVES the arena's spectral invariants — the rotation
  mixes WITHOUT changing the spectrum. The LINEAR invariant `rtr` (the linear trace) is killed
  (`family_kills_linear_spectral`, N300 `derH3_kills_jTr`), and the QUADRATIC invariant
  `rtr (A ∘ ·)` is killed too (`family_kills_quadratic_spectral`: `rtr (jb A (famC A)) = 0` for
  Hermitian `A`, via the derivation Leibniz law of `derH3` + `derH3_kills_jTr` on the Hermitian
  `jb A A`).

## The dissolution / the moat

Standard physics POSITS the CKM/PMNS mixing matrix as free parameters — the misalignment between
the mass eigenbasis (diagonal) and the flavour eigenbasis — AND separately posits a Yukawa mass
texture. The theory DISSOLVES the separation: the mass-splitting sector and the mixing sector are
ONE derived family-`so(3)` orbit inside the derived mass-texture module `L₀`, related by the
derived family rotation, which PRESERVES the spectrum. Mixing is not a separate posited sector — it
is the spectrum-preserving family rotation of the mass texture, FORCED by the arena's own Jordan
multiplication and the fold-forced family symmetry.

ONE CAUSE MANY TERMINATIONS: the same octonion non-associativity that stops the cascade (N2c) and
caps the Hermitian Jordan tower at order 3 (N5, `jordan_fails_H4`) — furnishing EXACTLY THREE
matter-carrier slots (N267) and the arena `H₃(O)` — makes its derivations `f₄` the
spectrum-PRESERVERS, its left-mults `Lmul` the spectrum-MOVERS, its gauge-neutral inner derivations
the family rotation, AND now forces that rotation to carry the diagonal mass-splitting sector into
the off-diagonal mixing sector isospectrally.

## Scope (honesty clause)

Banks the family-`so(3)` rotation joining the two sectors + the LINEAR and QUADRATIC
spectral-invariant preservation (isospectrality of the first two char-poly coefficients) ONLY. Does
NOT bank: the CUBIC-norm `jN` preservation (the full isospectrality — needs the cubic power-Leibniz,
a childed W-node), the ★2 mixing-angle VALUE (route-not-yet-found — a FORCED build target, NOT
human-gated), the ★5 mass-ratio VALUES, "= the physical CKM/PMNS matrix" (removable prose), the
dim-78 bundled `e₆` LieSubalgebra.

Physics-words-removable: delete mass/mixing/family/generation/texture — the pure statement is that
`famC := innerMul (slotA 1)(slotB 1) ∈ derH3` maps `Dg t0 t1 t2 ↦ slotC ((t2−t1)•1)` and
`slotC c ↦ Dg 0 (2 reQ c) (−(2 reQ c))`, so via `⁅famC, Lmul A⁆ B = Lmul (famC A) B` the
diagonal-`Dg` and off-diagonal-`slotC` left-mults form one `so(3)` orbit while `Lmul 1` is fixed,
and `rtr (famC A) = 0`, `rtr (jb A (famC A)) = 0` for Hermitian `A`. Pure operator/matrix algebra.
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## Plumbing — the central real diagonal is Hermitian and additive. -/

/-- The general central real diagonal is Hermitian (`ocR eᵢ` self-conjugate). Generalizes the banked
    `Dg_herm` (which covered only `Dg r r r`). -/
theorem Dg_herm_gen (t0 t1 t2 : ℚ) : (Dg t0 t1 t2)ᴴ = Dg t0 t1 t2 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Dg, Matrix.conjTranspose_apply, ocR_star]

/-- The central real diagonal is additive under subtraction: `Dg a b c − Dg d e f = Dg (a−d) …`. -/
theorem Dg_sub (a b c d e f : ℚ) : Dg a b c - Dg d e f = Dg (a - d) (b - e) (c - f) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Dg, Matrix.sub_apply, ocR_sub]

/-! ## The family generator carries the two sectors of `L₀` into each other. -/

/-- ★ THE DIAGONAL MASS-SPLITTING SECTOR → THE OFF-DIAGONAL MIXING SECTOR. The family generator
    `famC = innerMul (slotA 1)(slotB 1)` sends the diagonal mover `Dg t0 t1 t2` to the off-diagonal
    slot `slotC ((t2 − t1) • 1)` — the trace-zero root functional `t2 − t1` (N275) becomes the
    generation-mixing coupling. Directly from N274 `innerMul_slot_diag` at `a = b = 1`. -/
theorem famC_diag_to_mix (t0 t1 t2 : ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (Dg t0 t1 t2) = slotC ((t2 - t1) • (1 : O ℚ)) := by
  rw [innerMul_slot_diag]; congr 2; rw [star_one, one_mul]

/-- ★ THE OFF-DIAGONAL MIXING SECTOR → THE DIAGONAL MASS-SPLITTING SECTOR (traceless). The family
    generator sends the off-diagonal slot `slotC c` back to the TRACELESS diagonal mover
    `Dg 0 (2·reQ c) (−(2·reQ c))` — landing in the spectrum-splitting (trace-zero) slice N297
    identified, closing the family orbit. Via the banked `jb`-slot products. -/
theorem famC_slotC (c : O ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotC c) = Dg 0 (2 * reQ c) (-(2 * reQ c)) := by
  rw [innerMul_apply,
      jb_slotB_slotC, one_mul, jb_slotA1_slotA,
      jb_comm (slotA (1:O ℚ)) (slotC c), jb_slotC_slotA, one_mul, jb_slotB1_slotB,
      Dg_sub, reQ_star]
  congr 1 <;> ring

/-! ## The rotation on the module `L₀` via the `f₄`-equivariance (N296). -/

/-- ★★★ THE MASS-SPLITTING SECTOR IS ROTATED TO THE MIXING SECTOR. Under the family generator,
    the DIAGONAL mass-splitting mover `Lmul (Dg t0 t1 t2)` is carried to the OFF-DIAGONAL
    generation-mixing mover `Lmul (slotC ((t2 − t1) • 1))`:

        `⁅famC, Lmul (Dg t0 t1 t2)⁆ B = Lmul (slotC ((t2 − t1) • 1)) B`   (Hermitian `B`).

    Via the N296 equivariance `⁅T, Lmul A⁆ B = Lmul (T A) B` and `famC_diag_to_mix`. -/
theorem family_rotates_split_to_mix (t0 t1 t2 : ℚ) {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (Dg t0 t1 t2)⁆ B
      = Lmul (slotC ((t2 - t1) • (1:O ℚ))) B := by
  rw [spectrum_sector_equivariance _ famC_mem_derH3 (Dg_herm_gen t0 t1 t2) hB, famC_diag_to_mix]

/-- ★★★ THE MIXING SECTOR IS ROTATED BACK TO THE MASS-SPLITTING SECTOR. Under the family generator,
    the off-diagonal generation-mixing mover `Lmul (slotC c)` is carried to the TRACELESS diagonal
    mass-splitting mover `Lmul (Dg 0 (2·reQ c) (−(2·reQ c)))`:

        `⁅famC, Lmul (slotC c)⁆ B = Lmul (Dg 0 (2·reQ c) (−(2·reQ c))) B`   (Hermitian `B`).

    Via the N296 equivariance and `famC_slotC`. Together with `family_rotates_split_to_mix`, the two
    sectors are ONE family-`so(3)` orbit inside `L₀`. -/
theorem family_rotates_mix_to_split (c : O ℚ) {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (slotC c)⁆ B
      = Lmul (Dg 0 (2 * reQ c) (-(2 * reQ c))) B := by
  have hslotC : (slotC c)ᴴ = slotC c := Xz_herm 0 0 c
  rw [spectrum_sector_equivariance _ famC_mem_derH3 hslotC hB, famC_slotC]

/-- ★★ THE UNIVERSAL-MASS DILATION IS THE FAMILY SINGLET. The `f₄`-central dilation `Lmul 1` (the
    pure-scaling, non-splitting direction, N297) is FIXED by the family rotation:
    `⁅famC, Lmul 1⁆ B = 0`. The universal mass scale is family-invariant; only the traceless
    splitting/mixing sector is rotated. Directly the N297 `dilation_fixed` at `famC`. -/
theorem family_fixes_dilation {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))⁆ B = 0 :=
  dilation_fixed _ famC_mem_derH3 hB

/-! ## The rotation is ISOSPECTRAL — the linear and quadratic spectral invariants are preserved. -/

/-- ★★ THE LINEAR SPECTRAL INVARIANT IS PRESERVED. The family generator kills the linear trace
    `rtr = reQ ∘ (real diagonal trace)`: `rtr (famC A) = 0` for Hermitian `A`. The first
    characteristic-polynomial coefficient (the sum of eigenvalues) is unchanged under the family
    rotation. Directly from N300 `derH3_kills_jTr` (`famC ∈ derH3`, `famC_mem_derH3`). -/
theorem family_kills_linear_spectral {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (innerMul (slotA (1:O ℚ)) (slotB 1) A) = 0 := by
  have h := derH3_kills_jTr famC_mem_derH3 hA
  unfold rtr; rw [h]; simp [reQ]

/-- ★★ THE QUADRATIC SPECTRAL INVARIANT IS PRESERVED. The family generator also annihilates the
    quadratic trace pairing `rtr (A ∘ ·)`: `rtr (jb A (famC A)) = 0` for Hermitian `A`. Hence the
    second characteristic-polynomial coefficient (the sum of pairwise eigenvalue products, `jS`) is
    unchanged: the rotation is isospectral to quadratic order. Route: `famC ∈ derH3` gives the
    derivation Leibniz law `famC (jb A A) = jb (famC A) A + jb A (famC A) = 2 • jb A (famC A)` (by
    the symmetry `jb_comm`); `jb A A` is Hermitian (`jb_herm`), so `rtr (famC (jb A A)) = 0` (N300);
    additivity of `rtr` forces `rtr (jb A (famC A)) = 0`. -/
theorem family_kills_quadratic_spectral {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (jb A (innerMul (slotA (1:O ℚ)) (slotB 1) A)) = 0 := by
  set T := innerMul (slotA (1:O ℚ)) (slotB 1) with hTdef
  have hleib : T (jb A A) = jb (T A) A + jb A (T A) :=
    (mem_derH3.mp famC_mem_derH3).2 A A hA hA
  rw [jb_comm (T A) A] at hleib
  have hAA : (jb A A)ᴴ = jb A A := jb_herm hA hA
  have hkill : rtr (T (jb A A)) = 0 := by
    have h := derH3_kills_jTr famC_mem_derH3 hAA
    unfold rtr; rw [h]; simp [reQ]
  rw [hleib, rtr_add] at hkill
  linarith [hkill]

/-! ## W8 anti-vacuity — the rotation genuinely mixes. -/

/-- ★★ W8 NON-VACUITY. The split→mix rotation is genuinely nonzero: at `Dg 0 0 1` (a traceless
    unit split), applied to `B = 1`, the family generator produces `Lmul (slotC 1) 1 = slotC 1 +
    slotC 1`, whose `(1,2)` deep-real coordinate is `1 + 1 = 2 ≠ 0`. The mass-splitting sector is
    genuinely rotated into a nonzero mixing mover — the orbit is not trivial. -/
theorem family_rotates_split_to_mix_ne :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (Dg 0 0 1)⁆ 1 ≠ 0 := by
  rw [family_rotates_split_to_mix 0 0 1 Matrix.conjTranspose_one, Lmul_one]
  intro h
  have hentry : ((slotC ((1 - 0 : ℚ) • (1:O ℚ))) + (slotC ((1 - 0 : ℚ) • (1:O ℚ)))) 1 2
      = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1 2 := by rw [h]
  rw [Matrix.add_apply, slotC_entry] at hentry
  simp only [Matrix.zero_apply, sub_zero, one_smul] at hentry
  have : reQ ((1:O ℚ) + 1) = reQ (0 : O ℚ) := by rw [hentry]
  rw [reQ_add] at this
  simp only [reQ] at this; norm_num at this

/-! ## The capstone — the family-orbit / isospectral structure of the mass-texture module. -/

/-- ★★★ THE FAMILY-ORBIT ISOSPECTRAL STRUCTURE OF THE MASS-TEXTURE MODULE `L₀`. The derived family
    generator `famC = innerMul (slotA 1)(slotB 1) ∈ f₄ = derH3`:
    · rotates the DIAGONAL mass-splitting sector to the OFF-DIAGONAL mixing sector and back
      (`family_rotates_split_to_mix`, `family_rotates_mix_to_split`) — the two sectors are ONE
      family orbit in `L₀`;
    · FIXES the universal-mass dilation `Lmul 1` (`family_fixes_dilation`) — the family singlet;
    · is ISOSPECTRAL: preserves the LINEAR (`family_kills_linear_spectral`) and QUADRATIC
      (`family_kills_quadratic_spectral`) spectral invariants — mixing without changing the
      spectrum;
    · non-vacuously (`family_rotates_split_to_mix_ne`).
    Cap-forced at the maximal Jordan order 3 (`jordan_fails_H4`, N5). DERIVED — mixing is the
    spectrum-preserving family rotation of the mass texture, not a posited CKM/PMNS sector. -/
theorem family_mass_mixing_orbit_structure :
    (∀ (t0 t1 t2 : ℚ) (B : Matrix (Fin 3) (Fin 3) (O ℚ)), Bᴴ = B →
        ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (Dg t0 t1 t2)⁆ B
          = Lmul (slotC ((t2 - t1) • (1:O ℚ))) B)
    ∧ (∀ (c : O ℚ) (B : Matrix (Fin 3) (Fin 3) (O ℚ)), Bᴴ = B →
        ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (slotC c)⁆ B
          = Lmul (Dg 0 (2 * reQ c) (-(2 * reQ c))) B)
    ∧ (∀ B : Matrix (Fin 3) (Fin 3) (O ℚ), Bᴴ = B →
        ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))⁆ B = 0)
    ∧ (∀ A : Matrix (Fin 3) (Fin 3) (O ℚ), Aᴴ = A →
        rtr (innerMul (slotA (1:O ℚ)) (slotB 1) A) = 0)
    ∧ (∀ A : Matrix (Fin 3) (Fin 3) (O ℚ), Aᴴ = A →
        rtr (jb A (innerMul (slotA (1:O ℚ)) (slotB 1) A)) = 0)
    ∧ (⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (Dg 0 0 1)⁆ 1 ≠ 0)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨fun t0 t1 t2 B hB => family_rotates_split_to_mix t0 t1 t2 hB,
   fun c B hB => family_rotates_mix_to_split c hB,
   fun B hB => family_fixes_dilation hB,
   fun A hA => family_kills_linear_spectral hA,
   fun A hA => family_kills_quadratic_spectral hA,
   family_rotates_split_to_mix_ne,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
