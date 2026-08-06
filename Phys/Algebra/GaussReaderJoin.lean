/-
  # THE READER AND THE JOIN — membership exact, exponents add (GQ N606)

  ## What this file proves (GQ campaign, production node — R7 + the descent kit)

  The rank layer's complete group-side toolkit:

  * `reader_cancel` / `left_cancel` — ★★ THE READER, POWERED: the
    supply-laden relation reader with EVERY cancellation hypothesis
    discharged by the cancellation law — same complement, chain-equal
    landings ⟹ chain-equal factors, both slots.
  * `span_unique` — ★ the pCl membership test is EXACT on classes.
  * `pow_peel` — one rung off the top (exponent subtraction step).
  * `JoinLadder` — the FUSED join ladder: the power ladder and the
    hi-composite carried rung-aligned, both bracket readings per rung
    (design lesson: separate towers desynchronize — fuse them).
  * `joinLadder_pow` — the fused tower's h IS the j-th power.
  * `pow_join` — ★★ THE JOIN: the fused tower's W is the (j+i)-th power —
    exponent addition at the relation level, the order-divides engine.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussGenerators

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- ★★ THE READER, POWERED: same complement w, both land chain-equal ⟹
    the composed factors are chain-equal. (The supply-laden N599 reader,
    with every hypothesis discharged by the cancellation law.) -/
theorem reader_cancel {w x x' z z' : BQF}
    (hwprim : Primitive w) (hwpos : PosDef w) (hD : disc w < 0)
    (hxpos : PosDef x) (hx'pos : PosDef x')
    (hdx : disc w = disc x) (hdx' : disc w = disc x')
    (hcx : CompRel x w z) (hcx' : CompRel x' w z')
    (hzz : Chain z z') : Chain x x' :=
  cancel_oracle hwprim hwpos hD hxpos hx'pos hdx hdx'
    (compRel_comm hcx) (compRel_comm hcx') hzz

/-- ★ Left-slot cancellation (comm-conjugated). -/
theorem left_cancel {w x x' z z' : BQF}
    (hwprim : Primitive w) (hwpos : PosDef w) (hD : disc w < 0)
    (hxpos : PosDef x) (hx'pos : PosDef x')
    (hdx : disc w = disc x) (hdx' : disc w = disc x')
    (hcx : CompRel w x z) (hcx' : CompRel w x' z')
    (hzz : Chain z z') : Chain x x' :=
  cancel_oracle hwprim hwpos hD hxpos hx'pos hdx hdx' hcx hcx' hzz

/-- ★ SPAN UNIQUENESS: two forms composed against one complement into
    chain-equal principal landings are chain-equal — the pCl membership
    test is EXACT on classes. -/
theorem span_unique {w x x' L L' e e' : BQF}
    (hwprim : Primitive w) (hwpos : PosDef w) (hD : disc w < 0)
    (hxpos : PosDef x) (hx'pos : PosDef x')
    (hdx : disc w = disc x) (hdx' : disc w = disc x')
    (hcx : CompRel x w L) (hcx' : CompRel x' w L')
    (hLe : Chain L e) (hL'e' : Chain L' e') (hee : Chain e e') :
    Chain x x' := by
  apply reader_cancel hwprim hwpos hD hxpos hx'pos hdx hdx' hcx hcx'
  exact chainTrans hLe (chainTrans hee (chainSymm hL'e'))


/-- ★ PEEL ONE RUNG (re-export shape). -/
theorem pow_peel {g h : BQF} {k : Re}
    (hp : PowRel g (Re.step k) h) :
    (k = Re.void ∧ Chain g h) ∨ (∃ h', PowRel g k h' ∧ CompRel g h' h) :=
  powRel_split_succ hp

/-- THE FUSED JOIN LADDER: h is the j-th power AND W ~ h∘hi, rung-aligned. -/
inductive JoinLadder (g hi : BQF) : Re → BQF → BQF → Prop
  | base {h W : BQF} (hch : Chain g h) (hc : CompRel h hi W) :
      JoinLadder g hi (Re.step Re.void) h W
  | step {k : Re} {h W h' W' T : BQF}
      (prev : JoinLadder g hi k h W)
      (hrung : CompRel g h h')
      (hnext : CompRel h' hi W')
      (hT1 : CompRel h' hi T)
      (hT2 : CompRel g W T) :
      JoinLadder g hi (Re.step k) h' W'

/-- Projection: the fused tower's h is the j-th power. -/
theorem joinLadder_pow {g hi : BQF} {j : Re} {h W : BQF}
    (t : JoinLadder g hi j h W) : PowRel g j h := by
  induction t with
  | base hch hc => exact PowRel.one hch
  | step prev hrung hnext hT1 hT2 ih => exact PowRel.succ ih hrung

/-- ★★ THE JOIN: the fused tower's W is the (j+i)-th power. -/
theorem pow_join {g hi : BQF} {i : Re} (hpi : PowRel g i hi) :
    ∀ {j : Re} {h W : BQF}, JoinLadder g hi j h W →
    PowRel g (j + i) W := by
  intro j h W t
  induction t with
  | @base h W hch hc =>
      have hcomp' : CompRel g hi W :=
        compRel_congr (chainSymm hch) (Chain.refl _) (Chain.refl _) hc
      have hstep : PowRel g (Re.step i) W := PowRel.succ hpi hcomp'
      have hadd : Re.step Re.void + i = Re.step i := by
        calc Re.step Re.void + i = Re.step (Re.void + i) := Re.step_add _ _
          _ = Re.step i := by rw [Re.void_add]
      rw [hadd]
      exact hstep
  | @step k h W h' W' T prev hrung hnext hT1 hT2 ih =>
      -- W' ~ T (both h'∘hi composites), T is g∘W's composite:
      -- CompRel g W T with W the (k+i)-power ⟹ T is the (k+i+1)-power;
      -- W' ~ T transports.
      have hW'T : Chain W' T := compRel_functional hnext hT1
      have hTpow : PowRel g (Re.step (k + i)) T := PowRel.succ ih hT2
      have hW'pow : PowRel g (Re.step (k + i)) W' :=
        powRel_congr hTpow (chainSymm hW'T)
      have hadd : Re.step k + i = Re.step (k + i) := Re.step_add k i
      rw [hadd]
      exact hW'pow


#print axioms reader_cancel
#print axioms span_unique
#print axioms joinLadder_pow
#print axioms pow_join

end BQF
end GaussForms
end Phys.Foundation
