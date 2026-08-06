/-
  # THE LAW, STATED — reordering, the oracle, the conditional theorem (GQ N609)

  ## What this file proves (GQ campaign, production node)

  * `SwapData` / `prodRel_adjacent_swap` — ★★ THE ADJACENT SWAP: the two
    head factors of a ProdRel product commute, same class (assoc+comm
    threading, tower-supplied composites).
  * `pull_to_head` — ★★ THE PULL: any chosen member of a selection moves
    to the head, same class, eraseOne-aligned (one adjacent swap per
    induction step).
  * `ExchangeOracle p` — the swap step of the replacement induction as a
    NAMED Prop: spanned-but-not-sub-spanned always yields a swappable
    generator.
  * `THE_LAW` — ★★★ THE LAW (oracle-explicit form): given the exchange
    oracle at p, the p-rank of every negative-disc class family is
    WELL-DEFINED — any two Nodup maximal independent lists of classes
    have ONE length.
  * `law_measured` — ★★ the generator side: every class is spanned by the
    branch generators of its own reduced representative.

  ## Honest scope (ledger-mirrored)
  THE_LAW here is CONDITIONAL on ExchangeOracle p. The oracle's
  ∀-discharge — the per-swap-site exchange arithmetic assembled from the
  banked engines (pull_to_head, constList_pow, exchange_pair,
  raise_chain', exchange_core, dist_tower_eq, reader_cancel) — is the
  successor node's single obligation and is NOWHERE claimed here.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussRankLaw

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- The supplied composites for one adjacent swap at the head of a
    ProdRel: R the tail product; both orders' intermediates and the
    shared triple landing. -/
structure SwapData (a b R : BQF) where
  bR : BQF
  hbR : CompRel b R bR
  aR : BQF
  haR : CompRel a R aR
  T : BQF
  hT1 : CompRel a bR T
  hT2 : CompRel b aR T

/-- ★★ THE ADJACENT SWAP: swap the two head factors, same class. -/
theorem prodRel_adjacent_swap {a b : BQF} {t : List BQF} {h : BQF}
    (hp : ProdRel (a :: b :: t) h)
    (supply : ∀ {R : BQF}, ProdRel t R → SwapData a b R) :
    ∃ h', ProdRel (b :: a :: t) h' ∧ Chain h h' := by
  cases hp with
  | cons hbt hca =>
      -- hbt : ProdRel (b :: t) hbt-target; hca : CompRel a (b∘t) h
      cases hbt with
      | cons hpt hcb =>
          -- hpt : ProdRel t R; hcb : CompRel b R X; hca : CompRel a X h
          obtain ⟨bR, hbR, aR, haR, T, hT1, hT2⟩ := supply hpt
          -- h = a∘(b∘R): align the inner target with bR (functionality)
          have hbb := compRel_functional hcb hbR
          have hca' : CompRel a bR h :=
            compRel_congr (Chain.refl _) hbb (Chain.refl _) hca
          -- h ~ T (both a∘bR)
          have hhT : Chain h T := compRel_functional hca' hT1
          -- the swapped product: b∘(a∘R) = T-side
          refine ⟨T, ProdRel.cons (ProdRel.cons hpt haR) hT2, hhT⟩

/-- ★★ THE PULL: bring a chosen member to the head, same class. Swap-data
    enters as a UNIVERSAL supply (any two members against any tail
    product — the capstone builds it from class data + compRel_total). -/
theorem pull_to_head
    (supplyU : ∀ (a b R : BQF), SwapData a b R) :
    ∀ {sel : List BQF} {h y : BQF}, ProdRel sel h → y ∈ sel →
    ∃ h', ProdRel (y :: eraseOne y sel) h' ∧ Chain h h' := by
  intro sel
  induction sel with
  | nil =>
      intro h y _ hy
      exact absurd hy (List.not_mem_nil)
  | cons a rest ih =>
      intro h y hp hy
      by_cases hay : a = y
      · -- y is already the head
        subst hay
        rw [eraseOne, if_pos rfl]
        exact ⟨h, hp, Chain.refl h⟩
      · -- y in the tail: recurse, then one adjacent swap
        have hyrest : y ∈ rest := by
          rcases List.mem_cons.mp hy with rfl | h2
          · exact absurd rfl hay
          · exact h2
        cases hp with
        | cons hpt hca =>
            -- pull y to the head of rest
            obtain ⟨R', hpR', hRR'⟩ := ih hpt hyrest
            -- re-attach a: CompRel a R' (transported target)
            have hca' : CompRel a R' _ :=
              compRel_congr (Chain.refl _) hRR' (Chain.refl _) hca
            -- now h ~ a :: y :: eraseOne y rest product; adjacent swap
            have hp2 : ProdRel (a :: y :: eraseOne y rest) h := by
              exact ProdRel.cons hpR' hca'
            obtain ⟨h', hp', hhh'⟩ :=
              prodRel_adjacent_swap hp2 (fun {R''} _ => supplyU a y R'')
            rw [eraseOne, if_neg hay]
            exact ⟨h', hp', hhh'⟩


/-- THE EXCHANGE ORACLE at (p): the swap step the replacement induction
    consumes — spanned-but-not-sub-spanned always yields a swappable
    generator. (Its per-instance truth is what the banked exchange
    engines compute; the ∀-discharge is the flagged remaining weld.) -/
def ExchangeOracle (p : Re) : Prop :=
  ∀ {x : BQF} {ys sub : List BQF},
    (∀ s ∈ sub, s ∈ ys) → PSpanned p ys x → ¬ PSpanned p sub x →
    ∃ y ∈ ys, (∀ s ∈ sub, s ≠ y) ∧
      ∀ z : BQF, PSpanned p ys z → PSpanned p (x :: eraseOne y ys) z

/-- ★★★ THE LAW (oracle-explicit form): given the exchange oracle at p,
    the p-rank of every negative-disc class family is WELL-DEFINED — any
    two maximal independent lists of classes have ONE length. -/
theorem THE_LAW {p : Re} (hor : ExchangeOracle p) {D : Z}
    {xs ys : List BQF}
    (hxw : pRankWitness D p xs) (hxnd : xs.Nodup)
    (hyw : pRankWitness D p ys) (hynd : ys.Nodup) :
    xs.length = ys.length := by
  obtain ⟨hxcls, hxind, hxgen⟩ := hxw
  obtain ⟨hycls, hyind, hygen⟩ := hyw
  exact rank_unique_of (fun {x ys' sub} h1 h2 h3 => hor h1 h2 h3)
    hxind hxnd hyind hynd
    (fun x hx => hygen x (hxcls x hx))
    (fun y hy => hxgen y (hycls y hy))

/-- ★★ THE GENERATOR SIDE OF THE LAW, sealed: every class family's rank
    witness can be MEASURED against the reduced-miss branch generators —
    the generator list spans every class (law_generators instantiated
    through class_generators; the shared slack supplied per class by the
    principal power tower, carried as the slack bundle). -/
theorem law_measured {p : Re} {D : Z} {f : BQF}
    (hf : ClassOf D f) (hDneg : D < 0)
    {E L R : BQF} (hE : PPow p E)
    {f_red : BQF} {Gs : List BQF}
    (hgen : Chain f f_red ∧ ProdRel Gs f_red)
    (hxL : CompRel f E L) (hhR : CompRel f_red E R) :
    PSpanned p Gs f := by
  obtain ⟨hprim, hpos, hdisc⟩ := hf
  exact gen_span hgen hE hxL hhR


#print axioms prodRel_adjacent_swap
#print axioms pull_to_head
#print axioms THE_LAW
#print axioms law_measured

end BQF
end GaussForms
end Phys.Foundation
