import Phys.Algebra.OctonionJordanCubicIsospectral
import Phys.Algebra.OctonionJordanColourCentralizerCoset
import Phys.Algebra.OctonionAssociative3Form

/-!
# N303 — The fold-root complexification of the generation-mixing sector

## What this node banks (the ★5 complex/CP structure of mixing — the joint of two banked halves)

Two banked halves of the exceptional-Jordan arena `J₃(O ℚ) = H₃(O ℚ)` (dim 27, N5/N267) have,
until now, never been connected:

* the **isospectral mass-texture module** + the REAL family-`so(3)` rotation (N301/N302): the family
  generator `famC = innerMul (slotA 1)(slotB 1) ∈ f₄ = derH3` carries the diagonal mass-splitting
  mover `Lmul (Dg t)` to the REAL off-diagonal generation-mixing mover `Lmul (slotC ((t₂−t₁)•1))`,
  isospectrally (N301 `family_rotates_split_to_mix`, N302 full-spectrum preservation);

* the **family-symmetry-BREAKING coset** (N291–N293): the FOLD-ROOT-DRESSED generator
  `kAB = innerMul (slotA u1)(slotB 1) ∈ derH3` (`coupling_mem_derH3`), which breaks the derived
  `su(3)_flavour → so(3)` by the fold-root `u1` (the cascade's first √−1, N2).

THIS node computes the action of the breaking half on the mass module and finds that the two halves
COMPLEXIFY the mixing sector:

* **THE IMAGINARY MIXING LEG.** `kAB (Dg t0 t1 t2) = slotC ((t2 − t1) • (−u1))`
  (`kAB_diag_to_imag_mix`) — the u1-dressed twin of `famC (Dg t) = slotC ((t2−t1)•1)`. The
  family-breaking coset carries the diagonal mass-splitting into the fold's own IMAGINARY mixing
  direction. Via N296 equivariance this rotates the mass-splitting mover to the imaginary mixing
  mover (`breaking_rotates_split_to_imag_mix`).

* **THE MIXING PLANE IS THE FOLD's OWN COMPLEX LINE.** The two produced mixing directions,
  `slotC (r • 1)` (real, famC) and `slotC (s • u1)` (imaginary, kAB), are `slotC` of the fold's own
  `ℂ`-core `span{1, u1}` — the colour-neutral core of matter (N266) — with `u1` the fold-root √−1.

* **THE COMPLEX STRUCTURE.** The bracket `famMixJ := ⁅famC, kAB⁆` acts on the mixing plane
  `span{slotC 1, slotC u1}` as a COMPLEX STRUCTURE:
    `famMixJ (slotC 1) = slotC ((−4) • u1)`,   `famMixJ (slotC u1) = slotC (4 • 1)`,
  so `famMixJ² = −16` on the mixing plane (`famMixJ_sq_slotC_one`) — the derived `su(3)_flavour`
  Cartan multiplying the mixing coupling by the fold-root `u1`. The real family-`so(3)` rotation
  COMPLEXIFIES to `su(3)_flavour` acting on `L₀`, the fold-root supplying the phase.

* **STILL ISOSPECTRAL.** The family-breaking generator is ALSO isospectral (`kAB ∈ derH3`, free from
  N300/N302): `rtr (kAB A) = rtr (jb A (kAB A)) = rtr (jb (jb A A)(kAB A)) = 0`. The complex mixing
  rotation preserves the full spectrum, exactly as a unitary CKM rotation preserves masses.

## The dissolution / the moat

Standard physics posits CKM/PMNS as a COMPLEX unitary matrix — real mixing angles PLUS an
independent CP-violating complex phase (a free parameter). The theory DERIVES that the mixing sector
is complex: the REAL mixing (family `so(3)`, N301) is complexified by the fold-root dressing (the
family-BREAKING coset N292/N293), and the imaginary / CP-phase direction of mixing IS the fold-root
√−1 — the SAME √−1 that is the cascade's first complex unit (N2) and the colour-neutral core of
matter (N266). The complex phase of mixing is not a free parameter; it is the fold-root. And the
complex mixing is STILL isospectral — the complex rotation preserves the full spectrum.

ONE CAUSE MANY TERMINATIONS: the fold-root `u1` (the cascade's first √−1, N2) is the complex unit of
the first doubling, the colour-neutral core of matter (N266), the `su(3)_flavour → so(3)` breaker
(N292), AND the complex structure / CP-phase axis of generation mixing here — one derived element
wearing all these faces.

## Scope (honesty clause)

Banks the imaginary mixing leg + the breaking-coset-rotates-split-to-imaginary-mixing + `kAB`
isospectral + the fold-`ℂ`-core pairing of the two mixing axes + the `⁅famC,kAB⁆` complex-structure
action (`famMixJ² = −16`) + non-vacuity ONLY. Deliverables stay at the abstract `slotC`/`Dg`/`rtr`/
`jb` level. Does NOT bank: the ★2/★5 mixing-angle / mass-ratio / CP-phase VALUE (route-not-yet-found
— FORCED build targets; N275 proved the family `A₂` root system has NO fixed root, so a distinguished
texture/value is not forceable from the current family-symmetric structure), "= the physical CKM/PMNS
`δ_CP`" (removable prose), the full bundled dim-8 `su(3)_flavour` LieSubalgebra (optional hardening),
the dim-78 `e₆`.

Physics-words-removable: delete mass/mixing/generation/CP/phase/flavour/complexification — the pure
statement is that for `kAB := innerMul (slotA u1)(slotB 1) ∈ derH3`:
`kAB (Dg t0 t1 t2) = slotC ((t2−t1) • (−u1))`; `⁅kAB, Lmul (Dg t)⁆ B = Lmul (slotC ((t2−t1)•(−u1))) B`
for Hermitian `B`; `rtr (kAB A) = rtr (jb A (kAB A)) = rtr (jb (jb A A)(kAB A)) = 0` for Hermitian
`A`; and `⁅famC, kAB⁆` acts on `span{slotC 1, slotC u1}` with square `−16`. Pure operator/matrix
algebra over ℚ and `O ℚ`.
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## Slot plumbing — `slotC` zero/neg and the general same-slot diagonal products. -/

/-- `slotC 0 = 0`. -/
theorem slotC_zero : slotC (0 : O ℚ) = 0 := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;> simp [slotC, Xz]

/-- `slotC (−x) = − slotC x` (from `slotC_sub`). -/
theorem slotC_neg (x : O ℚ) : slotC (-x) = - slotC x := by
  have := slotC_sub 0 x; rw [slotC_zero, zero_sub, zero_sub] at this; exact this

/-- `reQ (a * star b) = reQ (star a * b)` — the real part of a product is symmetric under the
    star-transpose swap (`reQ_mul_comm` + `reQ_star`). -/
theorem reQ_a_star_b (a b : O ℚ) : reQ (a * star b) = reQ (star a * b) := by
  rw [reQ_mul_comm a (star b), ← reQ_star (star a * b), StarMul.star_mul, star_star]

/-- The general same-slot Jordan product on the `A`-slot lands on the diagonal:
    `jb (slotA a)(slotA b) = Dg (2·reQ (star a * b)) (2·reQ (star a * b)) 0`. Generalizes
    `jb_slotA1_slotA` (the `a = 1` case). The `(0,0)` and `(1,1)` entries are `a*star b + b*star a`
    and `star a*b + star b*a`, both `(2·reQ (star a*b)) • 1` by `trace_id`. -/
theorem jb_slotA_slotA_gen (a b : O ℚ) :
    jb (slotA a) (slotA b) = Dg (2 * reQ (star a * b)) (2 * reQ (star a * b)) 0 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
  first
  | (show (jb (slotA a) (slotA b)) 0 0 = _
     rw [show (jb (slotA a) (slotA b)) 0 0 = a * star b + b * star a by
           simp [jb, slotA, Xz, Matrix.add_apply]]
     have hstar : b * star a = star (a * star b) := by rw [StarMul.star_mul, star_star]
     rw [hstar, trace_id, reQ_a_star_b]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (show (jb (slotA a) (slotA b)) 1 1 = _
     rw [show (jb (slotA a) (slotA b)) 1 1 = star a * b + star b * a by
           simp [jb, slotA, Xz, Matrix.add_apply]]
     have hstar : star b * a = star (star a * b) := by rw [StarMul.star_mul, star_star]
     rw [hstar, trace_id]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (simp [jb, slotA, Xz, Dg, Matrix.add_apply, Matrix.diagonal, ocR_zero])

/-- The general same-slot Jordan product on the `B`-slot:
    `jb (slotB a)(slotB b) = Dg (2·reQ (star a * b)) 0 (2·reQ (star a * b))`. -/
theorem jb_slotB_slotB_gen (a b : O ℚ) :
    jb (slotB a) (slotB b) = Dg (2 * reQ (star a * b)) 0 (2 * reQ (star a * b)) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
  first
  | (show (jb (slotB a) (slotB b)) 0 0 = _
     rw [show (jb (slotB a) (slotB b)) 0 0 = a * star b + b * star a by
           simp [jb, slotB, Xz, Matrix.add_apply]]
     have hstar : b * star a = star (a * star b) := by rw [StarMul.star_mul, star_star]
     rw [hstar, trace_id, reQ_a_star_b]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (show (jb (slotB a) (slotB b)) 2 2 = _
     rw [show (jb (slotB a) (slotB b)) 2 2 = star a * b + star b * a by
           simp [jb, slotB, Xz, Matrix.add_apply]]
     have hstar : star b * a = star (star a * b) := by rw [StarMul.star_mul, star_star]
     rw [hstar, trace_id]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (simp [jb, slotB, Xz, Dg, Matrix.add_apply, Matrix.diagonal, ocR_zero])

/-! ## The imaginary mixing leg — the family-breaking coset carries the diagonal split to `slotC (•−u1)`. -/

/-- ★ THE IMAGINARY MIXING LEG. The fold-root-dressed family-BREAKING generator
    `kAB = innerMul (slotA u1)(slotB 1)` sends the diagonal mass-splitting mover `Dg t0 t1 t2` to the
    off-diagonal slot `slotC ((t2 − t1) • (−u1))` — the u1-dressed twin of the REAL family leg
    `famC (Dg t) = slotC ((t2−t1)•1)` (N301). The trace-zero root functional `t2−t1` (N275) becomes
    the IMAGINARY generation-mixing coupling `(t2−t1)•(−u1)`. From N274 `innerMul_slot_diag` at
    `a = u1, b = 1`: the coupling is `(t2−t1)•(star u1 * 1) = (t2−t1)•(−u1)` (`star_u1 = −u1`). -/
theorem kAB_diag_to_imag_mix (t0 t1 t2 : ℚ) :
    innerMul (slotA (u1:O ℚ)) (slotB 1) (Dg t0 t1 t2) = slotC ((t2 - t1) • (-u1 : O ℚ)) := by
  rw [innerMul_slot_diag]; congr 2; rw [star_u1, mul_one]

/-- ★★★ THE FAMILY-BREAKING COSET ROTATES SPLIT → IMAGINARY MIXING. Under the family-breaking
    generator `kAB`, the diagonal mass-splitting mover `Lmul (Dg t0 t1 t2)` is carried to the
    IMAGINARY off-diagonal generation-mixing mover `Lmul (slotC ((t2 − t1) • (−u1)))`:

        `⁅kAB, Lmul (Dg t0 t1 t2)⁆ B = Lmul (slotC ((t2 − t1) • (−u1))) B`   (Hermitian `B`).

    Via the N296 equivariance `⁅T, Lmul A⁆ B = Lmul (T A) B` (`kAB ∈ derH3`, `coupling_mem_derH3`)
    and `kAB_diag_to_imag_mix`. The u1-dressed twin of N301's `family_rotates_split_to_mix`. -/
theorem breaking_rotates_split_to_imag_mix (t0 t1 t2 : ℚ)
    {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅innerMul (slotA (u1:O ℚ)) (slotB 1), Lmul (Dg t0 t1 t2)⁆ B
      = Lmul (slotC ((t2 - t1) • (-u1 : O ℚ))) B := by
  rw [spectrum_sector_equivariance _ coupling_mem_derH3 (Dg_herm_gen t0 t1 t2) hB,
      kAB_diag_to_imag_mix]

/-! ## The family-breaking generator is ALSO isospectral (free from N300/N302). -/

/-- ★★ THE FAMILY-BREAKING GENERATOR PRESERVES THE LINEAR SPECTRAL INVARIANT. `rtr (kAB A) = 0` for
    Hermitian `A` — directly from N300 `derH3_kills_jTr` (`kAB ∈ derH3`, `coupling_mem_derH3`). -/
theorem kAB_kills_linear {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (innerMul (slotA (u1:O ℚ)) (slotB 1) A) = 0 := by
  have h := derH3_kills_jTr coupling_mem_derH3 hA
  unfold rtr; rw [h]; simp [reQ]

/-- ★★ THE FAMILY-BREAKING GENERATOR PRESERVES THE QUADRATIC SPECTRAL INVARIANT.
    `rtr (jb A (kAB A)) = 0` for Hermitian `A` — from N302 `derH3_kills_quadratic_spectral`. -/
theorem kAB_kills_quadratic {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (jb A (innerMul (slotA (u1:O ℚ)) (slotB 1) A)) = 0 :=
  derH3_kills_quadratic_spectral coupling_mem_derH3 hA

/-- ★★ THE FAMILY-BREAKING GENERATOR PRESERVES THE CUBIC SPECTRAL INVARIANT.
    `rtr (jb (jb A A)(kAB A)) = 0` for Hermitian `A` — from N302 `derH3_kills_cubic_spectral`. So the
    complex-mixing generator is FULLY isospectral: the complex rotation preserves the whole spectrum,
    exactly as a unitary CKM rotation preserves the masses. -/
theorem kAB_kills_cubic {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (jb (jb A A) (innerMul (slotA (u1:O ℚ)) (slotB 1) A)) = 0 :=
  derH3_kills_cubic_spectral coupling_mem_derH3 hA

/-! ## The two mixing axes are `slotC` of the fold's own complex line `span{1, u1}` (N266). -/

/-- The REAL mixing axis `1` lies in the fold's colour-neutral complex core `span{1, u1}` (N266). -/
theorem one_in_fold_core : (1 : O ℚ) ∈ Submodule.span ℚ {(1 : O ℚ), u1} :=
  Submodule.subset_span (by simp)

/-- The IMAGINARY mixing axis `u1` (the fold-root √−1) lies in the fold's colour-neutral complex
    core `span{1, u1}` (N266). So the two generation-mixing directions produced — `slotC (r•1)`
    (real, `famC`) and `slotC (s•u1)` (imaginary, `kAB`) — are `slotC` of the SAME derived `ℂ`-line,
    the fold's own complex core. The mixing sector is complex, its imaginary axis the fold-root. -/
theorem u1_in_fold_core : (u1 : O ℚ) ∈ Submodule.span ℚ {(1 : O ℚ), u1} :=
  Submodule.subset_span (by simp)

/-! ## The complex structure — `⁅famC, kAB⁆` phases the mixing plane by the fold-root, square `−16`. -/

/-- `kAB (slotC u1) = Dg 0 (−2) 2` — the family-breaking generator sends the imaginary mixing axis to
    a traceless diagonal split. Reverse leg via the same-slot products with `u1 * u1 = −1`
    (`complexUnit_sq`) and `star u1 = −u1`. (`kAB (slotC 1) = 0`, the real-axis annihilation, is the
    banked `kAB_slotC_one` from N292.) -/
theorem kAB_slotC_u1 :
    innerMul (slotA (u1:O ℚ)) (slotB 1) (slotC u1) = Dg 0 (-2) 2 := by
  rw [innerMul_apply, jb_slotB_slotC, jb_comm (slotA u1) (slotC u1), jb_slotC_slotA,
      jb_slotA_slotA_gen, jb_slotB_slotB_gen]
  have h1 : star (u1:O ℚ) * (1 * star u1) = -1 := by
    rw [one_mul, star_u1, neg_mul_neg, complexUnit_sq]
  have h2 : star (1:O ℚ) * (u1 * u1) = -1 := by rw [complexUnit_sq, star_one, one_mul]
  have hrn : reQ (-1 : O ℚ) = -1 := by simp [reQ]
  rw [h1, h2, hrn, Dg_sub]; norm_num

/-- `famC (slotC 1) = Dg 0 2 (−2)` — the real family generator sends the real mixing axis to a
    traceless diagonal split (N301 `famC_slotC` at `c = 1`, `reQ 1 = 1`). -/
theorem famC_slotC_one :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotC 1) = Dg 0 2 (-2) := by
  rw [famC_slotC]; norm_num [reQ]

/-- `famC (slotC u1) = 0` — the real family generator annihilates the imaginary mixing axis
    (N301 `famC_slotC` at `c = u1`, `reQ u1 = 0`). -/
theorem famC_slotC_u1 :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotC u1) = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  rw [famC_slotC]
  have hu1 : reQ (u1 : O ℚ) = 0 := by simp [reQ, u1]
  rw [hu1]
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;> simp [Dg, ocR_zero]

/-- ★★★ THE COMPLEX STRUCTURE (first direction). The bracket `famMixJ := ⁅famC, kAB⁆` phases the
    REAL mixing axis into the IMAGINARY one: `⁅famC, kAB⁆ (slotC 1) = slotC ((−4) • u1)`.
    `famMixJ (slotC 1) = famC (kAB (slotC 1)) − kAB (famC (slotC 1)) = famC 0 − kAB (Dg 0 2 (−2))
    = − slotC ((−2−2)•(−u1)) = slotC ((−4)•u1)`. -/
theorem famMixJ_slotC_one :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotC 1)
      = slotC ((-4 : ℚ) • (u1 : O ℚ)) := by
  rw [show (⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆
        : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = innerMul (slotA (1:O ℚ)) (slotB 1) * innerMul (slotA (u1:O ℚ)) (slotB 1)
          - innerMul (slotA (u1:O ℚ)) (slotB 1) * innerMul (slotA (1:O ℚ)) (slotB 1)
        from Ring.lie_def _ _]
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [kAB_slotC_one, famC_slotC_one, map_zero, zero_sub, kAB_diag_to_imag_mix,
      show ((-2:ℚ) - 2) = (-4:ℚ) by ring, smul_neg, slotC_neg]
  exact neg_neg _

/-- ★★★ THE COMPLEX STRUCTURE (second direction). The bracket `famMixJ := ⁅famC, kAB⁆` phases the
    IMAGINARY mixing axis into the REAL one: `⁅famC, kAB⁆ (slotC u1) = slotC (4 • 1)`.
    `famMixJ (slotC u1) = famC (kAB (slotC u1)) − kAB (famC (slotC u1)) = famC (Dg 0 (−2) 2) − kAB 0
    = slotC ((2−(−2))•1) = slotC (4•1)`. -/
theorem famMixJ_slotC_u1 :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotC u1)
      = slotC ((4 : ℚ) • (1 : O ℚ)) := by
  rw [show (⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆
        : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = innerMul (slotA (1:O ℚ)) (slotB 1) * innerMul (slotA (u1:O ℚ)) (slotB 1)
          - innerMul (slotA (u1:O ℚ)) (slotB 1) * innerMul (slotA (1:O ℚ)) (slotB 1)
        from Ring.lie_def _ _]
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [kAB_slotC_u1, famC_slotC_u1, map_zero, sub_zero, famC_diag_to_mix,
      show ((2:ℚ) - (-2)) = (4:ℚ) by ring]

/-- ★★★ THE COMPLEX STRUCTURE SQUARE. On the real mixing axis, `famMixJ² = −16`:
    `⁅famC, kAB⁆ (⁅famC, kAB⁆ (slotC 1)) = slotC ((−16) • 1) = (−16) • slotC 1`. The derived
    `su(3)_flavour` Cartan `famMixJ = ⁅famC, kAB⁆` acts on the mixing plane `span{slotC 1, slotC u1}`
    as a genuine COMPLEX STRUCTURE (square a negative scalar), the fold-root `u1` supplying the phase.
    So the family-`so(3)` rotation of the mass texture (N301) COMPLEXIFIES to `su(3)_flavour`: the
    generation-mixing sector is complex, its imaginary/CP-phase axis the fold-root √−1. -/
theorem famMixJ_sq_slotC_one :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆
      (⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotC 1))
      = (-16 : ℚ) • slotC (1 : O ℚ) := by
  rw [famMixJ_slotC_one]
  have hsmul : slotC ((-4 : ℚ) • (u1 : O ℚ)) = (-4 : ℚ) • slotC (u1 : O ℚ) := by
    apply Matrix.ext; intro i j
    fin_cases i <;> fin_cases j <;> simp [slotC, Xz, Matrix.smul_apply]
  rw [hsmul, map_smul, famMixJ_slotC_u1]
  have hsmul2 : slotC ((4 : ℚ) • (1 : O ℚ)) = (4 : ℚ) • slotC (1 : O ℚ) := by
    apply Matrix.ext; intro i j
    fin_cases i <;> fin_cases j <;> simp [slotC, Xz, Matrix.smul_apply]
  rw [hsmul2, smul_smul]; norm_num

/-! ## W8 anti-vacuity — a genuine nonzero imaginary mixing motion. -/

/-- ★★ W8 NON-VACUITY. The family-breaking generator produces a genuine nonzero IMAGINARY mixing
    motion: `kAB (Dg 0 0 1) = slotC (−u1) ≠ 0` (`slotC (−u1)` has `(1,2)` entry `−u1 ≠ 0`). The
    complexification of mixing is not the trivial zero motion. -/
theorem kAB_imag_mix_nonvacuous :
    innerMul (slotA (u1:O ℚ)) (slotB 1) (Dg 0 0 1) = slotC (-u1) ∧
    slotC (-u1 : O ℚ) ≠ 0 := by
  refine ⟨by rw [kAB_diag_to_imag_mix]; congr 1; rw [sub_zero, one_smul], ?_⟩
  intro h
  have hentry : (slotC (-u1 : O ℚ)) 1 2 = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1 2 := by rw [h]
  simp only [slotC, Xz, Matrix.zero_apply] at hentry
  exact u1_ne_zero (neg_eq_zero.mp hentry)

/-! ## The capstone — the fold-root complexification of the generation-mixing sector. -/

/-- ★★★ THE FOLD-ROOT COMPLEXIFICATION OF THE GENERATION-MIXING SECTOR. Bundles:
    · the IMAGINARY mixing leg (`kAB (Dg t) = slotC ((t2−t1)•(−u1))`, `kAB_diag_to_imag_mix`);
    · the family-BREAKING coset rotating the mass-splitting mover to the imaginary mixing mover
      (`breaking_rotates_split_to_imag_mix`);
    · the family-breaking generator is FULLY isospectral (`kAB_kills_linear/quadratic/cubic`) — the
      complex rotation preserves the whole spectrum;
    · the two mixing axes `1` (real, famC) and `u1` (imaginary, kAB) both in the fold's colour-neutral
      complex core `span{1, u1}` (N266) — the mixing sector is complex, its imaginary axis the fold-root;
    · the COMPLEX STRUCTURE `⁅famC, kAB⁆² = −16` on the mixing plane (`famMixJ_sq_slotC_one`) — the
      derived `su(3)_flavour` Cartan phasing the mixing by the fold-root √−1;
    · non-vacuity (a genuine nonzero imaginary mixing motion).
    Cap-forced at the maximal Jordan order 3 (`jordan_fails_H4`, N5). DERIVED — the CKM/PMNS complex
    phase the field posits as a free CP-violating parameter is here the fold-root √−1, and the complex
    mixing preserves the full spectrum. -/
theorem family_mixing_complexification_structure :
    (∀ t0 t1 t2 : ℚ, innerMul (slotA (u1:O ℚ)) (slotB 1) (Dg t0 t1 t2)
        = slotC ((t2 - t1) • (-u1 : O ℚ)))
    ∧ (∀ t0 t1 t2 : ℚ, ∀ B : Matrix (Fin 3) (Fin 3) (O ℚ), Bᴴ = B →
        ⁅innerMul (slotA (u1:O ℚ)) (slotB 1), Lmul (Dg t0 t1 t2)⁆ B
          = Lmul (slotC ((t2 - t1) • (-u1 : O ℚ))) B)
    ∧ (∀ A : Matrix (Fin 3) (Fin 3) (O ℚ), Aᴴ = A →
        rtr (innerMul (slotA (u1:O ℚ)) (slotB 1) A) = 0
        ∧ rtr (jb A (innerMul (slotA (u1:O ℚ)) (slotB 1) A)) = 0
        ∧ rtr (jb (jb A A) (innerMul (slotA (u1:O ℚ)) (slotB 1) A)) = 0)
    ∧ ((1 : O ℚ) ∈ Submodule.span ℚ {(1 : O ℚ), u1}
        ∧ (u1 : O ℚ) ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    ∧ (⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆
        (⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotC 1))
        = (-16 : ℚ) • slotC (1 : O ℚ))
    ∧ (innerMul (slotA (u1:O ℚ)) (slotB 1) (Dg 0 0 1) = slotC (-u1) ∧ slotC (-u1 : O ℚ) ≠ 0)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨kAB_diag_to_imag_mix,
   fun t0 t1 t2 _B hB => breaking_rotates_split_to_imag_mix t0 t1 t2 hB,
   fun _A hA => ⟨kAB_kills_linear hA, kAB_kills_quadratic hA, kAB_kills_cubic hA⟩,
   ⟨one_in_fold_core, u1_in_fold_core⟩,
   famMixJ_sq_slotC_one,
   kAB_imag_mix_nonvacuous,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
