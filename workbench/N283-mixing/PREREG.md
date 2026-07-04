# N283 PREREG — ★2 mixing-angle VALUE route-finding

## THE QUESTION (fixed target)
Is the weak mixing angle VALUE derivable posit-free from the N281 rank-2 spinor neutral
torus {L_u1, R_u1}, OR does it still need a posit / external-empirical number?

## MEASUREMENTS (Fraction-exact on the fold's real octonion table, workbench/N283-mixing/)

probe_gram.py — trace-form Gram B(A,C)=trace(A∘C) on the 8-dim SPINOR O ℚ:
  B(L1,L1)=B(R1,R1)=-8, B(L1,R1)=4         → torus Gram {{-8,4},{4,-8}}
  B(foldVec,foldVec)=-8, B(foldAx,foldAx)=-24, B(foldVec,foldAx)=0
  B(Q=crossOp u1, Q)=-6, B(Y=crossOp κO1, Y)=-6   (the gather charge/hyper self-lengths)
  Q ∉ span{L1,R1}, span{L1,foldVec}, span{L1,Y}  → Gell-Mann-Nishijima STILL fails
  foldVec ∈ span{L1,R1} ✓ (so foldVec is a torus element, no new direction)

probe_centralizer.py / probe_forced_hypercharge.py / probe_confirm.py:
  L1,R1,foldVec,foldAx ALL skew-adjoint w.r.t. Born gForm → IN so(8) (simple ambient exists!)
  Q=crossOp(u1), Y=crossOp(κO1) are NOT skew → OUTSIDE so(8) (N257 obstruction reproduced)
  centralizer(su(2)_L) in so(8) = 6-dim = su(2)_H ⊕ su(2)_Hℓ (block-diag), NOT a u(1) line
  centralizer(colour su(3)) in so(8) = 2-dim
  JOINT centralizer(su(2)_L + colour su(3)) in so(8) = 0   ← THE DEEP OBSTRUCTION
  R1,foldVec,foldAx commute with L1 but NOT L2,L3 → not central to su(2)_L
  The ONE forced convention-free angle: cos(T3_L=L1, T3_R=R1) = 4/√64 = 1/2 → 60° (CHIRAL plane)

## THE ANSWER: NO — the mixing-angle VALUE is NOT forceable posit-free from the spinor torus.

WHY (precise structural blocker):
The weak mixing angle is the RELATIVE normalization of the NON-ABELIAN su(2)_L T3 against
the ABELIAN colour-neutral u(1)_Y. Convention-free determination requires (N253's mechanism)
BOTH generators inside a SINGLE SIMPLE ambient with a unique-up-to-scale invariant form.

On the 8-dim spinor:
 (i)  The rank-2 torus {L1,R1} IS in the simple ambient so(8) and DOES have a forced
      convention-free angle — but that angle is the CHIRAL (T3_L,T3_R) 60°, a ★6-plane
      quantity, NOT the electroweak (T3_L, Y) mixing plane. The second torus generator R1
      is the RIGHT isospin, which does NOT commute with su(2)_L (so is not an abelian
      hypercharge).
 (ii) A genuine u(1)_Y must (a) commute with ALL of su(2)_L and (b) be colour-neutral.
      The JOINT centralizer of su(2)_L and colour su(3) inside so(8) is ZERO — there is NO
      colour-neutral abelian generator in the spinor's rotation algebra to serve as u(1)_Y.
 (iii) The gather-derived electroweak Q, Y (cross-ops, N240/N255/N278) are NON-skew →
      OUTSIDE so(8) → there is NO single simple ambient containing both su(2)_L and Y with a
      unique form. This reproduces N257's vector-7 obstruction one level up on the spinor.

So climbing to the spinor torus (N281) supplied a genuine second neutral generator (foldVec
on the ℂ-core) and a forced convention-free angle — but the forced angle is CHIRAL, and the
electroweak hypercharge Y is still outside any shared simple ambient. The mixing angle needs
a structure the current chain has NOT built.

## TWO MISSING INPUTS (named precisely)
A. [tree-level, NOT human-gated — a NAMED next climb] A DERIVED single simple ambient
   containing su(2)_L AND a colour-neutral abelian u(1)_Y as commuting subalgebras with a
   unique invariant form. so(8) does not supply it (joint centralizer 0; Y non-skew). The
   theory's candidate is the ASCENT: f₄ = Der(J₃(O)) / e₆ on the exceptional Jordan arena
   (N269 banked g₂ ⊆ f₄), where the electroweak factors could sit inside one simple
   exceptional algebra with a unique Killing form. N253 got a convention-free 3:8 for the
   charge:isospin pair on the vector-7 so(7) — but explicitly NOT the electroweak angle.
B. [physical VALUE — genuine CHAIN RUNWAY, human-gated] Even a derived tree-level ratio is
   the HIGH-scale value; the measured sin²θ_W ≈ 0.231 ≠ 3/8 = 0.375 is that value RG-RUN to
   the electroweak scale, which needs either the mass-scale ratios (external empirical
   numbers) OR the full derived dynamics (C6 + the derived spectrum), neither yet in the chain.

## DELIVERABLE PLAN
The route-finding ANSWER above is the primary deliverable. To make the "NO" rigorous and
permanent (N253/N257 house style — bank the convention-free invariant + PROVE the obstruction
+ refuse the angle), bank a TIGHT Lean node IF cheap to compile:
  - the spinor-carrier torus trace-form Gram (reduces to banked lregI_sq/rregI_sq + ONE trace
    trace(lregI∘rregI)=4), the forced convention-free relation 4·B(L1,R1)²=B(L1,L1)·B(R1,R1)
    (cos²=1/4);
  - THE OBSTRUCTION (the crux): the second torus generator rregI does NOT commute with
    su(2)_L (a single coordinate witness [rregI,lregJ]≠0), so the rank-2 torus's second
    direction is the RIGHT chiral isospin, NOT an abelian colour-neutral hypercharge — the
    electroweak mixing plane is NOT among the forced convention-free structures of the torus.
  - docstring + kanban CHAIN RUNWAY comment naming inputs A and B.
MEASURE trace cost first (W9). If heavy, deliver the named blocker in prose + CHAIN RUNWAY
comment + complete (explicitly allowed for a route-finding node).

## ANTI-BULLSHIT / ONE LAW check
- NOT drifting to "measure another N281 property": the Gram is the exact instrument the ★2
  question requires; the RESULT (forced angle is chiral, hypercharge absent) IS the
  route-finding answer.
- NOT weakening the target to "a ratio coinciding with sin²θ_W and calling the angle derived"
  — the OPPOSITE: proving the angle is NOT forced here, naming what's missing (N253/N257 refusal).
- The forced 60° is CHIRAL not electroweak — I will NOT frame it as "advances ★2 value"; the
  node's ★2 contribution is the NAMED BLOCKER + the rigorous obstruction, honestly short of the value.
