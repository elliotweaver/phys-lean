/-
  # THE FLOOR LAW — distinct seeds count into the class number (GQ L3)

  ## What this file proves (INVERSE-ENGINE port, production node)

  The early jaw's counting weld: with seed_slot (N619), deep principal
  contact is priced DIRECTLY into h(D):
      h(D) ≥ 1 + #{distinct primes p : 4p² ≤ |D|, p | some P(x)}.

  * `eraseOne_pairwise` — duplicate-freedom survives erasure.
  * `sublist_distinct_length` — ★ THE INJECTION COUNT: a duplicate-free
    list inside a duplicate-free list is no longer (induction through the
    banked eraseOne kit).
  * `floor_law` — ★★★ THE FLOOR LAW: k distinct slot-occupying primes
    force L.length ≥ 1 + k on any complete duplicate-free box — the
    classical pick map selects one form per prime; distinctness rides on
    a-values; non-principality on a ≥ 2 vs pf.a = 1; the count lands
    through ledger_identity_skeleton's partition.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussSeedLaw

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- eraseOne preserves pairwise-distinctness. -/
theorem eraseOne_pairwise {y : BQF} : ∀ {l : List BQF},
    List.Pairwise (· ≠ ·) l → List.Pairwise (· ≠ ·) (eraseOne y l) := by
  intro l
  induction l with
  | nil => intro _; rw [eraseOne]; exact List.Pairwise.nil
  | cons z zs ih =>
      intro hpw
      rw [List.pairwise_cons] at hpw
      obtain ⟨hz, hzs⟩ := hpw
      by_cases hzy : z = y
      · rw [eraseOne, if_pos hzy]
        exact hzs
      · rw [eraseOne, if_neg hzy, List.pairwise_cons]
        exact ⟨fun b hb => hz b (eraseOne_sub hb), ih hzs⟩

/-- ★ THE INJECTION COUNT: duplicate-free T inside duplicate-free M is
    no longer than M. -/
theorem sublist_distinct_length : ∀ {T M : List BQF},
    List.Pairwise (· ≠ ·) T → List.Pairwise (· ≠ ·) M →
    (∀ t ∈ T, t ∈ M) → T.length ≤ M.length := by
  intro T
  induction T with
  | nil => intro M _ _ _; exact Nat.zero_le _
  | cons t ts ih =>
      intro M hTpw hMpw hsub
      rw [List.pairwise_cons] at hTpw
      obtain ⟨hts, htspw⟩ := hTpw
      have htM : t ∈ M := hsub t (List.mem_cons_self ..)
      have hsub' : ∀ s ∈ ts, s ∈ eraseOne t M := by
        intro s hs
        refine mem_eraseOne_of_ne (hsub s (List.mem_cons_of_mem t hs)) ?_
        intro he
        exact (hts s hs) he.symm
      have hlen := ih htspw (eraseOne_pairwise hMpw) hsub'
      have hM := eraseOne_length htM
      show ts.length + 1 ≤ M.length
      omega

/-- ★★★ THE FLOOR LAW: k distinct slot-occupying primes force
    L.length ≥ 1 + k on any complete duplicate-free box. -/
theorem floor_law {D : Z} {pf : BQF} {L : List BQF} {ps : List Z}
    (hpw : List.Pairwise (· ≠ ·) L)
    (hmem : ∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = D)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f → disc f = D → f ∈ L)
    (hpfL : pf ∈ L) (hpfa : pf.a = 1)
    (hpspw : List.Pairwise (· ≠ ·) ps)
    (hp2 : ∀ p ∈ ps, (2 : Z) ≤ p)
    (hslots : ∀ p ∈ ps, ∃ f : BQF,
      Reduced f ∧ PosDef f ∧ disc f = D ∧ f.a = p) :
    1 + ps.length ≤ L.length := by
  obtain ⟨M, hM1, hM2, hMpw, hMlen⟩ :=
    ledger_identity_skeleton hpw hmem hpfL hpfa
  classical
  let pick : Z → BQF := fun p =>
    if h : ∃ f : BQF, Reduced f ∧ PosDef f ∧ disc f = D ∧ f.a = p
    then Classical.choose h else ⟨1, 0, 1⟩
  have hpick : ∀ p ∈ ps, Reduced (pick p) ∧ PosDef (pick p) ∧
      disc (pick p) = D ∧ (pick p).a = p := by
    intro p hp
    have h := hslots p hp
    simp only [pick, dif_pos h]
    exact Classical.choose_spec h
  have hTpw : List.Pairwise (· ≠ ·) (ps.map pick) := by
    rw [List.pairwise_map]
    refine List.Pairwise.imp_of_mem ?_ hpspw
    intro p q hpm hqm hne he
    have hpa := (hpick p hpm).2.2.2
    have hqa := (hpick q hqm).2.2.2
    rw [he] at hpa
    exact hne (hpa.symm.trans hqa)
  have hsub : ∀ t ∈ ps.map pick, t ∈ M := by
    intro t ht
    obtain ⟨p, hpm, rfl⟩ := List.mem_map.mp ht
    obtain ⟨hr, hpos, hd, ha⟩ := hpick p hpm
    have htL : pick p ∈ L := hcomplete _ hr hpos hd
    apply hM2 _ htL
    intro he
    have h2 := hp2 p hpm
    rw [he, hpfa] at ha
    linarith
  have hcount := sublist_distinct_length hTpw hMpw hsub
  rw [List.length_map] at hcount
  omega


#print axioms eraseOne_pairwise
#print axioms sublist_distinct_length
#print axioms floor_law

end BQF
end GaussForms
end Phys.Foundation
