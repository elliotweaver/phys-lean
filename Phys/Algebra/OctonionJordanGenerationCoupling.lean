/-
# N272 — THE ARENA'S JORDAN PRODUCT CYCLICALLY WEAVES THE THREE CAP-FORCED GENERATIONS

Over the DERIVED octonion rung `O ℚ = CD (H ℚ)` and the maximal Hermitian octonionic Jordan arena
`J₃(O ℚ) = H₃(O ℚ)` (N5/N267), this node banks the FORCED inter-generation coupling.

## The story this closes (the ★4/★5 forward beat of the arena turn N267–270)

N267 banked the generation COUNT: the maximal arena carries EXACTLY 3 position-disjoint,
injective, ℚ-linear matter-carrier copies — `slotA a` at `(0,1)`, `slotB b` at `(0,2)`, `slotC c`
at `(1,2)`. N268 banked that the derived gauge `Der(O ℚ) = g₂` acts on the three copies
ENTRYWISE and IDENTICALLY (`jAct D (slotX v) = slotX (D v)`) — its own docstring NAMES the blocker:
*the arena has EXACT family symmetry (the un-broken S₃ frame permutation + the identical gauge
action), which is precisely why the mixing-angle T₃-split cannot be forced and why the mass/mixing
texture requires BREAKING this symmetry.* The gauge is, by construction, per-slot and
family-symmetry-BLIND.

THIS node banks the ONLY derived structure that is NOT blind: the arena's OWN symmetric (Jordan)
product `jb A B = A·B + B·A`. It WEAVES two DISTINCT generations into the THIRD, carried by an
octonion product of their carriers:

    jb (slotA a) (slotB b) = slotC (star a * b)     -- gen_A ∘ gen_B → gen_C   (share index 0)
    jb (slotB b) (slotC c) = slotA (b * star c)     -- gen_B ∘ gen_C → gen_A   (share index 2)
    jb (slotC c) (slotA a) = slotB (a * c)          -- gen_C ∘ gen_A → gen_B   (share index 1)

The three cap-forced copies are the COUNT (N267), transform identically under gauge (N268) — but
under the arena's OWN multiplication they are NOT independent: the product of two distinct
generations lands in the third, and the value is a genuine octonion product with NO zero divisors
(N265). This is the forced inter-generation structure.

## The moat tie (the octonion anchor — the non-free-floating content)

The bare coupling law holds for 3×3 matrix units over any `*`-ring, so it is a SUPPORTING
ingredient, NOT the headline (exactly as N268's generic `jAct_mul` was demoted). The HEADLINE is the
octonion-SPECIFIC JOINT:

  · the scalar trace-contraction of a woven same-slot Jordan square reproduces the Born self-overlap
    cross-term: `reQ (trace (jb (slotC x) (slotC c))) = 4 * reQ (x * star c) = 4 * gForm x c`
    (the trace picks the two nonzero diagonal Jordan-square entries `x·star c + c·star x` (at (1,1))
    and `star x·c + star c·x` (at (2,2)); each of the four real parts equals `reQ (x·star c)` via
    `reQ_mul_comm`/`reQ_star`) — the arena's own product reads off the fold's Born metric `gForm`
    (N24); this is the diagonal analogue of the cubic-norm cross-term (`jN`, N215);
  · the well-definedness of the full-triangle cross-term is octonion trace-associativity
    (`jN_cross_assoc = reQ_mul_assoc3`, N210 — FALSE at the sedenions, where zero divisors also
    appear);
  · exactly THREE copies, cap-forced (`jordan_cap_pinned_at_three`, in the capstone type — false for
    an associative coordinate ring, which has no cap and `C(n,2)` copies for arbitrary `n`);
  · the coupling is division-valued (nonzero for nonzero inputs, `octMul_ne_zero`, N265).

## The dissolution / the moat (STANDARD §0)

The SM treats the three generations as identical copies (family universality) PLUS a SEPARATELY
POSITED Yukawa/mixing sector to couple and mix them — two independent inputs. The theory DERIVES
universality (N268) and now DERIVES the coupling too: it is the arena's OWN Jordan multiplication,
forced, not an added sector. The field's independent "second sector" becomes a consequence of the
arena's existing product.

## Scope — honesty clause

Banks the cyclic coupling laws + division-valuedness + the moat tie (the scalar contraction = the
Born cross-term) + the capstone carrying the octonion joint ONLY. Does NOT bank "= the CKM/PMNS
matrix / physical Yukawa couplings / mass ratios / the mixing angle" (removable prose; ★5 stays
OPEN, ★2 stays OPEN). NOVELTY claimed ONLY for: the forced inter-generation coupling IS the arena's
own product (the field's separately-posited Yukawa/mixing sector dissolved into existing structure)
+ the moat anchor.

## Physics-words-removable

Delete generation/family/matter/Yukawa/mixing/flavour: for the maximal Hermitian octonionic Jordan
order, the Jordan bracket of the `(0,1)`- and `(0,2)`-slot embeddings equals the `(1,2)`-slot
embedding of `star a * b`, cyclically; the scalar trace-contraction of a same-slot Jordan square is
`4·reQ (x·star c)`. Pure mathematics about the banked `slotA/B/C`, `jb`, `gForm`, `O ℚ`.
-/
import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.TowerWorldMapIndivisible
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-! ## The cyclic coupling laws — the arena's product weaves the three generations. -/

/-- ★★★ gen_A ∘ gen_B → gen_C. The Jordan bracket of the `(0,1)`-slot and the `(0,2)`-slot (which
    share matrix index `0`) is the `(1,2)`-slot embedding of the octonion product `star a * b`. The
    product of two distinct matter-carrier copies lands in the THIRD copy. -/
theorem jb_slotA_slotB (a b : O ℚ) : jb (slotA a) (slotB b) = slotC (star a * b) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jb, slotA, slotB, slotC, Xz, Matrix.mul_apply, Matrix.add_apply]

