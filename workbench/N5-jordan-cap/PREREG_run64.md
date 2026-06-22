# PREREG — N5g run 64 (central-diagonal reduction, structural abstract-central route)

FROZEN before compute. KILL classifies a fight as INSTRUMENT failure, not theory failure.

## TARGET (unchanged, a THEOREM)
`jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0` for the general Hermitian 3×3 over `O ℚ`
(call it `jdef_H3`), then `jordan_cap_pinned_at_three := ⟨jdef_H3, jordan_fails_H4⟩`.
With `jdef_Xz_core` banked, the remainder is the CENTRAL-DIAGONAL REDUCTION.

## STRUCTURE (re-derived this run; to be numerically reconfirmed before Lean)
Write Hm = Dm + Xz (Dm central-diagonal of `ocR` entries, Xz zero-diagonal off-part).
Two reduction lemmas suffice (both MEASURED TRUE run 50/62, central_split.py ok_dropA/ok_dropB):
  (I)  jdef(D+X, B) = jdef(X, B)        [drop central diagonal from FIRST arg, any B]
  (II) jdef(X, E+Y) = jdef(X, Y)        [drop central diagonal from SECOND arg, X zero-diag]
Then: jdef(D+X,E+Y) =(I)= jdef(X,E+Y) =(II)= jdef(X,Y) =[jdef_Xz_core]= 0.

(II) via jdef_add_right = jdef(X,E)+jdef(X,Y), so (II) ⟺ `jdef(X,E)=0` [zero-diag first, central-diag second].
Derived: jdef(X,E)_{ij} = 2(e_i−e_j)·A_X,{ij}, A_X := X(XX)−(XX)X (matrix associator).
  ⇒ DIAGONAL entries (i=j) vanish by centrality alone (e_i−e_i=0).
  ⇒ off-diagonal entries need A_X,{ij}=0 = Σ_{k,l} assoc(X_ik,X_kl,X_lj) (octonion alt algebra).

CLEAN (centrality+abel only, NO alt, NO coordinate ring), CONFIDENT:
  `jdef(D, B) = 0` for ANY B when D central-diagonal. (Derived: every entry cancels identically.)
  NOTE: jdef is NOT first-arg-additive, so this does NOT alone close (I); it is a reusable lever
  + builds the abstract-central matrix infrastructure (opaque-central diagonal, ocR kept opaque).

## ROUTE (W9.4 structural; ocR kept ABSTRACT/CENTRAL, never unfolded into coordinates)
Prove reduction lemmas over abstract `NonAssocRing S` with a diagonal matrix of OPAQUE central
entries (centrality hyps), then instantiate n_i := ocR d_i via ocR_comm/ocR_assocL/M/R. The
residual octonion associators close by the banked alt battery (Alternative.lean) + ka-style levers,
exactly as the building blocks bb1/bb2/bb3 did — NEVER a coordinate `ring` on a goal containing ocR.

## GO / NO-GO / KILL
- GO: bank `jdef_centralDiag_left` (jdef D B = 0, D central-diagonal, abstract S) — clean, this run.
- THEN execute the smallest hard sub-case = ONE off-diagonal entry of `jdef(X,E)=0` (the A_X,{ij}
  octonion associator sum), bank-as-you-go (W9.8). 
- KILL per obligation: 90 s wall / 3.5 GB RSS in a BOUNDED probe. NEVER an unbounded compile in
  the turn budget. If an entry's coordinate route blows the budget → decompose that entry (W9.3).
- DEAD ROUTES (do NOT re-run, MEASURED): full-Hm cdsimp+ring (simp-step overrun); ocR-unfold whnf
  timeout; the 4 brute normalizers; any flat abel-certificate. Keep ocR opaque always.
- DECOMPOSE (W3) with turns to spare: commit each clean lemma the instant it compiles; child the
  hard remainder onto the chain tail; complete this task as "decomposed" only if the full jdef_H3
  cannot land safely this run. NEVER run out of turns mid-task.

## STANDARD gate (second gate, after green): unbroken / complete (#print axioms ⊆ {propext,
Classical.choice, Quot.sound}) / physics-words-removable. NEVER weaken/bridge/posit/reach-for-ℝ.
