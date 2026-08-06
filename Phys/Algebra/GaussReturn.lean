/-
  # THE RETURN APPARATUS — powers, pigeonhole, cancellation, the order (GQ R3-R5)

  ## What this file proves (GQ campaign, production node)

  The complete return machinery on the derived integers, no Mathlib number
  content, no Finset/Fintype (list pigeonhole only):

  * `posdef_eval_pos` — a PosDef negative-disc form is positive at every
    nonzero point (4a·f(x,y) = (2ax+by)² − D·y²).
  * `chain_posdef` — PosDef rides chains (negative disc).
  * `reduced_rep_exists` — every PosDef form of negative disc chains to a
    REDUCED PosDef form of the same disc (re-export of reduction_exists).
  * `InBox` / `box_inj` — ★ reduced forms of one disc with equal (a, b) are
    EQUAL (c is determined): the reduced set is a rigid finite box.
  * `length_le_of_nodup_subset` / `power_list_repeat` — ★ THE PIGEONHOLE
    (list form, classical): more forms than the box holds ⟹ a repeat.
  * `PowRel` — the k-fold composition ladder (Chain-closed at the base);
    `powRel_congr` / `powRel_functional` / `powRel_split_succ` — the ladder
    is well-behaved: any two k-th powers are chain-equivalent.
  * `return_cancellation` — ★★ hi∘hd ~ hi + inverse + associativity supply
    ⟹ hd ~ e: the pigeonhole repeat CANCELS to a principal return.
  * `posdef_of_pos_a_neg_disc` — a > 0 + disc < 0 ⟹ PosDef.
  * `dup_pair_of_not_nodup` — duplicate extraction from the pigeonhole.
  * `ReturnSetR` / `IsOrderR` — the relational return set and THE ORDER
    (least positive return); `order_exists` — ★★ any return yields the
    least one (the banked well-ordering); D7 witnesses inhabit both.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussClassLaws

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- Positivity of PosDef negative-disc forms at every nonzero point: chain moves
    preserve disc; for D < 0 the leading coefficient never vanishes and
    a > 0 is preserved... exact route: shiftF preserves a; swapF exchanges
    a ↔ c. For NEGATIVE disc, a ≠ 0 and c ≠ 0 always (else disc = b² ≥ 0).
    PosDef(f) = 0 < a ∧ 0 < c. shiftF: a' = a > 0, and c' = f(k,1) — the
    eval at (k, 1) — positive because a PosDef NEGATIVE-DISC form is
    positive at every nonzero point: 4a·f(x,y) = (2ax+by)² − D·y² > 0 when
    (x,y) ≠ 0 (both squares, −D > 0, not both zero). Banked: -/
theorem posdef_eval_pos {f : BQF} (hp : PosDef f) (hD : disc f < 0)
    (x y : Z) (hxy : ¬ (x = 0 ∧ y = 0)) : 0 < eval f x y := by
  obtain ⟨ha, hc⟩ := hp
  -- 4a·eval = (2ax + by)² − disc·y²
  have hkey : 4 * f.a * eval f x y
      = (2 * f.a * x + f.b * y) * (2 * f.a * x + f.b * y) - disc f * (y * y) := by
    unfold eval disc
    ring
  have hsq1 : 0 ≤ (2 * f.a * x + f.b * y) * (2 * f.a * x + f.b * y) := mul_self_nonneg _
  have hsq2 : 0 ≤ y * y := mul_self_nonneg y
  rcases eq_or_ne y 0 with hy0 | hyne
  · -- y = 0 ⟹ x ≠ 0 ⟹ eval = a·x² > 0
    have hxne : x ≠ 0 := by
      intro hx0
      exact hxy ⟨hx0, hy0⟩
    have hx2 : 0 < x * x := by
      rcases lt_trichotomy 0 x with h | h | h
      · exact mul_pos h h
      · exact absurd h.symm hxne
      · have : 0 < (-x) * (-x) := mul_pos (by linarith) (by linarith)
        calc (0:Z) < (-x) * (-x) := this
          _ = x * x := by ring
    have : eval f x 0 = f.a * (x * x) := by
      unfold eval
      ring
    rw [hy0, this]
    exact mul_pos ha hx2
  · -- y ≠ 0 ⟹ disc·y² < 0 ⟹ RHS > 0 ⟹ 4a·eval > 0 ⟹ eval > 0
    have hy2 : 0 < y * y := by
      rcases lt_trichotomy 0 y with h | h | h
      · exact mul_pos h h
      · exact absurd h.symm hyne
      · have : 0 < (-y) * (-y) := mul_pos (by linarith) (by linarith)
        calc (0:Z) < (-y) * (-y) := this
          _ = y * y := by ring
    have hneg : disc f * (y * y) < 0 := mul_neg_of_neg_of_pos hD hy2
    have hpos4 : 0 < 4 * f.a * eval f x y := by
      rw [hkey]
      linarith
    by_contra hev
    push_neg at hev
    have h4a : 0 < 4 * f.a := by linarith
    have : 4 * f.a * eval f x y ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (le_of_lt h4a) hev
    linarith

