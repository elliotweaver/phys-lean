/-
  Phys.Algebra.StandpointArity — arc-R R7: THE ARITY SIGNATURE.
  ============================================================================================
  THE GRAIN OF THE GATHER'S GLUING OBSTRUCTION. The banked gather's local→global gluing defect
  is the octonion associator on the derived `O ℚ` (`o_gluingDefect_eq_assoc`, N219:
  `gluingDefect a b = fun x => assoc a b x`). This node reads the SHAPE of that obstruction as a
  trilinear form: it is invisible at arity ≤ 2 and genuinely present at arity 3.

  Two faces, one object.

  (A) ★ PAIRS GLUE — `assoc_span2_vanishes`. Any three elements drawn from ANY two-dimensional
      ℚ-span associate: `a,b,c ∈ span_ℚ{p,q} ⇒ assoc a b c = 0`. This is the honest "pairwise
      composition has no obstruction" — not the basis-pair special case, but an arbitrary spanning
      pair. It is FORCED purely by the three banked alternative laws (`alt_left` `[x,x,y]=0`,
      `alt_right` `[x,y,y]=0`, `alt_flex` `[x,y,x]=0`, N5b) together with slot-linearity: expanding
      the three arguments as ℚ-combinations of p,q leaves only associator triples with a repeated
      argument, each killed by one of the three laws.

  (A') ★ THE GENERATED CONTENT — `assoc_span4_vanishes`. One dimension richer: any three elements
      of `span_ℚ{1, a, b, a·b}` associate. This is the linear span of the generators together with
      their single product — the content of a two-generated subalgebra that has been closed by ONE
      multiplication. Route: `assoc_gen_triple` (all 64 generator-triples over {1,a,b,ab} vanish,
      via unit lemmas + the flexible/alternative laws + the six product-permutation lemmas) lifted
      through the three slot-span inductions (`assoc_slotN_span`). [The literal generated
      SUBALGEBRA `⟨a,b⟩` (Artin) additionally needs `⟨a,b⟩ ⊆ span{1,a,b,ab}` via the quadratic
      norm-scalar closure — the directed R7b successor.]

  (B) TRIPLES TEAR — `assoc_nonvanishing` (banked, N5b): at arity 3 the associator is genuinely
      nonzero, witnessed on the cascade's own non-associating triple. The obstruction is REAL.

  (Σ) ★ THE SIGNATURE — `arity_signature`, non-hollow: the gluing obstruction is EXACTLY trilinear
      — pairwise-clean (A ∧ A'), triadically-torn (B) — bundled with the gluing-defect hook
      `o_gluingDefect_eq_assoc` so the object read is the ACTUAL banked gather obstruction, not a
      free-floating alternating form. Cross-tie (N413/N415/Q1): the SAME associator that is
      confinement / cascade-stop / curvature / CP / parity has THIS pairs-clean/triples-tear grain
      as its arity signature.

  DERIVED-not-posited (G3): alternativity is a THEOREM about the derived `O ℚ` (the banked
  `alt_left`/`alt_right`/`alt_flex`), never a defining axiom. Words-removable (G4): delete
  "standpoint / grain / signature / arity" and every statement is a pure subalgebra-associativity
  fact about `assoc` on `O ℚ`. NO identification anywhere (G7 IDENTIFICATION FIREWALL — deferred
  to R8). Foundations-only ⊆ {propext, Classical.choice, Quot.sound}.

  Dependencies (all banked, cited):
    • `Phys.Algebra.assoc` (associator), `alt_left`/`alt_right`/`alt_flex`, `assoc_swap12/23`,
      `assoc_nonvanishing` — Phys/Algebra/Alternative.lean (N5b).
    • `assoc_add_left`/`assoc_add_mid`, `assoc_smul_left`/`assoc_smul_mid` — ConfinementColourSinglet (N385).
    • `assoc_one_left`/`assoc_one_mid`/`assoc_one_right` — TowerGatherObstructionRep7.
    • `qsmul_mul_right` — DerivationFinrank (ℚ-scalar/product compatibility).
    • `o_gluingDefect_eq_assoc`, `gluingDefect` — TowerGatherObstruction (N219: the gluing defect
      IS the associator).
-/
import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

/-! ### Slot-3 linearity and zero-slot vanishing (completing the trilinear book-keeping).

The banked associator linearity covers slots 1 and 2 (`assoc_add_left`/`assoc_smul_left`,
`assoc_add_mid`/`assoc_smul_mid`). Here we add slot 3 and the zero-slot facts. -/

/-- Slot-3 additivity: `assoc x y (z+z') = assoc x y z + assoc x y z'`. -/
theorem assoc_add_right' (x y z z' : O ℚ) :
    assoc x y (z + z') = assoc x y z + assoc x y z' := by
  simp only [assoc, mul_add]; abel

/-- Slot-3 ℚ-homogeneity: `assoc x y (c•z) = c • assoc x y z` (via banked `qsmul_mul_right`). -/
theorem assoc_smul_right' (c : ℚ) (x y z : O ℚ) :
    assoc x y (c • z) = c • assoc x y z := by
  simp only [assoc, qsmul_mul_right, smul_sub]

/-- Zero in slot 1. -/
theorem assoc_zero_left (y z : O ℚ) : assoc (0 : O ℚ) y z = 0 := by
  simp only [assoc, zero_mul]; abel
/-- Zero in slot 2. -/
theorem assoc_zero_mid (x z : O ℚ) : assoc x (0 : O ℚ) z = 0 := by
  simp only [assoc, zero_mul, mul_zero]; abel
/-- Zero in slot 3. -/
theorem assoc_zero_right (x y : O ℚ) : assoc x y (0 : O ℚ) = 0 := by
  simp only [assoc, mul_zero]; abel

/-! ### (A) ★ PAIRS GLUE — the arity-2 clean form.

Any three elements drawn from an arbitrary two-dimensional ℚ-span associate. This is the honest
"pairwise composition has no obstruction": the arity ≤ 2 obstruction vanishes identically. Forced
by the three banked alternative laws + slot-linearity — after expanding each of the three arguments
as `s•p + t•q`, every resulting associator triple has a repeated argument (`[p,p,·]`, `[·,q,q]`,
`[p,·,p]`, …) and is killed by `alt_left` / `alt_right` / `alt_flex`. -/
theorem assoc_span2_vanishes {p q : O ℚ} {a b c : O ℚ}
    (ha : a ∈ Submodule.span ℚ {p, q}) (hb : b ∈ Submodule.span ℚ {p, q})
    (hc : c ∈ Submodule.span ℚ {p, q}) :
    assoc a b c = 0 := by
  rw [Submodule.mem_span_pair] at ha hb hc
  obtain ⟨s, t, hst⟩ := ha
  obtain ⟨u, v, huv⟩ := hb
  obtain ⟨m, n, hmn⟩ := hc
  subst hst; subst huv; subst hmn
  simp only [assoc_add_left, assoc_add_mid, assoc_add_right',
    assoc_smul_left, assoc_smul_mid, assoc_smul_right',
    alt_left, alt_right, alt_flex, smul_zero, add_zero, zero_add]

/-! ### (A') ★ THE GENERATED CONTENT — the arity-3-of-4 clean form.

The linear span of the two generators together with their single product `{1, a, b, a·b}`. Every
three elements of this span associate. First: all 64 generator-triples vanish. -/

/-- Base product associator: `[a, b, a·b] = 0`. The single non-obvious generator-triple; every
    other reduces to it (or to a unit / repeated-argument case). Coordinate bash on the banked CD
    multiplication (foundations-only). -/
theorem obash_ab (a b : O ℚ) : assoc a b (a * b) = 0 := by
  unfold assoc; rw [sub_eq_zero]
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg,
      neg_neg, add_mul, mul_add, zero_mul, mul_zero] <;> ring

/-- Antisymmetry, slots 1↔2 (associator form of `assoc_swap12`). -/
theorem asw12 (x y z : O ℚ) : assoc x y z = - assoc y x z :=
  eq_neg_of_add_eq_zero_left (assoc_swap12 x y z)
/-- Antisymmetry, slots 2↔3 (associator form of `assoc_swap23`). -/
theorem asw23 (x y z : O ℚ) : assoc x y z = - assoc x z y :=
  eq_neg_of_add_eq_zero_left (assoc_swap23 x y z)

/-- `[b, a, a·b] = 0` (swap 1↔2 from `obash_ab`). -/
theorem p_b_a_ab (a b : O ℚ) : assoc b a (a * b) = 0 := by rw [asw12, obash_ab, neg_zero]
/-- `[a, a·b, b] = 0` (swap 2↔3 from `obash_ab`). -/
theorem p_a_ab_b (a b : O ℚ) : assoc a (a * b) b = 0 := by rw [asw23, obash_ab, neg_zero]
/-- `[b, a·b, a] = 0`. -/
theorem p_b_ab_a (a b : O ℚ) : assoc b (a * b) a = 0 := by
  rw [asw23 b (a * b) a, asw12 b a (a * b), obash_ab, neg_zero, neg_zero]
/-- `[a·b, a, b] = 0`. -/
theorem p_ab_a_b (a b : O ℚ) : assoc (a * b) a b = 0 := by
  rw [asw12 (a * b) a b, asw23 a (a * b) b, obash_ab, neg_zero, neg_zero]
/-- `[a·b, b, a] = 0`. -/
theorem p_ab_b_a (a b : O ℚ) : assoc (a * b) b a = 0 := by
  rw [asw12 (a * b) b a, asw23 b (a * b) a, asw12 b a (a * b), obash_ab, neg_zero, neg_zero, neg_zero]

/-- ★ Every one of the 64 generator-triples over `{1, a, b, a·b}` associates. Case split on the
    four choices per slot, closed by the unit lemmas (`assoc_one_*`), the alternative/flexible laws
    (`alt_left`/`alt_right`/`alt_flex`), and the six product-permutation lemmas above. (`simp only`
    with the named lemma set — a `first|…|` backtracking combinator over 64 cases is far slower.) -/
theorem assoc_gen_triple (a b : O ℚ) {p q r : O ℚ}
    (hp : p ∈ ({1, a, b, a * b} : Set (O ℚ))) (hq : q ∈ ({1, a, b, a * b} : Set (O ℚ)))
    (hr : r ∈ ({1, a, b, a * b} : Set (O ℚ))) :
    assoc p q r = 0 := by
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hp hq hr
  rcases hp with rfl | rfl | rfl | rfl <;> rcases hq with rfl | rfl | rfl | rfl <;>
    rcases hr with rfl | rfl | rfl | rfl <;>
    simp only [assoc_one_left, assoc_one_mid, assoc_one_right, alt_left, alt_right,
      alt_flex, obash_ab, p_b_a_ab, p_a_ab_b, p_b_ab_a, p_ab_a_b, p_ab_b_a]

/-- Slot-1 span lift: if `assoc g y z = 0` for every generator `g ∈ S`, then it vanishes for every
    `x ∈ span_ℚ S` (linearity in slot 1). -/
theorem assoc_slot1_span {S : Set (O ℚ)} {y z : O ℚ}
    (hgen : ∀ g ∈ S, assoc g y z = 0) {x : O ℚ} (hx : x ∈ Submodule.span ℚ S) :
    assoc x y z = 0 := by
  induction hx using Submodule.span_induction with
  | mem g hg => exact hgen g hg
  | zero => exact assoc_zero_left y z
  | add p q _ _ hp hq => rw [assoc_add_left, hp, hq, add_zero]
  | smul c p _ hp => rw [assoc_smul_left, hp, smul_zero]

/-- Slot-2 span lift. -/
theorem assoc_slot2_span {S : Set (O ℚ)} {x z : O ℚ}
    (hgen : ∀ g ∈ S, assoc x g z = 0) {y : O ℚ} (hy : y ∈ Submodule.span ℚ S) :
    assoc x y z = 0 := by
  induction hy using Submodule.span_induction with
  | mem g hg => exact hgen g hg
  | zero => exact assoc_zero_mid x z
  | add p q _ _ hp hq => rw [assoc_add_mid, hp, hq, add_zero]
  | smul c p _ hp => rw [assoc_smul_mid, hp, smul_zero]

/-- Slot-3 span lift. -/
theorem assoc_slot3_span {S : Set (O ℚ)} {x y : O ℚ}
    (hgen : ∀ g ∈ S, assoc x y g = 0) {z : O ℚ} (hz : z ∈ Submodule.span ℚ S) :
    assoc x y z = 0 := by
  induction hz using Submodule.span_induction with
  | mem g hg => exact hgen g hg
  | zero => exact assoc_zero_right x y
  | add p q _ _ hp hq => rw [assoc_add_right', hp, hq, add_zero]
  | smul c p _ hp => rw [assoc_smul_right', hp, smul_zero]

/-- ★ Any three elements of `span_ℚ{1, a, b, a·b}` associate. The generated content of a
    two-generated subalgebra closed by one product has NO obstruction — lift `assoc_gen_triple`
    through the three slot-span inductions. -/
theorem assoc_span4_vanishes (a b : O ℚ) {x y z : O ℚ}
    (hx : x ∈ Submodule.span ℚ ({1, a, b, a * b} : Set (O ℚ)))
    (hy : y ∈ Submodule.span ℚ ({1, a, b, a * b} : Set (O ℚ)))
    (hz : z ∈ Submodule.span ℚ ({1, a, b, a * b} : Set (O ℚ))) :
    assoc x y z = 0 := by
  refine assoc_slot1_span (S := ({1, a, b, a * b} : Set (O ℚ))) ?_ hx
  intro g hg
  refine assoc_slot2_span (S := ({1, a, b, a * b} : Set (O ℚ))) ?_ hy
  intro g' hg'
  refine assoc_slot3_span (S := ({1, a, b, a * b} : Set (O ℚ))) ?_ hz
  intro g'' hg''
  exact assoc_gen_triple a b hg hg' hg''

/-! ### (B) TRIPLES TEAR — the arity-3 obstruction is genuinely present.

The banked `assoc_nonvanishing`: at arity 3, on the cascade's own non-associating triple, the
associator is nonzero. Restated here as the arity-3 face of the signature. -/

/-- ★ At arity 3 the gluing obstruction is genuinely present: there exist three elements of `O ℚ`
    that do NOT associate (the banked witness `assoc_nonvanishing`, N5b — on the cascade's own
    non-associating triple). -/
theorem arity3_tear :
    ∃ x y z : O ℚ, assoc x y z ≠ 0 :=
  ⟨_, _, _, assoc_nonvanishing⟩

/-! ### (Σ) ★ THE ARITY SIGNATURE — pairwise-clean, triadically-torn.

The gluing obstruction of the gather is EXACTLY trilinear: it vanishes on every ≤ 2-dimensional
span (and on the closed two-generated content), and is genuinely nonzero at arity 3. Bundled
non-hollow with the gluing-defect hook (`o_gluingDefect_eq_assoc`) so the object is the ACTUAL
banked gather obstruction, not a free-floating alternating form. -/
theorem arity_signature :
    -- the gluing defect IS the associator (the object read is the banked gather obstruction)
    (∀ a b : O ℚ, gluingDefect a b = fun x => assoc a b x) ∧
    -- PAIRS GLUE: any three elements of any 2-dim span associate
    (∀ {p q a b c : O ℚ}, a ∈ Submodule.span ℚ {p, q} → b ∈ Submodule.span ℚ {p, q} →
      c ∈ Submodule.span ℚ {p, q} → assoc a b c = 0) ∧
    -- GENERATED CONTENT: any three elements of span{1,a,b,ab} associate
    (∀ (a b : O ℚ) {x y z : O ℚ},
      x ∈ Submodule.span ℚ ({1, a, b, a * b} : Set (O ℚ)) →
      y ∈ Submodule.span ℚ ({1, a, b, a * b} : Set (O ℚ)) →
      z ∈ Submodule.span ℚ ({1, a, b, a * b} : Set (O ℚ)) → assoc x y z = 0) ∧
    -- TRIPLES TEAR: at arity 3 the obstruction is genuinely present
    (∃ x y z : O ℚ, assoc x y z ≠ 0) := by
  refine ⟨o_gluingDefect_eq_assoc, ?_, ?_, arity3_tear⟩
  · intro p q a b c ha hb hc; exact assoc_span2_vanishes ha hb hc
  · intro a b x y z hx hy hz; exact assoc_span4_vanishes a b hx hy hz

end Phys.Algebra
