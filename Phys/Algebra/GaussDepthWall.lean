/-
  # THE DEPTH WALL — deep principal contact is exponentially priced (GQ L4)

  ## What this file proves (INVERSE-ENGINE port, production node)

  Recon P2 (151,941 discriminants, 0 violations) becomes kernel theorems:
  a principal-shape form of disc D < 0 primitively represents NOTHING
  strictly between 1 and |D|/4 — so any represented prime power obeys
  4·p^(k+1) ≥ |D|.

  * `eval_square_completion` — ★ 4·eval = (2x+by)² + (4c−b²)y² (a = 1).
  * `y_ne_zero_deep` — ★★ y ≠ 0 ⟹ 4m ≥ −D (integrality y² ≥ 1).
  * `y_zero_primitive` — y = 0 primitive ⟹ m = 1 (unit-square algebra).
  * `depth_wall_core` — ★★★ THE WALL: no primitive value in 1 < m < |D|/4.
  * `zpowRe_ge_one` / `zpowRe_step_ge_two` — ladder positivity.
  * `record_form_disc` — ★ the banked V4 power record IS a disc-D form.
  * `chain_represents_prim` — ★★ PRIMITIVE representation transports along
    Chain (shift/swap witness maps are unimodular).
  * `principal_rep_deep` — ★★★ THE WALL FIRES: principal-shape + primitive
    rep of p^(k+1) (p ≥ 2) ⟹ 4·p^(k+1) ≥ −D.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussFloorLaw

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- ★ THE SQUARE COMPLETION through the disc (a = 1). -/
theorem eval_square_completion (b c x y : Z) :
    4 * ((1 : Z) * x * x + b * x * y + c * y * y)
      = (2 * x + b * y) * (2 * x + b * y) + (4 * c - b * b) * (y * y) := by
  ring

/-- ★★ DEEP VALUES: y ≠ 0 forces 4m ≥ −D on a = 1 forms of disc D. -/
theorem y_ne_zero_deep {b c x y m D : Z}
    (hD : b * b - 4 * (1 : Z) * c = D) (hDneg : D < 0)
    (hm : (1 : Z) * x * x + b * x * y + c * y * y = m)
    (hy : y ≠ 0) :
    -D ≤ 4 * m := by
  have hid := eval_square_completion b c x y
  rw [hm] at hid
  -- y² ≥ 1 by integrality (trichotomy on y)
  have hy2 : (1 : Z) ≤ y * y := by
    rcases lt_trichotomy y 0 with hneg | h0 | hpos
    · have h1 : (1 : Z) ≤ -y := z_pos_ge_one (by linarith)
      nlinarith
    · exact absurd h0 hy
    · have h1 : (1 : Z) ≤ y := z_pos_ge_one hpos
      nlinarith
  -- (2x+by)² ≥ 0; (4c − b²) = −D
  have hsq : (0 : Z) ≤ (2 * x + b * y) * (2 * x + b * y) :=
    mul_self_nonneg _
  have hkey : (4 * c - b * b) * 1 ≤ (4 * c - b * b) * (y * y) := by
    have hpos : (0 : Z) ≤ 4 * c - b * b := by linarith
    nlinarith [hpos, hy2]
  nlinarith [hid, hsq, hkey]

/-- Primitivity of the representation at y = 0: m = x² with x a unit
    partner ⟹ m = 1. (gcd(x,0) = 1 delivered as the Bézout witness
    α·x + β·0 = 1.) -/
