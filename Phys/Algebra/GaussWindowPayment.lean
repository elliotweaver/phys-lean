/-
  # THE WINDOW-PAYMENT INEQUALITY — deferral is priced (GQ SG-d/e/f)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The counting engine of the E_m theorem (seedcount(D) < m ⟹ D ∈ E_m
  finite — the uniform frontier's remaining summit):

  * `count_channel_partition` — the trichotomy realized as a counting
    identity (three channel tags partition any list's length).
  * `length_filter_split` / `filter_filter_le` — filter bookkeeping.
  * `seed_pigeonhole` — ★★★ THE HARVEST: > |ps|·K values assigned into
    ps force a prime carrying > K.
  * `eraseOneN` kit + `distinct_inject_length` — the N620 injection
    machinery on Nat.
  * `apList` kit + `ap_class_bound` — ★★ THE AP CEILING: distinct hits
    below W in one residue class mod p number ≤ W/p + 1.
  * `two_class_bound` — ★★ two root classes per prime (root_pair's
    shape) ⟹ ≤ 2·(W/p + 1) hits.
  * `window_payment` — ★★★ THE PRICE LIST: distinct window positions
    all seeded from ps (two classes each) number ≤ Σ_{p∈ps} 2(W/p+1).
    Deferral (|ps| < m, p ≥ 3) caps the seeded window at an explicit
    threshold — past it, a new deep seed is FORCED. The multiplicative
    crush as one inequality chain.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussValueTrichotomy

namespace Phys.Foundation
namespace GaussForms
namespace BQF

/-- Channel tags partition the count: each element carries exactly one
    of three tags, so the tag-counts sum to the length. -/
theorem count_channel_partition {α : Type} (l : List α)
    (f : α → Fin 3) :
    l.countP (fun a => f a = 0) + l.countP (fun a => f a = 1) +
      l.countP (fun a => f a = 2) = l.length := by
  induction l with
  | nil => rfl
  | cons x t ih =>
      simp only [List.countP_cons, List.length_cons]
      by_cases h0 : f x = 0
      · simp [h0]; omega
      · by_cases h1 : f x = 1
        · simp [h0, h1]; omega
        · have h2 : f x = 2 := by omega
          simp [h0, h1, h2]; omega

/-- Filtered length is monotone under sub-filtering: filtering a filtered
    list is no longer than filtering the original. -/
theorem filter_filter_le {α : Type} (l : List α)
    (pb qb : α → Bool) :
    ((l.filter qb).filter pb).length ≤ (l.filter pb).length := by
  induction l with
  | nil => simp
  | cons x t ih =>
      by_cases hq : qb x = true
      · by_cases hp : pb x = true
        · simp only [List.filter_cons, hq, hp, if_true, List.length_cons]
          omega
        · have hp' : pb x = false := by
            revert hp; cases pb x <;> simp
          simp only [List.filter_cons, hq, hp', if_true, Bool.false_eq_true,
            if_false]
          exact ih
      · have hq' : qb x = false := by
          revert hq; cases qb x <;> simp
        by_cases hp : pb x = true
        · simp only [List.filter_cons, hq', hp, Bool.false_eq_true,
            if_false, if_true, List.length_cons]
          omega
        · have hp' : pb x = false := by
            revert hp; cases pb x <;> simp
          simp only [List.filter_cons, hq', hp', Bool.false_eq_true,
            if_false]
          exact ih

/-- A Bool filter and its negation split the length. -/
theorem length_filter_split {α : Type} (l : List α) (pb : α → Bool) :
    l.length = (l.filter pb).length +
               (l.filter (fun v => !pb v)).length := by
  induction l with
  | nil => rfl
  | cons w ws ihw =>
      cases hw : pb w <;>
        simp only [List.filter_cons, hw, Bool.not_true, Bool.not_false,
          Bool.false_eq_true, if_false, if_true, List.length_cons] <;>
        omega

/-- Erase one occurrence (Nat lists). -/
def eraseOneN (y : Nat) : List Nat → List Nat
  | [] => []
  | z :: zs => if z = y then zs else z :: eraseOneN y zs

theorem eraseOneN_length {y : Nat} : ∀ {l : List Nat}, y ∈ l →
    (eraseOneN y l).length + 1 = l.length := by
  intro l
  induction l with
  | nil => intro h; exact absurd h List.not_mem_nil
  | cons z zs ih =>
      intro hy
      by_cases hz : z = y
      · rw [eraseOneN, if_pos hz]; rfl
      · rw [eraseOneN, if_neg hz]
        have hy' : y ∈ zs := by
          rcases List.mem_cons.mp hy with h | h
          · exact absurd h.symm hz
          · exact h
        simp only [List.length_cons]
        rw [← ih hy']

theorem mem_eraseOneN {y w : Nat} : ∀ {l : List Nat},
    w ∈ l → w ≠ y → w ∈ eraseOneN y l := by
  intro l
  induction l with
  | nil => intro h _; exact absurd h List.not_mem_nil
  | cons z zs ih =>
      intro hw hne
      by_cases hz : z = y
      · rw [eraseOneN, if_pos hz]
        rcases List.mem_cons.mp hw with h | h
        · exact absurd (h.trans hz) hne
        · exact h
      · rw [eraseOneN, if_neg hz]
        rcases List.mem_cons.mp hw with h | h
        · exact h ▸ List.mem_cons_self ..
        · exact List.mem_cons_of_mem z (ih h hne)

theorem eraseOneN_pairwise {y : Nat} : ∀ {l : List Nat},
    List.Pairwise (· ≠ ·) l → List.Pairwise (· ≠ ·) (eraseOneN y l) := by
  intro l
  induction l with
  | nil => intro _; rw [eraseOneN]; exact List.Pairwise.nil
  | cons z zs ih =>
      intro hpw
      obtain ⟨hz, hzs⟩ := List.pairwise_cons.mp hpw
      by_cases hzy : z = y
      · rw [eraseOneN, if_pos hzy]; exact hzs
      · rw [eraseOneN, if_neg hzy]
        refine List.pairwise_cons.mpr ⟨?_, ih hzs⟩
        intro b hb
        -- b ∈ eraseOneN y zs ⟹ b ∈ zs
        have : ∀ {m : List Nat}, b ∈ eraseOneN y m → b ∈ m := by
          intro m
          induction m with
          | nil => intro h; rw [eraseOneN] at h; exact h
          | cons c cs ihc =>
              intro h
              by_cases hc : c = y
              · rw [eraseOneN, if_pos hc] at h
                exact List.mem_cons_of_mem c h
              · rw [eraseOneN, if_neg hc] at h
                rcases List.mem_cons.mp h with h' | h'
                · exact h' ▸ List.mem_cons_self ..
                · exact List.mem_cons_of_mem c (ihc h')
        exact hz b (this hb)

/-- ★ Distinct list injecting into a distinct list is no longer. -/
theorem distinct_inject_length : ∀ {T M : List Nat},
    List.Pairwise (· ≠ ·) T → List.Pairwise (· ≠ ·) M →
    (∀ t ∈ T, t ∈ M) → T.length ≤ M.length := by
  intro T
  induction T with
  | nil => intro M _ _ _; simp
  | cons t ts ih =>
      intro M hT hM hsub
      obtain ⟨ht, hts⟩ := List.pairwise_cons.mp hT
      have htM : t ∈ M := hsub t (List.mem_cons_self ..)
      have hsub' : ∀ s ∈ ts, s ∈ eraseOneN t M := by
        intro s hs
        refine mem_eraseOneN (hsub s (List.mem_cons_of_mem t hs)) ?_
        intro h
        exact (ht s hs) h.symm
      have hrec := ih hts (eraseOneN_pairwise hM) hsub'
      have hlen := eraseOneN_length htM
      simp only [List.length_cons]
      omega

/-- The AP master list r, r+p, ..., r+k·p. -/
def apList (p r k : Nat) : List Nat :=
  (List.range (k + 1)).map (fun i => r + i * p)

theorem apList_length {p r k : Nat} : (apList p r k).length = k + 1 := by
  rw [apList, List.length_map, List.length_range]

theorem apList_pairwise {p r k : Nat} (hp : 1 ≤ p) :
    List.Pairwise (· ≠ ·) (apList p r k) := by
  rw [apList, List.pairwise_map]
  have hlt : List.Pairwise (· < ·) (List.range (k + 1)) :=
    List.pairwise_lt_range
  refine hlt.imp ?_
  intro a b hab
  intro h
  have hmul : a * p < b * p := (Nat.mul_lt_mul_right hp).mpr hab
  omega

/-- ★★ Membership: every x < W with x % p = r (r < p) lies in
    apList p r (W / p). -/
theorem mem_apList {p r W x : Nat} (hp : 1 ≤ p) (hr : r < p)
    (hx : x < W) (hxr : x % p = r) :
    x ∈ apList p r (W / p) := by
  rw [apList, List.mem_map]
  refine ⟨x / p, ?_, ?_⟩
  · rw [List.mem_range]
    have h1 : x / p ≤ W / p := Nat.div_le_div_right (le_of_lt hx)
    omega
  · have hdm := Nat.div_add_mod x p
    rw [hxr] at hdm
    -- hdm : p * (x / p) + r = x ; goal : r + (x / p) * p = x
    have : p * (x / p) = (x / p) * p := Nat.mul_comm ..
    omega

/-- ★★★ THE AP CEILING: pairwise-distinct hits below W in residue class
    r mod p (r < p) number at most W/p + 1. -/
theorem ap_class_bound {p r W : Nat} (hp : 1 ≤ p) (hr : r < p)
    (l : List Nat) (hpw : List.Pairwise (· ≠ ·) l)
    (hmem : ∀ x ∈ l, x < W ∧ x % p = r) :
    l.length ≤ W / p + 1 := by
  have hsub : ∀ x ∈ l, x ∈ apList p r (W / p) := by
    intro x hx
    exact mem_apList hp hr (hmem x hx).1 (hmem x hx).2
  have := distinct_inject_length hpw (apList_pairwise hp) hsub
  rwa [apList_length] at this


/-- Per-prime cap: distinct hits below W in TWO residue classes mod p
    number at most 2·(W/p + 1). -/
theorem two_class_bound {p r1 r2 W : Nat} (hp : 1 ≤ p)
    (hr1 : r1 < p) (hr2 : r2 < p)
    (l : List Nat) (hpw : List.Pairwise (· ≠ ·) l)
    (hmem : ∀ x ∈ l, x < W ∧ (x % p = r1 ∨ x % p = r2)) :
    l.length ≤ 2 * (W / p + 1) := by
  have hsplit := length_filter_split l (fun x => decide (x % p = r1))
  have h1 : (l.filter (fun x => decide (x % p = r1))).length ≤ W / p + 1 := by
    refine ap_class_bound hp hr1 _ ?_ ?_
    · exact hpw.sublist List.filter_sublist
    · intro x hx
      have hx' := List.mem_filter.mp hx
      exact ⟨(hmem x hx'.1).1, by simpa using hx'.2⟩
  have h2 : (l.filter (fun x => !(decide (x % p = r1)))).length ≤ W / p + 1 := by
    refine ap_class_bound hp hr2 _ ?_ ?_
    · exact hpw.sublist List.filter_sublist
    · intro x hx
      have hx' := List.mem_filter.mp hx
      have hnr1 : ¬ x % p = r1 := by simpa using hx'.2
      rcases (hmem x hx'.1).2 with h | h
      · exact absurd h hnr1
      · exact ⟨(hmem x hx'.1).1, h⟩
  omega

/-- ★★★ THE WINDOW-PAYMENT INEQUALITY: a distinct window list, every
    position seeded from ps, two root classes per prime, is priced at
    Σ_{p ∈ ps} 2·(W/p + 1). -/
theorem window_payment {W : Nat} :
    ∀ (ps : List Nat) (xs : List Nat) (assign : Nat → Nat)
      (r1 r2 : Nat → Nat),
    List.Pairwise (· ≠ ·) xs →
    (∀ x ∈ xs, x < W ∧ assign x ∈ ps ∧
      (x % assign x = r1 (assign x) ∨ x % assign x = r2 (assign x))) →
    (∀ p ∈ ps, 1 ≤ p ∧ r1 p < p ∧ r2 p < p) →
    xs.length ≤ (ps.map (fun p => 2 * (W / p + 1))).sum := by
  intro ps
  induction ps with
  | nil =>
      intro xs assign r1 r2 hpw hmem hps
      cases xs with
      | nil => simp
      | cons x t =>
          exact absurd (hmem x (List.mem_cons_self ..)).2.1 List.not_mem_nil
  | cons p rest ih =>
      intro xs assign r1 r2 hpw hmem hps
      obtain ⟨hp1, hr1, hr2⟩ := hps p (List.mem_cons_self ..)
      -- split xs by assignment to p
      have hsplit := length_filter_split xs
        (fun x => decide (assign x = p))
      set mine := xs.filter (fun x => decide (assign x = p)) with hmine
      set rest_xs := xs.filter (fun x => !(decide (assign x = p)))
        with hrest
      -- mine: two-class bound at p
      have hmine_le : mine.length ≤ 2 * (W / p + 1) := by
        refine two_class_bound hp1 hr1 hr2 _ ?_ ?_
        · rw [hmine]; exact hpw.sublist List.filter_sublist
        · intro x hx
          rw [hmine] at hx
          have hx' := List.mem_filter.mp hx
          have hxa : assign x = p := by simpa using hx'.2
          obtain ⟨hxW, _, hcls⟩ := hmem x hx'.1
          rw [hxa] at hcls
          exact ⟨hxW, hcls⟩
      -- rest: recurse
      have hrest_le : rest_xs.length ≤
          (rest.map (fun p => 2 * (W / p + 1))).sum := by
        refine ih rest_xs assign r1 r2 ?_ ?_ ?_
        · rw [hrest]; exact hpw.sublist List.filter_sublist
        · intro x hx
          rw [hrest] at hx
          have hx' := List.mem_filter.mp hx
          have hne : ¬ assign x = p := by simpa using hx'.2
          obtain ⟨hxW, hin, hcls⟩ := hmem x hx'.1
          rcases List.mem_cons.mp hin with heq | hm
          · exact absurd heq hne
          · exact ⟨hxW, hm, hcls⟩
        · intro q hq
          exact hps q (List.mem_cons_of_mem p hq)
      simp only [List.map_cons, List.sum_cons]
      omega

/-- ★★★ THE HARVEST (pigeonhole on assignments): if every value's
    assigned prime lies in ps and there are more than ps.length · K
    values, some prime in ps carries more than K values. -/
theorem seed_pigeonhole {α : Type} {K : Nat} :
    ∀ (ps : List Z) (vals : List α) (assign : α → Z),
    (∀ v ∈ vals, assign v ∈ ps) →
    ps.length * K < vals.length →
    ∃ p ∈ ps, K < (vals.filter (fun v => decide (assign v = p))).length := by
  intro ps
  induction ps with
  | nil =>
      intro vals assign hin hbig
      cases vals with
      | nil => simp at hbig
      | cons v t =>
          exact absurd (hin v (List.mem_cons_self ..)) List.not_mem_nil
  | cons p rest ih =>
      intro vals assign hin hbig
      by_cases hp : K < (vals.filter (fun v => decide (assign v = p))).length
      · exact ⟨p, List.mem_cons_self .., hp⟩
      · push_neg at hp
        -- the values NOT assigned to p all go into rest
        set tail := vals.filter (fun v => !(decide (assign v = p))) with htail
        have hsplit :
            vals.length =
              (vals.filter (fun v => decide (assign v = p))).length +
              tail.length := by
          rw [htail]
          exact length_filter_split vals (fun v => decide (assign v = p))
        have htin : ∀ v ∈ tail, assign v ∈ rest := by
          intro v hv
          have hv' := List.mem_filter.mp hv
          have hmem := hin v hv'.1
          rcases List.mem_cons.mp hmem with heq | hm
          · exfalso
            have h2 := hv'.2
            simp [heq] at h2
          · exact hm
        have hbig' : rest.length * K < tail.length := by
          have hle : vals.length ≤
              (vals.filter (fun v => decide (assign v = p))).length +
              tail.length := le_of_eq hsplit
          simp only [List.length_cons] at hbig
          have hexp : (rest.length + 1) * K = rest.length * K + K :=
            Nat.succ_mul rest.length K
          rw [hexp] at hbig
          omega
        obtain ⟨q, hq, hqcount⟩ := ih tail assign htin hbig'
        refine ⟨q, List.mem_cons_of_mem p hq, ?_⟩
        calc K < (tail.filter (fun v => decide (assign v = q))).length :=
              hqcount
          _ ≤ (vals.filter (fun v => decide (assign v = q))).length := by
              rw [htail]
              exact filter_filter_le vals _ _


#print axioms count_channel_partition
#print axioms seed_pigeonhole
#print axioms ap_class_bound
#print axioms window_payment

end BQF
end GaussForms
end Phys.Foundation