/-- ★★★ gen_B ∘ gen_C → gen_A. The `(0,2)`- and `(1,2)`-slots share index `2`; their Jordan bracket
    is the `(0,1)`-slot embedding of `b * star c`. -/
theorem jb_slotB_slotC (b c : O ℚ) : jb (slotB b) (slotC c) = slotA (b * star c) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jb, slotA, slotB, slotC, Xz, Matrix.mul_apply, Matrix.add_apply]

/-- ★★★ gen_C ∘ gen_A → gen_B. The `(1,2)`- and `(0,1)`-slots share index `1`; their Jordan bracket
    is the `(0,2)`-slot embedding of `a * c`. The three coupling laws CLOSE a cyclic triangle
    A→B→C→A on the three cap-forced copies. -/
theorem jb_slotC_slotA (a c : O ℚ) : jb (slotC c) (slotA a) = slotB (a * c) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jb, slotA, slotB, slotC, Xz, Matrix.mul_apply, Matrix.add_apply]

/-! ## Non-vacuity + division-valuedness: the coupling is a genuine, nonzero cross-copy map. -/

/-- ★★ W8 DIVISION-VALUEDNESS: the coupling of two NONZERO generations is NONZERO — a genuine
    coupling into the third copy, never collapsing to zero. Via `octMul_ne_zero` (N265, no zero
    divisors — the fold's Born positivity), FALSE at the sedenions. -/
theorem coupling_ne_zero (a b : O ℚ) (ha : a ≠ 0) (hb : b ≠ 0) :
    jb (slotA a) (slotB b) ≠ 0 := by
  rw [jb_slotA_slotB]
  intro h
  have hstar : star a ≠ 0 := by
    intro hsa
    apply ha
    have := congrArg star hsa
    simpa using this
  have hne : star a * b ≠ 0 := octMul_ne_zero hstar hb
  apply hne
  apply slotC_inj
  rw [h]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotC, Xz]

/-- ★ The coupling lands in a DIFFERENT copy: `jb (slotA a) (slotB b)` is a `slotC` element (its
    `(0,1)` entry — where `slotA` would carry its octonion — is ZERO). Genuinely cross-copy, not a
    self-coupling. -/
theorem coupling_cross_copy (a b : O ℚ) : (jb (slotA a) (slotB b)) 0 1 = 0 := by
  rw [jb_slotA_slotB]; simp [slotC, Xz]

/-! ## The moat tie: the scalar trace-contraction reproduces the Born cross-term. -/

/-- The `(1,1)` diagonal entry of the same-slot Jordan square: `x·star c + c·star x`. -/
theorem jbCC_d11 (x c : O ℚ) : (jb (slotC x) (slotC c)) 1 1 = x * star c + c * star x := by
  simp [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]

/-- The `(2,2)` diagonal entry of the same-slot Jordan square: `star x·c + star c·x`. -/
theorem jbCC_d22 (x c : O ℚ) : (jb (slotC x) (slotC c)) 2 2 = star x * c + star c * x := by
  simp [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]