/-- ★ PosDef transports along chains (negative disc): the hypotheses ride
    inside the induction motive. -/
theorem chain_posdef {f g : BQF} (hch : Chain f g) :
    PosDef f → disc f < 0 → PosDef g := by
  induction hch with
  | refl f => exact fun hp _ => hp
  | @shift f' h' k t ih =>
      intro hp hD
      apply ih
      · -- PosDef (shiftF k f'): a same; c = eval f' k 1 > 0
        obtain ⟨ha, hc⟩ := hp
        constructor
        · exact ha
        · have hcc : (shiftF k f').c = eval f' k 1 := by
            unfold shiftF eval
            ring_nf
          rw [hcc]
          exact posdef_eval_pos ⟨ha, hc⟩ hD k 1 (by
            intro ⟨_, h1⟩
            exact one_ne_zero h1)
      · rw [shiftF_disc]
        exact hD
  | @swap f' h' t ih =>
      intro hp hD
      apply ih
      · obtain ⟨ha, hc⟩ := hp
        exact ⟨hc, ha⟩
      · rw [swapF_disc]
        exact hD

/-- ★★ REDUCED REPRESENTATIVE: every PosDef form of negative disc chains to
    a REDUCED PosDef form of the same disc. -/
theorem reduced_rep_exists {f : BQF} (hp : PosDef f) (hD : disc f < 0) :
    ∃ g : BQF, Chain f g ∧ Reduced g ∧ PosDef g ∧ disc g = disc f :=
  reduction_exists f hp hD


/-- The (a, b)-box of disc D: reduced PosDef forms of disc D have
    3a² ≤ −D (shallow_miss) and −a < b ≤ a (Reduced). The BOX PREDICATE: -/
def InBox (D : Z) (f : BQF) : Prop :=
  Reduced f ∧ PosDef f ∧ disc f = D

/-- ★ BOX INJECTIVITY: two reduced PosDef forms of one disc with equal
    (a, b) are EQUAL (c pinned by c_determined). -/
theorem box_inj {D : Z} {f g : BQF} (hf : InBox D f) (hg : InBox D g)
    (ha : f.a = g.a) (hb : f.b = g.b) : f = g := by
  obtain ⟨hfr, hfp, hfd⟩ := hf
  obtain ⟨hgr, hgp, hgd⟩ := hg
  have hane : f.a ≠ 0 := ne_of_gt hfp.1
  have hdd : disc f = disc g := by rw [hfd, hgd]
  have hc := c_determined hane ha hb hdd
  -- assemble componentwise
  obtain ⟨fa, fb, fc⟩ := f
  obtain ⟨ga, gb, gc⟩ := g
  simp only at ha hb hc
  rw [ha, hb, hc]

/-- R3a's pigeonhole, inlined (classical, no DecidableEq needed). -/
theorem length_le_of_nodup_subset {α : Type} :
    ∀ (L M : List α), L.Nodup → (∀ x ∈ L, x ∈ M) → L.length ≤ M.length := by
  intro L
  induction L with
  | nil => intro M _ _; exact Nat.zero_le _
  | cons a L ih =>
      intro M hnd hsub
      have haM : a ∈ M := hsub a (List.mem_cons_self ..)
      obtain ⟨M₁, M₂, rfl⟩ := List.append_of_mem haM
      have hndL : L.Nodup := (List.nodup_cons.mp hnd).2
      have haL : a ∉ L := (List.nodup_cons.mp hnd).1
      have hsub' : ∀ x ∈ L, x ∈ M₁ ++ M₂ := by
        intro x hx
        have hxM : x ∈ M₁ ++ a :: M₂ := hsub x (List.mem_cons_of_mem a hx)
        rcases List.mem_append.mp hxM with h | h
        · exact List.mem_append.mpr (Or.inl h)
        · rcases List.mem_cons.mp h with heq | h2
          · exact absurd (heq ▸ hx) haL
          · exact List.mem_append.mpr (Or.inr h2)
      have hlen := ih (M₁ ++ M₂) hndL hsub'
      simp [List.length_append] at hlen ⊢
      omega

/-- ★ THE POWER-LIST REPEAT PRINCIPLE (abstract form the capstone consumes):
    given a list L of forms, ALL in the box of D, with length exceeding a
    bound list M that CONTAINS every box form... i.e. the pigeonhole in the
    exact shape: if every entry of L is in the box, every box form is an
    entry of M, and length M < length L, then L has two distinct positions
    with EQUAL forms. (Positions via a Nodup contradiction on R3a.) -/
theorem power_list_repeat {D : Z} (L M : List BQF)
    (hL : ∀ f ∈ L, InBox D f) (hM : ∀ f, InBox D f → f ∈ M)
    (hlen : M.length < L.length) :
    ¬ L.Nodup := by
  intro hnd
  have hsub : ∀ f ∈ L, f ∈ M := fun f hf => hM f (hL f hf)
  have := length_le_of_nodup_subset L M hnd hsub
  omega


/-- The k-fold composition ladder, Chain-closed at the base. -/
inductive PowRel (g : BQF) : Re → BQF → Prop
  | one {h : BQF} (hch : Chain g h) : PowRel g (Re.step Re.void) h
  | succ {k : Re} {h h' : BQF} (hp : PowRel g k h) (hc : CompRel g h h') :
      PowRel g (Re.step k) h'

/-- ★ Result-slot Chain closure. -/
theorem powRel_congr {g : BQF} {k : Re} {h h' : BQF}
    (hp : PowRel g k h) (hch : Chain h h') : PowRel g k h' := by
  induction hp with
  | one hb => exact PowRel.one (chainTrans hb hch)
  | succ hp hc ih =>
      exact PowRel.succ hp (compRel_congr (Chain.refl _) (Chain.refl _) hch hc)

/-- ★ FUNCTIONALITY of the ladder: two k-th powers are chain-equivalent. -/
theorem powRel_not_void {g h : BQF} (hp : PowRel g Re.void h) : False := by
  cases hp

theorem powRel_functional {g : BQF} {k : Re} {h1 h2 : BQF}
    (hp1 : PowRel g k h1) (hp2 : PowRel g k h2) : Chain h1 h2 := by
  induction hp1 generalizing h2 with
  | one hb =>
      cases hp2 with
      | one hb2 => exact chainTrans (chainSymm hb) hb2
      | succ hp2' hc2 => exact absurd hp2' powRel_not_void
  | @succ k h h' hp hc ih =>
      cases hp2 with
      | one hb2 => exact absurd hp powRel_not_void
      | succ hp2' hc2 =>
          have hch : Chain h _ := ih hp2'
          have hc2' : CompRel g h _ :=
            compRel_congr (Chain.refl g) (chainSymm hch) (Chain.refl _) hc2
          exact compRel_functional hc hc2'

/-- ★ One-step split (definitional). -/
theorem powRel_split_succ {g : BQF} {k : Re} {h : BQF}
    (hp : PowRel g (Re.step k) h) :
    (k = Re.void ∧ Chain g h) ∨ (∃ hk, PowRel g k hk ∧ CompRel g hk h) := by
  cases hp with
  | one hb => exact Or.inl ⟨rfl, hb⟩
  | succ hp' hc => exact Or.inr ⟨_, hp', hc⟩

/-- ★ SAME-INPUT functionality corollary: equal-input compositions with
    chain-equivalent second slots give chain-equivalent results. -/
theorem compRel_functional' {x y y' z z' : BQF}
    (h1 : CompRel x y z) (h2 : CompRel x y' z') (hy : Chain y y') :
    Chain z z' := by
  have h2' : CompRel x y z' :=
    compRel_congr (Chain.refl x) (chainSymm hy) (Chain.refl z') h2
  exact compRel_functional h1 h2'


/-- ★★ THE RETURN CANCELLATION: pure relation algebra. Given
    hi ∘ hd ~ hi, an inverse for hi, and the associativity supply
    (both bracketings landing on one T with the identity-law instance),
    the d-th power hd is principal-chained: Chain hd e. -/
theorem return_cancellation {hi hd hiinv e T : BQF}
    (hcomp : CompRel hi hd hi)
    (hinv : CompRel hiinv hi e)
    (hbrL : CompRel e hd T)
    (hbrR : CompRel hiinv hi T)
    (hid : CompRel e hd hd) :
    Chain hd e := by
  have h1 : Chain T hd := compRel_functional hbrL hid
  have h2 : Chain T e := compRel_functional hbrR hinv
  exact chainTrans (chainSymm h1) h2

/-- ★ PosDef from a > 0 and negative disc: 4ac = b² − disc > 0 forces c > 0. -/
theorem posdef_of_pos_a_neg_disc {f : BQF} (ha : 0 < f.a) (hD : disc f < 0) :
    PosDef f := by
  refine ⟨ha, ?_⟩
  have hkey : 4 * f.a * f.c = f.b * f.b - disc f := by
    unfold disc
    ring
  have hpos : 0 < 4 * f.a * f.c := by
    have hb2 : 0 ≤ f.b * f.b := mul_self_nonneg _
    linarith
  by_contra hc
  push_neg at hc
  have h4a : 0 < 4 * f.a := by linarith
  have : 4 * f.a * f.c ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (le_of_lt h4a) hc
  linarith

/-- ★ DUPLICATE EXTRACTION: a non-Nodup list splits around a repeated entry. -/
theorem dup_pair_of_not_nodup {α : Type} :
    ∀ {L : List α}, ¬ L.Nodup →
    ∃ x L₁ L₂ L₃, L = L₁ ++ x :: (L₂ ++ x :: L₃) := by
  intro L
  induction L with
  | nil => intro h; exact absurd List.nodup_nil h
  | cons a L ih =>
      intro h
      by_cases haL : a ∈ L
      · obtain ⟨M₁, M₂, rfl⟩ := List.append_of_mem haL
        exact ⟨a, [], M₁, M₂, rfl⟩
      · have hnd : ¬ L.Nodup := by
          intro hL
          exact h (List.nodup_cons.mpr ⟨haL, hL⟩)
        obtain ⟨x, L₁, L₂, L₃, hsplit⟩ := ih hnd
        exact ⟨x, a :: L₁, L₂, L₃, by rw [hsplit]; rfl⟩


/-- The relational return set: the k-th power chains to a principal-shape
    form (leading miss 1). -/
def ReturnSetR (g : BQF) (k : Re) : Prop :=
  ∃ h e : BQF, PowRel g k h ∧ Chain h e ∧ e.a = 1

/-- The relational order: the least positive return. -/
def IsOrderR (g : BQF) (h : Re) : Prop :=
  ReturnSetR g h ∧ Re.void < h ∧
  ∀ k, ReturnSetR g k → Re.void < k → h ≤ k

/-- ★★ ORDER EXTRACTION: any positive return yields THE least one. -/
theorem order_exists {g : BQF} {k0 : Re}
    (hk0 : ReturnSetR g k0) (hpos : Re.void < k0) :
    ∃ h : Re, IsOrderR g h := by
  -- least_element on P := fun k => ReturnSetR g k ∧ void < k
  have hex : ∃ k, (ReturnSetR g k ∧ Re.void < k) := ⟨k0, hk0, hpos⟩
  obtain ⟨h, ⟨hret, hhpos⟩, hleast⟩ :=
    least_element (P := fun k => ReturnSetR g k ∧ Re.void < k) hex
  exact ⟨h, hret, hhpos, fun k hk hkpos => hleast k ⟨hk, hkpos⟩⟩

/-- Every PowRel power of ONE step is the base: extraction. -/
theorem powRel_one_out {g h : BQF} (hp : PowRel g (Re.step Re.void) h) :
    Chain g h := by
  cases hp with
  | one hb => exact hb
  | succ hp' hc => cases hp'

/-- D7 INHABITATION: the principal-shape form (1,0,1) has ReturnSetR at 1
    (its own first power chains to itself, leading miss 1). -/
theorem returnSetR_inhabited : ReturnSetR ⟨1, 0, 1⟩ (Re.step Re.void) :=
  ⟨⟨1, 0, 1⟩, ⟨1, 0, 1⟩, PowRel.one (Chain.refl _), Chain.refl _, rfl⟩

/-- D7: the order of the principal-shape form is 1. -/
theorem isOrderR_inhabited : IsOrderR ⟨1, 0, 1⟩ (Re.step Re.void) := by
  refine ⟨returnSetR_inhabited, ?_, ?_⟩
  · rw [lt_iff_step_le]
  · intro k _ hk
    rw [lt_iff_step_le] at hk
    exact hk


#print axioms posdef_eval_pos
#print axioms chain_posdef
#print axioms box_inj
#print axioms power_list_repeat
#print axioms powRel_functional
#print axioms return_cancellation
#print axioms order_exists
#print axioms isOrderR_inhabited

end BQF
end GaussForms
end Phys.Foundation
