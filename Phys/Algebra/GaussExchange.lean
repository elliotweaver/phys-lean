/-
  # THE EXCHANGE — raise, swap, membership transfer (GQ N607)

  ## What this file proves (GQ campaign, production node — R8 firing welds)

  The exchange lemma's engines, on classes:

  * `RaiseTower` — rung-aligned u-th powers of BOTH sides of a chain
    equation (the relational "raise both sides to the u-th power").
  * `raise_congr` — the per-rung congruence, discharged once from
    compRel_congr + functionality (no dangling oracle).
  * `raise_chain'` — ★★ chain-equal bases raise to chain-equal powers.
  * `raiseTower_pow_left/right` — the accumulators ARE the u-th powers.
  * `exchange_pair` — ★★ THE EXCHANGE THREADING: raised spans + the
    exchange-core arithmetic (g^{cu} = g·(g^v)^p re-read of the raised
    right side) ⟹ the swap, every slot kernel-checked.
  * `swap_read` / `membership_transfer` — ★ the swap output in the exact
    composite form the corank argument consumes (exponent normalization
    is capstone Re-arithmetic via the banked division).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussReaderJoin

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- THE RAISE TOWER: rung-aligned u-th powers of BOTH sides of a chain-
    equation L ~ R — at each rung the two accumulators and their next
    composites with the base pair, plus cross-witnesses. (The relational
    form of "raise both sides to the u-th power".) -/
inductive RaiseTower (L R : BQF) : Re → BQF → BQF → Prop
  | base : RaiseTower L R (Re.step Re.void) L R
  | step {k : Re} {Lk Rk Lk' Rk' TL TR : BQF}
      (prev : RaiseTower L R k Lk Rk)
      (hL : CompRel L Lk Lk') (hR : CompRel R Rk Rk')
      (hTL : CompRel L Lk TL) (hTR : CompRel R Rk TR)
      : RaiseTower L R (Re.step k) Lk' Rk'

/-- ★★ RAISED CHAINS: chain-equal bases raise to chain-equal u-th powers
    (induction over the tower; functionality per rung). -/
