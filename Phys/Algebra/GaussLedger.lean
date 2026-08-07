/-
  # THE LEDGER — the principal slot and the partition identity (GQ L1)

  ## What this file proves (INVERSE-ENGINE port, production node)

  The structural core of THE LEDGER IDENTITY  h(D) = 1 + Σ_{a≥2} rc(D,a):

  * `z_zero_or_one` / `four_k_ne_one` — window and parity arithmetic.
  * `principal_slot_exists_odd` / `_even` — the a = 1 slot is occupied:
    explicit reduced PosDef principal forms per disc parity.
  * `principal_slot_unique` — ★★ the a = 1 slot holds EXACTLY ONE reduced
    form per disc (b ∈ {0,1} by the reduction window; parity forces b;
    4k ≠ 1 kills the cross case; c is solved by the disc equation).
  * `ledger_partition` — ★★ any duplicate-free box with a principal
    occupant splits as 1 + (non-principal part), with the part exact.
  * `ledger_identity_skeleton` — ★★★ THE LEDGER'S SKELETON: a complete
    duplicate-free box of disc D counts 1 + the a ≥ 2 slots — the h(D)−1
    ledger read banked as list-level structure over the banked box
    machinery (boxList_complete supplies completeness at the capstone).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussPipeline

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- Integers in (-1, 1] are 0 or 1. -/
theorem z_zero_or_one {b : Z} (h1 : -1 < b) (h2 : b ≤ 1) :
    b = 0 ∨ b = 1 := by
  have h0 : 0 ≤ b := by
    have := z_pos_ge_one (show (0:Z) < b + 1 by linarith)
    linarith
  rcases lt_or_eq_of_le h0 with hpos | heq
  · exact Or.inr (le_antisymm h2 (z_pos_ge_one hpos))
  · exact Or.inl heq.symm

/-- 4k = 1 has no integer solution. -/
theorem four_k_ne_one (k : Z) : 4 * k ≠ 1 := by
  intro h
  rcases lt_trichotomy k 0 with hk | hk | hk
  · linarith
  · subst hk; linarith
  · have := z_pos_ge_one hk
    linarith

/-- ★ EXISTENCE (odd case): D = 1 − 4c₀, c₀ ≥ 1 ⟹ ⟨1,1,c₀⟩ is the
    principal slot occupant. -/
theorem principal_slot_exists_odd {D c₀ : Z} (hD : D = 1 - 4 * c₀)
    (hc : 1 ≤ c₀) :
    ∃ f : BQF, Reduced f ∧ PosDef f ∧ disc f = D ∧ f.a = 1 := by
  refine ⟨⟨1, 1, c₀⟩, ⟨by norm_num, le_refl _, hc⟩,
    ⟨by norm_num, by show (0:Z) < c₀; linarith⟩, ?_, rfl⟩
  show (1 : Z) * 1 - 4 * 1 * c₀ = D
  linarith

/-- ★ EXISTENCE (even case): D = −4c₀, c₀ ≥ 1 ⟹ ⟨1,0,c₀⟩. -/
theorem principal_slot_exists_even {D c₀ : Z} (hD : D = -(4 * c₀))
    (hc : 1 ≤ c₀) :
    ∃ f : BQF, Reduced f ∧ PosDef f ∧ disc f = D ∧ f.a = 1 := by
  refine ⟨⟨1, 0, c₀⟩, ⟨by norm_num, by norm_num, hc⟩,
    ⟨by norm_num, by show (0:Z) < c₀; linarith⟩, ?_, rfl⟩
  show (0 : Z) * 0 - 4 * 1 * c₀ = D
  linarith

/-- ★★ UNIQUENESS: the a = 1 slot holds at most one reduced form per disc. -/
theorem principal_slot_unique {f g : BQF}
    (hfr : Reduced f) (hgr : Reduced g)
    (hd : disc f = disc g) (hfa : f.a = 1) (hga : g.a = 1) :
    f = g := by
  obtain ⟨fa, fb, fc⟩ := f
  obtain ⟨ga, gb, gc⟩ := g
  simp only [] at hfa hga
  subst hfa hga
  obtain ⟨hf1, hf2, _⟩ := hfr
  obtain ⟨hg1, hg2, _⟩ := hgr
  -- b ∈ {0, 1} on both
  have hfb := z_zero_or_one (by simpa using hf1) (by simpa using hf2)
  have hgb := z_zero_or_one (by simpa using hg1) (by simpa using hg2)
  -- disc equation: fb² − 4fc = gb² − 4gc
  have hde : fb * fb - 4 * 1 * fc = gb * gb - 4 * 1 * gc := hd
  rcases hfb with hfb0 | hfb1 <;> rcases hgb with hgb0 | hgb1
  · -- both 0: c forced
    subst hfb0 hgb0
    have : fc = gc := by linarith
    rw [this]
  · -- 0 vs 1: parity clash — 4(fc−gc)... = 1
    subst hfb0 hgb1
    exfalso
    exact four_k_ne_one (gc - fc) (by linarith)
  · subst hfb1 hgb0
    exfalso
    exact four_k_ne_one (fc - gc) (by linarith)
  · subst hfb1 hgb1
    have : fc = gc := by linarith
    rw [this]


