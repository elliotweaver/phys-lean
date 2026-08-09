/-
  ScratchN711 — annihilator geometry of the terminal double `S ℚ` (pure algebra).
  ================================================================================
  Prereg targets (workbench/sedenion-annihilator/PREREG.md), priority order per the
  re-dispatch addendum: T4 (two-sided annihilator quadruple at zdX), T6/T7 (sparse
  ray family + witness direction of the zero-divisor classification), T8 (counts),
  T11 (Leibniz-at-zero), then the rest as budget allows with honest BLOCKED markers.
  All statements are pure algebra: annihilators, kernels, rays, counts.
  No sorry / no admit / no axiom.
-/
import Phys.Cascade.Sedenion
import Mathlib.Tactic

set_option linter.unnecessarySimpa false
set_option linter.unusedSimpArgs false

namespace Workbench.N711

open Phys.Cascade

/-! ## T4 — the two-sided annihilator quadruple at `zdX = e₁ + e₁₀`.

    Recon (exact rationals, recon_verify.py): the two-sided annihilator of `zdX`
    contains the four independent directions
      `a₁ = e₇ + e₁₂`, `a₂ = −e₆ + e₁₃`, `a₃ = e₅ + e₁₄ (= zdY)`, `a₄ = −e₄ + e₁₅`.
    Coordinate convention (flat index n = 8·b₃ + 4·b₂ + 2·b₁ + b₀ picks the nesting
    `S.im`ᵇ³ `O.im`ᵇ² `H.im`ᵇ¹ `Dbl.im`ᵇ⁰), exactly as in `zdX`/`zdY`. -/

/-- `a₁ = e₇ + e₁₂` in flat coordinates. -/
def a1 : S ℚ :=
  ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 1⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨1, 0⟩, ⟨0, 0⟩⟩⟩⟩

/-- `a₂ = −e₆ + e₁₃` in flat coordinates. -/
def a2 : S ℚ :=
  ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨-1, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 1⟩, ⟨0, 0⟩⟩⟩⟩

/-- `a₃ = e₅ + e₁₄` — this is exactly the banked `zdY`. -/
def a3 : S ℚ := zdY

/-- `a₄ = −e₄ + e₁₅` in flat coordinates. -/
def a4 : S ℚ :=
  ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨-1, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 1⟩⟩⟩⟩

