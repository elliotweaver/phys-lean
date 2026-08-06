/-
  # GAUSS FORMS ON THE DERIVED INTEGERS — reduction, classes, the anchor

  ## What this file proves (GQ campaign, production node — L1 + class layer)

  Binary quadratic forms as triples over the fold's ℤ, with the complete
  reduction theory and class structure, NO Mathlib number content:

  * `BQF`, `disc`, `eval`, `PosDef`, `Reduced` (+ D7 witness `reduced_inhabited`).
  * `shallow_miss` — ★ FACT 1 of the campaign: reduced ⟹ 3a² ≤ −D
    (every obstruction class IS a shallow miss — the reduction geometry).
  * `Chain` — the SL₂ walk as an inductive move relation (shift/swap);
    `Chain.symm/trans` — every move reverses: the walk is an EQUIVALENCE.
  * `b_window` — the record normalizes into (−a, a] by the derived division.
  * `reduction_exists` — ★ every positive-definite form of negative disc
    CHAINS to a reduced form (termination by strong induction on the miss).
  * `downList_complete` — the finite-box enumeration principle from the
    fold's own recursion (no Finset).
  * `c_determined` — the miss-branch record (a, b, disc) pins c: the reduced
    set injects into a finite box.
  * `FormClass` — the quotient by the walk; `classDisc` descends.
  * `Represents`/`chain_represents` — the value set is a CLASS object.
  * `anchor` — ★★ THE ANCHOR: every properly-landed value becomes a leading
    miss within the class (Euclid descent on the witness, ~350 lines of
    derived arithmetic; the workhorse of composition).

  ## Standard
  Foundations-only; no sorry; trunk + IntegerArith imports only.
-/
import Phys.Foundation.IntegerArithMore

namespace Phys.Foundation
namespace GaussForms

open Re
open IntegerArith

theorem ofRe_mono {m n : Re} (h : m ≤ n) : Z.ofRe m ≤ Z.ofRe n := by
  obtain ⟨c, rfl⟩ := h
  exact ⟨c, by rw [Z.ofRe_add]⟩

theorem ofRe_strict_mono {m n : Re} (h : m < n) : Z.ofRe m < Z.ofRe n := by
  refine lt_of_le_of_ne (ofRe_mono (le_of_lt h)) ?_
  intro heq
  exact ne_of_lt h (Z.ofRe_injective heq)


theorem ofRe_lt_reflect {m n : Re} (h : Z.ofRe m < Z.ofRe n) : m < n := by
  obtain ⟨c, hc⟩ := le_of_lt h
  have hzc : Z.ofRe n = Z.ofRe (m + c) := by rw [Z.ofRe_add]; exact hc
  have hn : n = m + c := Z.ofRe_injective hzc
  refine lt_of_le_of_ne ⟨c, hn⟩ ?_
  intro heq
  subst heq
  exact lt_irrefl _ h

structure BQF where
  a : Z
  b : Z
  c : Z

namespace BQF

/-- The discriminant b² − 4ac. -/
def disc (f : BQF) : Z := f.b * f.b - (4 : Z) * f.a * f.c

def eval (f : BQF) (x y : Z) : Z := f.a * x * x + f.b * x * y + f.c * y * y

def shiftF (k : Z) (f : BQF) : BQF :=
  ⟨f.a, f.b + 2 * f.a * k, f.a * k * k + f.b * k + f.c⟩

def swapF (f : BQF) : BQF := ⟨f.c, -f.b, f.a⟩

theorem shiftF_disc (k : Z) (f : BQF) : disc (shiftF k f) = disc f := by
  unfold disc shiftF; ring

theorem swapF_disc (f : BQF) : disc (swapF f) = disc f := by
  unfold disc swapF; ring

inductive Chain : BQF → BQF → Prop
  | refl (f : BQF) : Chain f f
  | shift {f h : BQF} (k : Z) (t : Chain (shiftF k f) h) : Chain f h
  | swap {f h : BQF} (t : Chain (swapF f) h) : Chain f h

/-- Positive-definite (for negative discriminant): a > 0 and c > 0. -/
def PosDef (f : BQF) : Prop := 0 < f.a ∧ 0 < f.c

