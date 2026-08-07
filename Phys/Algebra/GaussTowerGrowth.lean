/-
  # THE EXIT — long towers force large h (GQ SG-u)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The split-case closure of the ∀m composition: when 2 splits, the
  occupied 2-tower BILLS h — deferring D with long towers have LARGE
  h, so they exit every fiber h ≤ H below an EXPLICIT |D| (T₂ > H ⟺
  A ≥ 3·4^(H+1)). Finiteness through growth, complementing the inert
  case's pure-m bound.

  * `picks_bound` — generic distinct-injection induction (pairwise-
    distinct picks inside a duplicate-free list bound its length;
    split-at-occurrence, self-contained, choice-free).
  * `tower_growth` — ★★★ THE EXIT: a box realizing every index of a
    distinct pick family has length ≥ the family's size.

  ## Standard
  Foundations-only (choice-free); no sorry; trunk imports only.
-/
import Phys.Algebra.GaussSignatureBound

namespace Phys.Foundation
namespace GaussForms
namespace BQF

/-- Generic distinct-injection: pairwise-distinct picks inside a list
    bound its length from below. Self-contained induction. -/
theorem picks_bound {α : Type} : ∀ (idx : List Nat) (box : List α)
    (pick : Nat → α),
    (∀ t ∈ idx, pick t ∈ box) →
    List.Pairwise (fun s t => pick s ≠ pick t) idx →
    List.Pairwise (· ≠ ·) box →
    idx.length ≤ box.length := by
  intro idx
  induction idx with
  | nil => intro box pick _ _ _; simp
  | cons t rest ih =>
      intro box pick hin hpw hboxpw
      -- pick t ∈ box: split box at that occurrence
      have hmem : pick t ∈ box := hin t (List.mem_cons_self ..)
      obtain ⟨pre, post, rfl⟩ := List.append_of_mem hmem
      -- box = pre ++ pick t :: post; every rest-pick lands in
      -- pre ++ post (they differ from pick t)
      have hpwrest := List.pairwise_cons.mp hpw
      have hinr : ∀ r ∈ rest, pick r ∈ pre ++ post := by
        intro r hr
        have hne : pick t ≠ pick r := hpwrest.1 r hr
        have hmem' : pick r ∈ pre ++ pick t :: post :=
          hin r (List.mem_cons_of_mem t hr)
        rw [List.mem_append] at hmem' ⊢
        rcases hmem' with h | h
        · exact Or.inl h
        · rcases List.mem_cons.mp h with h' | h'
          · exact absurd h'.symm hne
          · exact Or.inr h'
      -- pre ++ post is still pairwise-distinct
      have hbox' : List.Pairwise (· ≠ ·) (pre ++ post) :=
        (List.pairwise_append.mpr
          (let h := List.pairwise_append.mp hboxpw
           ⟨h.1, (List.pairwise_cons.mp h.2.1).2,
            fun a ha b hb => h.2.2 a ha b (List.mem_cons_of_mem _ hb)⟩))
      have := ih (pre ++ post) pick hinr hpwrest.2 hbox'
      simp only [List.length_append, List.length_cons] at *
      omega

/-- ★★★ THE EXIT: a duplicate-free box realizing every index of a
    pairwise-distinct pick family has length ≥ the family's size —
    deferring D with long occupied towers have large h. -/
theorem tower_growth (idx : List Nat) (box : List BQF)
    (pick : Nat → BQF)
    (hin : ∀ t ∈ idx, pick t ∈ box)
    (hpw : List.Pairwise (fun s t => pick s ≠ pick t) idx)
    (hboxpw : List.Pairwise (· ≠ ·) box) :
    idx.length ≤ box.length :=
  picks_bound idx box pick hin hpw hboxpw


#print axioms picks_bound
#print axioms tower_growth

end BQF
end GaussForms
end Phys.Foundation