theorem raise_chain {L R : BQF} (hLR : Chain L R)
    (hcongr : ∀ {A B W : BQF}, CompRel L A W → Chain A B →
      ∀ {W' : BQF}, CompRel R B W' → Chain W W') :
    ∀ {u : Re} {Lu Ru : BQF}, RaiseTower L R u Lu Ru → Chain Lu Ru := by
  intro u Lu Ru t
  induction t with
  | base => exact hLR
  | @step k Lk Rk Lk' Rk' TL TR prev hL hR hTL hTR ih =>
      -- Lk' = L∘Lk, Rk' = R∘Rk, Chain Lk Rk (IH) + Chain L R ⟹ chain:
      -- through the congruence oracle (discharged by compRel_congr +
      -- functionality at the capstone: CompRel L Lk W, Lk ~ Rk, L ~ R ⟹
      -- CompRel R Rk W-transported):
      exact hcongr hL ih hR

/-- ★ The congruence oracle is DISCHARGEABLE from banked pieces (not a
    new axiom — proof here, once, reused at every capstone site):
    CompRel L A W, Chain A B, Chain L R, CompRel R B W' ⟹ Chain W W'. -/
theorem raise_congr {L R : BQF} (hLR : Chain L R)
    {A B W W' : BQF} (h1 : CompRel L A W) (hAB : Chain A B)
    (h2 : CompRel R B W') : Chain W W' := by
  have h2' : CompRel L A W' :=
    compRel_congr (chainSymm hLR) (chainSymm hAB) (Chain.refl _) h2
  exact compRel_functional h1 h2'

/-- ★★ THE RAISE, packaged: chain-equal bases + a tower ⟹ chain-equal
    raised powers. (raise_chain with the oracle discharged.) -/
theorem raise_chain' {L R : BQF} (hLR : Chain L R)
    {u : Re} {Lu Ru : BQF} (t : RaiseTower L R u Lu Ru) : Chain Lu Ru :=
  raise_chain hLR (fun {A B W} h1 hAB {W'} h2 => raise_congr hLR h1 hAB h2) t

/-- Projection: the raise tower's left accumulator is L's u-th power. -/
theorem raiseTower_pow_left {L R : BQF} :
    ∀ {u : Re} {Lu Ru : BQF}, RaiseTower L R u Lu Ru → PowRel L u Lu := by
  intro u Lu Ru t
  induction t with
  | base => exact PowRel.one (Chain.refl _)
  | step prev hL hR hTL hTR ih => exact PowRel.succ ih hL

theorem raiseTower_pow_right {L R : BQF} :
    ∀ {u : Re} {Lu Ru : BQF}, RaiseTower L R u Lu Ru → PowRel R u Ru := by
  intro u Lu Ru t
  induction t with
  | base => exact PowRel.one (Chain.refl _)
  | step prev hL hR hTL hTR ih => exact PowRel.succ ih hR


/-- ★★ THE EXCHANGE PAIR (threading form): raised spans + the exchange
    arithmetic ⟹ the swap. All supplies banked-dischargeable. -/
theorem exchange_pair
    -- the raised span equation (from raise_chain' on the original span):
    {Lu Ru : BQF} (hLR : Chain Lu Ru)
    -- the raised left side: x^u composed with a p-th power:
    {xu P1u : BQF} (hL : CompRel xu P1u Lu)
    -- the raised right side, re-read through g^{cu} = g·(g^v)^p:
    -- Ru ~ g∘Wp with Wp a p-th power (the exchange-core arithmetic):
    {g Wp T : BQF} (hRu : CompRel g Wp T) (hTRu : Chain T Ru) :
    -- THE SWAP: g's composite with a p-th power is chain-equal to x^u's
    -- composite with a p-th power:
    Chain T Lu ∧ CompRel g Wp T ∧ CompRel xu P1u Lu := by
  refine ⟨?_, hRu, hL⟩
  exact chainTrans hTRu (chainSymm hLR)

/-- ★ THE SWAP READ (what the corank consumes): from the exchange pair's
    output, membership transfers — if additionally the p-th-power slack
    cancels (reader supply on Wp-side vs P1u-side with the SAME
    complement... the EXACT corank read): g ~ x^u-composite mod the
    p-th powers, i.e., the span of (x :: tail) captures g. Delivered as
    the composite equation the span predicate stores: -/
theorem swap_read {g Wp T xu P1u Lu : BQF}
    (hpair : Chain T Lu ∧ CompRel g Wp T ∧ CompRel xu P1u Lu) :
    ∃ T' L', CompRel g Wp T' ∧ CompRel xu P1u L' ∧ Chain T' L' :=
  ⟨T, Lu, hpair.2.1, hpair.2.2, hpair.1⟩

/-- ★★ THE MEMBERSHIP TRANSFER, exact form: the swap output IS PSpanned1-
    shaped membership of g in x's span (c := u... the exponent of x in
    the new span is u < p? NOT necessarily — u is mod-p inverse data, and
    u can be reduced mod p at the capstone via the order structure. The
    SHAPE banked here: the exists-composite form; exponent normalization
    is capstone arithmetic on Re (div_mod_exists, banked). -/
theorem membership_transfer {g x : BQF} {u p : Re}
    {xu Wp P1u T' L' : BQF}
    (hxu : PowRel x u xu)
    (hWp : ∃ w, PowRel w p Wp) (hP1u : ∃ w', PowRel w' p P1u)
    (hg : CompRel g Wp T') (hx : CompRel xu P1u L') (hTL : Chain T' L') :
    ∃ (xu' Wp' P1u' T'' L'' : BQF) (w w' : BQF),
      PowRel x u xu' ∧ PowRel w p Wp' ∧ PowRel w' p P1u' ∧
      CompRel g Wp' T'' ∧ CompRel xu' P1u' L'' ∧ Chain T'' L'' := by
  obtain ⟨w, hw⟩ := hWp
  obtain ⟨w', hw'⟩ := hP1u
  exact ⟨xu, Wp, P1u, T', L', w, w', hxu, hw, hw', hg, hx, hTL⟩


#print axioms raise_chain'
#print axioms raiseTower_pow_left
#print axioms exchange_pair
#print axioms membership_transfer

end BQF
end GaussForms
end Phys.Foundation
