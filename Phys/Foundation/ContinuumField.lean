/-
  Phys.Foundation.ContinuumField — THE ℝ RUNG'S FIELD OPERATIONS, INCREMENT 1:
  THE ADDITIVE ORDERED GROUP on the DERIVED-ℚ completion `ContinuumQ.Cut`.
  ===========================================================================
  N10 (`ContinuumDerived.lean`, namespace `ContinuumQ`) banked the ℝ rung's ORDER
  half over the DERIVED ℚ: the carrier `Cut` (Dedekind lower cuts of the derived
  `Phys.Foundation.Q`), its total order (`Cut.le_total` + `PartialOrder Cut`), and
  Dedekind ORDER-COMPLETENESS (`completion_coherence_closed`). But `Cut` carried
  ONLY the order — no `+`, no `·`. To finish the ℝ rung it must become an ORDERED
  FIELD with the least-upper-bound property. THIS file banks the FIRST increment:
  the ADDITIVE ORDERED GROUP — `Cut` is a Dedekind-complete LINEARLY ORDERED
  ABELIAN GROUP, with NO posited ℝ, NO `import Mathlib.Data.{Nat,Int,Rat,Real,
  Complex}` used to GET it. Multiplication / inverse / `Field` is the next
  increment (childed onto the chain tail).

  ── THE THEORY-NATIVE PICTURE (the trunk, read OUT of the math; §2 below) ──
  N8 made every ADDITIVE re-entry undoable (the derived ℤ: negation = the SWAP =
  the fold's reflection `look x = -x`). N9 made every NONZERO MULTIPLICATIVE step
  undoable (the derived ℚ: inverse = the swap `q/p`). Here the SAME "make the act
  reversible" move is realized ONE LEVEL UP, on the COMPLETION:
  • ADDITION of cuts = the gather of pairwise sums `{a+b | a∈x, b∈y}` — adding two
    approached points by approaching their sum.
  • NEGATION of a cut = the fold's REFLECTION at the completion level: reflect the
    UPPER complement (`(-x).S q := ∃ r, q < -r ∧ ¬ x.S r`). The swap that undid a
    count (N8) now undoes a CUT.
  • The additive inverse `x + (-x) = 0` is where the trunk's C6 *eternal approach*
    becomes load-bearing: the cut and its reflection meet at `0` EXACTLY because
    the derived ground is ARCHIMEDEAN (the approach can be made arbitrarily fine) —
    `Q.archimedean`, itself DERIVED here from counting (`Re.toNat`: every count is
    bounded by a metalanguage `n`, lifted ℤ→ℚ). The reversibility the fold demands
    is achieved at the continuum level precisely by the eternal approach.

  ── WHAT THIS BANKS (all over the DERIVED ℚ; NO posited ℝ) ──
    THE ARCHIMEDEAN PROPERTY OF THE DERIVED ℚ (the prerequisite, itself derived):
      Z.instArchimedean / instArchimedean (Q) — the derived ℤ and ℚ are Archimedean,
        derived from counting (`Re.toNat`), NOT imported.
    THE ADDITIVE STRUCTURE on Cut:
      addS / Add Cut / add_S            — cut addition = the gather of pairwise sums.
      Zero Cut (= Qcut 0)               — the zero cut.
      negS / Neg Cut / neg_S            — cut negation = reflect the upper complement.
      approx                            — ★ THE CUT-APPROXIMATION LEMMA (Archimedean):
                                          element and upper bound within any ε.
      add_neg_self                      — ★★ x + (-x) = 0 (the additive inverse — the
                                          eternal approach made load-bearing).
      add_comm/assoc, zero_add/add_zero — the abelian-group laws.
      addCommGroup                      — ★ AddCommGroup Cut.
    THE ORDER COMPATIBILITY:
      linearOrder                       — ★ LinearOrder Cut (upgrades the banked
                                          PartialOrder via Cut.le_total).
      add_le_add_right' / IsOrderedAddMonoid Cut — ★ the order is translation-invariant.
    NON-VACUITY (W8):
      Qcut_add / Qcut_strictMono        — the derived-ℚ embedding is an additive,
                                          strictly-monotone hom ℚ ↪ Cut.
      zero_lt_sqrt2                      — the derived √2 is a STRICTLY POSITIVE new
                                          element (the group is non-degenerate and
                                          strictly extends the derived ℚ).

  §2. PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete "fold / reflection / gather /
  miss / completion / continuum / eternal approach / counting / re-entry": what
  remains is that the Dedekind completion (the type of lower cuts) of a derived
  linearly ordered ARCHIMEDEAN field is a Dedekind-complete linearly ordered abelian
  GROUP under cut addition, with negation given by reflecting the upper complement,
  strictly extending the ground (the √2 cut is a new strictly-positive element). Pure
  order theory over a derived ordered field; no theorem STATEMENT needs a trunk or
  physics word to be true.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  NO Mathlib number-system content import, NO posited ℝ.
-/
import Phys.Foundation.ContinuumDerived
import Mathlib.Tactic
import Mathlib.Algebra.Order.Archimedean.Basic

namespace Phys.Foundation
open Phys.Foundation

/-! ## INC-0: THE ARCHIMEDEAN PROPERTY OF THE DERIVED ℚ, DERIVED FROM COUNTING.

    The Dedekind additive-inverse law `x + (-x) = 0` needs the ground to be
    Archimedean (the cut and its reflection meet only if the approach can be made
    arbitrarily fine). We DERIVE it — from the fold's counting `Re`, NOT imported.
    `Re.toNat` maps a count to the metalanguage ℕ (substrate arity, STANDARD §3),
    giving `ofRe a = (toNat a : Z)`; every derived integer is then bounded by some
    metalanguage `n`, and the field-of-fractions lift gives `Archimedean Q`. -/

theorem step_eq_add_one (a : Re) : Re.step a = a + 1 := rfl

theorem Z.ofRe_step (a : Re) : Z.ofRe (Re.step a) = Z.ofRe a + 1 := by
  rw [step_eq_add_one, Z.ofRe_add, Z.ofRe_one]

/-- The count-to-metalanguage map (substrate arity, STANDARD §3 — `ℕ` here is the
    METALANGUAGE counting the count's depth, not a posited content object). -/
def Re.toNat (a : Re) : ℕ := Re.iterate 0 Nat.succ a

@[simp] theorem Re.toNat_void : Re.toNat Re.void = 0 := rfl
@[simp] theorem Re.toNat_step (a : Re) : Re.toNat (Re.step a) = (Re.toNat a) + 1 := rfl

/-- The derived-ℤ image of a count equals the metalanguage cast of its depth. -/
theorem Z.ofRe_eq_natCast (a : Re) : Z.ofRe a = ((Re.toNat a : ℕ) : Z) := by
  induction a with
  | void => rfl
  | step k ih => rw [Z.ofRe_step, ih, Re.toNat_step]; push_cast; ring

/-- Any derived integer `mk a b` is `≤` the image of its positive part. -/
theorem Z.le_ofRe (a b : Re) : Z.mk a b ≤ Z.ofRe a := by
  refine ⟨b, ?_⟩; rw [Z.ofRe_def]; apply Z.sound; ring

/-- Every derived integer is bounded above by a metalanguage natural. -/
theorem Z.exists_nat_ge (x : Z) : ∃ n : ℕ, x ≤ (n : Z) := by
  refine Z.ind (fun a b => ?_) x
  exact ⟨Re.toNat a, by rw [← Z.ofRe_eq_natCast]; exact Z.le_ofRe a b⟩

/-- A positive derived integer is `≥ 1` (the counts are discrete). -/
theorem Z.one_le_of_pos {y : Z} (hy : 0 < y) : 1 ≤ y := by
  obtain ⟨n, hn⟩ := le_of_lt hy
  rw [zero_add] at hn
  have hn0 : n ≠ 0 := by rintro rfl; rw [Z.ofRe_zero] at hn; exact (ne_of_lt hy) hn.symm
  cases n with
  | void => exact absurd rfl hn0
  | step m => exact ⟨m, by rw [hn, Z.ofRe_step]; ring⟩

/-- ★ THE DERIVED ℤ IS ARCHIMEDEAN (derived from counting, not imported). -/
noncomputable instance Z.instArchimedean : Archimedean Z := by
  constructor
  intro x y hy
  obtain ⟨n, hn⟩ := Z.exists_nat_ge x
  have h1 : (1 : Z) ≤ y := Z.one_le_of_pos hy
  refine ⟨n, le_trans hn ?_⟩
  calc (n : Z) = n • (1 : Z) := by rw [nsmul_eq_mul, mul_one]
    _ ≤ n • y := nsmul_le_nsmul_right h1 n

/-- The metalanguage-natural cast factors through the derived-ℤ embedding. -/
theorem Q.natCast_eq_ofZ (n : ℕ) : ((n : ℕ) : Q) = Q.ofZ ((n : ℕ) : Z) := by
  induction n with
  | zero => rw [Nat.cast_zero, Nat.cast_zero, Q.ofZ_zero]
  | succ k ih => push_cast; rw [ih, Q.ofZ_add, Q.ofZ_one]

/-- ★★ THE DERIVED ℚ IS ARCHIMEDEAN. The ground the continuum is cut from has the
    eternal-approach property — DERIVED from counting via the ℤ rung, NOT imported.
    This is exactly what the cut additive-inverse `x + (-x) = 0` requires. -/
noncomputable instance Q.instArchimedean : Archimedean Q := by
  rw [archimedean_iff_nat_le]
  refine Q.ind (fun p q => ?_)
  have hd2 : 0 < q.1 * q.1 := mul_self_pos.mpr q.2
  obtain ⟨n, hn⟩ := Archimedean.arch (p * q.1) hd2
  rw [nsmul_eq_mul] at hn
  refine ⟨n, ?_⟩
  rw [Q.natCast_eq_ofZ, Q.le_def, Q.ofZ_def, sub_eq_add_neg, Q.neg_mk, Q.mk_add_mk,
    Q.nonneg_mk, NZ.mul_val, NZ.one_val]
  nlinarith [hn]

/-! ## INC-1: THE ADDITIVE ORDERED GROUP on the completion `Cut`. -/

namespace ContinuumQ
open ContinuumQ

/-- ADDITION of cuts = the gather of pairwise sums `{a+b | a∈x, b∈y}`. Adding two
    approached points by approaching their sum. -/
def addS (x y : Cut) (q : Q) : Prop := ∃ a b, x.S a ∧ y.S b ∧ q = a + b

/-- The pairwise-sum set of two gathers is again a gather. -/
theorem addGather (x y : Cut) : IsGather (addS x y) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · obtain ⟨a, ha⟩ := x.isG.ne
    obtain ⟨b, hb⟩ := y.isG.ne
    exact ⟨a + b, a, b, ha, hb, rfl⟩
  · obtain ⟨p, hp⟩ := x.isG.proper
    obtain ⟨r, hr⟩ := y.isG.proper
    refine ⟨p + r, ?_⟩
    rintro ⟨a, b, ha, hb, hq⟩
    have hap : a < p := by
      rcases le_or_gt p a with h | h
      · exact absurd (x.isG.down ha h) hp
      · exact h
    have hbr : b < r := by
      rcases le_or_gt r b with h | h
      · exact absurd (y.isG.down hb h) hr
      · exact h
    linarith [hq]
  · rintro p q ⟨a, b, ha, hb, hq⟩ hpq
    refine ⟨a, p - a, ha, ?_, by ring⟩
    apply y.isG.down hb
    linarith [hq]
  · rintro q ⟨a, b, ha, hb, hq⟩
    obtain ⟨a', ha', haa'⟩ := x.isG.nomax a ha
    exact ⟨a' + b, ⟨a', b, ha', hb, rfl⟩, by linarith [hq]⟩

noncomputable instance : Add Cut := ⟨fun x y => ⟨addS x y, addGather x y⟩⟩

@[simp] theorem add_S (x y : Cut) (q : Q) :
    (x + y).S q ↔ ∃ a b, x.S a ∧ y.S b ∧ q = a + b := Iff.rfl

/-- ZERO = the (derived) rational cut of `0`. -/
noncomputable instance : Zero Cut := ⟨Qcut 0⟩

@[simp] theorem zero_S (q : Q) : (0 : Cut).S q ↔ q < 0 := Iff.rfl

/-- NEGATION of a cut = THE FOLD'S REFLECTION one level up: reflect the upper
    complement. `q ∈ -x` iff some upper bound `r ∉ x` has `q < -r` (the strict
    inequality keeps `-x` open, with no greatest element). -/
def negS (x : Cut) (q : Q) : Prop := ∃ r, q < -r ∧ ¬ x.S r

/-- The reflection of a gather is again a gather. -/
theorem negGather (x : Cut) : IsGather (negS x) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · obtain ⟨p, hp⟩ := x.isG.proper
    exact ⟨-p - 1, p, by linarith, hp⟩
  · obtain ⟨a, ha⟩ := x.isG.ne
    refine ⟨-a, ?_⟩
    rintro ⟨r, hr, hnr⟩
    have : r < a := by linarith
    exact hnr (x.isG.down ha (le_of_lt this))
  · rintro p q ⟨r, hr, hnr⟩ hpq
    exact ⟨r, by linarith, hnr⟩
  · rintro q ⟨r, hr, hnr⟩
    exact ⟨(q + -r) / 2, ⟨r, by linarith, hnr⟩, by linarith⟩

noncomputable instance : Neg Cut := ⟨fun x => ⟨negS x, negGather x⟩⟩

@[simp] theorem neg_S (x : Cut) (q : Q) : (-x).S q ↔ ∃ r, q < -r ∧ ¬ x.S r := Iff.rfl

/-- ★ THE CUT-APPROXIMATION LEMMA (where the ARCHIMEDEAN property is forced). For
    any `ε > 0` there is an element `a ∈ x` and an upper bound `r ∉ x` within `ε`.
    Proof: step by `δ = ε/2` from a known interior point; the Archimedean property
    guarantees a step that escapes the cut (`Nat.find` the first such), and the
    predecessor step is still interior. -/
theorem approx (x : Cut) (ε : Q) (hε : 0 < ε) :
    ∃ a r, x.S a ∧ ¬ x.S r ∧ r - a < ε := by
  obtain ⟨a0, ha0⟩ := x.isG.ne
  obtain ⟨p, hp⟩ := x.isG.proper
  set δ : Q := ε / 2 with hδdef
  have hδ : 0 < δ := by rw [hδdef]; linarith
  have hex : ∃ k : ℕ, ¬ x.S (a0 + k • δ) := by
    obtain ⟨n, hn⟩ := Archimedean.arch (p - a0) hδ
    rw [nsmul_eq_mul] at hn
    refine ⟨n, fun hxn => ?_⟩
    have hple : p ≤ a0 + n • δ := by rw [nsmul_eq_mul]; linarith
    exact hp (x.isG.down hxn hple)
  classical
  have hm : ¬ x.S (a0 + (Nat.find hex) • δ) := Nat.find_spec hex
  have hm0 : Nat.find hex ≠ 0 := by
    intro h
    apply hm; rw [h, zero_nsmul, add_zero]; exact ha0
  obtain ⟨m', hm'eq⟩ := Nat.exists_eq_succ_of_ne_zero hm0
  rw [hm'eq] at hm
  have hm'in : x.S (a0 + m' • δ) := by
    by_contra h
    exact Nat.find_min hex (by rw [hm'eq]; exact Nat.lt_succ_self m') h
  refine ⟨a0 + m' • δ, a0 + (m' + 1) • δ, hm'in, hm, ?_⟩
  have hdiff : (a0 + (m' + 1) • δ) - (a0 + m' • δ) = δ := by rw [succ_nsmul]; ring
  rw [hdiff, hδdef]; linarith

/-- ★★ THE ADDITIVE INVERSE: `x + (-x) = 0`. The reverse inclusion is where the
    cut-approximation (the Archimedean / eternal-approach property) is load-bearing:
    given `q < 0`, approximate within `-q` to find `a ∈ x` and `r ∉ x` with
    `r - a < -q`, so `q - a < -r`, placing `q - a ∈ -x` and `q = a + (q - a)`. -/
theorem add_neg_self (x : Cut) : x + (-x) = 0 := by
  apply Cut.ext'
  intro q
  rw [add_S, zero_S]
  constructor
  · rintro ⟨a, b, ha, hb, hq⟩
    rw [neg_S] at hb
    obtain ⟨r, hbr, hnr⟩ := hb
    have har : a < r := by
      rcases le_or_gt r a with h | h
      · exact absurd (x.isG.down ha h) hnr
      · exact h
    linarith [hq]
  · intro hq
    obtain ⟨a, r, ha, hnr, hlt⟩ := approx x (-q) (by linarith)
    refine ⟨a, q - a, ha, ?_, by ring⟩
    rw [neg_S]
    exact ⟨r, by linarith, hnr⟩

/-- Cut addition is commutative. -/
theorem add_comm' (x y : Cut) : x + y = y + x := by
  apply Cut.ext'; intro q
  rw [add_S, add_S]
  constructor
  · rintro ⟨a, b, ha, hb, hq⟩; exact ⟨b, a, hb, ha, by rw [hq]; ring⟩
  · rintro ⟨a, b, ha, hb, hq⟩; exact ⟨b, a, hb, ha, by rw [hq]; ring⟩

/-- Cut addition is associative. -/
theorem add_assoc' (x y z : Cut) : x + y + z = x + (y + z) := by
  apply Cut.ext'; intro q
  rw [add_S, add_S]
  constructor
  · rintro ⟨ab, c, hab, hc, hq⟩
    rw [add_S] at hab
    obtain ⟨a, b, ha, hb, hab'⟩ := hab
    exact ⟨a, b + c, ha, ⟨b, c, hb, hc, rfl⟩, by rw [hq, hab']; ring⟩
  · rintro ⟨a, bc, ha, hbc, hq⟩
    rw [add_S] at hbc
    obtain ⟨b, c, hb, hc, hbc'⟩ := hbc
    exact ⟨a + b, c, ⟨a, b, ha, hb, rfl⟩, hc, by rw [hq, hbc']; ring⟩

/-- `0 + x = x`: the zero cut is a left identity (the `nomax` up-step supplies the
    decomposition `q = (q - b) + b` with `q - b < 0`). -/
theorem zero_add' (x : Cut) : 0 + x = x := by
  apply Cut.ext'; intro q
  rw [add_S]
  constructor
  · rintro ⟨a, b, ha, hb, hq⟩
    rw [zero_S] at ha
    apply x.isG.down hb
    rw [hq]; linarith
  · intro hq
    obtain ⟨b, hb, hqb⟩ := x.isG.nomax q hq
    exact ⟨q - b, b, by rw [zero_S]; linarith, hb, by ring⟩

theorem add_zero' (x : Cut) : x + 0 = x := by rw [add_comm']; exact zero_add' x

/-- ★ THE COMPLETION IS AN ABELIAN GROUP under cut addition: the additive
    (group) closure of the derived ℚ's order-completion. The negation is the
    fold's reflection one level up; the inverse law rests on the eternal approach
    (Archimedean). -/
noncomputable instance addCommGroup : AddCommGroup Cut where
  add := (· + ·)
  add_assoc := add_assoc'
  zero := 0
  zero_add := zero_add'
  add_zero := add_zero'
  neg := (- ·)
  add_comm := add_comm'
  nsmul := nsmulRec
  zsmul := zsmulRec
  neg_add_cancel := fun x => by rw [add_comm']; exact add_neg_self x

/-- ★ THE COMPLETION IS LINEARLY ORDERED — upgrading the banked `PartialOrder Cut`
    with totality (`Cut.le_total`). -/
noncomputable instance linearOrder : LinearOrder Cut where
  le := Cut.le
  lt := fun x y => x ≤ y ∧ ¬ y ≤ x
  le_refl := Cut.le_refl
  le_trans := fun _ _ _ => Cut.le_trans'
  le_antisymm := fun _ _ => Cut.le_antisymm'
  le_total := Cut.le_total
  lt_iff_le_not_ge := fun _ _ => Iff.rfl
  toDecidableLE := Classical.decRel _

/-- Cut addition is translation-invariant (order-compatible on the right). -/
theorem add_le_add_right' (a b : Cut) (h : a ≤ b) (c : Cut) : a + c ≤ b + c := by
  rw [Cut.le_def]
  intro q hq
  rw [add_S] at hq ⊢
  obtain ⟨u, v, hu, hv, hq'⟩ := hq
  exact ⟨u, v, h u hu, hv, hq'⟩

/-- ★ THE ORDER IS COMPATIBLE WITH ADDITION — `Cut` is an ordered additive monoid.
    Together with `addCommGroup` + `linearOrder` + the banked
    `completion_coherence_closed`, the completion is a DEDEKIND-COMPLETE LINEARLY
    ORDERED ABELIAN GROUP: the additive half of the ℝ rung, over the derived ℚ. -/
noncomputable instance : IsOrderedAddMonoid Cut where
  add_le_add_left := fun a b h c => add_le_add_right' a b h c

/-! ## Non-vacuity (W8): the embedding is an additive strictly-monotone hom, and the
    derived √2 is a strictly-positive new element. -/

/-- The derived-ℚ embedding `Qcut` is ADDITIVE: `Qcut a + Qcut b = Qcut (a+b)`. -/
theorem Qcut_add (a b : Q) : Qcut a + Qcut b = Qcut (a + b) := by
  apply Cut.ext'; intro q
  rw [add_S]
  show (∃ s t, s < a ∧ t < b ∧ q = s + t) ↔ q < a + b
  constructor
  · rintro ⟨s, t, hs, ht, hq⟩; rw [hq]; linarith
  · intro hq
    refine ⟨a - (a + b - q) / 2, b - (a + b - q) / 2, by linarith, by linarith, by ring⟩

/-- The embedding `Qcut` is STRICTLY MONOTONE: `a < b → Qcut a < Qcut b`. -/
theorem Qcut_strictMono {a b : Q} (h : a < b) : Qcut a < Qcut b := by
  rw [Cut.lt_def]
  refine ⟨fun q hq => lt_trans hq h, ?_⟩
  rw [Cut.le_def]
  push Not
  exact ⟨a, h, lt_irrefl a⟩

/-- ★ THE DERIVED √2 IS A STRICTLY POSITIVE element of the completion group. The
    additive group is non-degenerate and `sqrt2` is a genuine point `> 0` (the
    completion strictly extends the derived ℚ, which had no √2 — banked
    `sqrt2_not_rational`). -/
theorem zero_lt_sqrt2 : (0 : Cut) < sqrt2 := by
  rw [Cut.lt_def]
  constructor
  · intro q hq
    rw [zero_S] at hq
    exact Or.inl (le_of_lt hq)
  · rw [Cut.le_def]
    push Not
    refine ⟨1, Or.inr (by norm_num), ?_⟩
    rw [zero_S]; norm_num

end ContinuumQ
end Phys.Foundation