theorem y_zero_primitive {x m α β : Z}
    (hm : (1 : Z) * x * x + m * 0 = m)   -- m = x² (shaped)
    (hbez : α * x + β * 0 = 1) :
    m = 1 := by
  have hx : α * x = 1 := by linarith
  have hm' : m = x * x := by linarith
  -- x·α = 1 ⟹ x² · α² = 1 ⟹ m · α² = 1 ⟹ m = 1 (integrality: m > 0
  -- forced, and m ∣ 1)
  have h2 : (x * x) * (α * α) = 1 := by nlinarith [hx]
  rw [← hm'] at h2
  -- m · k = 1 with both integers: m = 1 or m = −1; m = x² ≥ 0 kills −1
  have hmnn : 0 ≤ m := by rw [hm']; exact mul_self_nonneg x
  rcases lt_trichotomy m 1 with hlt | heq | hgt
  · -- 0 ≤ m < 1 ⟹ m = 0 ⟹ 0 = 1 contradiction
    have hm0 : m = 0 := by
      rcases lt_or_eq_of_le hmnn with hpos | h0
      · exfalso
        have := z_pos_ge_one hpos
        linarith
      · exact h0.symm
    rw [hm0] at h2
    norm_num at h2
  · exact heq
  · -- m ≥ 2: m·(α²) = 1 with α² ≥ 0: α² = 0 ⟹ 0 = 1; α² ≥ 1 ⟹ m ≤ 1
    exfalso
    have ha2 : 0 ≤ α * α := mul_self_nonneg α
    rcases lt_or_eq_of_le ha2 with hapos | ha0
    · have ha1 : (1 : Z) ≤ α * α := z_pos_ge_one hapos
      nlinarith
    · rw [← ha0] at h2
      norm_num at h2

/-- ★★★ THE DEPTH WALL CORE: a principal-shape form of disc D < 0
    primitively represents no value strictly between 1 and |D|/4. -/
theorem depth_wall_core {e : BQF} {x y m α β : Z}
    (hea : e.a = 1) (hDneg : disc e < 0)
    (hval : e.a * x * x + e.b * x * y + e.c * y * y = m)
    (hprim : α * x + β * y = 1)
    (hmne : m ≠ 1) :
    -(disc e) ≤ 4 * m := by
  obtain ⟨ea, eb, ec⟩ := e
  simp only [] at hea hval hDneg ⊢
  subst hea
  have hDneg' : eb * eb - 4 * 1 * ec < 0 := hDneg
  show -(eb * eb - 4 * 1 * ec) ≤ 4 * m
  by_cases hy : y = 0
  · -- y = 0: primitive ⟹ m = 1, contradiction with hmne
    exfalso
    subst hy
    apply hmne
    apply y_zero_primitive (x := x) (α := α) (β := β)
    · -- shape: 1·x·x + m·0 = m from hval (y = 0 collapses)
      have : (1 : Z) * x * x = m := by linarith [hval]
      linarith
    · linarith [hprim]
  · -- y ≠ 0: the deep bound
    have hD : eb * eb - 4 * (1 : Z) * ec = eb * eb - 4 * 1 * ec := rfl
    exact y_ne_zero_deep (b := eb) (c := ec) (x := x) (y := y)
      (D := eb * eb - 4 * 1 * ec) rfl hDneg' (by linarith [hval]) hy

/-- Ladder positivity: 1 ≤ a ⟹ 1 ≤ a^k. -/
theorem zpowRe_ge_one {a : Z} (ha : 1 ≤ a) : ∀ k : Re, 1 ≤ zpowRe a k := by
  intro k
  induction k with
  | void => exact le_refl 1
  | step n ih =>
      show 1 ≤ a * zpowRe a n
      nlinarith [ha, ih]

/-- 2 ≤ p ⟹ 2 ≤ p^(k+1). -/
theorem zpowRe_step_ge_two {p : Z} (hp : 2 ≤ p) (k : Re) :
    2 ≤ zpowRe p (Re.step k) := by
  show 2 ≤ p * zpowRe p k
  have h1 := zpowRe_ge_one (by linarith : (1:Z) ≤ p) k
  nlinarith [hp, h1]

/-- ★ THE RECORD IS A FORM: B² − D = 4·A·t ⟹ disc ⟨A, B, t⟩ = D. -/
theorem record_form_disc {D A B t : Z} (hrec : B * B - D = 4 * A * t) :
    disc (⟨A, B, t⟩ : BQF) = D := by
  show B * B - 4 * A * t = D
  linarith

/-- ★★ PRIMITIVE representation transports along Chain. -/
theorem chain_represents_prim {f g : BQF} (h : Chain f g) :
    ∀ N : Z, (∃ x y α β : Z, eval g x y = N ∧ α * x + β * y = 1) →
    (∃ x y α β : Z, eval f x y = N ∧ α * x + β * y = 1) := by
  induction h with
  | refl f => exact fun N h => h
  | @shift f' h' k t ih =>
      intro N hN
      obtain ⟨x, y, α, β, hxy, hprim⟩ := ih N hN
      refine ⟨x + k * y, y, α, β - k * α, ?_, by linarith [hprim]⟩
      rw [← shiftF_eval]
      exact hxy
  | @swap f' h' t ih =>
      intro N hN
      obtain ⟨x, y, α, β, hxy, hprim⟩ := ih N hN
      refine ⟨y, -x, β, -α, ?_, by linarith [hprim]⟩
      rw [← swapF_eval]
      exact hxy

/-- ★★★ THE WALL FIRES: principal-shape + primitive rep of p^(k+1) ⟹
    the depth bound. -/
theorem principal_rep_deep {e : BQF} {p : Z} {k : Re}
    (hea : e.a = 1) (hDneg : disc e < 0) (hp : 2 ≤ p)
    (hrep : ∃ x y α β : Z,
      eval e x y = zpowRe p (Re.step k) ∧ α * x + β * y = 1) :
    -(disc e) ≤ 4 * zpowRe p (Re.step k) := by
  obtain ⟨x, y, α, β, hxy, hprim⟩ := hrep
  have hne : zpowRe p (Re.step k) ≠ 1 := by
    have := zpowRe_step_ge_two hp k
    intro h1
    rw [h1] at this
    linarith
  exact depth_wall_core hea hDneg (by
      show e.a * x * x + e.b * x * y + e.c * y * y = zpowRe p (Re.step k)
      rw [← hxy]
      unfold eval
      ring) hprim hne


#print axioms depth_wall_core
#print axioms chain_represents_prim
#print axioms principal_rep_deep

end BQF
end GaussForms
end Phys.Foundation
