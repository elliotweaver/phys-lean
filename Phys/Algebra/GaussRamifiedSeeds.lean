/-
  # THE RAMIFIED SEEDS — the gather's content IS seedcount (GQ SG-aq)

  ## What this file proves (SEED-GROWTH campaign, THE RAMIFIED ARM OF
  THE BOXED THEOREM)

  The fold reading: the gather bills its own ramification — an odd
  prime p | D touches the branch through its own HALF-WITNESS
  x = (p−1)/2 (4·P((p−1)/2) = p² − D = p(p−k); parity descent divides
  out the 4 — the N660 pattern applied to the touch itself). Deep
  (4p² ≤ A) ⟹ p belongs to EVERY complete touching list.

  * `ramified_touch` — ★★ the half-witness (∀D): p = 2mp+1, p | D ⟹
    P(mp) = p·w.
  * `pairwise_subset_length` — ★ distinct-subset counting.
  * `ramified_forces_seedcount` — ★★★ THE ARM (∀D): m pairwise-
    distinct deep ramified odd primes ⟹ every complete touching
    list has length ≥ m. SEEDCOUNT FROM THE GATHER'S OWN CONTENT —
    no factory, no counting argument, the gather counting itself.

  With JAW 1 (inverse_theorem N663: touching split content expels)
  this gives the boxed theorem's second unconditional arm; the
  remaining case (silent + few ramified) is the Euler-factory crown
  (return-law route, in campaign).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussInverseTheorem

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★ THE HALF-WITNESS: a ramified odd prime touches through
    x = (p−1)/2. -/
theorem ramified_touch {c₀ p mp k : Z}
    (hp : p = 2 * mp + 1) (hram : 1 - 4 * c₀ = p * k) :
    ∃ w : Z, mp * mp + mp + c₀ = p * w := by
  -- 4V = p² − D = p(p − k)
  have h4V : 4 * (mp * mp + mp + c₀) = p * (p - k) := by
    have hsq : (2 * mp + 1) * (2 * mp + 1) - (1 - 4 * c₀)
        = 4 * (mp * mp + mp + c₀) := by ring
    calc 4 * (mp * mp + mp + c₀)
        = (2 * mp + 1) * (2 * mp + 1) - (1 - 4 * c₀) := hsq.symm
      _ = p * p - p * k := by rw [← hp, hram]
      _ = p * (p - k) := by ring
  -- k odd (else D even — dead)
  obtain ⟨mk, hk | hk⟩ := z_parity k
  · exfalso
    have hcontra : 2 * (p * mk + 2 * c₀) = 1 := by
      have : 1 - 4 * c₀ = p * (2 * mk) := by rw [← hk]; exact hram
      linarith [this]
    rcases lt_trichotomy (p * mk + 2 * c₀) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(p * mk + 2 * c₀) by linarith)]
    · rw [hc] at hcontra; norm_num at hcontra
    · nlinarith [z_pos_ge_one hc]
  -- p − k = 2(mp − mk): 2V = p(mp − mk)
  have h2V : 2 * (mp * mp + mp + c₀) = p * (mp - mk) := by
    have hpk : p - k = 2 * (mp - mk) := by rw [hp, hk]; ring
    have h4V' : 4 * (mp * mp + mp + c₀) = p * (2 * (mp - mk)) := by
      rw [← hpk]; exact h4V
    linarith [h4V']
  -- mp − mk = 2w (p odd kills the odd case): V = pw
  obtain ⟨w, hw | hw⟩ := z_parity (mp - mk)
  · refine ⟨w, ?_⟩
    have : 2 * (mp * mp + mp + c₀) = p * (2 * w) := by rw [← hw]; exact h2V
    linarith [this]
  · exfalso
    have hodd : 2 * (mp * mp + mp + c₀) = p * (2 * w + 1) := by
      rw [← hw]; exact h2V
    rw [hp] at hodd
    have hcontra : 2 * ((mp * mp + mp + c₀) - ((2 * mp + 1) * w + mp)) = 1 := by
      nlinarith [hodd]
    rcases lt_trichotomy ((mp * mp + mp + c₀) - ((2 * mp + 1) * w + mp)) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) <
        -((mp * mp + mp + c₀) - ((2 * mp + 1) * w + mp)) by linarith)]
    · rw [hc] at hcontra; norm_num at hcontra
    · nlinarith [z_pos_ge_one hc]

/-- ★ Pairwise-distinct subset counting: qs ⊆ ps with both
    pairwise-ne ⟹ qs.length ≤ ps.length. -/
theorem pairwise_subset_length : ∀ (qs ps : List Z),
    List.Pairwise (· ≠ ·) qs → List.Pairwise (· ≠ ·) ps →
    (∀ q ∈ qs, q ∈ ps) → qs.length ≤ ps.length
  | [], _, _, _, _ => by simp
  | q :: rest, ps, hqspw, hpspw, hin => by
      have hqin : q ∈ ps := hin q List.mem_cons_self
      have hqnotin : q ∉ rest := by
        intro hcontra
        exact (List.pairwise_cons.mp hqspw).1 q hcontra rfl
      have hrec := pairwise_subset_length rest (ps.erase q)
        (List.pairwise_cons.mp hqspw).2
        (hpspw.sublist List.erase_sublist)
        (by
          intro r hr
          refine (List.mem_erase_of_ne ?_).mpr (hin r (List.mem_cons_of_mem _ hr))
          intro heq
          exact hqnotin (heq ▸ hr))
      have herase : (ps.erase q).length = ps.length - 1 :=
        List.length_erase_of_mem hqin
      have hpos : 0 < ps.length := List.length_pos_of_mem hqin
      simp only [List.length_cons]
      omega

/-- ★★★ THE RAMIFIED ARM: m distinct deep ramified odd primes force
    every complete touching list past m — seedcount from the gather's
    own content, ∀D. -/
theorem ramified_forces_seedcount {c₀ A : Z}
    (hA : A = 4 * c₀ - 1)
    (qs : List Z)
    (hqspw : List.Pairwise (· ≠ ·) qs)
    (hqs : ∀ q ∈ qs, ∃ mq k : Z, q = 2 * mq + 1 ∧ 1 ≤ mq ∧
      1 - 4 * c₀ = q * k ∧ 4 * (q * q) ≤ A)
    (ps : List Z)
    (hpscomplete : ∀ p mp : Z, p = 2 * mp + 1 → 1 ≤ mp →
      4 * (p * p) ≤ A → (∃ x w : Z, x * x + x + c₀ = p * w) → p ∈ ps)
    (hpspw : List.Pairwise (· ≠ ·) ps) :
    qs.length ≤ ps.length := by
  -- each ramified q is in ps: the half-witness touch + deepness
  have hin : ∀ q ∈ qs, q ∈ ps := by
    intro q hq
    obtain ⟨mq, k, hqm, hmq1, hram, hdeep⟩ := hqs q hq
    obtain ⟨w, hw⟩ := ramified_touch hqm hram
    exact hpscomplete q mq hqm hmq1 hdeep ⟨mq, w, hw⟩
  exact pairwise_subset_length qs ps hqspw hpspw hin


#print axioms ramified_touch
#print axioms pairwise_subset_length
#print axioms ramified_forces_seedcount

end BQF
end GaussForms
end Phys.Foundation
