N278 PREREG — de-risk notes (SELECT phase)
============================================

TARGET (decided): THE FORCED HYPERCHARGE OPERATOR IS THE CAYLEY–DICKSON DOUBLING
INTERTWINER THAT IDENTIFIES THE TWO WEAK-ISOSPIN WORLDS.

The banked forced hypercharge U(1)_Y operator hyperOp = crossOp(κO1) (N255),
restricted to N277's isospin-multiplet decomposition ImO = TL ⊕ Sg ⊕ TR = 3⊕1⊕3,
IS the Cayley–Dickson doubling map ℓ·(−) [ℓ = κO1 = e4O]:
  (1) SWAPS the two su(2)_L triplets: hyperOp(TL) = TR and hyperOp(TR) = TL;
  (2) KILLS the fixed doubling axis: hyperOp(Sg) = 0 (octCross_self);
  (3) COMPLEX STRUCTURE: hyperOp² = −1 on TL⊕TR, 0 on Sg (octCross_contraction);
  (4) su(2)_L-EQUIVARIANT: BANKED N255 hyperOp_commute_isospin (just cite);
  (5) ⟹ su(2)_L-MODULE ISO TL ≅ TR (the two triplets are ONE rep, doubled);
  (6) IDENTITY: hyperOp on TL⊕TR = left-mult by ℓ (octCross κO1 y = κO1·y for y⟂κO1).

DE-RISK FINDINGS (banked ingredients confirmed present & clean):
  · hyperOp := crossOp (kappaO 1)  — N255 TowerGatherForcedHyperchargeDirection.lean:92
  · hyperOp_commute_isospin (⁅imRep DX, hyperOp⁆ = 0 for all X)  — N255:129  [THE ENGINE]
  · TL/Sg/TR + finranks + invariance + no-fixed-vector  — N277 TowerGatherIsospinMultiplet
  · octCross x y = x*y + (gForm x y)•1  — OctonionCrossProduct.lean:105
  · octCross_self (octCross x x = 0 for x∈ImO)  — OctonionCrossProduct.lean:147  [kills Sg]
  · octCross_contraction (octCross a (octCross a y) = ⟨a,y⟩•a − ⟨a,a⟩•y)  — OctonionCrossProductContraction.lean:111  [hyperOp²]
  · gForm (kappaO 1)(kappaO 1) = 1, gForm u1 (kappaO 1) = 0  — TowerGatherIsometry.lean:327,337 (via gForm_imBasis N257)
  · chargeOp_sq_coe pattern (the exact twin: chargeOp²(y)=⟨u1,y⟩•u1 − y)  — N240 [template for hyperOp²]
  · kap1'_eq_e4I (κO1 = e4O), imRep_DJ/DK_u1I (u1 generates TL under su(2)_L)  — N277

W9 COST PLAN (structural route, minimize coordinate bashes):
  · hyperOp is su(2)_L-EQUIVARIANT (N255). u1 CYCLICALLY GENERATES TL under su(2)_L
    (imRep DJ u1 = −2e3, imRep DK u1 = 2e2, N277). So: compute hyperOp(u1) ∈ TR ONCE
    (one 8-coord ext<;>simp<;>ring), then equivariance spreads hyperOp(TL) ⊆ TR:
    hyperOp(D·u1) = D·hyperOp(u1) ∈ su(2)_L·TR ⊆ TR (TR invariant).
    Symmetric for TR→TL (compute hyperOp(e5) ∈ TL once).
  · hyperOp² via octCross_contraction: STRUCTURAL, no coordinate bash (twin of chargeOp_sq_coe).
  · KILL budget: any single octCross coordinate product > 400k heartbeats → decompose per-coord (N257 pattern).

PROBE RESULT: e4O·u1 lands in span{e5O,e6O,e7O}=TR (coordinate structure confirmed via
raw CD.mul unfolding; exact sign is production bookkeeping). octCross κO1 u1 = κO1·u1
since ⟨κO1,u1⟩=0. Confirms hyperOp(u1) ∈ TR.

MOAT / ONE CAUSE: the last CD doubling O = H ⊕ Hℓ (stops the cascade, N2c) supplies THREE faces of ONE map:
  (i)  su(2)_L = Der(H) grading matter into multiplets (N277);
  (ii) the map ℓ· identifying the two multiplet worlds TL≅TR (THIS node);
  (iii) the forced hypercharge U(1)_Y operator hyperOp (N255).
ONE derived operator, three physical faces (isospin-rep structure + hypercharge + cascade-stop doubling).

SCOPE (explicit NOT-list): the su(2)_L-module iso TL≅TR + the doubling-intertwiner identity
+ hyperOp² complex structure + kills-Sg + the moat tie to N255 hyperOp ONLY.
NOT the hypercharge NORMALIZATION / weak mixing angle (★2 ceiling STANDS — no coupling ratio here);
NOT Gell-Mann–Nishijima Q=T3+Y/2 (WALLED N255/N257); NOT the FULL Burnside irreducibility of TL/TR
(downstream); NOT masses/mixings (★5 un-forceable); NOT parity; NOT "= a specific SM multiplet" (removable prose).

ANTI-★2 CHECK: target is the DIRECTION/ROLE of hyperOp (banked-forced, N255), NOT its normalization.
No coupling constant, no relative su(2)_L/u(1)_Y scale, no GMN span relation appears. Clear of the ceiling.
