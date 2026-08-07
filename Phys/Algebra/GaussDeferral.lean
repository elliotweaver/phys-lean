/-
  # THE DEFERRAL LAW — the fold's door, transcribed (GQ L5)

  ## What this file proves (INVERSE-ENGINE port, production node)

  The escape-termination mechanism, read off the fold at Q5/Q6 exactness
  (first contact IS first opportunity, 1.0000/18,186; the half-window
  law, 1.0000/40,667) and banked as kernel objects:

  * `ZDvd'` — divisibility carrier on the derived integers.
  * `root_pair` — ★ p | P(x) ⟹ p | P(p−1−x): the branch's roots pair
    through the (2x+1) ↦ −(2x+1) reflection — both CRT roots of the
    gather live IN the branch (explicit integer witnesses, pure ring).
  * `root_shift` / `root_shift_down` — p-periodicity of contact.
  * `root_window` — ★★ THE COLLAPSE: any root anywhere descends into
    [0, p) (fuel induction on the |x|-measure).
  * `root_half` — ★★ THE HALF WINDOW: roots in [0, p) reflect into
    [0, (p−1)/2] for odd p.
  * `deferral_law` — ★★★ THE DEFERRAL LAW: no root in [0, (p−1)/2] ⟹
    p root-free EVERYWHERE. Checking (p−1)/2 + 1 values of the principal
    branch kernel-decides an odd prime's total blocking — deferral
    becomes a FINITE, per-prime, certificate-grade condition. No
    Kronecker symbol, no reciprocity: the branch is its own oracle.

  With the banked jaws (seed_slot N619, floor_law N620, depth walls
  N621/N622), the engine's completeness certificates are now composed
  entirely of production theorems + finite kernel computations.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussClassWall

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

def ZDvd' (p v : Z) : Prop := ∃ k : Z, v = p * k

