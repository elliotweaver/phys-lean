# PREREG — Node 4 (t_1953c0de): D7 endpoint narrowing rung 2

## Campaign context
Owner huc-derivation campaign node 4. Succeeds N579 (huc discharged; endpoint at ~9 digits,
[136.307188, 136.3071883]). Task: sharpen the DOMINANT derived-input residual one rung deeper,
re-assemble the endpoint bracket, D7 RESTATE 1/α(0) at more sig digits.

## MEASURE-FIRST (W9) — done, workbench/d7-endpoint-narrow/measure.py
Endpoint bare normal form: recomposedEndpoint = 2425/18 + kappaLeading·cInner,
  cInner = 2·L_m01 + (7/3)·L_mb + (11/3)·L_b0 − (5/3)·L_b2.
Per-input contribution to endpoint width (|coeff|·κ·input_width):
  L_b0  3.89e-8   (DOMINANT)
  L_b2  3.54e-8
  L_mb  2.48e-8
  kappa 1.01e-11  (ext6 floor)
  L_m01 2.12e-12  (already negligible, banked NB11)
Sum ≈ 9.9e-8 ⇒ ~9 sig digits. THE DOMINANT RESIDUAL = the THREE EDGE LOGS (all ~1e-7,
comparable). To move digits I must sharpen ALL THREE (sharpening only L_b0 leaves 6e-8).

## THE RUNG (deeper reads of the SAME derived objects — no fit)
- L_b0 = cutLog mass0: clean 15-digit mass0 bracket [5661726012625403/1e15, 5661726012625422/1e15]
  from banked NB11 mass0_lo_s6/hi_s6 (b0 = 1189719085816627/5e14 …), through the exp instrument
  at index 20 → cutLog mass0 ∈ [17337287949546/1e13, 17337287949547/1e13]  (width 1e-13).
- L_b2 = cutLog mass2 = −cutLog(1/mass2): clean 15-digit mass2 from NB11 s6 wp/wr (b2=1−(wp−wr)/2,
  mass2=b2²), 1/mass2 ∈ [500000000000000/168322936140649, 500000000000000/168322936140643], exp
  instrument index 18 → cutLog(1/mass2) ∈ [2721809313059/2.5e12, 10887237252237/1e13],
  cutLog mass2 ∈ [−10887237252237/1e13, −10887237252236/1e13]  (width 1e-13).
- L_mb = cutLog mbRatioDerived = −cutLog(1/mbR): from mbRatioDerived_closed (1−q)²/(3(1+q)),
  q sharpened via q²=1/2 to q ∈ [707106781186547/1e15, 707106781186548/1e15] (15-digit),
  mbR ∈ [.., ..], 1/mbR ~ 59.6984848…, exp instrument indices 26(lo)/27(hi) →
  cutLog(1/mbR) ∈ [40893066400067/1e13, 10223266600017/2.5e12],
  cutLog mbR ∈ [−10223266600017/2.5e12, −40893066400067/1e13]  (width 1e-13).
- L_m01 (NB11, width 1e-11) and κ (ext6, width 2e-12) wired in unchanged.

## LANDING (verified exact arithmetic — lock2.py)
Inner core bracket [14.9379518556, 14.9379518557] (10-dp; nlinarith-provable from the four edge
brackets). Endpoint arithmetic core (mirror endpoint_core_s1):
- BARE: recomposedEndpoint ∈ [136.3071881405, 136.3071881406] = [272614376281/2e9, 681535940703/5e9]
  width 1e-10, ~12 sig digits, nested STRICTLY inside banked [136.307188, 136.3071883], < 137.
- DRESSED: recomposedEndpointDressed ∈ [137.0996710997, 137.0996710998]
  = [1370996710997/1e10, 1370996710998/1e10] width 1e-10, ~12 sig digits, nested STRICTLY inside
  banked [137.0984, 137.1006], > 137.

## HONEST GRADE
9→12 sig-digit advance. NOT 15: the residual is now κ = 1/cutPi (ext6, ~2e-12), the new
bottleneck ⇒ the ≥15-digit floor is ROUTE-NOT-YET-FOUND, handed to ONE directed successor
(sharpen 1/cutPi deeper — a deeper cutCos grid for leastCosZero). NOT the measured 1/α(0)≈137.036
(removable prose); no empirical number in any proof. Continue-the-hunt, not an arc exit.

## W9 COST BUDGET + KILL
Each edge-log = the banked cutLog_ge/le_certified + cutLog_mono pattern with
`norm_num [Nat.factorial]` on partial exp sums at index ≤27 — already banked at this cost in Rung1
(indices 15,16,21,22,26,27). Endpoint core = one nlinarith on the inner combo + two mul_le_mul,
identical shape to endpoint_core_s1 (maxHeartbeats 2000000). KILL: if any single exp cert >90s,
decompose the partial sum. Abstract arithmetic core keeps transcendentals OUT.

## MODULE
Phys/Algebra/D7NarrowingRung2.lean, namespace Phys.Algebra.D7NarrowingRung2.
Imports: D7DepthTwoComposed (bare+dressed normal forms, cInner, kappa_bracket via transitive),
D7NarrowingRung1 (the pattern + cutLog_m01_sharp), NarrowedBracket11 (s6 numerals), Mathlib.Tactic.
