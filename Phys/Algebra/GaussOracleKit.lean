/-
  # THE ORACLE KIT — fresh generator, swap supply, extraction (GQ N610a-b)

  ## What this file proves (GQ campaign, production node)

  The exchange oracle's discharge pipeline, pieces 1–3:

  * `fresh_generator` — ★ a span the sub-selection cannot reproduce MUST
    use a generator outside the sub-selection (classical extraction of
    the swap candidate; span_mono contradiction).
  * `swap_supply` — ★★ THE UNIVERSAL SWAP SUPPLY: primitive PosDef
    same-disc triples carry SwapData — built by the third bracketing of
    the triple gather (triple_concordant → miss_split pair-gathers →
    compRel_assoc_presented → the (a1a3, a2) pairing at the shared
    cofactor). This makes pull_to_head FIREABLE on the classes THE LAW
    ranges over.
  * `countOcc` / `removeAll` + kit — classical occurrence counting and
    removal (membership, length, notmem, eraseOne commutation in the
    Re-native step form).
  * `extract_all` — ★★ THE EXTRACTION: any ProdRel selection reorganizes
    as y^count ++ (y-free rest), same class — fuel induction, one
    pull_to_head per step, the count/removeAll identities aligning each
    rebuilt cons.

  ## Honest scope (ledger-mirrored)
  Pieces 4–5 of the discharge (the invertible/p-divisible case split at
  the extracted head block, and the oracle assembly upgrading THE_LAW to
  its unconditional form) are the successor node's obligation — claimed
  nowhere here.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussLawStatement

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- ★ THE FRESH GENERATOR: an un-sub-reproducible span uses a generator
    outside the sub-selection. -/
theorem fresh_generator {p : Re} {x : BQF} {ys sub : List BQF}
    (hspan : PSpanned p ys x) (hnsub : ¬ PSpanned p sub x) :
    ∃ sel : List BQF, (∀ s ∈ sel, s ∈ ys) ∧
      (∃ h : BQF, ProdRel sel h ∧ CapturedBy p x h) ∧
      ∃ y ∈ sel, y ∉ sub := by
  obtain ⟨sel, hsel, h, hp, hcap⟩ := hspan
  refine ⟨sel, hsel, ⟨h, hp, hcap⟩, ?_⟩
  by_contra hall
  push_neg at hall
  exact hnsub ⟨sel, fun s hs => hall s hs, h, hp, hcap⟩

/-- ★★ THE UNIVERSAL SWAP SUPPLY: primitive PosDef same-disc triples
    carry SwapData — the two bracketings of a∘b∘R on one triple gather. -/