theorem root_pair {p c₀ x : Z}
    (h : ZDvd' p (x * x + x + c₀)) :
    ZDvd' p ((p - 1 - x) * (p - 1 - x) + (p - 1 - x) + c₀) := by
  obtain ⟨k, hk⟩ := h
  refine ⟨p - 2 * x - 1 + k, ?_⟩
  have : (p - 1 - x) * (p - 1 - x) + (p - 1 - x) + c₀
      = p * (p - 2 * x - 1) + (x * x + x + c₀) := by ring
  rw [this, hk]
  ring

theorem root_shift {p c₀ x : Z}
    (h : ZDvd' p (x * x + x + c₀)) :
    ZDvd' p ((x + p) * (x + p) + (x + p) + c₀) := by
  obtain ⟨k, hk⟩ := h
  refine ⟨2 * x + p + 1 + k, ?_⟩
  have : (x + p) * (x + p) + (x + p) + c₀
      = p * (2 * x + p + 1) + (x * x + x + c₀) := by ring
  rw [this, hk]
  ring

theorem root_shift_down {p c₀ x : Z}
    (h : ZDvd' p (x * x + x + c₀)) :
    ZDvd' p ((x - p) * (x - p) + (x - p) + c₀) := by
  obtain ⟨k, hk⟩ := h
  refine ⟨-(2 * x) + p - 1 + k, ?_⟩
  have : (x - p) * (x - p) + (x - p) + c₀
      = p * (-(2 * x) + p - 1) + (x * x + x + c₀) := by ring
  rw [this, hk]
  ring

/-- ★★ THE COLLAPSE: any root descends into [0, p). Fuel on |x|. -/
theorem root_window {p c₀ : Z} (hp : 0 < p) :
    ∀ (fuel : Re) (x : Z), (x ≤ Z.ofRe fuel ∧ -(Z.ofRe fuel) ≤ x) →
    ZDvd' p (x * x + x + c₀) →
    ∃ x', 0 ≤ x' ∧ x' < p ∧ ZDvd' p (x' * x' + x' + c₀) := by
  intro fuel
  induction fuel with
  | void =>
      intro x hbnd h
      -- |x| ≤ 0 ⟹ x = 0 ∈ [0, p)
      have hz : Z.ofRe Re.void = (0 : Z) := rfl
      obtain ⟨h1, h2⟩ := hbnd
      rw [hz] at h1 h2
      have hx0 : x = 0 := le_antisymm h1 h2
      subst hx0
      exact ⟨0, le_refl 0, hp, h⟩
  | step n ih =>
      intro x hbnd h
      obtain ⟨h1, h2⟩ := hbnd
      have hstep : Z.ofRe (Re.step n) = Z.ofRe n + 1 := by
        rw [show Re.step n = n + Re.step Re.void from rfl, Z.ofRe_add,
            show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
      rw [hstep] at h1 h2
      by_cases hlo : 0 ≤ x
      · by_cases hhi : x < p
        · exact ⟨x, hlo, hhi, h⟩
        · -- x ≥ p: step down; |x − p| ≤ |x| − 1 (since p ≥ 1, x ≥ p)
          push_neg at hhi
          have hp1 : (1 : Z) ≤ p := z_pos_ge_one hp
          have hnew := root_shift_down (p := p) (c₀ := c₀) (x := x) h
          apply ih (x - p)
          constructor
          · linarith
          · linarith
          · exact hnew
      · -- x < 0: step up. If x + p lands in [0, p) we are done directly
        -- (x < 0 ⟹ x + p < p); else x + p < 0 and |x+p| < |x|: recurse.
        push_neg at hlo
        have hp1 : (1 : Z) ≤ p := z_pos_ge_one hp
        have hxm1 : x ≤ -1 := by
          have := z_pos_ge_one (show (0:Z) < -x by linarith)
          linarith
        have hnew := root_shift (p := p) (c₀ := c₀) (x := x) h
        by_cases hup : 0 ≤ x + p
        · exact ⟨x + p, hup, by linarith, hnew⟩
        · push_neg at hup
          apply ih (x + p)
          constructor
          · linarith
          · linarith
          · exact hnew

/-- ★★ THE HALF WINDOW: a root in [0, p) yields one in [0, (p−1)/2]
    (odd p = 2m+1: the pair x, p−1−x has a member ≤ m). -/
theorem root_half {p c₀ x m : Z} (hodd : p = 2 * m + 1) (hm : 0 ≤ m)
    (hx0 : 0 ≤ x) (hxp : x < p)
    (h : ZDvd' p (x * x + x + c₀)) :
    ∃ x', 0 ≤ x' ∧ x' ≤ m ∧ ZDvd' p (x' * x' + x' + c₀) := by
  by_cases hle : x ≤ m
  · exact ⟨x, hx0, hle, h⟩
  · push_neg at hle
    have hxle : x ≤ p - 1 := by
      by_contra hgt
      push_neg at hgt
      have := z_pos_ge_one (show (0:Z) < x - (p - 1) by linarith)
      linarith
    refine ⟨p - 1 - x, by linarith, by linarith, root_pair h⟩

/-- ★★★ THE DEFERRAL LAW: no root in [0, m] (p = 2m+1 odd) ⟹ p is
    root-free EVERYWHERE. The finite certificate condition. -/
theorem deferral_law {p c₀ m : Z} (hodd : p = 2 * m + 1) (hm : 0 ≤ m)
    (hfree : ∀ x', 0 ≤ x' → x' ≤ m → ¬ ZDvd' p (x' * x' + x' + c₀)) :
    ∀ x : Z, ¬ ZDvd' p (x * x + x + c₀) := by
  intro x hdvd
  have hp : 0 < p := by linarith
  -- fuel: |x| bounded by an Re via trichotomy on x and −x
  obtain ⟨n, hn | hn⟩ := z_trichotomy x
  · -- x = ofRe n ≥ 0: fuel n bounds x; −ofRe n ≤ 0 ≤ x
    obtain ⟨x', h0, hlt, hroot⟩ := root_window hp n x
      ⟨le_of_eq hn, by
        have := ofRe_nonneg n
        linarith [hn]⟩ hdvd
    obtain ⟨x'', h0', hle', hroot'⟩ := root_half hodd hm h0 hlt hroot
    exact hfree x'' h0' hle' hroot'
  · -- x = −ofRe n ≤ 0
    obtain ⟨x', h0, hlt, hroot⟩ := root_window hp n x
      ⟨by
        have := ofRe_nonneg n
        linarith [hn], by linarith [hn]⟩ hdvd
    obtain ⟨x'', h0', hle', hroot'⟩ := root_half hodd hm h0 hlt hroot
    exact hfree x'' h0' hle' hroot'

#print axioms root_half
#print axioms deferral_law


#print axioms root_pair
#print axioms root_window
#print axioms root_half
#print axioms deferral_law

end BQF
end GaussForms
end Phys.Foundation
