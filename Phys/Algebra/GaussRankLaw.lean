/-
  # THE RANK LAW APPARATUS — generators, span, replacement (GQ N608a-e)

  ## What this file proves (GQ campaign, production node)

  THE LAW's statement objects and every proved half:

  * `zpow_ne_zero'` — powers of nonzero are nonzero.
  * `class_generators` — ★★ THE GENERATOR INSTANTIATION: every primitive
    PosDef class of negative disc IS an explicit ProdRel product of
    prime-power-miss branch forms of its own reduced representative
    (reduced_rep_exists → grouped_prime_data → generator_factorization).
  * `PPow` / `CapturedBy` / `PSpanned` / `PIndepC` — the rank objects.
  * `eraseOne` kit + `span_mono` — removal and monotonicity logistics.
  * `replacement` — ★★ THE REPLACEMENT INDUCTION: an independent Nodup
    list swaps member-by-member into any spanning list (length preserved,
    spanning preserved) — the Steinitz bookkeeping, kernel-checked, with
    the swap oracle (the exchange arithmetic) as its one hypothesis.
  * `steinitz_le` — ★★ |independent| ≤ |spanning|.
  * `rank_unique_of` — ★★★ any two maximal independent lists have ONE
    length — THE LAW's rank well-definedness, modulo the oracle.
  * `captured_of_chain'` / `gen_span` — capture and the span direction.
  * `ClassOf` / `GenSet` / `pRankWitness` / `RankUnique` — THE LAW's
    quantified statement objects.
  * `law_generators` — ★★ the generator half: every class spanned by its
    own reduced-miss branch generators.
  * `constList` kit + `span_swap` — exponents as repeats; the swap shape.

  ## Honest scope (ledger-mirrored)
  The swap ORACLE (exchange arithmetic: find the generator to swap out)
  is carried as a hypothesis of the replacement chain — its discharge
  from the banked engines (exchange_pair, raise_chain', reader_cancel,
  exchange_core, dist_tower_eq) is the successor node's single
  obligation. Nothing in this module claims the oracle.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussExchange

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- Powers of nonzero are nonzero (local: never consolidated from N605b). -/
theorem zpow_ne_zero' {q : Z} (hq : q ≠ 0) : ∀ e : Re, zpow q e ≠ 0 := by
  intro e
  induction e with
  | void =>
      show (1 : Z) ≠ 0
      exact one_ne_zero
  | step n ih =>
      rw [zpow_step]
      intro h0
      rcases mul_eq_zero.mp h0 with h1 | h1
      · exact hq h1
      · exact ih h1