/-- ★★ THE PARTITION. -/
theorem ledger_partition {pf : BQF} :
    ∀ {L : List BQF}, List.Pairwise (· ≠ ·) L → pf ∈ L →
    (∀ f ∈ L, f.a = 1 → f = pf) →
    ∃ M : List BQF,
      (∀ f ∈ M, f ∈ L ∧ f.a ≠ 1) ∧
      (∀ f ∈ L, f ≠ pf → f ∈ M) ∧
      List.Pairwise (· ≠ ·) M ∧
      L.length = 1 + M.length := by
  intro L
  induction L with
  | nil =>
      intro _ hpf _
      exact absurd hpf List.not_mem_nil
  | cons g T ih =>
      intro hpw hpf hone
      rw [List.pairwise_cons] at hpw
      obtain ⟨hgT, hTpw⟩ := hpw
      by_cases hg : g = pf
      · -- head is the principal: M := T
        subst hg
        refine ⟨T, ?_, ?_, hTpw, by simp [Nat.add_comm]⟩
        · intro f hf
          refine ⟨List.mem_cons_of_mem g hf, ?_⟩
          intro ha1
          have : f = g := hone f (List.mem_cons_of_mem g hf) ha1
          subst this
          exact (hgT f hf) rfl
        · intro f hfL hfne
          rcases List.mem_cons.mp hfL with rfl | hfT
          · exact absurd rfl hfne
          · exact hfT
      · -- head is non-principal: recurse
        have hpfT : pf ∈ T := by
          rcases List.mem_cons.mp hpf with rfl | h
          · exact absurd rfl hg
          · exact h
        obtain ⟨M, hM1, hM2, hMpw, hMlen⟩ := ih hTpw hpfT
          (fun f hf ha => hone f (List.mem_cons_of_mem g hf) ha)
        refine ⟨g :: M, ?_, ?_, ?_, by
          show (g :: T).length = 1 + (g :: M).length
          simp only [List.length_cons]
          omega⟩
        · intro f hf
          rcases List.mem_cons.mp hf with rfl | hfM
          · exact ⟨List.mem_cons_self .., fun ha => hg (hone f
              (List.mem_cons_self ..) ha)⟩
          · obtain ⟨hfT, hfa⟩ := hM1 f hfM
            exact ⟨List.mem_cons_of_mem g hfT, hfa⟩
        · intro f hfL hfne
          rcases List.mem_cons.mp hfL with rfl | hfT
          · exact List.mem_cons_self ..
          · exact List.mem_cons_of_mem g (hM2 f hfT hfne)
        · rw [List.pairwise_cons]
          exact ⟨fun b hb => hgT b (hM1 b hb).1, hMpw⟩

/-- ★★★ THE LEDGER IDENTITY SKELETON: a complete duplicate-free box of
    disc D with principal occupant pf counts 1 + the a ≥ 2 slots. -/
theorem ledger_identity_skeleton {D : Z} {pf : BQF} {L : List BQF}
    (hpw : List.Pairwise (· ≠ ·) L)
    (hmem : ∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = D)
    (hpfL : pf ∈ L) (hpfa : pf.a = 1) :
    ∃ M : List BQF,
      (∀ f ∈ M, Reduced f ∧ PosDef f ∧ disc f = D ∧ f.a ≠ 1) ∧
      (∀ f ∈ L, f ≠ pf → f ∈ M) ∧
      List.Pairwise (· ≠ ·) M ∧
      L.length = 1 + M.length := by
  obtain ⟨hpfr, hpfpos, hpfd⟩ := hmem pf hpfL
  have hone : ∀ f ∈ L, f.a = 1 → f = pf := by
    intro f hf ha
    obtain ⟨hfr, hfpos, hfd⟩ := hmem f hf
    exact principal_slot_unique hfr hpfr (by rw [hfd, hpfd]) ha hpfa
  obtain ⟨M, hM1, hM2, hMpw, hMlen⟩ := ledger_partition hpw hpfL hone
  refine ⟨M, ?_, hM2, hMpw, hMlen⟩
  intro f hf
  obtain ⟨hfL, hfa⟩ := hM1 f hf
  obtain ⟨hr, hp, hd⟩ := hmem f hfL
  exact ⟨hr, hp, hd, hfa⟩


#print axioms principal_slot_exists_odd
#print axioms principal_slot_exists_even
#print axioms principal_slot_unique
#print axioms ledger_partition
#print axioms ledger_identity_skeleton

end BQF
end GaussForms
end Phys.Foundation
