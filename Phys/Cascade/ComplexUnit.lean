/-
  Phys.Cascade.ComplexUnit — N2 rung 1: THE FORCED COMPLEX UNIT.
  ===========================================================================
  THE FIRST RUNG OF THE CASCADE. N1 (Phys/Foundation/Fold.lean) defines the fold
  by the look-back law and proves it is negation (`look = -id`, `look² = id`) and
  self-blind; it pointedly leaves the complex unit `J² = −1` to N2. Here that unit
  is DERIVED — never posited, never imported (no `import ...Complex`, no
  `Complex.I`). A physicist READS "ℂ" out of the math, never INTO it.

  THE FORWARD DERIVATION (derived forward from N1; NOT assumed backward — cf. the
  drift trap in docs/ROADMAP.md N2 and docs/RUNBOOK.md W1/W5):

  Recursive self-blindness = the look-back applied to ITSELF = seeking a *square
  root of the fold*: an operator `J` with `J ∘ J = look = -id`. Reusing N1
  directly this is `IsFold (J ∘ J)` — a *fold-root* (`IsFoldRoot`). The fold
  forcing the complex unit is then a chain of theorems in two movements:

  ── OBSTRUCTION (the base is too small; positivity blocks it) ──
    isFoldRoot_iff           — a fold-root squares to `-id` (`J (J x) = -x`).
    sqrt_fold_not_on_line    — on an ORDERED base ring, no scalar squares to `-1`
                               (`j*j ≥ 0 > -1`): the fold's own self-overlap
                               positivity (Born = self-overlap, the trunk) blinds
                               it to its root within the line.
    foldRoot_forces_even_dim — ★ THE WHY-DOUBLE LAW. Any real-linear fold-root on
                               a finite-dim space forces EVEN dimension. ONE cause
                               — `det(J)² = (-1)^dim ≥ 0`, the same positivity —
                               blocks every odd dimension at once. (This is the
                               project's "one cause, many terminations" template.)
    no_foldRoot_dim1         — the base carrier (dim 1, odd) is blocked: no linear
                               fold-root exists there. The line must grow.

  ── RESOLUTION (doubling 1 → 2 carries it; the algebra is FORCED) ──
    J₂                       — operator witness that the minimal even dim 2 is
                               ACHIEVED: `J₂(a,b) = (-b,a)` on `Cut × Cut` (the
                               DERIVED ℝ, N11–N13), a genuine fold-root
                               (`J₂_isFoldRoot`), self-blind via N1
                               (`J₂_self_blind`) and genuinely new.
    Dbl R, instance CommRing — THE COMPLEX ALGEBRA, abstractly over any base ring:
                               the double `R × R` is a commutative ring (nothing
                               collapsed). This is the cascade object — doubling it
                               again is N2b's ℍ.
    Dbl.mul_forced           — ★ THE PRODUCT IS FORCED, not chosen: any unital,
                               bilinear product on the double with `J*J = -1` is
                               UNIQUELY the Cayley–Dickson product. `J² = -1` plus
                               bilinearity determines the whole multiplication.
    Dbl.J_mul_J              — ★ THE COMPLEX UNIT, DERIVED: `J * J = -1` in the
                               algebra. The unit N1 deferred, now a theorem on the
                               forced carrier with the forced product.
    Dbl.J_self_blind         — the algebra's complex unit inherits the fold's
                               self-blindness (via N1's `fold_self_blind`).

  ONE CAUSE: the same positivity (self-overlap ≥ 0) that forbids the root on the
  line (and on every odd dimension) is what forces the step up a dimension. The
  cascade has taken its first forced rung. (Rungs ℍ → 𝕆 and the proved STOP are N2b.)

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "fold / look-back /
  self-blindness / complex unit / Born / void": what remains is a complete theory
  of square roots of `-1` — the impossibility on an ordered ring and on every odd
  dimension, the forced 2-dimensional doubling, the forced product, and the
  derived element squaring to `-1`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Prod
import Mathlib.Algebra.Order.Ring.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Foundation.ContinuumFieldInverse

namespace Phys.Cascade

open Phys.Foundation Module

/-! ## The notion: a square root of the fold (rooted in N1). -/

variable {V : Type*} [AddGroup V]

/-- A *fold-root*: a self-map whose square IS the fold (N1). Reuses `IsFold`
    directly — `J ∘ J` annihilates each state — so the chain back to N1 is
    explicit and unbroken: a fold-root is a square root of the look-back. -/
def IsFoldRoot (J : V → V) : Prop := IsFold (fun x => J (J x))

/-- A fold-root squares to `-id`: `J (J x) = -x` (the complex-unit law, abstractly). -/
theorem isFoldRoot_iff {J : V → V} : IsFoldRoot J ↔ ∀ x, J (J x) = -x := by
  constructor
  · intro h x; exact fold_eq_neg h x
  · intro h x; show J (J x) + x = 0; rw [h x]; exact neg_add_cancel x

/-! ## OBSTRUCTION, scalar form — positivity forbids the root on the ordered line. -/

/-- For a commutative ring base, scaling by `j` is a fold-root iff `j * j = -1`. -/
theorem scalar_isFoldRoot_iff {R : Type*} [CommRing R] (j : R) :
    IsFoldRoot (fun x : R => j * x) ↔ j * j = -1 := by
  rw [isFoldRoot_iff]
  constructor
  · intro h; have h1 := h 1; simp only [mul_one] at h1; exact h1
  · intro h x; rw [← mul_assoc, h, neg_one_mul]

/-- THE OBSTRUCTION (scalar). On an ordered base line, self-overlap is nonnegative,
    so no scalar squares to `-1`: the square root of the fold cannot live on the line. -/
theorem sqrt_fold_not_on_line {R : Type*} [CommRing R] [LinearOrder R]
    [IsStrictOrderedRing R] (j : R) : j * j ≠ -1 := by
  intro h
  have hpos : (0 : R) ≤ j * j := mul_self_nonneg j
  rw [h] at hpos
  have hle : (1 : R) ≤ 0 := neg_nonneg.mp hpos
  exact absurd (lt_of_lt_of_le zero_lt_one hle) (lt_irrefl 0)

/-- No scalar on the ordered line is a fold-root — the recursion has no solution
    within the line, so a new dimension is forced. -/
theorem no_scalar_foldRoot_on_line {R : Type*} [CommRing R] [LinearOrder R]
    [IsStrictOrderedRing R] (j : R) : ¬ IsFoldRoot (fun x : R => j * x) := by
  rw [scalar_isFoldRoot_iff]; exact sqrt_fold_not_on_line j

/-- TIGHTNESS / order load-bearing. Drop the order and the square root of the fold
    DOES live on the line: in `ZMod 5`, `2 * 2 = -1`. The obstruction is exactly
    positivity, not algebra. -/
theorem sqrt_fold_on_unordered_line : ∃ j : ZMod 5, j * j = -1 := ⟨2, by decide⟩

/-- Non-vacuity over the DERIVED ℚ `Phys.Foundation.Q` (a linearly ordered field DERIVED
    from the fold, N9/N10 — NOT imported Mathlib `Rat`): the obstruction is non-vacuous on
    the fold's own rational line. -/
theorem obstruction_nonvacuous : ∀ j : Phys.Foundation.Q, j * j ≠ -1 := sqrt_fold_not_on_line

/-! ## OBSTRUCTION, the WHY-DOUBLE LAW — a linear fold-root over ANY ordered FIELD forces
    EVEN dim. One cause (`det(J)² = (-1)^dim ≥ 0`, the trunk's positivity) blocks every odd
    dimension at once. This is the structural reason the cascade DOUBLES. The law is ABSTRACT
    over any linearly ordered field `K` (the positivity, NOT `K = ℝ`, is the cause); it is then
    INSTANTIATED at the DERIVED ℝ `Phys.Foundation.ContinuumQ.Cut` (N11–N13, a linearly ordered
    field DERIVED from the fold), so no imported Mathlib `ℝ` is load-bearing anywhere. -/

/-- For a linear map over a field `K`, being a fold-root is exactly `J ∘ J = -id` as linear maps. -/
theorem isFoldRoot_linearMap_iff {K : Type*} [Field K]
    {W : Type*} [AddCommGroup W] [Module K W]
    (J : W →ₗ[K] W) : IsFoldRoot (fun x => J x) ↔ J.comp J = -LinearMap.id := by
  rw [isFoldRoot_iff]
  constructor
  · intro h; ext x; simpa using h x
  · intro h x; have := LinearMap.congr_fun h x; simpa using this

/-- ★ THE WHY-DOUBLE LAW. A linear fold-root over ANY linearly ordered field `K`, on a
    finite-dimensional space, forces the dimension to be EVEN. Proof: `det(J)² =
    det(J ∘ J) = det(-id) = (-1)^finrank`, and `det(J)² ≥ 0` (the trunk's self-overlap
    positivity, the SAME Born positivity that forbade the scalar root), so `(-1)^finrank ≥ 0`,
    forcing `finrank` even. The base (dim 1, odd) is therefore blocked, and the minimal
    nontrivial even dimension is 2 — the carrier is forced to double. NOTHING here is special
    to `ℝ`: any ordered field carries the positivity, so the law holds over the DERIVED ℝ. -/
theorem foldRoot_forces_even_dim
    {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]
    {W : Type*} [AddCommGroup W] [Module K W] [Module.Finite K W]
    (J : W →ₗ[K] W) (h : IsFoldRoot (fun x => J x)) :
    Even (finrank K W) := by
  rw [isFoldRoot_linearMap_iff] at h
  have hdet : (LinearMap.det J) ^ 2 = (-1 : K) ^ (finrank K W) := by
    have e1 : LinearMap.det (J.comp J) = LinearMap.det J * LinearMap.det J :=
      LinearMap.det_comp J J
    have e2 : (-LinearMap.id : W →ₗ[K] W) = (-1 : K) • LinearMap.id := by
      ext x; simp
    rw [h, e2, LinearMap.det_smul, LinearMap.det_id, mul_one] at e1
    rw [sq]; exact e1.symm
  have hnn : (0 : K) ≤ (-1 : K) ^ (finrank K W) := by
    rw [← hdet]; exact sq_nonneg _
  by_contra hodd
  rw [Nat.not_even_iff_odd] at hodd
  rw [hodd.neg_one_pow] at hnn
  linarith

/-- OBSTRUCTION (direct, base carrier the DERIVED ℝ `Cut`). No `Cut`-linear `J : Cut → Cut` is
    a fold-root: a linear endo of the line `Cut` is `c • (·)`, and `J (J x) = -x` forces
    `c² = -1`, impossible since `c² ≥ 0` over the ordered field `Cut`. -/
theorem no_foldRoot_dim1 :
    ¬ ∃ J : ContinuumQ.Cut →ₗ[ContinuumQ.Cut] ContinuumQ.Cut, IsFoldRoot (fun x => J x) := by
  rintro ⟨J, hJ⟩
  set c : ContinuumQ.Cut := J 1 with hc
  have hlin : ∀ x : ContinuumQ.Cut, J x = x * c := by
    intro x
    have hx : J x = x • J 1 := by
      rw [← LinearMap.map_smul]; congr 1; simp [smul_eq_mul]
    rw [hx, hc, smul_eq_mul]
  have hroot : (fun x => J x) ((fun x => J x) 1) = -(1 : ContinuumQ.Cut) :=
    (isFoldRoot_iff.mp hJ) 1
  simp only at hroot
  have hsq : c * c = -1 := by
    have h1 : J 1 = c := hc.symm
    rw [hlin (J 1), h1] at hroot
    simpa using hroot
  exact sqrt_fold_not_on_line c hsq

/-- The same obstruction as a COROLLARY of the why-double law over the DERIVED ℝ `Cut`:
    `finrank Cut Cut = 1` is odd, so no fold-root lives on the derived line. One cause (the
    positivity forcing even dimension) produces the base obstruction — the dim-1 block and the
    even-dim structure are the SAME mathematical fact. -/
theorem no_foldRoot_dim1_of_evenLaw :
    ¬ ∃ J : ContinuumQ.Cut →ₗ[ContinuumQ.Cut] ContinuumQ.Cut, IsFoldRoot (fun x => J x) := by
  rintro ⟨J, hJ⟩
  have heven : Even (finrank ContinuumQ.Cut ContinuumQ.Cut) := foldRoot_forces_even_dim J hJ
  rw [finrank_self] at heven
  exact (Nat.not_even_iff_odd.mpr odd_one) heven

/-! ## RESOLUTION, operator witness — dim 2 ACHIEVES the fold-root, over the DERIVED ℝ. -/

/-- Operator witness on the doubled DERIVED-ℝ carrier `Cut × Cut`: `J₂(a,b) = (-b, a)`. The
    minimal even dimension permitted by the why-double law is realised over the fold-derived
    continuum (`Cut`, N11–N13), with NO imported Mathlib `ℝ`. -/
noncomputable def J₂ : (ContinuumQ.Cut × ContinuumQ.Cut) →ₗ[ContinuumQ.Cut]
    (ContinuumQ.Cut × ContinuumQ.Cut) where
  toFun p := (-p.2, p.1)
  map_add' p q := Prod.ext (by simp; ring) (by simp)
  map_smul' r p := Prod.ext (by simp) (by simp)

@[simp] theorem J₂_apply (p : ContinuumQ.Cut × ContinuumQ.Cut) : J₂ p = (-p.2, p.1) := rfl

/-- `J₂ ∘ J₂ = -id`: the minimal even dimension carries a fold-root operator over the DERIVED ℝ. -/
theorem J₂_isFoldRoot : IsFoldRoot (fun p => J₂ p) := by
  rw [isFoldRoot_iff]; intro p; simp [Prod.ext_iff]

/-- The operator witness inherits the fold's self-blindness (via N1's
    `fold_self_blind`): its only fixed point is the void. -/
theorem J₂_self_blind (p : ContinuumQ.Cut × ContinuumQ.Cut) (hp : J₂ p = p) : p = 0 := by
  refine fold_self_blind J₂_isFoldRoot ?_ p ?_
  · intro y hy
    have : (2 : ContinuumQ.Cut) • y = 0 := by rw [two_smul]; exact hy
    simpa using this
  · show J₂ (J₂ p) = p; rw [hp, hp]

/-! ## RESOLUTION, the forced complex ALGEBRA — the cascade object. -/

/-- THE DOUBLE. The minimal carrier extending a base ring by one dimension: `re`
    is the base component, `im` the new dimension forced by the obstruction. -/
structure Dbl (R : Type*) where
  re : R
  im : R

namespace Dbl

@[ext] theorem ext {R : Type*} : ∀ {z w : Dbl R}, z.re = w.re → z.im = w.im → z = w
  | ⟨_, _⟩, ⟨_, _⟩, rfl, rfl => rfl

variable {R : Type*} [CommRing R]

instance : Zero (Dbl R) := ⟨⟨0, 0⟩⟩
instance : One (Dbl R) := ⟨⟨1, 0⟩⟩
instance : Add (Dbl R) := ⟨fun z w => ⟨z.re + w.re, z.im + w.im⟩⟩
instance : Neg (Dbl R) := ⟨fun z => ⟨-z.re, -z.im⟩⟩
instance : SMul R (Dbl R) := ⟨fun r z => ⟨r * z.re, r * z.im⟩⟩
/-- THE FORCED PRODUCT (Cayley–Dickson double of the line; the base fold is trivial
    here): `(a,b)(c,d) = (ac - bd, ad + bc)`. Forced by `J² = -1` + bilinearity —
    see `mul_forced`. -/
instance : Mul (Dbl R) := ⟨fun z w => ⟨z.re * w.re - z.im * w.im, z.re * w.im + z.im * w.re⟩⟩

@[simp] theorem zero_re : (0 : Dbl R).re = 0 := rfl
@[simp] theorem zero_im : (0 : Dbl R).im = 0 := rfl
@[simp] theorem one_re : (1 : Dbl R).re = 1 := rfl
@[simp] theorem one_im : (1 : Dbl R).im = 0 := rfl
@[simp] theorem add_re (z w : Dbl R) : (z + w).re = z.re + w.re := rfl
@[simp] theorem add_im (z w : Dbl R) : (z + w).im = z.im + w.im := rfl
@[simp] theorem neg_re (z : Dbl R) : (-z).re = -z.re := rfl
@[simp] theorem neg_im (z : Dbl R) : (-z).im = -z.im := rfl
@[simp] theorem smul_re (r : R) (z : Dbl R) : (r • z).re = r * z.re := rfl
@[simp] theorem smul_im (r : R) (z : Dbl R) : (r • z).im = r * z.im := rfl
@[simp] theorem mul_re (z w : Dbl R) : (z * w).re = z.re * w.re - z.im * w.im := rfl
@[simp] theorem mul_im (z w : Dbl R) : (z * w).im = z.re * w.im + z.im * w.re := rfl

/-- The double is a genuine commutative ring: the structure did not collapse. -/
instance : CommRing (Dbl R) where
  add_assoc a b c := by ext <;> simp <;> ring
  zero_add a := by ext <;> simp
  add_zero a := by ext <;> simp
  add_comm a b := by ext <;> simp <;> ring
  left_distrib a b c := by ext <;> simp <;> ring
  right_distrib a b c := by ext <;> simp <;> ring
  zero_mul a := by ext <;> simp
  mul_zero a := by ext <;> simp
  mul_assoc a b c := by ext <;> simp <;> ring
  one_mul a := by ext <;> simp
  mul_one a := by ext <;> simp
  mul_comm a b := by ext <;> simp <;> ring
  neg_add_cancel a := by ext <;> simp
  nsmul := nsmulRec
  zsmul := zsmulRec

/-- THE COMPLEX UNIT, as an algebra element: `J = (0,1)`, the quarter-turn into the
    new dimension. -/
def J : Dbl R := ⟨0, 1⟩

/-- ★ THE COMPLEX UNIT, DERIVED: `J * J = -1`. The unit N1 deferred — now a theorem
    in the forced algebra, never a posit. -/
theorem J_mul_J : (J : Dbl R) * J = -1 := by ext <;> simp [J]

/-- Multiplication by `J` is a fold-root on the algebra: the algebra's complex unit
    IS a square root of the fold (`(z ↦ J*z)` applied twice is `-id`). -/
theorem mulJ_isFoldRoot : IsFoldRoot (fun z : Dbl R => J * z) := by
  rw [isFoldRoot_iff]; intro z; rw [← mul_assoc, J_mul_J, neg_one_mul]

/-- The double is 2-torsion-free whenever the base is (componentwise). -/
theorem two_torsion_free (htf : ∀ r : R, r + r = 0 → r = 0) :
    ∀ y : Dbl R, y + y = 0 → y = 0 := by
  intro y hy
  have hre : y.re + y.re = 0 := by have := congrArg Dbl.re hy; simpa using this
  have him : y.im + y.im = 0 := by have := congrArg Dbl.im hy; simpa using this
  ext
  · exact htf y.re hre
  · exact htf y.im him

/-- The algebra's complex unit inherits the fold's self-blindness (via N1's
    `fold_self_blind`): on a 2-torsion-free base, its only fixed point is the void. -/
theorem J_self_blind (htf : ∀ r : R, r + r = 0 → r = 0) (z : Dbl R)
    (hz : J * z = z) : z = 0 := by
  refine fold_self_blind mulJ_isFoldRoot (two_torsion_free htf) z ?_
  show J * (J * z) = z; rw [hz, hz]

/-- Basis decomposition: every element of the double is `re • 1 + im • J`. -/
theorem decomp (z : Dbl R) : z = z.re • (1 : Dbl R) + z.im • J := by ext <;> simp [J]

/-- The base line embeds into the double as the `im = 0` slice. -/
def ι (a : R) : Dbl R := ⟨a, 0⟩

@[simp] theorem ι_re (a : R) : (ι a : Dbl R).re = a := rfl
@[simp] theorem ι_im (a : R) : (ι a : Dbl R).im = 0 := rfl

/-- The embedding of the base line is injective: the double genuinely contains it. -/
theorem ι_injective : Function.Injective (ι : R → Dbl R) := by
  intro a b h; have h2 := congrArg Dbl.re h; simpa using h2

/-- `J` is genuinely NEW: it is not on the base line. So the double strictly extends
    the line and `J` is a new generator, not a relabelled line element. -/
theorem J_not_scalar [Nontrivial R] : ∀ a : R, (J : Dbl R) ≠ ι a := by
  intro a h
  have h2 : (1 : R) = 0 := by have := congrArg Dbl.im h; simpa [J] using this
  exact one_ne_zero h2

/-- ★ THE PRODUCT IS FORCED, not chosen. A binary operation on the double that is
    unital, additive in each argument, `R`-bilinear, and sends `J * J ↦ -1` is
    UNIQUELY the Cayley–Dickson product: `J² = -1` plus bilinearity determines the
    whole multiplication. -/
structure IsAdmissible (m : Dbl R → Dbl R → Dbl R) : Prop where
  unit_left : ∀ z, m 1 z = z
  unit_right : ∀ z, m z 1 = z
  add_left : ∀ x y z, m (x + y) z = m x z + m y z
  add_right : ∀ x y z, m x (y + z) = m x y + m x z
  smul_left : ∀ (a : R) x z, m (a • x) z = a • m x z
  smul_right : ∀ (a : R) x z, m x (a • z) = a • m x z
  J_sq : m J J = -1

theorem mul_forced {m : Dbl R → Dbl R → Dbl R} (h : IsAdmissible m) (z w : Dbl R) :
    m z w = z * w := by
  have e11 : m 1 1 = 1 := h.unit_left 1
  have e1J : m 1 J = J := h.unit_left J
  have eJ1 : m J 1 = J := h.unit_right J
  have eJJ : m J J = -1 := h.J_sq
  conv_lhs => rw [decomp z, decomp w]
  rw [h.add_left, h.smul_left, h.smul_left,
      h.add_right, h.add_right, h.smul_right, h.smul_right, h.smul_right, h.smul_right,
      e11, e1J, eJ1, eJJ]
  ext <;> simp [J] <;> ring

/-- NON-VACUITY (anti-W8) over the DERIVED ℚ `Phys.Foundation.Q` (N9, derived from the fold —
    NOT imported Mathlib `Rat`): the algebra's complex unit genuinely MOVES the witness `1`
    and its square is the negation — the resolution is not vacuous. -/
theorem J_nonvacuous : (J : Dbl Phys.Foundation.Q) ≠ 1 ∧ (J : Dbl Phys.Foundation.Q) * J = -1 := by
  refine ⟨?_, J_mul_J⟩
  intro h
  have : (1 : Phys.Foundation.Q) = 0 := by have := congrArg Dbl.im h; simpa [J] using this
  exact one_ne_zero this

end Dbl

end Phys.Cascade