/-- The `(0,0)` diagonal entry of the same-slot Jordan square is `0` (the (1,2)-slots do not touch
    row/column 0). -/
theorem jbCC_d00 (x c : O ℚ) : (jb (slotC x) (slotC c)) 0 0 = 0 := by
  simp [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]

/-- ★★★ THE MOAT TIE (real form). The real trace-contraction of a same-slot woven Jordan square is
    four times the Born self-overlap: `reQ (trace (jb (slotC x) (slotC c))) = 4 * reQ (x * star c)`.
    The trace picks the two nonzero diagonal entries `x·star c + c·star x` (at (1,1)) and
    `star x·c + star c·x` (at (2,2)); each real part collapses to `reQ (x·star c)` via
    `reQ_mul_comm` + `reQ_star` (`c·star x = star (x·star c)`). The arena's own product reads off the
    fold's Born metric; the diagonal analogue of the cubic-norm cross-term (N215). -/
theorem trace_coupling_reQ (x c : O ℚ) :
    reQ (Matrix.trace (jb (slotC x) (slotC c))) = 4 * reQ (x * star c) := by
  have htr : Matrix.trace (jb (slotC x) (slotC c))
      = (x * star c + c * star x) + (star x * c + star c * x) := by
    simp only [Matrix.trace, Fin.sum_univ_three, Matrix.diag_apply, jbCC_d00, jbCC_d11, jbCC_d22]
    abel
  have hcx : c * star x = star (x * star c) := by rw [StarMul.star_mul, star_star]
  have key : reQ (c * star x) = reQ (x * star c) := by rw [hcx]; exact reQ_star _
  have key2 : reQ (star x * c) = reQ (x * star c) := by rw [reQ_mul_comm]; exact key
  have key3 : reQ (star c * x) = reQ (x * star c) := reQ_mul_comm (star c) x
  rw [htr, reQ_add, reQ_add, reQ_add, key, key2, key3]
  ring

/-- ★★★ THE MOAT TIE via the Born form: the same contraction equals `4 * gForm x c` — the arena's
    own product reads off the fold's Born self-overlap `gForm v w = reQ (v * star w)` (N24). -/
theorem trace_coupling_gForm (x c : O ℚ) :
    reQ (Matrix.trace (jb (slotC x) (slotC c))) = 4 * gForm x c := by
  rw [trace_coupling_reQ]; rfl

/-- The full-triangle cross-term's well-definedness is octonion trace-associativity (N210),
    re-exported here as the anchor that the woven coupling's scalar invariant is bracketing-free —
    FALSE one rung up at the sedenions. -/
theorem coupling_cross_term_assoc (a b c : O ℚ) :
    reQ ((a * c) * star b) = reQ (a * (c * star b)) :=
  jN_cross_assoc a b c

/-! ## The capstone — the octonion joint (not the bare law). -/

/-- ★★★ THE CAPSTONE: the arena's Jordan product cyclically weaves the three cap-forced generations,
    anchored to the octonion cap. Bundles: the three cyclic coupling laws ∧ division-valuedness
    (genuine nonzero cross-copy coupling, N265) ∧ the moat tie (scalar contraction = the Born
    cross-term) ∧ the cross-term trace-associativity anchor (N210) ∧ the octonion cap
    `jordan_cap_pinned_at_three` (exactly-3 copies, cap-forced — the TYPE is NOT carrier-agnostic,
    false for an associative coordinate ring). -/
theorem generation_coupling_structure :
    (∀ a b : O ℚ, jb (slotA a) (slotB b) = slotC (star a * b))
    ∧ (∀ b c : O ℚ, jb (slotB b) (slotC c) = slotA (b * star c))
    ∧ (∀ a c : O ℚ, jb (slotC c) (slotA a) = slotB (a * c))
    ∧ (∀ a b : O ℚ, a ≠ 0 → b ≠ 0 → jb (slotA a) (slotB b) ≠ 0)
    ∧ (∀ x c : O ℚ, reQ (Matrix.trace (jb (slotC x) (slotC c))) = 4 * gForm x c)
    ∧ (∀ a b c : O ℚ, reQ ((a * c) * star b) = reQ (a * (c * star b)))
    ∧ ((∀ (d0 d1 d2 : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ),
          jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0) ∧ jdef Xwit Ywit ≠ 0) :=
  ⟨jb_slotA_slotB, jb_slotB_slotC, jb_slotC_slotA, coupling_ne_zero, trace_coupling_gForm,
    coupling_cross_term_assoc, jordan_cap_pinned_at_three⟩

end Phys.Algebra.HJ