/-- The REDUCED predicate: |b| ≤ a ≤ c, i.e. −a < b ≤ a ≤ c
    (Gauss's normalization; strict on the boundary handled at production). -/
def Reduced (f : BQF) : Prop := -f.a < f.b ∧ f.b ≤ f.a ∧ f.a ≤ f.c

/-- D7-DISCIPLINE INHABITATION WITNESS: the principal-shape form (1,0,1) is
    reduced and positive-definite, with discriminant −4. -/
theorem reduced_inhabited : ∃ f : BQF, Reduced f ∧ PosDef f ∧ disc f = -(4 : Z) := by
  refine ⟨⟨1, 0, 1⟩, ⟨?_, ?_, le_refl _⟩, ⟨zero_lt_one, zero_lt_one⟩, ?_⟩
  · simpa using (neg_neg_iff_pos.mpr (zero_lt_one : (0:Z) < 1))
  · exact zero_le_one
  · show (0 : Z) * 0 - 4 * 1 * 1 = -4
    ring

/-- ★ FACT 1 (the shallow-miss bound, Z-form): a reduced positive-definite form
    satisfies 4a·a ≤ b·b + 4a·c  →  3·(a·a) ≤ −D  (since −D = 4ac − b²,
    and b² ≤ a² ≤ ac). THE reduction-geometry theorem of THE LAW. -/
theorem shallow_miss {f : BQF} (hr : Reduced f) (hp : PosDef f) :
    (3 : Z) * (f.a * f.a) ≤ -(disc f) := by
  obtain ⟨hbl, hbu, hac⟩ := hr
  obtain ⟨hapos, _⟩ := hp
  -- −D = 4ac − b²; need 3a² ≤ 4ac − b², i.e. 3a² + b² ≤ 4ac.
  -- b² ≤ a² (from −a < b ≤ a) and a² ≤ ac (from a ≤ c, a > 0): 3a² + b² ≤ 4a² ≤ 4ac... 
  -- careful: 3a² + b² ≤ 3a² + a² = 4a² ≤ 4ac. ✓
  have hb2 : f.b * f.b ≤ f.a * f.a := by
    rcases le_or_gt 0 f.b with hb0 | hb0
    · exact mul_self_le_mul_self hb0 hbu
    · have hminus : 0 ≤ -f.b := neg_nonneg.mpr (le_of_lt hb0)
      have hlt : -f.b ≤ f.a := by
        have := neg_lt_neg hbl
        simpa using le_of_lt (by simpa using this)
      calc f.b * f.b = (-f.b) * (-f.b) := by ring
        _ ≤ f.a * f.a := mul_self_le_mul_self hminus hlt
  have ha2c : f.a * f.a ≤ f.a * f.c :=
    mul_le_mul_of_nonneg_left hac (le_of_lt hapos)
  have h4 : (0:Z) ≤ 4 := by positivity
  have key : (3:Z) * (f.a * f.a) + f.b * f.b ≤ (4:Z) * (f.a * f.c) := by
    have s1 : (3:Z) * (f.a * f.a) + f.b * f.b ≤ (3:Z) * (f.a * f.a) + f.a * f.a := by
      linarith
    have s2 : (3:Z) * (f.a * f.a) + f.a * f.a = (4:Z) * (f.a * f.a) := by ring
    have s3 : (4:Z) * (f.a * f.a) ≤ (4:Z) * (f.a * f.c) :=
      mul_le_mul_of_nonneg_left ha2c h4
    linarith
  have hfin : (3:Z) * (f.a * f.a) ≤ (4:Z) * (f.a * f.c) - f.b * f.b := by linarith
  have hdisc : (4:Z) * (f.a * f.c) - f.b * f.b = -(disc f) := by
    unfold disc; ring
  linarith


theorem pos_extract {x : Z} (hx : 0 < x) : ∃ n : Re, n ≠ 0 ∧ x = Z.ofRe n := by
  obtain ⟨n, hn⟩ := le_of_lt hx
  rw [zero_add] at hn
  refine ⟨n, ?_, hn⟩
  intro h0
  subst h0
  rw [hn, Z.ofRe_zero] at hx
  exact lt_irrefl _ hx


theorem pos_of_mul_pos_left {x y : Z} (hxy : 0 < x * y) (hx : 0 < x) : 0 < y := by
  rcases lt_trichotomy 0 y with h | h | h
  · exact h
  · exfalso; rw [← h, mul_zero] at hxy; exact lt_irrefl _ hxy
  · exfalso
    have h1 : 0 ≤ x * (-y) := mul_nonneg (le_of_lt hx) (by linarith)
    nlinarith


/-- shift composes additively. -/
theorem shiftF_shiftF (k l : Z) (f : BQF) :
    shiftF l (shiftF k f) = shiftF (k + l) f := by
  unfold shiftF
  have h1 : (⟨f.a, f.b + 2 * f.a * k, f.a * k * k + f.b * k + f.c⟩ : BQF).a = f.a := rfl
  refine congrArg₂ (fun b c => BQF.mk f.a b c) ?_ ?_
  · show f.b + 2 * f.a * k + 2 * f.a * l = f.b + 2 * f.a * (k + l)
    ring
  · show f.a * l * l + (f.b + 2 * f.a * k) * l + (f.a * k * k + f.b * k + f.c)
      = f.a * (k + l) * (k + l) + f.b * (k + l) + f.c
    ring

/-- shift 0 is the identity. -/
theorem shiftF_zero (f : BQF) : shiftF 0 f = f := by
  unfold shiftF
  refine congrArg₂ (fun b c => BQF.mk f.a b c) ?_ ?_
  · show f.b + 2 * f.a * 0 = f.b; ring
  · show f.a * 0 * 0 + f.b * 0 + f.c = f.c; ring

/-- swap is an involution. -/
theorem swapF_swapF (f : BQF) : swapF (swapF f) = f := by
  unfold swapF
  show (⟨f.a, -(-f.b), f.c⟩ : BQF) = f
  rw [neg_neg]

/-! ### The b-window lemma (branch normalization) -/

theorem b_window (a b : Z) (ha : 0 < a) :
    ∃ k b', b' = b + 2 * a * k ∧ -a < b' ∧ b' ≤ a := by
  obtain ⟨n, hn0, hna⟩ := pos_extract ha
  have h2n0 : (n + n) ≠ 0 := by
    intro h
    rcases Re.add_eq_zero h with ⟨h1, _⟩
    exact hn0 h1
  have h2npos : Re.void < n + n :=
    lt_of_le_of_ne (Re.zero_le _) (fun h => h2n0 h.symm)
  have h2a : (2 : Z) * a = Z.ofRe (n + n) := by
    rw [Z.ofRe_add, hna]; ring
  obtain ⟨m, hm | hm⟩ := z_trichotomy (b + a)
  · -- b + a = ofRe m
    obtain ⟨q, r, hqr, hrlt⟩ := div_mod_exists (n + n) h2npos m
    have hofm : Z.ofRe m = (2 * a) * Z.ofRe q + Z.ofRe r := by
      rw [hqr, Z.ofRe_add, Z.ofRe_mul, h2a]
    rcases eq_or_ne r 0 with hr0 | hrne
    · -- boundary: land on b' = a
      refine ⟨-(Z.ofRe q) + 1, a, ?_, by linarith, le_refl a⟩
      subst hr0
      rw [Z.ofRe_zero, add_zero] at hofm
      have hb : b = (2 * a) * Z.ofRe q - a := by
        have : b + a = (2 * a) * Z.ofRe q := by rw [hm, hofm]
        linarith
      rw [hb]; ring
    · -- interior: b' = ofRe r − a
      refine ⟨-(Z.ofRe q), Z.ofRe r - a, ?_, ?_, ?_⟩
      · have hb : b = (2 * a) * Z.ofRe q + Z.ofRe r - a := by
          have : b + a = (2 * a) * Z.ofRe q + Z.ofRe r := by rw [hm, hofm]
          linarith
        rw [hb]; ring
      · have : (0 : Z) < Z.ofRe r := ofRe_pos hrne
        linarith
      · have : Z.ofRe r ≤ Z.ofRe (n + n) := ofRe_mono (le_of_lt hrlt)
        rw [← h2a] at this
        linarith
  · -- b + a = −ofRe m
    obtain ⟨q, r, hqr, hrlt⟩ := div_mod_exists (n + n) h2npos m
    have hofm : Z.ofRe m = (2 * a) * Z.ofRe q + Z.ofRe r := by
      rw [hqr, Z.ofRe_add, Z.ofRe_mul, h2a]
    refine ⟨Z.ofRe q + 1, a - Z.ofRe r, ?_, ?_, ?_⟩
    · have hb : b = -((2 * a) * Z.ofRe q + Z.ofRe r) - a := by
        have : b + a = -((2 * a) * Z.ofRe q + Z.ofRe r) := by rw [hm, hofm]
        linarith
      rw [hb]; ring
    · have : Z.ofRe r < Z.ofRe (n + n) := ofRe_strict_mono hrlt
      rw [← h2a] at this
      linarith
    · have : (0 : Z) ≤ Z.ofRe r := ofRe_nonneg r
      linarith

/-! ### ★ THE REDUCTION THEOREM: every positive-definite form of negative
    discriminant reaches a reduced form by a finite move chain. -/

theorem reduction_exists (f : BQF) (hp : PosDef f) (hd : disc f < 0) :
    ∃ g, Chain f g ∧ Reduced g ∧ PosDef g ∧ disc g = disc f := by
  obtain ⟨n₀, hn₀ne, hn₀⟩ := pos_extract hp.1
  -- strong induction on the Re-measure of the leading coefficient
  have main : ∀ n : Re, ∀ f : BQF, f.a = Z.ofRe n → PosDef f → disc f < 0 →
      ∃ g, Chain f g ∧ Reduced g ∧ PosDef g ∧ disc g = disc f := by
    refine strong_induction
      (P := fun n => ∀ f : BQF, f.a = Z.ofRe n → PosDef f → disc f < 0 →
        ∃ g, Chain f g ∧ Reduced g ∧ PosDef g ∧ disc g = disc f) ?_
    intro n ih f hfa hp hd
    -- normalize b into the window
    obtain ⟨k, b', hb', hbl, hbu⟩ := b_window f.a f.b hp.1
    set f1 : BQF := shiftF k f with hf1
    have hf1a : f1.a = f.a := rfl
    have hf1b : f1.b = b' := by rw [hf1]; show f.b + 2 * f.a * k = b'; rw [hb']
    have hd1 : disc f1 = disc f := shiftF_disc k f
    have hp1 : PosDef f1 := by
      refine ⟨by rw [hf1a]; exact hp.1, ?_⟩
      -- 4 a c₁ = b₁² − D > 0
      have h4ac : (4 : Z) * f1.a * f1.c = f1.b * f1.b - disc f1 := by
        unfold disc; ring
      have hpos : (0:Z) < (4 : Z) * f1.a * f1.c := by
        rw [h4ac, hd1]
        have hb2 : (0:Z) ≤ f1.b * f1.b := mul_self_nonneg f1.b
        linarith
      have h4a : (0:Z) < (4 : Z) * f1.a := by
        rw [hf1a]
        have := hp.1
        linarith
      have : (0:Z) < ((4 : Z) * f1.a) * f1.c := by
        calc (0:Z) < (4 : Z) * f1.a * f1.c := hpos
          _ = ((4 : Z) * f1.a) * f1.c := by ring
      exact pos_of_mul_pos_left this h4a
    rcases le_or_gt f1.a f1.c with hac | hca
    · -- already reduced
      refine ⟨f1, Chain.shift k (Chain.refl _), ?_, hp1, hd1⟩
      refine ⟨?_, ?_, hac⟩
      · rw [hf1b, hf1a]; exact hbl
      · rw [hf1b, hf1a]; exact hbu
    · -- swap and recurse: new leading coefficient c₁ < a
      set f2 : BQF := swapF f1 with hf2
      have hf2a : f2.a = f1.c := rfl
      have hp2 : PosDef f2 := ⟨hp1.2, hp1.1⟩
      have hd2 : disc f2 = disc f := by rw [hf2, swapF_disc, hd1]
      obtain ⟨m, hmne, hmc⟩ := pos_extract hp1.2
      have hmn : m < n := by
        apply ofRe_lt_reflect
        rw [← hmc]
        have hfa1 : f1.a = Z.ofRe n := by rw [hf1a, hfa]
        rw [← hfa1]
        exact hca
      obtain ⟨g, hchain, hred, hpg, hdg⟩ :=
        ih m hmn f2 (by rw [hf2a, hmc]) hp2 (by rw [hd2]; exact hd)
      exact ⟨g, Chain.shift k (Chain.swap hchain),
        hred, hpg, by rw [hdg, hd2]⟩
  exact main n₀ f hn₀ hp hd


theorem z_mul_ne_zero {x y : Z} (hx : x ≠ 0) (hy : y ≠ 0) : x * y ≠ 0 := by
  have hxt : 0 < x ∨ x < 0 := by
    rcases lt_trichotomy 0 x with h | h | h
    · exact Or.inl h
    · exact absurd h.symm hx
    · exact Or.inr h
  have hyt : 0 < y ∨ y < 0 := by
    rcases lt_trichotomy 0 y with h | h | h
    · exact Or.inl h
    · exact absurd h.symm hy
    · exact Or.inr h
  rcases hxt with hx1 | hx1 <;> rcases hyt with hy1 | hy1
  · exact ne_of_gt (Z.mul_pos x y hx1 hy1)
  · have : 0 < x * (-y) := Z.mul_pos x (-y) hx1 (by linarith)
    intro h0
    rw [show x * (-y) = -(x * y) by ring, h0, neg_zero] at this
    exact lt_irrefl _ this
  · have : 0 < (-x) * y := Z.mul_pos (-x) y (by linarith) hy1
    intro h0
    rw [show (-x) * y = -(x * y) by ring, h0, neg_zero] at this
    exact lt_irrefl _ this
  · have : 0 < (-x) * (-y) := Z.mul_pos (-x) (-y) (by linarith) (by linarith)
    intro h0
    rw [show (-x) * (-y) = x * y by ring, h0] at this
    exact lt_irrefl _ this

theorem z_mul_cancel {a x y : Z} (ha : a ≠ 0) (h : a * x = a * y) : x = y := by
  by_contra hne
  have hxy : x - y ≠ 0 := fun h0 => hne (by linarith [sub_eq_zero.mp h0])
  have : a * (x - y) ≠ 0 := z_mul_ne_zero ha hxy
  apply this
  rw [mul_sub, h, sub_self]


/-- ★ INJECTIVITY OF THE MISS-BRANCH RECORD: same a ≠ 0, same b, same
    discriminant ⟹ same form. The reduced set injects into (a,b)-pairs. -/
theorem c_determined {f g : BQF} (ha : f.a ≠ 0)
    (hfa : f.a = g.a) (hfb : f.b = g.b) (hd : disc f = disc g) : f.c = g.c := by
  unfold disc at hd
  have h4 : ((4:Z) * f.a) * f.c = ((4:Z) * f.a) * g.c := by
    rw [hfb] at hd
    have hstep : (4:Z) * f.a * f.c = (4:Z) * g.a * g.c := by linarith
    rw [← hfa] at hstep
    linarith
  have h4a : (4:Z) * f.a ≠ 0 := by
    apply z_mul_ne_zero _ ha
    intro h
    have h04 : (0:Z) < 4 := by positivity
    rw [← h] at h04
    exact lt_irrefl _ h04
  exact z_mul_cancel h4a h4

theorem chain_trans {f g h : BQF} (h1 : Chain f g) (h2 : Chain g h) : Chain f h := by
  induction h1 with
  | refl f => exact h2
  | shift k t ih => exact Chain.shift k (ih h2)
  | swap t ih => exact Chain.swap (ih h2)

theorem anchor_step_eval (f : BQF) (k x y : Z) :
    eval (swapF (shiftF k f)) y (-(x - k * y)) = eval f x y := by
  unfold eval swapF shiftF
  ring

/-- |z| as a count: the Re-measure from trichotomy. -/
def zAbs (z : Z) (n : Re) : Prop := z = Z.ofRe n ∨ z = -(Z.ofRe n)

theorem zAbs_exists (z : Z) : ∃ n, zAbs z n := z_trichotomy z

/-- ★ THE ANCHOR: a proper landing becomes the miss of a chained form.
    Proper: ∃ u v, u*x + v*y = 1. -/
theorem anchor (f : BQF) (x y N : Z) (hval : eval f x y = N)
    (hproper : ∃ u v : Z, u * x + v * y = 1) :
    ∃ g : BQF, Chain f g ∧ g.a = N := by
  -- strong induction on the count measure of y
  obtain ⟨ny, hny⟩ := zAbs_exists y
  -- the induction is over ny with (f, x, y, witness) generalized
  have main : ∀ n : Re, ∀ (f : BQF) (x y N : Z), zAbs y n → eval f x y = N →
      (∃ u v : Z, u * x + v * y = 1) → ∃ g : BQF, Chain f g ∧ g.a = N := by
    refine strong_induction
      (P := fun n => ∀ (f : BQF) (x y N : Z), zAbs y n → eval f x y = N →
        (∃ u v : Z, u * x + v * y = 1) → ∃ g : BQF, Chain f g ∧ g.a = N) ?_
    intro n ih f x y N hyabs hval hproper
    rcases eq_or_ne y 0 with hy0 | hyne
    · -- y = 0: properness gives u x = 1 ⟹ x² = 1 (x u = 1 in Z ⟹ x = ±1, but
      -- we only need x² = 1: from u x = 1, (u x)² = 1 ⟹ x² u² = 1... simplest:
      -- eval f x 0 = a x². a x² = N and x u = 1 ⟹ N = a x², and
      -- g := f anchored: we need g.a = N = a x². Take g = f when x² = 1.
      -- x u = 1 in the derived ℤ ⟹ x = 1 ∨ x = −1 (unit classification).
      subst hy0
      obtain ⟨u, v, huv⟩ := hproper
      have hux : u * x = 1 := by linarith [huv]
      -- unit classification on Z via trichotomy + discreteness
      have hxpm : x = 1 ∨ x = -1 := by
        obtain ⟨m, hm | hm⟩ := z_trichotomy x
        · -- x = ofRe m ≥ 0; x u = 1 > 0 with x ≥ 0 ⟹ x > 0 ⟹ m ≥ 1
          -- and if m ≥ 2 then x ≥ 2 ⟹ u x = 1 with |x| ≥ 2 impossible by
          -- discreteness: u ≥ 1 ⟹ ux ≥ 2; u ≤ 0 ⟹ ux ≤ 0. So m = 1.
          match m with
          | .void =>
              exfalso
              rw [show Z.ofRe Re.void = (0:Z) from Z.ofRe_zero] at hm
              subst hm
              rw [mul_zero] at hux
              exact absurd hux (by intro h; exact one_ne_zero h.symm)
          | .step m' =>
              -- x = ofRe (step m') = ofRe m' + 1 ≥ 1
              have hx1 : x = Z.ofRe m' + 1 := by
                rw [hm]
                have hsm : Re.step m' = m' + Re.step Re.void := by
                  rw [add_step_swap]
                  show Re.step m' = Re.step m' + Re.void
                  rw [Re.add_void]
                rw [hsm, Z.ofRe_add, show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
              rcases eq_or_ne m' 0 with hm0 | hmne
              · left
                rw [hx1, hm0, Z.ofRe_zero, zero_add]
              · -- m' ≥ 1 ⟹ x ≥ 2 ⟹ u x = 1 impossible
                exfalso
                have hm1 : (1 : Z) ≤ Z.ofRe m' := by
                  match m', hmne with
                  | .step m'', _ =>
                      have hsm : Re.step m'' = m'' + Re.step Re.void := by
                        rw [add_step_swap]
                        show Re.step m'' = Re.step m'' + Re.void
                        rw [Re.add_void]
                      rw [hsm, Z.ofRe_add, show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
                      linarith [ofRe_nonneg m'']
                have hx2 : (2 : Z) ≤ x := by rw [hx1]; linarith
                -- u x = 1, x ≥ 2: u ≥ 1 ⟹ ux ≥ 2 > 1; u ≤ 0 ⟹ ux ≤ 0 < 1.
                -- u must satisfy 0 < u (since ux = 1 > 0 and x > 0): then u ≥ 1 by discreteness.
                have hxpos : (0 : Z) < x := by linarith
                have hupos : (0 : Z) < u := by
                  by_contra hun
                  push_neg at hun
                  have : u * x ≤ 0 := mul_nonpos_of_nonpos_of_nonneg hun (le_of_lt hxpos)
                  linarith
                have hu1 : (1 : Z) ≤ u := by
                  obtain ⟨mu, hmu | hmu⟩ := z_trichotomy u
                  · match mu, hmu with
                    | .void, hmu =>
                        exfalso
                        rw [show Z.ofRe Re.void = (0:Z) from Z.ofRe_zero] at hmu
                        rw [hmu] at hupos
                        exact lt_irrefl _ hupos
                    | .step mu', hmu =>
                        have hsm : Re.step mu' = mu' + Re.step Re.void := by
                          rw [add_step_swap]
                          show Re.step mu' = Re.step mu' + Re.void
                          rw [Re.add_void]
                        rw [hmu, hsm, Z.ofRe_add, show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
                        linarith [ofRe_nonneg mu']
                  · exfalso
                    have : u ≤ 0 := by rw [hmu]; linarith [ofRe_nonneg mu]
                    linarith
                nlinarith
        · -- x = −ofRe m: symmetric, x ≤ 0; get x = −1
          match m with
          | .void =>
              exfalso
              rw [show Z.ofRe Re.void = (0:Z) from Z.ofRe_zero, neg_zero] at hm
              subst hm
              rw [mul_zero] at hux
              exact absurd hux (by intro h; exact one_ne_zero h.symm)
          | .step m' =>
              have hx1 : x = -(Z.ofRe m' + 1) := by
                rw [hm]
                have hsm : Re.step m' = m' + Re.step Re.void := by
                  rw [add_step_swap]
                  show Re.step m' = Re.step m' + Re.void
                  rw [Re.add_void]
                rw [hsm, Z.ofRe_add, show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
              rcases eq_or_ne m' 0 with hm0 | hmne
              · right
                rw [hx1, hm0, Z.ofRe_zero, zero_add]
              · exfalso
                have hm1 : (1 : Z) ≤ Z.ofRe m' := by
                  match m', hmne with
                  | .step m'', _ =>
                      have hsm : Re.step m'' = m'' + Re.step Re.void := by
                        rw [add_step_swap]
                        show Re.step m'' = Re.step m'' + Re.void
                        rw [Re.add_void]
                      rw [hsm, Z.ofRe_add, show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
                      linarith [ofRe_nonneg m'']
                have hx2 : x ≤ -2 := by rw [hx1]; linarith
                have hxneg : x < 0 := by linarith
                have huneg : u < 0 := by
                  by_contra hun
                  push_neg at hun
                  have : u * x ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hun (le_of_lt hxneg)
                  linarith
                have hu1 : u ≤ -1 := by
                  obtain ⟨mu, hmu | hmu⟩ := z_trichotomy u
                  · exfalso
                    have : 0 ≤ u := by rw [hmu]; exact ofRe_nonneg mu
                    linarith
                  · match mu, hmu with
                    | .void, hmu =>
                        exfalso
                        rw [show Z.ofRe Re.void = (0:Z) from Z.ofRe_zero, neg_zero] at hmu
                        rw [hmu] at huneg
                        exact lt_irrefl _ huneg
                    | .step mu', hmu =>
                        have hsm : Re.step mu' = mu' + Re.step Re.void := by
                          rw [add_step_swap]
                          show Re.step mu' = Re.step mu' + Re.void
                          rw [Re.add_void]
                        rw [hmu, hsm, Z.ofRe_add, show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
                        linarith [ofRe_nonneg mu']
                nlinarith
      -- with x = ±1: eval f x 0 = a x² = a = N
      have hN : f.a = N := by
        rcases hxpm with hx | hx <;>
          (subst hx; unfold eval at hval; linarith [hval])
      exact ⟨f, Chain.refl f, hN⟩
    · -- y ≠ 0: Euclid step on the witness
      -- write x = q y + r with the derived division on |x|, |y| — work through
      -- trichotomy: divide the count of x by the count of y? The step needs
      -- x − q y = r with |r| < |y|. Build it via div_mod on counts + signs.
      obtain ⟨nx, hnx⟩ := zAbs_exists x
      -- get q, r over Z with x = q*y + r and the count of r < count of y:
      have hdiv : ∃ q r : Z, x = q * y + r ∧ ∃ nr, zAbs r nr ∧ nr < n := by
        have nne : n ≠ 0 := by
          intro h0
          apply hyne
          rcases hyabs with hy | hy
          · rw [hy, h0, show Z.ofRe (0:Re) = (0:Z) from Z.ofRe_zero]
          · rw [hy, h0, show Z.ofRe (0:Re) = (0:Z) from Z.ofRe_zero, neg_zero]
        have hnpos' : Re.void < n :=
          lt_of_le_of_ne (Re.zero_le n) (fun h => nne h.symm)
        obtain ⟨q0, r0, hqr0, hr0lt⟩ := div_mod_exists n hnpos' nx
        have hofx : Z.ofRe nx = Z.ofRe n * Z.ofRe q0 + Z.ofRe r0 := by
          rw [hqr0, Z.ofRe_add, Z.ofRe_mul]
        rcases hnx with hx | hx <;> rcases hyabs with hy | hy
        · -- x = ofRe nx, y = ofRe ny
          exact ⟨Z.ofRe q0, Z.ofRe r0, by rw [hx, hy, hofx]; ring,
            ⟨r0, Or.inl rfl, hr0lt⟩⟩
        · -- x = ofRe nx, y = −ofRe ny
          exact ⟨-(Z.ofRe q0), Z.ofRe r0, by rw [hx, hy, hofx]; ring,
            ⟨r0, Or.inl rfl, hr0lt⟩⟩
        · -- x = −ofRe nx, y = ofRe ny
          exact ⟨-(Z.ofRe q0), -(Z.ofRe r0), by rw [hx, hy, hofx]; ring,
            ⟨r0, Or.inr rfl, hr0lt⟩⟩
        · -- x = −ofRe nx, y = −ofRe ny
          exact ⟨Z.ofRe q0, -(Z.ofRe r0), by rw [hx, hy, hofx]; ring,
            ⟨r0, Or.inr rfl, hr0lt⟩⟩
      obtain ⟨q, r, hxqr, nr, hnr, hnrlt⟩ := hdiv
      -- the step: f' := swap (shift q f); eval f' y (−r) = eval f x y = N
      set f' : BQF := swapF (shiftF q f) with hf'
      have hval' : eval f' y (-r) = N := by
        rw [hf']
        have hr : r = x - q * y := by linarith
        rw [hr]
        rw [anchor_step_eval f q x y]
        exact hval
      -- witness transports: u x + v y = 1 ⟹ (uq+v) y + u r ... need u' y + v'(−r) = 1
      have hproper' : ∃ u' v' : Z, u' * y + v' * (-r) = 1 := by
        obtain ⟨u, v, huv⟩ := hproper
        refine ⟨u * q + v, -u, ?_⟩
        have hr : r = x - q * y := by linarith
        rw [hr]
        ring_nf
        ring_nf at huv
        linarith
      -- measure: count of (−r) is nr < ny... zAbs (−r) nr from zAbs r nr
      have hnegr : zAbs (-r) nr := by
        rcases hnr with h | h
        · exact Or.inr (by rw [h])
        · exact Or.inl (by rw [h]; ring)
      obtain ⟨g, hchain', hga⟩ := ih nr hnrlt f' y (-r) N hnegr hval' hproper'
      -- assemble: f → shift q f → swap (shift q f) = f' → g
      refine ⟨g, ?_, hga⟩
      have c1 : Chain f g := by
        apply Chain.shift q
        apply Chain.swap
        rw [← hf']
        exact hchain'
      exact c1
  exact main ny f x y N hny hval hproper


theorem disc_eq {f g : BQF} (h : Chain f g) : disc f = disc g := by
  induction h with
  | refl f => rfl
  | shift k t ih => rw [← ih, shiftF_disc]
  | swap t ih => rw [← ih, swapF_disc]

/-- Chain is transitive (append). -/
theorem chainTrans {f g h : BQF} (h1 : Chain f g) (h2 : Chain g h) : Chain f h := by
  induction h1 with
  | refl f => exact h2
  | shift k t ih => exact Chain.shift k (ih h2)
  | swap t ih => exact Chain.swap (ih h2)

/-- Single-move chains. -/
theorem of_shift (k : Z) (f : BQF) : Chain f (shiftF k f) :=
  Chain.shift k (Chain.refl _)

theorem of_swap (f : BQF) : Chain f (swapF f) :=
  Chain.swap (Chain.refl _)

/-- ★ SYMMETRY: every move chain reverses (shift −k and swap undo). -/
theorem chainSymm {f g : BQF} (h : Chain f g) : Chain g f := by
  induction h with
  | refl f => exact Chain.refl f
  | @shift f' h' k t ih =>
      refine chainTrans ih ?_
      have hundo : shiftF (-k) (shiftF k f') = f' := by
        rw [shiftF_shiftF]
        have hk : k + -k = 0 := by ring
        rw [hk, shiftF_zero]
      have step : Chain (shiftF k f') (shiftF (-k) (shiftF k f')) := of_shift _ _
      rw [hundo] at step
      exact step
  | @swap f' h' t ih =>
      refine chainTrans ih ?_
      have hundo : swapF (swapF f') = f' := swapF_swapF f'
      have step : Chain (swapF f') (swapF (swapF f')) := of_swap _
      rw [hundo] at step
      exact step
/-- The descending list [n, n−1, ..., 1, 0] (as counts: n, pred n, ...). -/
def downList : Re → List Re
  | .void => [.void]
  | .step m => .step m :: downList m

theorem downList_complete : ∀ n k : Re, k ≤ n → k ∈ downList n := by
  intro n
  induction n with
  | void =>
      intro k hk
      have hk0 : k = Re.void := by
        obtain ⟨c, hc⟩ := hk
        rcases Re.add_eq_zero (a := k) (b := c) hc.symm with ⟨h1, _⟩
        exact h1
      subst hk0
      exact List.mem_singleton.mpr rfl
  | step n ihn =>
      intro k hk
      rcases eq_or_ne k (Re.step n) with heq | hne
      · subst heq
        exact List.mem_cons_self ..
      · have hkn : k ≤ n := by
          obtain ⟨c, hc⟩ := hk
          match c with
          | .void =>
              exfalso
              apply hne
              have hv : k + Re.void = k := Re.add_void k
              rw [hv] at hc
              exact hc.symm
          | .step c =>
              -- step n = k + step c = step (k + c) ⇒ n = k + c ⇒ k ≤ n
              have h1 : k + Re.step c = Re.step (k + c) := by
                calc k + Re.step c = Re.step c + k := add_comm _ _
                  _ = Re.step (c + k) := Re.step_add c k
                  _ = Re.step (k + c) := by rw [add_comm c k]
              rw [h1] at hc
              have h2 : n = k + c := Re.step_inj hc
              exact ⟨c, h2⟩
        exact List.mem_cons_of_mem _ (ihn k hkn)


/-- The value set: N is represented if some (x,y) lands on it. -/
def Represents (f : BQF) (N : Z) : Prop := ∃ x y : Z, eval f x y = N

/-- D7 witness: (1,0,1) represents 1. -/
theorem represents_inhabited : Represents ⟨1, 0, 1⟩ 1 :=
  ⟨1, 0, by unfold eval; ring⟩

/-- shift preserves values: f(x + ky, y) = (shift k f)(x, y) — reading it
    backwards, (shift k f)(x,y) = f(x + ky, y). -/
theorem shiftF_eval (k : Z) (f : BQF) (x y : Z) :
    eval (shiftF k f) x y = eval f (x + k * y) y := by
  unfold eval shiftF
  ring

/-- swap preserves values: (swap f)(x,y) = f(y, −x)... check: swap = (c,−b,a);
    c x² − b x y + a y² = a y² + b y(−x) + c x²  = f(y, −x). ✓ -/
theorem swapF_eval (f : BQF) (x y : Z) :
    eval (swapF f) x y = eval f y (-x) := by
  unfold eval swapF
  ring

/-- ★ CHAIN-INVARIANCE OF THE VALUE SET (the landing set is a class object). -/
theorem chain_represents {f g : BQF} (h : Chain f g) :
    ∀ N, Represents g N → Represents f N := by
  induction h with
  | refl f => exact fun N h => h
  | @shift f' h' k t ih =>
      intro N hN
      obtain ⟨x, y, hxy⟩ := ih N hN
      exact ⟨x + k * y, y, by rw [← shiftF_eval]; exact hxy⟩
  | @swap f' h' t ih =>
      intro N hN
      obtain ⟨x, y, hxy⟩ := ih N hN
      exact ⟨y, -x, by rw [← swapF_eval]; exact hxy⟩

/-- Forms represent their leading miss. -/
theorem represents_a (f : BQF) : Represents f f.a :=
  ⟨1, 0, by unfold eval; ring⟩

/-- Forms represent their trailing coefficient. -/
theorem represents_c (f : BQF) : Represents f f.c :=
  ⟨0, 1, by unfold eval; ring⟩


/-- THE CLASS RELATION: chain-equivalence (already refl/trans/symm). -/
def ClassEq (f g : BQF) : Prop := Chain f g

instance classSetoid : Setoid BQF where
  r := ClassEq
  iseqv := ⟨Chain.refl, chainSymm, chainTrans⟩

/-- THE FORM CLASSES: the quotient — the gather of all SL₂ walks. -/
def FormClass : Type := Quotient classSetoid

/-- D7 witness: the class of (1,0,1) exists. -/
theorem formClass_inhabited : ∃ _ : FormClass, True :=
  ⟨Quotient.mk classSetoid ⟨1, 0, 1⟩, trivial⟩

/-- Discriminant descends to classes. -/
def classDisc : FormClass → Z :=
  Quotient.lift disc (fun _ _ h => disc_eq h)

theorem classDisc_mk (f : BQF) :
    classDisc (Quotient.mk classSetoid f) = disc f := rfl



#print axioms shallow_miss
#print axioms reduction_exists
#print axioms anchor
#print axioms c_determined
#print axioms formClass_inhabited

end BQF
end GaussForms
end Phys.Foundation
