# N170 — PREREG (frozen before production compute)

## THE NODE (route i, the LIKELY route per ROADMAP §N170)
Close the TIME-FIXING SPATIAL RESIDUAL. N169 banked `joinedIdQvC_of_timeFixing_residual`:
IF the time-fixing residual `k` (`k e₀=e₀`, `IsQvIsomC k`) is `JoinedIdQvC`, THEN every
orthochronous `QvC`-isometry `p` is `JoinedIdQvC`. N163 banked
`joinedIdQvC_of_timeFixing_evCOrth_SO9_aux`: a time-fixing `QvC`-isometry `k` whose x-axis image
moves to `(0,x',v')` with `v'≠0` and whose deflated stabilizer has octonion-v-block `det=1` is
`JoinedIdQvC`. The MEASURED gap N163 left: its `_aux` consumes a SPATIAL-FORM x-image
`k(0,1,0)=(0,x',v')` that N158 derived ONLY from an EvC-orthogonality hypothesis
(`evCOrth_xaxis_image_time_zero` via `evC_preserved_of_orth`).

## MEASURE-FIRST VERDICT (W1/W9, recorded BEFORE committing)
THE KEY MEASURE: does `k e₀=e₀` + `IsQvIsomC k` ALONE force the spatial form `(k(0,1,0)).1=0`,
WITHOUT the EvC-orthogonality hypothesis? **YES — DISSOLVABLE NOW.**
  - N163's own `qvIsom_fixingTX_vanish` (lines 89–104) already proves: a QvC-isometry fixing BOTH
    axes sends `(0,0,v)` to `(0,0,·)`, via `linIsom_BvC_preserved` (N51: any QvC-isometry preserves
    the indefinite `BvC`) + `BvC((0,0,v),e₀)=0` reading the t-slot.
  - The SAME pattern applies to the x-axis image directly: for a TIME-fixing QvC-isometry `k`
    (`k e₀=e₀`), `BvC(k(0,1,0), k e₀) = BvC((0,1,0), e₀)`. Since `k e₀=e₀` and `BvC(·,e₀)` reads the
    t-slot (`BvC p e₀ = p.1·1 - p.2.1·0 - gFormC p.2.2 0 = p.1`), and `BvC((0,1,0),e₀)=0`, we get
    `(k(0,1,0)).1 = 0`. **NO EvC-orthogonality needed.** The EvC hypothesis in N158/N163 was
    REDUNDANT — the t-slot vanishing is forced by the indefinite form alone (THE ONE LAW: the trunk
    form `BvC` IS the lever, not the auxiliary definite form `EvC`).
  - This is the W5/W1 reframe: the residual closure does NOT fight; the EvC-orthogonal framing was
    heavier than needed. Connect to N163's `_aux` (which only needs the spatial form + `v'≠0` + det)
    via a BvC-derived spatial form, dropping the EvC hypothesis entirely.

WHAT IS HEAVY (NOT attempted this node, childed): the FULLY UNCONDITIONAL closure needs (a) the
`v'=0` antipode case (x-axis FIXED, no peel — handled by N163's `joinedIdQvC_of_xtFixing_det_one`,
but needs det bookkeeping), and (b) translating "p proper" (the SO not O restriction) into
"det(vBlock of deflated k)=1" ACROSS the boost factorization. The det-parity bookkeeping across the
peel is the genuinely-heavy remainder. So this node banks the DISSOLVED spatial-form bridge +
the EvC-FREE time-fixing SO(9) assembly (under the explicit `v'≠0` + `det=1` hypotheses, which are
now the ONLY residual hypotheses), and childs the det-parity/antipode unconditional closure.

## GO / NO-GO (frozen)
GO (bank) iff ALL hold:
  1. `timeFixing_xaxis_time_zero`: `IsQvIsomC k` + `k e₀=e₀` ⟹ `(k(0,1,0)).1 = 0`. (BvC, clean.)
  2. `timeFixing_xaxis_spatial_form`: repackage to `k(0,1,0) = (0, x', v')`. (Prod.ext.)
  3. `joinedIdQvC_of_timeFixing_SO9`: `IsQvIsomC k` + `k e₀=e₀` + `v'≠0` + `det(vBlock(deflate·k))=1`
     ⟹ `JoinedIdQvC k`. (= N163 `_aux` fed by 1+2, EvC hypothesis DROPPED.)
  4. W8 witness `joinedIdQvC_timeFixingWitness`: a CONCRETE time-fixing x-moving QvC-isometry
     (`inflateNinth (3/5) ((4/5)•e₂)`) is `JoinedIdQvC` by route 3, and it MOVES the x-axis
     (`(0,1,0) ↦ (0, 3/5, (4/5)•e₂) ≠ (0,1,0)`), so NON-vacuous. det(vBlock(deflate·inflate))=1 via
     `deflate_inflate_id` ⟹ vBlock 1 = id ⟹ det = 1.
  5. All foundations-only `{propext, Classical.choice, Quot.sound}`; costume C202 bites a DISTINCT
     false numeric (1=170); gate D0–D6 green.

NO-GO / KILL (classify as INSTRUMENT failure, NOT theory failure — do NOT grind):
  - If the BvC t-slot read-off needs `nlinarith`/`ring` that exceeds a 60s bounded probe on the
    SMALLEST sub-obligation → it is an instrument framing problem (the read-off should be `simp`+
    `linarith` like N163's `qvIsom_fixingTX_vanish`); re-measure, do NOT inflate maxHeartbeats.
  - If the spatial-form dissolution genuinely FAILS (the t-slot does NOT vanish from BvC alone) →
    the MEASURE was wrong; STOP, do NOT add hypotheses to force it; re-examine whether EvC really is
    redundant. (Expected: it is redundant — `qvIsom_fixingTX_vanish` is direct evidence.)
  - COST BUDGET: each lemma ≤ 60s compile (all over banked levers, no coordinate brute expected).
    The whole file should build in < 3 min. If ANY single lemma exceeds 120s → W9 instrument wall,
    decompose that lemma; do NOT wait.

## DISCIPLINE
PREREG frozen (this file). Scratch probe in probes/ via `lake env lean`. Production in
`Phys/Algebra/LorentzContinuumTimeFixingResidualSO9.lean`. Wire Phys.lean + Audits/AxiomAudit.lean
(import at END + #print axioms). Costume C202 (1=170) ONE row in scripts/costume_manifest.tsv.
Gate bg. STANDARD check. Commit + LEDGER + ROADMAP. Child the unconditional det-parity/antipode
closure onto the chain tail. NO bridge, NO weakening, NO posited group/topology, NO Mathlib ℝ/ℂ.