set_option maxHeartbeats 1000000 in
/-- `a₁` left-annihilates: `zdX * a₁ = 0`. -/
theorem zdX_mul_a1 : zdX * a1 = 0 := by
  ext <;> simp [zdX, a1, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

set_option maxHeartbeats 1000000 in
/-- `a₁` right-annihilates: `a₁ * zdX = 0`. -/
theorem a1_mul_zdX : a1 * zdX = 0 := by
  ext <;> simp [zdX, a1, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

set_option maxHeartbeats 1000000 in
/-- `a₂` left-annihilates: `zdX * a₂ = 0`. -/
theorem zdX_mul_a2 : zdX * a2 = 0 := by
  ext <;> simp [zdX, a2, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

set_option maxHeartbeats 1000000 in
/-- `a₂` right-annihilates: `a₂ * zdX = 0`. -/
theorem a2_mul_zdX : a2 * zdX = 0 := by
  ext <;> simp [zdX, a2, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

/-- `a₃` left-annihilates: `zdX * a₃ = 0` (the banked `zero_divisor_prod`). -/
theorem zdX_mul_a3 : zdX * a3 = 0 := zero_divisor_prod

set_option maxHeartbeats 1000000 in
/-- `a₃` right-annihilates: `a₃ * zdX = 0` (the banked zero divisor is two-sided). -/
theorem a3_mul_zdX : a3 * zdX = 0 := by
  ext <;> simp [zdX, a3, zdY, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

set_option maxHeartbeats 1000000 in
/-- `a₄` left-annihilates: `zdX * a₄ = 0`. -/
theorem zdX_mul_a4 : zdX * a4 = 0 := by
  ext <;> simp [zdX, a4, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

set_option maxHeartbeats 1000000 in
/-- `a₄` right-annihilates: `a₄ * zdX = 0`. -/
theorem a4_mul_zdX : a4 * zdX = 0 := by
  ext <;> simp [zdX, a4, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

/-- ★ T4 — THE QUADRUPLE IS TWO-SIDED: each of the four directions annihilates
    `zdX` on BOTH sides. Packaged as one statement. -/
theorem annBasis_two_sided :
    (zdX * a1 = 0 ∧ a1 * zdX = 0) ∧ (zdX * a2 = 0 ∧ a2 * zdX = 0) ∧
    (zdX * a3 = 0 ∧ a3 * zdX = 0) ∧ (zdX * a4 = 0 ∧ a4 * zdX = 0) :=
  ⟨⟨zdX_mul_a1, a1_mul_zdX⟩, ⟨zdX_mul_a2, a2_mul_zdX⟩,
   ⟨zdX_mul_a3, a3_mul_zdX⟩, ⟨zdX_mul_a4, a4_mul_zdX⟩⟩

/-- `a₁ ≠ 0` (anti-vacuity: its `e₇` coordinate is `1`). -/
theorem a1_ne_zero : a1 ≠ (0 : S ℚ) := by
  intro h
  have h2 : (1 : ℚ) = 0 := by
    have := congrArg (fun z : S ℚ => z.re.im.im.im) h; simpa [a1] using this
  exact one_ne_zero h2

/-- `a₂ ≠ 0` (anti-vacuity: its `e₁₃` coordinate is `1`). -/
theorem a2_ne_zero : a2 ≠ (0 : S ℚ) := by
  intro h
  have h2 : (1 : ℚ) = 0 := by
    have := congrArg (fun z : S ℚ => z.im.im.re.im) h; simpa [a2] using this
  exact one_ne_zero h2

/-- `a₃ ≠ 0` (banked). -/
theorem a3_ne_zero : a3 ≠ (0 : S ℚ) := zdY_ne_zero

/-- `a₄ ≠ 0` (anti-vacuity: its `e₁₅` coordinate is `1`). -/
theorem a4_ne_zero : a4 ≠ (0 : S ℚ) := by
  intro h
  have h2 : (1 : ℚ) = 0 := by
    have := congrArg (fun z : S ℚ => z.im.im.im.im) h; simpa [a4] using this
  exact one_ne_zero h2

/-! ## T6 — the sparse ray family `z(i,k,s) = e_{i+1} + s·e_{9+k}`.

    Basis convention: `eS n` is the flat basis direction `e_n` of `S ℚ`,
    `n = 8·b₃ + 4·b₂ + 2·b₁ + b₀` selecting the nesting
    (`S`-slot, `O`-slot, `H`-slot, `Dbl`-slot). Matches `zdX = e₁ + e₁₀`. -/

/-- The flat basis vector `e_n` of `S ℚ` (n = 0..15). -/
def eS : Fin 16 → S ℚ :=
  ![⟨⟨⟨⟨1,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,1⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨1,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,1⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨1,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,1⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨1,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,1⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨1,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,1⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨1,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,1⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨1,0⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,1⟩,⟨0,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨1,0⟩⟩⟩⟩,
    ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,1⟩⟩⟩⟩]

/-- The sign of a `Bool`: `true ↦ 1`, `false ↦ −1`. -/
def sgn (s : Bool) : ℚ := if s then 1 else -1

/-- T6 — THE SPARSE RAY. `zRay i k s = e_{i+1} + (±1)·e_{9+k}`: one lower
    (index 1..7) and one upper (index 9..15) basis direction, sign `s`.
    (Index shift per prereg: lower slots `i.val+1 ∈ 1..7`, upper slots
    `9+k.val = 8+(k.val+1) ∈ 9..15`.) -/
def zRay (i k : Fin 7) (s : Bool) : S ℚ :=
  eS ⟨i.val + 1, by omega⟩ +
    (if s then eS ⟨9 + k.val, by omega⟩ else -eS ⟨9 + k.val, by omega⟩)

/-- Sanity: `zRay 0 1 true` is exactly the banked `zdX = e₁ + e₁₀`. -/
theorem zRay_zero_one : zRay 0 1 true = zdX := by
  show eS 1 + eS 10 = zdX
  ext <;> simp [eS, zdX]

/-! ## T7 (witness direction) — off-diagonal rays are two-sided zero divisors.

    THE PARTNER FORMULA (recon-verified for all 84 rays, exact rationals):
    for `i ≠ k` (1-based labels `i,k ∈ 1..7`), set `x := i XOR k`,
    `l := min { l' ∈ 1..7 | l' ∉ {i, k, x} }`, `j := x XOR l`; then there is a
    UNIQUE sign `t = s·u(i,k)` making `z(j,l,t)` a TWO-SIDED annihilating partner
    of `z(i,k,s)`:  `z(i,k,s) · z(j,l,t) = 0 = z(j,l,t) · z(i,k,s)`.
    The sign table `u` is odd under `s ↦ −s` (`t(−s) = −t(s)`).
    A concrete instance is banked below; the full 84-case enumeration is
    generated in the T7-ENUM section. -/

set_option maxHeartbeats 1000000 in
/-- Witness instance of the partner formula at `(i,k,s) = (1,2,+1)`:
    partner `(j,l,t) = (7,4,+1)` (since `x = 3`, `l = 4`, `j = 3 XOR 4 = 7`,
    `u(1,2) = +1`), left product. -/
theorem zRay12_mul_partner : zRay 0 1 true * zRay 6 3 true = 0 := by
  show (eS 1 + eS 10) * (eS 7 + eS 12) = 0
  ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

set_option maxHeartbeats 1000000 in
/-- Witness instance, right product: the partner annihilates on BOTH sides. -/
theorem partner_mul_zRay12 : zRay 6 3 true * zRay 0 1 true = 0 := by
  show (eS 7 + eS 12) * (eS 1 + eS 10) = 0
  ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

/-! ## T8 — the counts (plain Finset arithmetic, no imports beyond Mathlib).

    The unsigned skeleton: 42 ordered off-diagonal pairs on 7 labels.
    The signed family: 84 rays = 42 pairs × 2 signs. -/

/-- ★ T8a — THE UNSIGNED SKELETON COUNT: `#{(i,k) : Fin 7 × Fin 7 | i ≠ k} = 42`. -/
theorem offDiag_pair_count :
    (Finset.univ.filter (fun p : Fin 7 × Fin 7 => p.1 ≠ p.2)).card = 42 := by
  decide

/-- ★ T8b — THE SIGNED RAY COUNT: `#{(i,k,s) : Fin 7 × Fin 7 × Bool | i ≠ k} = 84`. -/
theorem sparseZDCount :
    (Finset.univ.filter
      (fun p : (Fin 7 × Fin 7) × Bool => p.1.1 ≠ p.1.2)).card = 84 := by
  decide

/-! ## T11 — LEIBNIZ AT ZERO: the zero-product locus is infinitesimally
    derivation-invariant.

    For ANY additive endomorphism `D` of `S ℚ` satisfying the Leibniz law over
    the `S` product (the same predicate shape as the banked
    `Phys.Algebra.IsDeriv` / `liftEnd_isDeriv` at the `CD (CD B)` rung),
    a vanishing product stays vanishing to first order:
    `x·y = 0 → (Dx)·y + x·(Dy) = 0`. One line from the lift: apply `D` to
    `x·y = 0` and use `D 0 = 0`. -/

/-- ★ T11 — LEIBNIZ AT ZERO. Any Leibniz endomorphism (with `D 0 = 0`, e.g. any
    additive map) sends the zero-product relation to its first-order shadow:
    the annihilation locus is infinitesimally invariant under every derivation. -/
theorem leibniz_at_zero (D : S ℚ → S ℚ) (hD0 : D 0 = 0)
    (hLeib : ∀ x y : S ℚ, D (x * y) = D x * y + x * D y)
    (x y : S ℚ) (h : x * y = 0) : D x * y + x * D y = 0 := by
  rw [← hLeib, h, hD0]

/-- T11 corollary at the banked witness: every Leibniz endomorphism kills the
    first-order deformation of the banked zero divisor `zdX · zdY = 0`. -/
theorem leibniz_at_zero_zdXY (D : S ℚ → S ℚ) (hD0 : D 0 = 0)
    (hLeib : ∀ x y : S ℚ, D (x * y) = D x * y + x * D y) :
    D zdX * zdY + zdX * D zdY = 0 :=
  leibniz_at_zero D hD0 hLeib zdX zdY zero_divisor_prod

/-! ## T7-ENUM — the partner law, all 84 rays.

    For every off-diagonal ray `z(i,k,s)` (labels 1-based, `i ≠ k`), the partner
    `z(j,l,t)` with `x = i XOR k`, `l = min(1..7 \ {i,k,x})`, `j = x XOR l`, and
    the recon-determined unique sign `t`, annihilates on BOTH sides. Together with
    ray-nonvanishing this is the witness direction of T7: EVERY off-diagonal ray
    is a genuine two-sided zero divisor. 84 machine-generated lemmas
    (generator: the partner formula above; verified in exact rationals first). -/

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(1,2,+)`: partner `(7,4,+)`, both sides. -/
theorem partner_12p : (eS 1 + eS 10) * (eS 7 + eS 12) = 0 ∧ (eS 7 + eS 12) * (eS 1 + eS 10) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(1,2,-)`: partner `(7,4,-)`, both sides. -/
theorem partner_12m : (eS 1 + -eS 10) * (eS 7 + -eS 12) = 0 ∧ (eS 7 + -eS 12) * (eS 1 + -eS 10) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(1,3,+)`: partner `(6,4,-)`, both sides. -/
theorem partner_13p : (eS 1 + eS 11) * (eS 6 + -eS 12) = 0 ∧ (eS 6 + -eS 12) * (eS 1 + eS 11) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(1,3,-)`: partner `(6,4,+)`, both sides. -/
theorem partner_13m : (eS 1 + -eS 11) * (eS 6 + eS 12) = 0 ∧ (eS 6 + eS 12) * (eS 1 + -eS 11) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(1,4,+)`: partner `(7,2,-)`, both sides. -/
theorem partner_14p : (eS 1 + eS 12) * (eS 7 + -eS 10) = 0 ∧ (eS 7 + -eS 10) * (eS 1 + eS 12) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(1,4,-)`: partner `(7,2,+)`, both sides. -/
theorem partner_14m : (eS 1 + -eS 12) * (eS 7 + eS 10) = 0 ∧ (eS 7 + eS 10) * (eS 1 + -eS 12) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(1,5,+)`: partner `(6,2,+)`, both sides. -/
theorem partner_15p : (eS 1 + eS 13) * (eS 6 + eS 10) = 0 ∧ (eS 6 + eS 10) * (eS 1 + eS 13) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(1,5,-)`: partner `(6,2,-)`, both sides. -/
theorem partner_15m : (eS 1 + -eS 13) * (eS 6 + -eS 10) = 0 ∧ (eS 6 + -eS 10) * (eS 1 + -eS 13) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(1,6,+)`: partner `(5,2,-)`, both sides. -/
theorem partner_16p : (eS 1 + eS 14) * (eS 5 + -eS 10) = 0 ∧ (eS 5 + -eS 10) * (eS 1 + eS 14) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(1,6,-)`: partner `(5,2,+)`, both sides. -/
theorem partner_16m : (eS 1 + -eS 14) * (eS 5 + eS 10) = 0 ∧ (eS 5 + eS 10) * (eS 1 + -eS 14) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(1,7,+)`: partner `(4,2,+)`, both sides. -/
theorem partner_17p : (eS 1 + eS 15) * (eS 4 + eS 10) = 0 ∧ (eS 4 + eS 10) * (eS 1 + eS 15) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(1,7,-)`: partner `(4,2,-)`, both sides. -/
theorem partner_17m : (eS 1 + -eS 15) * (eS 4 + -eS 10) = 0 ∧ (eS 4 + -eS 10) * (eS 1 + -eS 15) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(2,1,+)`: partner `(7,4,-)`, both sides. -/
theorem partner_21p : (eS 2 + eS 9) * (eS 7 + -eS 12) = 0 ∧ (eS 7 + -eS 12) * (eS 2 + eS 9) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(2,1,-)`: partner `(7,4,+)`, both sides. -/
theorem partner_21m : (eS 2 + -eS 9) * (eS 7 + eS 12) = 0 ∧ (eS 7 + eS 12) * (eS 2 + -eS 9) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(2,3,+)`: partner `(5,4,+)`, both sides. -/
theorem partner_23p : (eS 2 + eS 11) * (eS 5 + eS 12) = 0 ∧ (eS 5 + eS 12) * (eS 2 + eS 11) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(2,3,-)`: partner `(5,4,-)`, both sides. -/
theorem partner_23m : (eS 2 + -eS 11) * (eS 5 + -eS 12) = 0 ∧ (eS 5 + -eS 12) * (eS 2 + -eS 11) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(2,4,+)`: partner `(7,1,+)`, both sides. -/
theorem partner_24p : (eS 2 + eS 12) * (eS 7 + eS 9) = 0 ∧ (eS 7 + eS 9) * (eS 2 + eS 12) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(2,4,-)`: partner `(7,1,-)`, both sides. -/
theorem partner_24m : (eS 2 + -eS 12) * (eS 7 + -eS 9) = 0 ∧ (eS 7 + -eS 9) * (eS 2 + -eS 12) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(2,5,+)`: partner `(6,1,-)`, both sides. -/
theorem partner_25p : (eS 2 + eS 13) * (eS 6 + -eS 9) = 0 ∧ (eS 6 + -eS 9) * (eS 2 + eS 13) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(2,5,-)`: partner `(6,1,+)`, both sides. -/
theorem partner_25m : (eS 2 + -eS 13) * (eS 6 + eS 9) = 0 ∧ (eS 6 + eS 9) * (eS 2 + -eS 13) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(2,6,+)`: partner `(5,1,+)`, both sides. -/
theorem partner_26p : (eS 2 + eS 14) * (eS 5 + eS 9) = 0 ∧ (eS 5 + eS 9) * (eS 2 + eS 14) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(2,6,-)`: partner `(5,1,-)`, both sides. -/
theorem partner_26m : (eS 2 + -eS 14) * (eS 5 + -eS 9) = 0 ∧ (eS 5 + -eS 9) * (eS 2 + -eS 14) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(2,7,+)`: partner `(4,1,-)`, both sides. -/
theorem partner_27p : (eS 2 + eS 15) * (eS 4 + -eS 9) = 0 ∧ (eS 4 + -eS 9) * (eS 2 + eS 15) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(2,7,-)`: partner `(4,1,+)`, both sides. -/
theorem partner_27m : (eS 2 + -eS 15) * (eS 4 + eS 9) = 0 ∧ (eS 4 + eS 9) * (eS 2 + -eS 15) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(3,1,+)`: partner `(6,4,+)`, both sides. -/
theorem partner_31p : (eS 3 + eS 9) * (eS 6 + eS 12) = 0 ∧ (eS 6 + eS 12) * (eS 3 + eS 9) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(3,1,-)`: partner `(6,4,-)`, both sides. -/
theorem partner_31m : (eS 3 + -eS 9) * (eS 6 + -eS 12) = 0 ∧ (eS 6 + -eS 12) * (eS 3 + -eS 9) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(3,2,+)`: partner `(5,4,-)`, both sides. -/
theorem partner_32p : (eS 3 + eS 10) * (eS 5 + -eS 12) = 0 ∧ (eS 5 + -eS 12) * (eS 3 + eS 10) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(3,2,-)`: partner `(5,4,+)`, both sides. -/
theorem partner_32m : (eS 3 + -eS 10) * (eS 5 + eS 12) = 0 ∧ (eS 5 + eS 12) * (eS 3 + -eS 10) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(3,4,+)`: partner `(6,1,-)`, both sides. -/
theorem partner_34p : (eS 3 + eS 12) * (eS 6 + -eS 9) = 0 ∧ (eS 6 + -eS 9) * (eS 3 + eS 12) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(3,4,-)`: partner `(6,1,+)`, both sides. -/
theorem partner_34m : (eS 3 + -eS 12) * (eS 6 + eS 9) = 0 ∧ (eS 6 + eS 9) * (eS 3 + -eS 12) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(3,5,+)`: partner `(7,1,-)`, both sides. -/
theorem partner_35p : (eS 3 + eS 13) * (eS 7 + -eS 9) = 0 ∧ (eS 7 + -eS 9) * (eS 3 + eS 13) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(3,5,-)`: partner `(7,1,+)`, both sides. -/
theorem partner_35m : (eS 3 + -eS 13) * (eS 7 + eS 9) = 0 ∧ (eS 7 + eS 9) * (eS 3 + -eS 13) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(3,6,+)`: partner `(4,1,+)`, both sides. -/
theorem partner_36p : (eS 3 + eS 14) * (eS 4 + eS 9) = 0 ∧ (eS 4 + eS 9) * (eS 3 + eS 14) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(3,6,-)`: partner `(4,1,-)`, both sides. -/
theorem partner_36m : (eS 3 + -eS 14) * (eS 4 + -eS 9) = 0 ∧ (eS 4 + -eS 9) * (eS 3 + -eS 14) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(3,7,+)`: partner `(5,1,+)`, both sides. -/
theorem partner_37p : (eS 3 + eS 15) * (eS 5 + eS 9) = 0 ∧ (eS 5 + eS 9) * (eS 3 + eS 15) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(3,7,-)`: partner `(5,1,-)`, both sides. -/
theorem partner_37m : (eS 3 + -eS 15) * (eS 5 + -eS 9) = 0 ∧ (eS 5 + -eS 9) * (eS 3 + -eS 15) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(4,1,+)`: partner `(7,2,+)`, both sides. -/
theorem partner_41p : (eS 4 + eS 9) * (eS 7 + eS 10) = 0 ∧ (eS 7 + eS 10) * (eS 4 + eS 9) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(4,1,-)`: partner `(7,2,-)`, both sides. -/
theorem partner_41m : (eS 4 + -eS 9) * (eS 7 + -eS 10) = 0 ∧ (eS 7 + -eS 10) * (eS 4 + -eS 9) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(4,2,+)`: partner `(7,1,-)`, both sides. -/
theorem partner_42p : (eS 4 + eS 10) * (eS 7 + -eS 9) = 0 ∧ (eS 7 + -eS 9) * (eS 4 + eS 10) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(4,2,-)`: partner `(7,1,+)`, both sides. -/
theorem partner_42m : (eS 4 + -eS 10) * (eS 7 + eS 9) = 0 ∧ (eS 7 + eS 9) * (eS 4 + -eS 10) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(4,3,+)`: partner `(6,1,+)`, both sides. -/
theorem partner_43p : (eS 4 + eS 11) * (eS 6 + eS 9) = 0 ∧ (eS 6 + eS 9) * (eS 4 + eS 11) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(4,3,-)`: partner `(6,1,-)`, both sides. -/
theorem partner_43m : (eS 4 + -eS 11) * (eS 6 + -eS 9) = 0 ∧ (eS 6 + -eS 9) * (eS 4 + -eS 11) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(4,5,+)`: partner `(3,2,+)`, both sides. -/
theorem partner_45p : (eS 4 + eS 13) * (eS 3 + eS 10) = 0 ∧ (eS 3 + eS 10) * (eS 4 + eS 13) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(4,5,-)`: partner `(3,2,-)`, both sides. -/
theorem partner_45m : (eS 4 + -eS 13) * (eS 3 + -eS 10) = 0 ∧ (eS 3 + -eS 10) * (eS 4 + -eS 13) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(4,6,+)`: partner `(3,1,-)`, both sides. -/
theorem partner_46p : (eS 4 + eS 14) * (eS 3 + -eS 9) = 0 ∧ (eS 3 + -eS 9) * (eS 4 + eS 14) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(4,6,-)`: partner `(3,1,+)`, both sides. -/
theorem partner_46m : (eS 4 + -eS 14) * (eS 3 + eS 9) = 0 ∧ (eS 3 + eS 9) * (eS 4 + -eS 14) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(4,7,+)`: partner `(2,1,+)`, both sides. -/
theorem partner_47p : (eS 4 + eS 15) * (eS 2 + eS 9) = 0 ∧ (eS 2 + eS 9) * (eS 4 + eS 15) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(4,7,-)`: partner `(2,1,-)`, both sides. -/
theorem partner_47m : (eS 4 + -eS 15) * (eS 2 + -eS 9) = 0 ∧ (eS 2 + -eS 9) * (eS 4 + -eS 15) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(5,1,+)`: partner `(6,2,-)`, both sides. -/
theorem partner_51p : (eS 5 + eS 9) * (eS 6 + -eS 10) = 0 ∧ (eS 6 + -eS 10) * (eS 5 + eS 9) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(5,1,-)`: partner `(6,2,+)`, both sides. -/
theorem partner_51m : (eS 5 + -eS 9) * (eS 6 + eS 10) = 0 ∧ (eS 6 + eS 10) * (eS 5 + -eS 9) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(5,2,+)`: partner `(6,1,+)`, both sides. -/
theorem partner_52p : (eS 5 + eS 10) * (eS 6 + eS 9) = 0 ∧ (eS 6 + eS 9) * (eS 5 + eS 10) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(5,2,-)`: partner `(6,1,-)`, both sides. -/
theorem partner_52m : (eS 5 + -eS 10) * (eS 6 + -eS 9) = 0 ∧ (eS 6 + -eS 9) * (eS 5 + -eS 10) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(5,3,+)`: partner `(7,1,+)`, both sides. -/
theorem partner_53p : (eS 5 + eS 11) * (eS 7 + eS 9) = 0 ∧ (eS 7 + eS 9) * (eS 5 + eS 11) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(5,3,-)`: partner `(7,1,-)`, both sides. -/
theorem partner_53m : (eS 5 + -eS 11) * (eS 7 + -eS 9) = 0 ∧ (eS 7 + -eS 9) * (eS 5 + -eS 11) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(5,4,+)`: partner `(3,2,-)`, both sides. -/
theorem partner_54p : (eS 5 + eS 12) * (eS 3 + -eS 10) = 0 ∧ (eS 3 + -eS 10) * (eS 5 + eS 12) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(5,4,-)`: partner `(3,2,+)`, both sides. -/
theorem partner_54m : (eS 5 + -eS 12) * (eS 3 + eS 10) = 0 ∧ (eS 3 + eS 10) * (eS 5 + -eS 12) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(5,6,+)`: partner `(2,1,-)`, both sides. -/
theorem partner_56p : (eS 5 + eS 14) * (eS 2 + -eS 9) = 0 ∧ (eS 2 + -eS 9) * (eS 5 + eS 14) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(5,6,-)`: partner `(2,1,+)`, both sides. -/
theorem partner_56m : (eS 5 + -eS 14) * (eS 2 + eS 9) = 0 ∧ (eS 2 + eS 9) * (eS 5 + -eS 14) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(5,7,+)`: partner `(3,1,-)`, both sides. -/
theorem partner_57p : (eS 5 + eS 15) * (eS 3 + -eS 9) = 0 ∧ (eS 3 + -eS 9) * (eS 5 + eS 15) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(5,7,-)`: partner `(3,1,+)`, both sides. -/
theorem partner_57m : (eS 5 + -eS 15) * (eS 3 + eS 9) = 0 ∧ (eS 3 + eS 9) * (eS 5 + -eS 15) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(6,1,+)`: partner `(5,2,+)`, both sides. -/
theorem partner_61p : (eS 6 + eS 9) * (eS 5 + eS 10) = 0 ∧ (eS 5 + eS 10) * (eS 6 + eS 9) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(6,1,-)`: partner `(5,2,-)`, both sides. -/
theorem partner_61m : (eS 6 + -eS 9) * (eS 5 + -eS 10) = 0 ∧ (eS 5 + -eS 10) * (eS 6 + -eS 9) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(6,2,+)`: partner `(5,1,-)`, both sides. -/
theorem partner_62p : (eS 6 + eS 10) * (eS 5 + -eS 9) = 0 ∧ (eS 5 + -eS 9) * (eS 6 + eS 10) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(6,2,-)`: partner `(5,1,+)`, both sides. -/
theorem partner_62m : (eS 6 + -eS 10) * (eS 5 + eS 9) = 0 ∧ (eS 5 + eS 9) * (eS 6 + -eS 10) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(6,3,+)`: partner `(4,1,-)`, both sides. -/
theorem partner_63p : (eS 6 + eS 11) * (eS 4 + -eS 9) = 0 ∧ (eS 4 + -eS 9) * (eS 6 + eS 11) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(6,3,-)`: partner `(4,1,+)`, both sides. -/
theorem partner_63m : (eS 6 + -eS 11) * (eS 4 + eS 9) = 0 ∧ (eS 4 + eS 9) * (eS 6 + -eS 11) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(6,4,+)`: partner `(3,1,+)`, both sides. -/
theorem partner_64p : (eS 6 + eS 12) * (eS 3 + eS 9) = 0 ∧ (eS 3 + eS 9) * (eS 6 + eS 12) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(6,4,-)`: partner `(3,1,-)`, both sides. -/
theorem partner_64m : (eS 6 + -eS 12) * (eS 3 + -eS 9) = 0 ∧ (eS 3 + -eS 9) * (eS 6 + -eS 12) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(6,5,+)`: partner `(2,1,+)`, both sides. -/
theorem partner_65p : (eS 6 + eS 13) * (eS 2 + eS 9) = 0 ∧ (eS 2 + eS 9) * (eS 6 + eS 13) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(6,5,-)`: partner `(2,1,-)`, both sides. -/
theorem partner_65m : (eS 6 + -eS 13) * (eS 2 + -eS 9) = 0 ∧ (eS 2 + -eS 9) * (eS 6 + -eS 13) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(6,7,+)`: partner `(3,2,-)`, both sides. -/
theorem partner_67p : (eS 6 + eS 15) * (eS 3 + -eS 10) = 0 ∧ (eS 3 + -eS 10) * (eS 6 + eS 15) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(6,7,-)`: partner `(3,2,+)`, both sides. -/
theorem partner_67m : (eS 6 + -eS 15) * (eS 3 + eS 10) = 0 ∧ (eS 3 + eS 10) * (eS 6 + -eS 15) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(7,1,+)`: partner `(4,2,-)`, both sides. -/
theorem partner_71p : (eS 7 + eS 9) * (eS 4 + -eS 10) = 0 ∧ (eS 4 + -eS 10) * (eS 7 + eS 9) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(7,1,-)`: partner `(4,2,+)`, both sides. -/
theorem partner_71m : (eS 7 + -eS 9) * (eS 4 + eS 10) = 0 ∧ (eS 4 + eS 10) * (eS 7 + -eS 9) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(7,2,+)`: partner `(4,1,+)`, both sides. -/
theorem partner_72p : (eS 7 + eS 10) * (eS 4 + eS 9) = 0 ∧ (eS 4 + eS 9) * (eS 7 + eS 10) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(7,2,-)`: partner `(4,1,-)`, both sides. -/
theorem partner_72m : (eS 7 + -eS 10) * (eS 4 + -eS 9) = 0 ∧ (eS 4 + -eS 9) * (eS 7 + -eS 10) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(7,3,+)`: partner `(5,1,-)`, both sides. -/
theorem partner_73p : (eS 7 + eS 11) * (eS 5 + -eS 9) = 0 ∧ (eS 5 + -eS 9) * (eS 7 + eS 11) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(7,3,-)`: partner `(5,1,+)`, both sides. -/
theorem partner_73m : (eS 7 + -eS 11) * (eS 5 + eS 9) = 0 ∧ (eS 5 + eS 9) * (eS 7 + -eS 11) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(7,4,+)`: partner `(2,1,-)`, both sides. -/
theorem partner_74p : (eS 7 + eS 12) * (eS 2 + -eS 9) = 0 ∧ (eS 2 + -eS 9) * (eS 7 + eS 12) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(7,4,-)`: partner `(2,1,+)`, both sides. -/
theorem partner_74m : (eS 7 + -eS 12) * (eS 2 + eS 9) = 0 ∧ (eS 2 + eS 9) * (eS 7 + -eS 12) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(7,5,+)`: partner `(3,1,+)`, both sides. -/
theorem partner_75p : (eS 7 + eS 13) * (eS 3 + eS 9) = 0 ∧ (eS 3 + eS 9) * (eS 7 + eS 13) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(7,5,-)`: partner `(3,1,-)`, both sides. -/
theorem partner_75m : (eS 7 + -eS 13) * (eS 3 + -eS 9) = 0 ∧ (eS 3 + -eS 9) * (eS 7 + -eS 13) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(7,6,+)`: partner `(3,2,+)`, both sides. -/
theorem partner_76p : (eS 7 + eS 14) * (eS 3 + eS 10) = 0 ∧ (eS 3 + eS 10) * (eS 7 + eS 14) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

set_option maxHeartbeats 4000000 in
/-- Partner law at `(i,k,s)=(7,6,-)`: partner `(3,2,-)`, both sides. -/
theorem partner_76m : (eS 7 + -eS 14) * (eS 3 + -eS 10) = 0 ∧ (eS 3 + -eS 10) * (eS 7 + -eS 14) = 0 := by
  constructor <;>
    (ext <;> simp [eS, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])

/-! ## T7 packaging — a ray IS a genuine two-sided zero divisor (witness level). -/

/-- The banked quadruple direction `a₁ = e₇ + e₁₂` equals the ray-shaped partner
    of `zRay 0 1 true`. -/
theorem a1_eq_partner : a1 = eS 7 + eS 12 := by
  ext <;> simp [a1, eS]

/-- ★ T7 (witness direction, packaged): the ray `z(1,2,+) = zdX` is a GENUINE
    two-sided zero divisor — a nonzero partner annihilates it on both sides. -/
theorem zRay_zero_one_isZeroDivisor :
    ∃ y : S ℚ, y ≠ 0 ∧ zRay 0 1 true * y = 0 ∧ y * zRay 0 1 true = 0 := by
  refine ⟨a1, a1_ne_zero, ?_, ?_⟩
  · rw [zRay_zero_one]; exact zdX_mul_a1
  · rw [zRay_zero_one]; exact a1_mul_zdX

/-! ## HONEST BLOCKED MARKERS (prereg discipline — not attempted, no claim made)

    T1/T2 (annL/annR as `Submodule ℚ (S ℚ)` kernels): NOT BUILT — requires the
      `Module ℚ (S ℚ)` + bilinearity packaging of left/right multiplication; the
      module-structure plumbing was out of budget. BLOCKED (budget).
    T3 (finrank of the kernel = 4): NOT PROVED — membership + independence of the
      quadruple is implied by T4 + the nonvanishing lemmas, but the SPANNING half
      (dim ≤ 4, i.e. rank L = 12) needs the 16-equation coordinate elimination or a
      12-dim image family. BLOCKED (budget).
    T5 (annL = annR at zdX): the two-sided QUADRUPLE statement (T4) is the honest
      banked form; submodule equality needs T1–T3. BLOCKED (depends on T1–T3).
    T7 (diagonal direction, i = k ⇒ NOT a zero divisor): needs the norm/rank
      argument on the associative 2-plane. NOT attempted. BLOCKED (budget).
    T9 (annihilation graph, 4-regularity): the 84 partner lemmas give ONE edge per
      vertex (each ray has its canonical partner); degree-4 at a witness and full
      4-regularity are not banked. BLOCKED (budget).
    T10 (XOR component invariant): edge-preservation of `i XOR k` is VISIBLE in the
      partner formula itself (`j XOR l = (x XOR l) XOR l = x = i XOR k` — the
      canonical partner provably carries the same label by construction), but the
      general edge statement over all edges is not formalized. BLOCKED (budget). -/

end Workbench.N711
