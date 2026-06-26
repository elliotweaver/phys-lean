# N73 PREREG — THE FIRST CLOSED MULTI-STEP DEFLATION DESCENT (extract→deflate→recurse to termination)

Frozen BEFORE compute. KILL classifies a fight as INSTRUMENT failure (W9), not theory.

## NODE SPECIFICATION (against what the chain ACTUALLY produced — ROADMAP §N73 priority (i))
N70 banked the SINGLE inductive step `deflateC_specOpN : deflateC (specOpN l u) (l k) (u k)
= specOpN (update l k 0) u` and one concrete crank `deflateC_txMix_fst : deflateC txMix 9 mixA
= specOpN ![0,4,25] mix3`. N71 fired it ONCE on the GIVEN-eigenbasis operator txMix (peel mixA(9),
mixB(4) survives). N72 fired it ONCE on the CONSTRUCTED-eigenbasis operator toMix. **NOWHERE in the
chain has the deflation engine been CHAINED to its TERMINATION.** The extract→deflate→recurse loop —
the closed induction the full spectral existence runs on — has never been assembled even at fixed
small n. This node banks THE FIRST CLOSED MULTI-STEP DESCENT: peel ALL eigenpairs, terminate at the
zero operator.

## GO / NO-GO TARGETS (the bankable package)
1. `specOpN_zero` (GENERAL termination base case): `specOpN (fun _ => (0:Cut)) u = 0`. The descent
   TERMINATES at the zero operator once every coefficient is peeled. New — never banked.
2. `zeroOn S l := fun i => if i ∈ S then 0 else l i` + the GENERAL inductive step
   `deflateC_specOpN_zeroOn (S) (hk : k ∉ S) : deflateC (specOpN (zeroOn S l) u) (l k) (u k)
   = specOpN (zeroOn (insert k S) l) u`. The genuine CLOSED-INDUCTION skeleton: peeling one more
   index from the partially-deflated spectral operator zeroes one more coefficient. New.
3. `specOpN_zeroOn_univ : specOpN (zeroOn Finset.univ l) u = 0` (the terminal state).
4. THE CONCRETE 3-STEP CLOSED DESCENT on N69's 10-dim-mixing witness txMix (eigenvalues 9,4,25 over
   mix3 = ![mixA,mixB,mixW3]):
     - step2 `deflateC (specOpN ![0,4,25] mix3) 4 mixB = specOpN ![0,0,25] mix3`
     - step3 `deflateC (specOpN ![0,0,25] mix3) 25 mixW3 = specOpN ![0,0,0] mix3`
     - the surviving-eigenvalue honesty: `deflateC (specOpN ![0,4,25] mix3) 4 mixB mixW3 = 25•mixW3`
       (mixW3 survives the second peel)
     - THE HEADLINE `txMix_full_descent :
         deflateC (deflateC (deflateC txMix 9 mixA) 4 mixB) 25 mixW3 = 0`
       — peel all three eigenpairs of the genuine 10-dim-mixing operator, the operator VANISHES.
       The first concrete CLOSED descent terminating at the zero operator.

## THE TRUNK REFRAME (THE ONE LAW)
The descent IS iterated subtraction of the trunk eigenprojections projC (N63). Each peel removes one
`l k • projC (u k)` from the spectral sum specOpN = ∑ᵢ lᵢ•projC(uᵢ); after all n peels the sum is
empty → the zero operator. No Mathlib spectral theory, no posited operator calculus — pure Finset
bookkeeping over the banked projC/specOpN/deflateC + the reference form EvC (N58, Born positivity
N56), over the DERIVED ℝ Cut. Each intermediate peel is the GENUINE surviving eigenpair
(specOpN_eigen, N71), so the descent is honest at every step.

## COSTUME C104 (W8 — MUST BITE; false numeric DISTINCT from C84..C103, incl C103 100=40)
A WRONG closed-descent claim: that after peeling mixA(9) AND mixB(4), the surviving eigenvalue of
mixW3 in the twice-deflated operator is some wrong value (e.g. 11), reducing through the genuine
banked machinery (step2 = specOpN ![0,0,25] mix3, then specOpN_read/_eigen → 25) to the false
numeric `25 = 11`. MUST fail to compile. (Pick the bite distinct from the whole banked battery.)

## KILL BUDGET (W9 — instrument-failure thresholds, frozen)
- Per-obligation KILL: 30s elaboration. All targets are Finset.sum bookkeeping over Fin 3 / over an
  abstract index — NO ring/decide/simp over fully-expanded octonion coordinates. specOpN_zero is
  `simp [specOpN, zero_smul, Finset.sum_const_zero]`. The zeroOn step is funext + simp. The concrete
  descent is `deflateC_specOpN` rewrites + `fin_cases i <;> simp [Function.update]` (exactly the
  pattern banked in deflateC_txMix_fst). If ANY single obligation exceeds 30s → INSTRUMENT failure:
  decompose the offending rewrite into bounded named steps; do NOT inflate maxHeartbeats, do NOT
  brute. No maxHeartbeats override anywhere. No native_decide. No new axiom/sorry.
- If the concrete 3-step descent itself resists (unlikely — it is three applications of a banked
  single-step lemma), bank the GENERAL step + termination (1–3) and child the concrete chain.

## NON-NEGOTIABLES
Zero axioms beyond {propext, Classical.choice, Quot.sound}; verify #print axioms against the built
olean myself. No posited Lorentz group, no Mathlib ℝ/ℂ as content, no bridge. Physics-words-removable.
Production file: Phys/Algebra/LorentzContinuumDeflateInduct.lean. Single-flight: child N74 onto tail.