theorem swap_supply {a b R : BQF}
    (hap : Primitive a) (hbp : Primitive b)
    (hapos : PosDef a) (hbpos : PosDef b) (hRpos : PosDef R)
    (hD : disc R < 0)
    (hdab : disc R = disc a) (hdRb : disc R = disc b) :
    ∃ sd : SwapData a b R, True := by
  -- triple concordant on (R, b, a): f1 := R, f2 := b, f3 := a
  obtain ⟨a1, a2, a3, B, t, g1, g2, g3, ha1ne, ha2ne, ha3ne,
    hcop12, hcop13, hcop23, hg1, hg2, hg3, hge1, hge2, hge3⟩ :=
    triple_concordant (f1 := R) (f2 := b) (f3 := a)
      hbp hap hRpos hbpos hapos hD hdRb hdab
  subst hge1
  subst hge2
  subst hge3
  -- presented positivity for miss products
  have hp1 := chain_posdef hg1 hRpos hD
  have hp2 := chain_posdef hg2 hbpos (by rw [← hdRb]; exact hD)
  have hp3 := chain_posdef hg3 hapos (by rw [← hdab]; exact hD)
  have ha1pos : 0 < a1 := hp1.1
  have ha2pos : 0 < a2 := hp2.1
  have ha3pos : 0 < a3 := hp3.1
  have hne123 : a1 * a2 * a3 ≠ 0 :=
    ne_of_gt (mul_pos (mul_pos ha1pos ha2pos) ha3pos)
  -- the two bracketings of the triple gather
  obtain ⟨al12, be12, h12⟩ :=
    id (coprime_symm (coprime_mul (coprime_symm hcop13) (coprime_symm hcop23)))
  obtain ⟨al3, be3, h23⟩ := id (coprime_mul hcop12 hcop13)
  obtain ⟨hbrL, hbrR, hTeq⟩ := compRel_assoc_presented
    (B := B) (t := t) h12 h23 hne123
  rw [← hTeq] at hbrR
  set T := gatherForm (a1 * a2) a3 B t with hTdef
  -- bR := the (b, R) pair-gather = (a1a2)-gather: b∘R lands there
  obtain ⟨al', be', hb12⟩ := id hcop12
  have hne12 : a1 * a2 ≠ 0 := ne_of_gt (mul_pos ha1pos ha2pos)
  have hms12 := miss_split (b := B) (c := a3 * t) hb12 hne12
  have em1 : (⟨a1, B, (a2 * a3) * t⟩ : BQF) = ⟨a1, B, a2 * (a3 * t)⟩ := by
    rw [mul_assoc]
  have em2 : (⟨a2, B, (a1 * a3) * t⟩ : BQF) = ⟨a2, B, a1 * (a3 * t)⟩ := by
    rw [mul_assoc]
  have hg1' := em1 ▸ hg1
  have hg2' := em2 ▸ hg2
  -- CompRel b R bR (transport branches back to b, R)
  have hbR : CompRel b R (⟨a1 * a2, B, a3 * t⟩ : BQF) := by
    have h := compRel_congr (chainSymm hg2') (chainSymm hg1') (Chain.refl _)
      (compRel_comm hms12)
    exact h
  -- aR := the (a, R) pair-gather = (a1a3)-gather
  obtain ⟨al'', be'', hb13⟩ := id hcop13
  have hne13 : a1 * a3 ≠ 0 := ne_of_gt (mul_pos ha1pos ha3pos)
  have hms13 := miss_split (b := B) (c := a2 * t) hb13 hne13
  have em3 : (⟨a1, B, (a2 * a3) * t⟩ : BQF) = ⟨a1, B, a3 * (a2 * t)⟩ := by
    rw [show ((a2 * a3) * t : Z) = a3 * (a2 * t) from by ring]
  have em4 : (⟨a3, B, (a1 * a2) * t⟩ : BQF) = ⟨a3, B, a1 * (a2 * t)⟩ := by
    rw [show ((a1 * a2) * t : Z) = a1 * (a2 * t) from by ring]
  have hg1'' := em3 ▸ hg1
  have hg3' := em4 ▸ hg3
  have haR : CompRel a R (⟨a1 * a3, B, a2 * t⟩ : BQF) := by
    have h := compRel_congr (chainSymm hg3') (chainSymm hg1'') (Chain.refl _)
      (compRel_comm hms13)
    exact h
  -- hT1 : CompRel a bR T — the LEFT bracketing (a1a2)∘a3 with a3 = a-branch
  have hT1 : CompRel a (⟨a1 * a2, B, a3 * t⟩ : BQF) T := by
    have h := compRel_congr (chainSymm hg3) (Chain.refl _) (Chain.refl _)
      (compRel_comm hbrL)
    exact h
  -- hT2 : CompRel b aR T — the third pairing (a1a3, a2) at cofactor t:
  have hcopA : Coprime (a1 * a3) a2 :=
    coprime_symm (coprime_mul (coprime_symm hcop12) hcop23)
  obtain ⟨alq, beq, hq⟩ := hcopA
  have hms_f := miss_split (b := B) (c := t) hq
    (ne_of_gt (mul_pos (mul_pos ha1pos ha3pos) ha2pos))
  have hT2 : CompRel b (⟨a1 * a3, B, a2 * t⟩ : BQF) T := by
    have hcomm := compRel_comm hms_f
    have hbb : Chain b (⟨a2, B, (a1 * a3) * t⟩ : BQF) := hg2
    have hmeq : (⟨(a1 * a3) * a2, B, t⟩ : BQF) = T := by
      rw [hTdef]
      show (⟨(a1 * a3) * a2, B, t⟩ : BQF) = gatherForm (a1 * a2) a3 B t
      show (⟨(a1 * a3) * a2, B, t⟩ : BQF) = ⟨(a1 * a2) * a3, B, t⟩
      have hring : (a1 * a3) * a2 = (a1 * a2) * a3 := by ring
      rw [hring]
    rw [hmeq] at hcomm
    exact compRel_congr (chainSymm hbb) (Chain.refl _) (Chain.refl _) hcomm
  exact ⟨⟨⟨a1 * a2, B, a3 * t⟩, hbR, ⟨a1 * a3, B, a2 * t⟩, haR, T, hT1, hT2⟩,
    trivial⟩


open Classical in
noncomputable def countOcc (y : BQF) : List BQF → Re
  | [] => Re.void
  | z :: zs => if z = y then Re.step (countOcc y zs) else countOcc y zs

open Classical in
noncomputable def removeAll (y : BQF) : List BQF → List BQF
  | [] => []
  | z :: zs => if z = y then removeAll y zs else z :: removeAll y zs

theorem removeAll_sub {y s : BQF} : ∀ {l : List BQF},
    s ∈ removeAll y l → s ∈ l ∧ s ≠ y := by
  intro l
  induction l with
  | nil =>
      intro h
      rw [removeAll] at h
      exact absurd h (List.not_mem_nil)
  | cons z zs ih =>
      intro h
      by_cases hz : z = y
      · rw [removeAll, if_pos hz] at h
        obtain ⟨hmem, hne⟩ := ih h
        exact ⟨List.mem_cons_of_mem z hmem, hne⟩
      · rw [removeAll, if_neg hz] at h
        rcases List.mem_cons.mp h with rfl | h2
        · exact ⟨List.mem_cons_self .., hz⟩
        · obtain ⟨hmem, hne⟩ := ih h2
          exact ⟨List.mem_cons_of_mem z hmem, hne⟩

theorem removeAll_len {y : BQF} : ∀ l : List BQF,
    (removeAll y l).length ≤ l.length := by
  intro l
  induction l with
  | nil =>
      exact Nat.le_refl _
  | cons z zs ih =>
      by_cases hz : z = y
      · rw [removeAll, if_pos hz]
        exact Nat.le_succ_of_le ih
      · rw [removeAll, if_neg hz]
        exact Nat.succ_le_succ ih

theorem removeAll_notmem {y : BQF} : ∀ {l : List BQF},
    y ∉ removeAll y l := by
  intro l hmem
  exact (removeAll_sub hmem).2 rfl

/-- eraseOne at a present member: removeAll preserved; count steps down. -/
theorem eraseOne_count {y : BQF} : ∀ {l : List BQF}, y ∈ l →
    removeAll y (eraseOne y l) = removeAll y l ∧
    Re.step (countOcc y (eraseOne y l)) = countOcc y l := by
  intro l
  induction l with
  | nil => intro h; exact absurd h (List.not_mem_nil)
  | cons z zs ih =>
      intro hmem
      by_cases hz : z = y
      · subst hz
        rw [eraseOne, if_pos rfl]
        refine ⟨?_, ?_⟩
        · rw [removeAll, if_pos rfl]
        · rw [countOcc, if_pos rfl]
      · have hy : y ∈ zs := by
          rcases List.mem_cons.mp hmem with rfl | h2
          · exact absurd rfl hz
          · exact h2
        obtain ⟨ih2, ih3⟩ := ih hy
        rw [eraseOne, if_neg hz]
        refine ⟨?_, ?_⟩
        · rw [removeAll, if_neg hz, removeAll, if_neg hz, ih2]
        · rw [countOcc, if_neg hz, countOcc, if_neg hz]
          exact ih3

theorem countOcc_zero_of_notmem {y : BQF} : ∀ {l : List BQF}, y ∉ l →
    countOcc y l = Re.void := by
  intro l
  induction l with
  | nil => intro _; rfl
  | cons z zs ih =>
      intro hy
      have hzy : z ≠ y := fun h' => hy (h' ▸ List.mem_cons_self ..)
      rw [countOcc, if_neg hzy]
      exact ih (fun hm => hy (List.mem_cons_of_mem z hm))