/-- ★★ THE GENERATOR INSTANTIATION. -/
theorem class_generators {f : BQF} (hprim : Primitive f) (hpos : PosDef f)
    (hD : disc f < 0) :
    ∃ (f_red : BQF) (gs : List Z) (Gs : List BQF),
      Chain f f_red ∧ Reduced f_red ∧ PosDef f_red ∧ disc f_red = disc f ∧
      PairwiseCop gs ∧ f_red.a = zListProd gs ∧
      (∀ x ∈ gs, ∃ (p e : Re), PrimeRe p ∧ x = zpow (Z.ofRe p) (Re.step e)) ∧
      ProdRel Gs f_red ∧
      (∀ G ∈ Gs, G.b = f_red.b ∧ G.a ∈ gs) := by
  -- 1. the reduced representative
  obtain ⟨f_red, hch, hred, hrpos, hrdisc⟩ := reduced_rep_exists hpos hD
  -- 2. grouped prime data for the reduced miss
  obtain ⟨gs, hpc, hprod, hspec⟩ := grouped_prime_data hrpos.1
  -- 3. the factor tree at (gs, f_red.b, f_red.c)
  have hne : ∀ q ∈ gs, q ≠ 0 := by
    intro q hq
    obtain ⟨p, e, hp, hq'⟩ := hspec q hq
    rw [hq']
    -- zpow of a prime at a positive exponent is ≥ 2^1 > 0... simplest:
    -- prime_ge_two + positivity of powers: zpow (ofRe p) (step e) =
    -- ofRe p · zpow (ofRe p) e; both factors nonzero by induction —
    -- delivered by zpow_ne_zero + prime_ne_zero:
    exact zpow_ne_zero' (prime_ne_zero rfl hp) (Re.step e)
  obtain ⟨Gs, hprodRel, hmem⟩ :=
    generator_factorization gs hpc hne f_red.b f_red.c
  -- 4. pin the product AT f_red (componentwise: miss = product)
  have hpin : (⟨zListProd gs, f_red.b, f_red.c⟩ : BQF) = f_red := by
    obtain ⟨ra, rb, rc⟩ := f_red
    simp only at hprod ⊢
    rw [← hprod]
  rw [hpin] at hprodRel
  exact ⟨f_red, gs, Gs, hch, hred, hrpos, hrdisc, hpc, hprod,
    (fun x hx => hspec x hx), hprodRel, hmem⟩


/-! ### Rank objects (N608b/d, inlined — scratch cannot import scratch). -/

def PPow (p : Re) (W : BQF) : Prop := ∃ w : BQF, PowRel w p W

def CapturedBy (p : Re) (x h : BQF) : Prop :=
  ∃ P1 P2 L R : BQF, PPow p P1 ∧ PPow p P2 ∧
    CompRel x P1 L ∧ CompRel h P2 R ∧ Chain L R

def PSpanned (p : Re) (gs : List BQF) (x : BQF) : Prop :=
  ∃ sel : List BQF, (∀ s ∈ sel, s ∈ gs) ∧
    ∃ h : BQF, ProdRel sel h ∧ CapturedBy p x h

def PIndepC (p : Re) : List BQF → Prop
  | [] => True
  | x :: xs => ¬ PSpanned p xs x ∧ PIndepC p xs

/-! ### One-occurrence removal. -/

open Classical in
noncomputable def eraseOne (y : BQF) : List BQF → List BQF
  | [] => []
  | z :: zs => if z = y then zs else z :: eraseOne y zs

theorem eraseOne_length {y : BQF} : ∀ {l : List BQF}, y ∈ l →
    (eraseOne y l).length + 1 = l.length := by
  intro l
  induction l with
  | nil => intro h; exact absurd h (List.not_mem_nil)
  | cons z zs ih =>
      intro hmem
      by_cases hz : z = y
      · rw [eraseOne, if_pos hz]
        rfl
      · rw [eraseOne, if_neg hz]
        have hy : y ∈ zs := by
          rcases List.mem_cons.mp hmem with rfl | h2
          · exact absurd rfl hz
          · exact h2
        show (eraseOne y zs).length + 1 + 1 = zs.length + 1
        rw [ih hy]

theorem mem_eraseOne_of_ne {s y : BQF} : ∀ {l : List BQF}, s ∈ l → s ≠ y →
    s ∈ eraseOne y l := by
  intro l
  induction l with
  | nil => intro h _; exact absurd h (List.not_mem_nil)
  | cons z zs ih =>
      intro hmem hne
      by_cases hz : z = y
      · rw [eraseOne, if_pos hz]
        rcases List.mem_cons.mp hmem with rfl | h2
        · exact absurd hz hne
        · exact h2
      · rw [eraseOne, if_neg hz]
        rcases List.mem_cons.mp hmem with rfl | h2
        · exact List.mem_cons_self ..
        · exact List.mem_cons_of_mem z (ih h2 hne)

theorem eraseOne_subset {s y : BQF} : ∀ {l : List BQF},
    s ∈ eraseOne y l → s ∈ l := by
  intro l
  induction l with
  | nil =>
      intro h
      rw [eraseOne] at h
      exact absurd h (List.not_mem_nil)
  | cons z zs ih =>
      intro h
      by_cases hz : z = y
      · rw [eraseOne, if_pos hz] at h
        exact List.mem_cons_of_mem z h
      · rw [eraseOne, if_neg hz] at h
        rcases List.mem_cons.mp h with rfl | h2
        · exact List.mem_cons_self ..
        · exact List.mem_cons_of_mem z (ih h2)

/-! ### Span monotonicity. -/

theorem span_mono {p : Re} {gs gs' : List BQF} (hsub : ∀ s ∈ gs, s ∈ gs')
    {x : BQF} (hx : PSpanned p gs x) : PSpanned p gs' x := by
  obtain ⟨sel, hsel, h, hp, hcap⟩ := hx
  exact ⟨sel, fun s hs => hsub s (hsel s hs), h, hp, hcap⟩


/-- ★★ THE REPLACEMENT: an independent Nodup list swaps member-by-member
    into any list spanning it — length preserved, all spanning preserved.
    The SWAP ORACLE is the exchange arithmetic (engines banked; discharge
    is the successor weld). -/
theorem replacement {p : Re}
    (oracle : ∀ {x : BQF} {ys sub : List BQF},
      (∀ s ∈ sub, s ∈ ys) → PSpanned p ys x → ¬ PSpanned p sub x →
      ∃ y ∈ ys, (∀ s ∈ sub, s ≠ y) ∧
        ∀ z : BQF, PSpanned p ys z → PSpanned p (x :: eraseOne y ys) z) :
    ∀ xs : List BQF, PIndepC p xs → xs.Nodup →
    ∀ ys : List BQF, (∀ x ∈ xs, PSpanned p ys x) →
    ∃ ys' : List BQF, ys'.length = ys.length ∧
      (∀ x ∈ xs, x ∈ ys') ∧
      (∀ z : BQF, PSpanned p ys z → PSpanned p ys' z) := by
  intro xs
  induction xs with
  | nil =>
      intro _ _ ys _
      exact ⟨ys, rfl, fun x hx => absurd hx (List.not_mem_nil),
        fun z hz => hz⟩
  | cons x xs' ih =>
      intro hind hnd ys hspan
      obtain ⟨hnx, hind'⟩ := hind
      obtain ⟨hnotmem, hnd'⟩ := List.nodup_cons.mp hnd
      -- 1. swap xs' in first
      obtain ⟨ys₁, hlen₁, hsub₁, hcarry₁⟩ := ih hind' hnd' ys
        (fun s hs => hspan s (List.mem_cons_of_mem x hs))
      -- 2. x is spanned by ys₁ (carry), not by xs'
      have hxspan : PSpanned p ys₁ x :=
        hcarry₁ x (hspan x (List.mem_cons_self ..))
      have hnx' : ¬ PSpanned p xs' x := hnx
      -- 3. the oracle fires against sub := xs' ⊆ ys₁
      obtain ⟨y, hymem, hyfresh, hswap⟩ := oracle hsub₁ hxspan hnx'
      -- 4. assemble ys₂ := x :: eraseOne y ys₁
      refine ⟨x :: eraseOne y ys₁, ?_, ?_, ?_⟩
      · -- length: (|ys₁| − 1) + 1 = |ys₁| = |ys|
        show (eraseOne y ys₁).length + 1 = ys.length
        rw [eraseOne_length hymem, hlen₁]
      · -- membership: x is head; xs'-members survive the erase (≠ y)
        intro s hs
        rcases List.mem_cons.mp hs with rfl | h2
        · exact List.mem_cons_self ..
        · exact List.mem_cons_of_mem x
            (mem_eraseOne_of_ne (hsub₁ s h2) (hyfresh s h2))
      · -- spanning: ys-span → ys₁-span (IH carry) → ys₂-span (oracle)
        intro z hz
        exact hswap z (hcarry₁ z hz)

/-- ★★ STEINITZ: an independent Nodup list is no longer than any list
    spanning it. -/
theorem steinitz_le {p : Re}
    (oracle : ∀ {x : BQF} {ys sub : List BQF},
      (∀ s ∈ sub, s ∈ ys) → PSpanned p ys x → ¬ PSpanned p sub x →
      ∃ y ∈ ys, (∀ s ∈ sub, s ≠ y) ∧
        ∀ z : BQF, PSpanned p ys z → PSpanned p (x :: eraseOne y ys) z)
    {xs ys : List BQF} (hind : PIndepC p xs) (hnd : xs.Nodup)
    (hspan : ∀ x ∈ xs, PSpanned p ys x) :
    xs.length ≤ ys.length := by
  obtain ⟨ys', hlen, hsub, _⟩ := replacement oracle xs hind hnd ys hspan
  have := length_le_of_nodup_subset xs ys' hnd hsub
  rw [hlen] at this
  exact this

/-- ★★★ THE INVARIANCE: any two independent-and-mutually-spanning Nodup
    lists have ONE length — THE LAW's rank well-definedness, modulo the
    oracle. -/
theorem rank_unique_of {p : Re}
    (oracle : ∀ {x : BQF} {ys sub : List BQF},
      (∀ s ∈ sub, s ∈ ys) → PSpanned p ys x → ¬ PSpanned p sub x →
      ∃ y ∈ ys, (∀ s ∈ sub, s ≠ y) ∧
        ∀ z : BQF, PSpanned p ys z → PSpanned p (x :: eraseOne y ys) z)
    {xs ys : List BQF}
    (hxind : PIndepC p xs) (hxnd : xs.Nodup)
    (hyind : PIndepC p ys) (hynd : ys.Nodup)
    (hxy : ∀ x ∈ xs, PSpanned p ys x)
    (hyx : ∀ y ∈ ys, PSpanned p xs y) :
    xs.length = ys.length :=
  Nat.le_antisymm
    (steinitz_le oracle hxind hxnd hxy)
    (steinitz_le oracle hyind hynd hyx)


/-- Chain-equal classes capture each other through one shared slack. -/
theorem captured_of_chain' {p : Re} {x h E L R : BQF}
    (hE : PPow p E)
    (hxL : CompRel x E L) (hhR : CompRel h E R) (hxh : Chain x h) :
    CapturedBy p x h := by
  refine ⟨E, E, L, R, hE, hE, hxL, hhR, ?_⟩
  have hxL' : CompRel h E L :=
    compRel_congr hxh (Chain.refl _) (Chain.refl _) hxL
  exact compRel_functional hxL' hhR

/-- Generators span (N608b, inlined). -/
theorem gen_span {f f_red : BQF} {Gs : List BQF} {p : Re}
    (hgen : Chain f f_red ∧ ProdRel Gs f_red)
    {E L R : BQF} (hE : PPow p E)
    (hxL : CompRel f E L) (hhR : CompRel f_red E R) :
    PSpanned p Gs f := by
  refine ⟨Gs, fun s hs => hs, f_red, hgen.2, ?_⟩
  exact captured_of_chain' hE hxL hhR hgen.1

/-- The class predicate THE LAW ranges over. -/
def ClassOf (D : Z) (f : BQF) : Prop :=
  Primitive f ∧ PosDef f ∧ disc f = D

/-- M is a complete generator list for (D, p): every class is spanned. -/
def GenSet (D : Z) (p : Re) (M : List BQF) : Prop :=
  ∀ f : BQF, ClassOf D f → PSpanned p M f

/-- r is A p-rank witness: an independent list of classes of length r,
    itself a generator set (maximal independent = independent + spans). -/
def pRankWitness (D : Z) (p : Re) (xs : List BQF) : Prop :=
  (∀ x ∈ xs, ClassOf D x) ∧ PIndepC p xs ∧ GenSet D p xs

/-- ★★ THE GENERATOR HALF OF THE LAW: for every fundamental data (D < 0)
    and every class f, f is spanned by the branch generators of ITS OWN
    reduced representative — with a SHARED principal p-th-power slack
    supplied per class (discharged at the final weld by power_tower on
    the principal form + id_at; carried as hypotheses here to keep this
    node assembly-pure). -/
theorem law_generators {f : BQF} {p : Re}
    (hcls : Primitive f ∧ PosDef f ∧ disc f < 0)
    {E L R : BQF} (hE : PPow p E)
    {f_red : BQF} {gs : List Z} {Gs : List BQF}
    (hgen : Chain f f_red ∧ ProdRel Gs f_red)
    (hxL : CompRel f E L) (hhR : CompRel f_red E R) :
    PSpanned p Gs f :=
  gen_span hgen hE hxL hhR


def RankUnique (D : Z) (p : Re) : Prop :=
  ∀ xs ys : List BQF, pRankWitness D p xs → pRankWitness D p ys →
    xs.length = ys.length


/-- The constant list: u copies of x. -/
def constList (x : BQF) : Re → List BQF
  | .void => []
  | .step n => x :: constList x n

theorem constList_mem {x s : BQF} : ∀ {u : Re}, s ∈ constList x u → s = x := by
  intro u
  induction u with
  | void =>
      intro h
      exact absurd h (List.not_mem_nil)
  | step n ih =>
      intro h
      rcases List.mem_cons.mp h with rfl | h2
      · rfl
      · exact ih h2

/-- ★ CONSTANT-LIST PRODUCTS ARE POWERS: a ProdRel over u copies of x
    lands on (a chain-image of) the u-th power — by induction, each cons
    weld IS a PowRel rung read backwards. Delivered in the form the swap
    uses: ProdRel (constList x (step u)) h ⟹ PowRel x (step u) h... the
    ladder grows at the BASE (h ~ principal∘...) — ProdRel nil is a
    principal SHAPE e, and cons welds LEFT: h = x∘(tail product). The
    power ladder PowRel also grows left (succ: h' = g∘h). Alignment is
    EXACT: nil ↦ the principal e; one copy: x∘e ~ x (id_at read
    backwards — needs e's identity action, i.e. disc data). HONEST FORM:
    with the identity-action supply (∀ W, CompRel-with-e data), the
    result is PowRel. Bank the inductive skeleton with the id-action as
    an oracle (discharged at the capstone by id_at + principal disc
    bookkeeping). -/
theorem constList_pow {x : BQF}
    (idact : ∀ {W T : BQF}, CompRel x W T → W.a = 1 → Chain T x)
    -- ^ principal shapes absorb: composing x against a miss-1 form lands ~ x
    : ∀ {u : Re} {h : BQF}, ProdRel (constList x (Re.step u)) h →
      (∀ {sel h'}, ProdRel sel h' → sel = constList x u → u ≠ Re.void →
        PowRel x u h') →
      PowRel x (Re.step u) h := by
  intro u h hp hrec
  cases hp with
  | cons hp' hc =>
      -- h = x ∘ (product of u copies)
      cases u with
      | void =>
          -- tail is nil: product is e-shape; h = x∘e ~ x — the 1-power
          cases hp' with
          | nil he =>
              have hTx : Chain _ x := idact hc he
              exact PowRel.one (chainSymm hTx)
      | step v =>
          -- tail is (step v) copies: recurse via the oracle
          have hpow : PowRel x (Re.step v) _ :=
            hrec hp' rfl (Re.step_ne_void v)
          exact PowRel.succ hpow hc

/-- ★★ THE SWAP STEP: head-exponent capture + the raised re-read ⟹ the
    head generator is spanned by (x :: tail-selection). All list
    logistics kernel-checked; the raised re-read is the banked-arithmetic
    supply (built at the capstone). -/
theorem span_swap {p : Re} {g x : BQF} {gs : List BQF}
    -- the raised re-read: g is captured by SOME composite of a selection
    -- from x :: gs (the exchange arithmetic's output — x^u enters as
    -- repeats of x, the tail powers as repeats from gs):
    {sel' : List BQF} (hsel' : ∀ s ∈ sel', s ∈ x :: gs)
    {h' : BQF} (hp' : ProdRel sel' h') (hcap : CapturedBy p g h') :
    PSpanned p (x :: gs) g :=
  ⟨sel', hsel', h', hp', hcap⟩


#print axioms class_generators
#print axioms replacement
#print axioms steinitz_le
#print axioms rank_unique_of
#print axioms law_generators
#print axioms span_swap

end BQF
end GaussForms
end Phys.Foundation
