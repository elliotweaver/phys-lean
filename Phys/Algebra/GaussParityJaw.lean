/-
  # THE PARITY JAW — both parities, one statement (GQ SG-av)

  ## What this file proves (SEED-GROWTH campaign, THE EVEN ARM +
  UNIFICATION — audit item 3)

  The even fundamental disc D = −4n carries the same geometry as the
  odd: branch Q(x) = x² + n, EVEN look b = 2x, and divisibility is
  geometry by the same one-line identity —

  * `divisor_form_even` — ★★★ (∀): x² + n = s·r ⟹ ⟨s, 2x, r⟩ has
    disc −4n ∧ PosDef. `divisor_form_even_reduced` — band landing.
  * `even_composite_bound` — ★★★ THE EVEN JAW (∀n): m distinct
    composite low positions bill the even box (distinct even looks).
  * `parity_jaw` — ★★★ THE UNIFIED JAW: par ∈ {0, 1}, branch
    x² + x·par + base, look 2x + par, disc par − 4·base — m
    witnessed composite positions force box ≥ m AT EITHER PARITY.
    One quantifier string covering every negative fundamental
    discriminant's branch.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussSilentFactory

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE EVEN DIVISOR FORM: divisibility is geometry at even
    discs. -/
theorem divisor_form_even {n x s r : Z}
    (hsr : x * x + n = s * r) (hs : 0 < s) (hr : 0 < r) :
    disc ⟨s, 2 * x, r⟩ = -(4 * n) ∧ PosDef ⟨s, 2 * x, r⟩ := by
  constructor
  · show (2 * x) * (2 * x) - 4 * s * r = -(4 * n)
    have : s * r = x * x + n := hsr.symm
    nlinarith [this]
  · exact ⟨hs, hr⟩

/-- ★★ THE EVEN BAND LANDING. -/
theorem divisor_form_even_reduced {n x s r : Z}
    (hsr : x * x + n = s * r) (hs : 0 < s) (hr : 0 < r)
    (hlow : -s < 2 * x) (hhigh : 2 * x ≤ s) (hsr' : s ≤ r) :
    Reduced ⟨s, 2 * x, r⟩ ∧ PosDef ⟨s, 2 * x, r⟩ ∧
      disc ⟨s, 2 * x, r⟩ = -(4 * n) := by
  obtain ⟨hdisc, hpos⟩ := divisor_form_even hsr hs hr
  exact ⟨⟨hlow, hhigh, hsr'⟩, hpos, hdisc⟩

/-- ★★★ THE EVEN JAW: composite low positions bill the even-disc
    box — distinct positions, distinct even looks 2x. -/
theorem even_composite_bound {n : Z}
    (box : List BQF)
    (hboxpw : List.Pairwise (· ≠ ·) box)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f → disc f = -(4 * n) →
      f ∈ box)
    (xs : List Z)
    (hxspw : List.Pairwise (· ≠ ·) xs)
    (hfac : ∀ x ∈ xs, 0 ≤ x ∧ ∃ s r : Z, x * x + n = s * r ∧
      0 < s ∧ s ≤ r ∧ 2 * x ≤ s ∧ -s < 2 * x) :
    xs.length ≤ box.length := by
  classical
  let pick : Z → BQF := fun x =>
    if h : ∃ s r : Z, x * x + n = s * r ∧ 0 < s ∧ s ≤ r ∧
        2 * x ≤ s ∧ -s < 2 * x
    then ⟨h.choose, 2 * x, h.choose_spec.choose⟩
    else ⟨1, 1, 1⟩
  have hpickmem : ∀ x ∈ xs, pick x ∈ box := by
    intro x hx
    obtain ⟨hx0, hex⟩ := hfac x hx
    simp only [pick, dif_pos hex]
    obtain ⟨hsr, hs, hsle, hwin, hlow⟩ := hex.choose_spec.choose_spec
    have hr : 0 < hex.choose_spec.choose := by
      -- r ≥ s > 0
      linarith
    obtain ⟨hred, hpos, hdisc⟩ :=
      divisor_form_even_reduced hsr hs hr hlow hwin hsle
    exact hcomplete _ hred hpos hdisc
  have hpickpw : List.Pairwise (fun a b => pick a ≠ pick b) xs := by
    refine hxspw.imp_of_mem ?_
    intro a b ha hb hne heq
    have hba : (pick a).b = 2 * a := by
      obtain ⟨_, hex⟩ := hfac a ha
      simp only [pick, dif_pos hex]
    have hbb : (pick b).b = 2 * b := by
      obtain ⟨_, hex⟩ := hfac b hb
      simp only [pick, dif_pos hex]
    have : (2 : Z) * a = 2 * b := by rw [← hba, ← hbb, heq]
    exact hne (by linarith)
  exact zpicks_bound xs box pick hpickmem hpickpw hboxpw

/-- ★★★ THE PARITY JAW — one statement, both parities: the branch is
    Q(x) = x² + x·par + base with par ∈ {0, 1} (even: par = 0, base =
    n, disc = −4n; odd: par = 1, base = c₀, disc = 1 − 4c₀), the look
    is 2x + par, and m witnessed composite positions bill EITHER box. -/
theorem parity_jaw {par base : Z} (hpar : par = 0 ∨ par = 1)
    (box : List BQF)
    (hboxpw : List.Pairwise (· ≠ ·) box)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f →
      disc f = par - 4 * base → f ∈ box)
    (xs : List Z)
    (hxspw : List.Pairwise (· ≠ ·) xs)
    (hfac : ∀ x ∈ xs, 0 ≤ x ∧ ∃ s r : Z,
      x * x + x * par + base = s * r ∧
      0 < s ∧ s ≤ r ∧ 2 * x + par ≤ s ∧ -s < 2 * x + par) :
    xs.length ≤ box.length := by
  rcases hpar with rfl | rfl
  · -- even: Q(x) = x² + base, disc = −4·base
    refine even_composite_bound (n := base) box hboxpw ?_ xs hxspw ?_
    · intro f hred hpos hdisc
      exact hcomplete f hred hpos (by rw [hdisc]; ring)
    · intro x hx
      obtain ⟨hx0, s, r, hsr, hs, hsle, hwin, hlow⟩ := hfac x hx
      exact ⟨hx0, s, r, by linarith [hsr], hs, hsle, by linarith,
        by linarith⟩
  · -- odd: Q(x) = x² + x + base, disc = 1 − 4·base
    refine composite_positions_bound (c₀ := base) box hboxpw ?_ xs hxspw ?_
    · intro f hred hpos hdisc
      exact hcomplete f hred hpos (by rw [hdisc])
    · intro x hx
      obtain ⟨hx0, s, r, hsr, hs, hsle, hwin, hlow⟩ := hfac x hx
      exact ⟨hx0, s, r, by linarith [hsr], hs, hsle, by linarith⟩


#print axioms divisor_form_even
#print axioms divisor_form_even_reduced
#print axioms even_composite_bound
#print axioms parity_jaw

end BQF
end GaussForms
end Phys.Foundation