theorem removeAll_id_of_notmem {y : BQF} : ∀ {l : List BQF}, y ∉ l →
    removeAll y l = l := by
  intro l
  induction l with
  | nil => intro _; rfl
  | cons z zs ih =>
      intro hy
      have hzy : z ≠ y := fun h' => hy (h' ▸ List.mem_cons_self ..)
      rw [removeAll, if_neg hzy]
      rw [ih (fun hm => hy (List.mem_cons_of_mem z hm))]

/-- constList append step: y :: (constList y n ++ r) = constList y (n+1) ++ r. -/
theorem constList_cons_append (y : BQF) (n : Re) (r : List BQF) :
    y :: (constList y n ++ r) = constList y (Re.step n) ++ r := rfl

/-- ★★ THE EXTRACTION (fuel form): a selection reorganizes as
    y^count ++ (y-free rest), same class. -/
theorem extract_all (supplyU : ∀ (a b R : BQF), SwapData a b R) :
    ∀ (N : Nat) (sel : List BQF), sel.length ≤ N →
    ∀ {h y : BQF}, ProdRel sel h →
    ∃ h', ProdRel (constList y (countOcc y sel) ++ removeAll y sel) h' ∧
      Chain h h' := by
  intro N
  induction N with
  | zero =>
      intro sel hlen h y hp
      cases sel with
      | nil =>
          refine ⟨h, ?_, Chain.refl h⟩
          have h0 : countOcc y ([] : List BQF) = Re.void := rfl
          have h1 : removeAll y ([] : List BQF) = [] := rfl
          rw [h0, h1]
          exact hp
      | cons a rest => exact absurd hlen (Nat.not_succ_le_zero _)
  | succ N ih =>
      intro sel hlen h y hp
      by_cases hy : y ∈ sel
      · -- pull one y to the head, recurse on the erased tail
        obtain ⟨h1, hp1, hch1⟩ := pull_to_head supplyU hp hy
        -- hp1 : ProdRel (y :: eraseOne y sel) h1
        cases hp1 with
        | cons hpt hca =>
            -- hpt : ProdRel (eraseOne y sel) R; hca : CompRel y R h1
            have hlen' : (eraseOne y sel).length ≤ N := by
              have := eraseOne_length (l := sel) hy
              omega
            obtain ⟨h2, hp2, hch2⟩ := ih (eraseOne y sel) hlen' hpt
            -- rebuild the cons over the reorganized tail
            have hca' := compRel_congr (Chain.refl y) hch2 (Chain.refl _) hca
            obtain ⟨hc2, hc3⟩ := eraseOne_count hy
            refine ⟨h1, ?_, hch1⟩
            have hgoal : ProdRel
                (y :: (constList y (countOcc y (eraseOne y sel)) ++
                  removeAll y (eraseOne y sel))) h1 :=
              ProdRel.cons hp2 hca'
            rw [constList_cons_append, hc3, hc2] at hgoal
            exact hgoal
      · -- y absent: count 0, removeAll = sel (identity reorganization)
        refine ⟨h, ?_, Chain.refl h⟩
        rw [countOcc_zero_of_notmem hy, removeAll_id_of_notmem hy]
        exact hp


#print axioms fresh_generator
#print axioms swap_supply
#print axioms extract_all

end BQF
end GaussForms
end Phys.Foundation
