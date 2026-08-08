/-
  # THE RABINOWITSCH JAW — compositeness IS box content (GQ SG-at)

  ## What this file proves (SEED-GROWTH campaign, THE FACTORY JAW)

  The fold reading: a composite value P(x) = s·r at a b-window
  position (2x+1 ≤ s) carries the REDUCED form ⟨s, 2x+1, r⟩
  (divisor_form_reduced N666); DIFFERENT positions give DIFFERENT
  b = 2x+1 — pairwise-distinct box members regardless of
  a-collisions:

  * `zpicks_bound` — ★ (choice-free) Z-indexed distinct-picks
    counting (mem-split, no BEq needed).
  * `composite_positions_bound` — ★★★ THE JAW (∀D): m distinct
    b-window composite positions ⟹ box.length ≥ m.

  CONTRAPOSITIVE: h ≤ H forces all but H of the b-window values
  PRIME — Euler's prime factory is not evidence of small h, it IS
  small h. The Rabinowitsch hard direction as window arithmetic.
  With JAW 1 (N663), the ramified arm (N664), and this jaw, every
  channel of the silent crown bills the box.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussDivisorForm

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★ Z-indexed picks counting (BEq-free: mem-split instead of erase):
    distinct picks in a duplicate-free box bound the index list. -/
theorem zpicks_bound : ∀ (xs : List Z) (box : List BQF) (pick : Z → BQF),
    (∀ x ∈ xs, pick x ∈ box) →
    List.Pairwise (fun a b => pick a ≠ pick b) xs →
    List.Pairwise (· ≠ ·) box →
    xs.length ≤ box.length
  | [], _, _, _, _, _ => by simp
  | x :: rest, box, pick, hin, hpw, hboxpw => by
      have hxin : pick x ∈ box := hin x List.mem_cons_self
      obtain ⟨l1, l2, rfl⟩ := List.append_of_mem hxin
      have hsub : (l1 ++ l2).Sublist (l1 ++ pick x :: l2) :=
        (l2.sublist_cons_self (pick x)).append_left l1
      have hrec := zpicks_bound rest (l1 ++ l2) pick
        (by
          intro r hr
          have hrbox : pick r ∈ l1 ++ pick x :: l2 :=
            hin r (List.mem_cons_of_mem _ hr)
          have hne : pick r ≠ pick x := by
            intro heq
            exact (List.pairwise_cons.mp hpw).1 r hr heq.symm
          rcases List.mem_append.mp hrbox with h1 | h2
          · exact List.mem_append.mpr (Or.inl h1)
          · rcases List.mem_cons.mp h2 with heq | h2'
            · exact absurd heq hne
            · exact List.mem_append.mpr (Or.inr h2'))
        (List.pairwise_cons.mp hpw).2
        (hboxpw.sublist hsub)
      simp only [List.length_cons, List.length_append] at *
      omega

/-- ★★★ THE RABINOWITSCH JAW: composite low-window positions inject
    into the box through their divisor forms — distinct b, distinct
    members. -/
theorem composite_positions_bound {c₀ : Z}
    (box : List BQF)
    (hboxpw : List.Pairwise (· ≠ ·) box)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f → disc f = 1 - 4 * c₀ →
      f ∈ box)
    (xs : List Z)
    (hxspw : List.Pairwise (· ≠ ·) xs)
    (hfac : ∀ x ∈ xs, 0 ≤ x ∧ ∃ s r : Z, x * x + x + c₀ = s * r ∧
      0 < s ∧ s ≤ r ∧ 2 * x + 1 ≤ s) :
    xs.length ≤ box.length := by
  classical
  -- pick: position ↦ its divisor form (choice on the factorization)
  let pick : Z → BQF := fun x =>
    if h : ∃ s r : Z, x * x + x + c₀ = s * r ∧ 0 < s ∧ s ≤ r ∧
        2 * x + 1 ≤ s
    then ⟨h.choose, 2 * x + 1, h.choose_spec.choose⟩
    else ⟨1, 1, 1⟩
  have hpickmem : ∀ x ∈ xs, pick x ∈ box := by
    intro x hx
    obtain ⟨hx0, hex⟩ := hfac x hx
    simp only [pick, dif_pos hex]
    obtain ⟨hsr, hs, hsle, hwin⟩ := hex.choose_spec.choose_spec
    have hr : 0 < hex.choose_spec.choose := by
      -- r > 0 from s·r = P(x) > 0 and s > 0: P(x) ≥ c₀ > 0? c₀ sign
      -- unknown — derive from the window: s ≥ 2x+1 ≥ 1 > 0 and
      -- s·r = P(x); positivity of P(x): P(x) = s·r needs r > 0 iff
      -- P(x) > 0. From hwin: s ≥ 2x+1 ≥ 1; from hsle: r ≥ s ≥ 1.
      linarith
    have hlow : -hex.choose < 2 * x + 1 := by linarith
    obtain ⟨hred, hpos, hdisc⟩ := divisor_form_reduced hsr hs hr hlow hwin hsle
    exact hcomplete _ hred hpos hdisc
  have hpickpw : List.Pairwise (fun a b => pick a ≠ pick b) xs := by
    refine hxspw.imp_of_mem ?_
    intro a b ha hb hne heq
    -- distinct positions ⟹ distinct b-coefficients 2a+1 ≠ 2b+1
    have hba : (pick a).b = 2 * a + 1 := by
      obtain ⟨_, hex⟩ := hfac a ha
      simp only [pick, dif_pos hex]
    have hbb : (pick b).b = 2 * b + 1 := by
      obtain ⟨_, hex⟩ := hfac b hb
      simp only [pick, dif_pos hex]
    have : (2 : Z) * a + 1 = 2 * b + 1 := by rw [← hba, ← hbb, heq]
    exact hne (by linarith)
  exact zpicks_bound xs box pick hpickmem hpickpw hboxpw


#print axioms zpicks_bound
#print axioms composite_positions_bound

end BQF
end GaussForms
end Phys.Foundation
