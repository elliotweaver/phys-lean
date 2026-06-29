# N171 — PREREG (frozen GO/NO-GO + KILL before compute)

## CHAIN POSITION
N170 banked `joinedIdQvC_of_timeFixing_SO9` (EvC-free time-fixing SO(9) closure). N169 banked
`qvIsom_orthochronous_boost_factor` (`p = B·k`) + `joinedIdQvC_of_timeFixing_residual`. N163 banked
`joinedIdQvC_of_xtFixing_det_one` (det-+1 isometry fixing both axes is JoinedIdQvC). The
UNCONDITIONAL full SO⁺(1,9) closure needs the time-fixing residual `k := B⁻¹·p` certified
JoinedIdQvC, which requires discharging (a) the antipode case split (v'=0) and (b) the det-+1
parity of the deflated v-block, DERIVED from p's properness — NOT assumed.

## MEASURE-FIRST VERDICT (frozen before compute)
The det-parity propagation requires det values of explicit operators. TWO candidate routes for
"JoinedIdQvC ⟹ det = 1":
  - LEMMA A (continuity): `det : End Cut STVC → Cut` continuous on `endOpC` ⟹ locally constant on
    the isometry group ⟹ det = 1 on the identity component. MEASURED: `endOpC` is the
    POINTWISE-CONVERGENCE topology (induced from `STVC → STVC`), NOT a norm topology. Mathlib's
    `ContinuousLinearMap.continuous_det` needs a NORMED space — does NOT apply. Proving det
    continuous in the pointwise topology over derived `Cut` is its OWN substantial build (det =
    polynomial in toMatrix entries; each entry continuous via evaluation; needs basis machinery +
    Cut continuous-ring). HEAVY / uncertain. NOT the first bank.
  - LEMMA B (STRUCTURAL, the chosen route): `det_prodMap` (Mathlib) needs only Module.Free +
    Module.Finite — BOTH available for `Cut`, `O Cut`, `STVC`. Block-diagonal operators reduce
    cleanly: `det(octBlockEndC R) = det R`; for a QvC-isometry g fixing the t-axis and x-axis,
    `g = octBlockEndC (vBlockEndC g)` (N163 `qvIsom_fixingTX_eq_octBlockEndC`) so
    `det g = det (vBlockEndC g)`. `det(boostEndC a b) = a²−b² = 1` (boostEndC mixes only t,x — both
    Cut coords — so it is prodMap of a 2×2 boost and id on O Cut). CLEAN, BANKABLE NOW.

The DEEP remainder of the FULL unconditional closure (MEASURED as a genuine W3 decomposition, MORE
than one 45-min node):
  (1) `det(genBoostLin wx wv a b) = 1` — a 2-plane (t–ŵ) boost embedded in 10-dim, axis ŵ NOT a
      coordinate vector; needs conjugation-to-boostEndC or adapted-basis det. HEAVY.
  (2) `det(deflateNinth x' v') = 1` — a 2-plane (x–ê) rotation, axis ê not coordinate; same shape.
  (3) the antipode x'=−1 sub-case (k sends (0,1,0)↦(0,−1,0)) — a π-rotation, NOT x-fixing, so
      `joinedIdQvC_of_xtFixing_det_one` does not directly apply.
  (4) the det-multiplicativity bookkeeping propagating "p proper (det 1)" through `p = B·k` and the
      deflation to `det(v-block of deflateNinth·k) = 1`.

## GO / NO-GO (frozen)
GO = bank the CLEAN STRUCTURAL det-reduction keystone the det-propagation needs, NON-VACUOUS, gate
D0–D6 green, costume C203 biting a wrong det/closure value (1=171), foundations-only, committed +
LEDGER + ROADMAP; child the heavy det-of-boost / det-of-deflation / antipode-x'=−1 / final-assembly
remainder onto the chain tail.
  Target lemmas (bank-as-you-go, each committed the instant it compiles):
    B1. `det_octBlockEndC : LinearMap.det (octBlockEndC R) = LinearMap.det R`
    B2. `det_eq_vBlock_of_fixingTX` : for a QvC-isometry g fixing t-axis and x-axis,
        `LinearMap.det g = LinearMap.det (vBlockEndC g)`
    B3. `det_boostEndC : a²−b²=1 → LinearMap.det (boostEndC a b) = 1`
  If MORE compiles cleanly (det_genBoostLin via conjugation, det_deflateNinth, the antipode split),
  bank it too and push toward the unconditional theorem.

NO-GO / DECOMPOSE = if the heavy det-of-boost/deflation obligations resist after measure + trunk
reframe (the conjugation lemmas not banked, adapted-basis det fighting), bank B1–B3 (+ whatever
else compiled) and child the full det-parity propagation + antipode-x'=−1 + final assembly.

## KILL (classifies a fight as INSTRUMENT failure, not theory)
- KILL-1: any single `det`/`ring`/`simp` tactic on a fully-expanded 10-dim STVC coordinate det
  running > 90 s in a bounded probe ⟹ INSTRUMENT wall (W9): do NOT inflate maxHeartbeats; reduce
  via det_prodMap block structure instead. NEVER expand the full 10×10 det.
- KILL-2: ≥2 probe runs banking no new compiling lemma on the SAME obligation ⟹ stop probing,
  bank what compiled, decompose (W9 item 7).
- KILL-3: if det-of-genBoostLin/deflateNinth needs an adapted basis that does not assemble in <~15
  turns ⟹ child it, do NOT grind (W3, finalize with turns to spare).
- THE ONE LAW (W5): if any det bookkeeping FIGHTS, the framing is wrong — return to the trunk (B,
  deflateNinth, octBlockEndC are EXPLICIT derived operators; their dets are computable via block
  structure, never posited). Do NOT add a hypothesis; do NOT smuggle the v-block det=1 as input;
  do NOT weaken to the vacuous JoinedIdC.

## ANTI-VACUITY (W8)
The banked result must be NON-VACUOUS: the det-reduction must genuinely reduce a 10-dim det to the
v-block det (not a tautology); the costume C203 must bite a WRONG det value (1=171), failing to
compile, distinct from the banked battery (… C201 1=169, C202 1=170). Headline phrased so deleting
physics words leaves a real linear-algebra constraint over the derived Cut.
