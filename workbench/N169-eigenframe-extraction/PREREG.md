# N169 — THE BOOST PEEL (eigenframe extraction core reduction) — PREREG (frozen before compute)

## TARGET (route i, trunk-native reframe of the eigenframe extraction)
Close the eigenframe extraction's CORE structural reduction: every orthochronous `QvC`-isometry
`p` (`0 ≤ (p e₀).1`, e₀ = (1,0,0)) factors as `p = B · k` where
  - `B := genBoostLin wx wv a b` is a FORWARD general-axis boost (N168), with the boost data
    READ OFF `p e₀`: `a := (p e₀).1`, `b := cutSqrt nrm`, `ŵ := (s_x/b, (1/b)•s_v)`,
    `nrm := s_x² + gFormC s_v s_v`, `s := (p e₀).2`;
  - `k := B⁻¹ · p` is a TIME-FIXING `QvC`-isometry (`k e₀ = e₀`).
Hence (corollary, the JoinedIdQvC reduction): if the time-fixing residual `k` is `JoinedIdQvC`,
then `p` is `JoinedIdQvC` (boost JoinedIdQvC by N168 `joinedIdQvC_genBoostLin` + `joinedIdQvC_mul`).

This is the SIGNATURE-(1,9) geometry made operator-explicit: ONE boost peels the UNIQUE timelike
mixing direction off `p`, leaving a purely-spatial (time-fixing) residual. The hyperbolic mirror
of the N158 spatial Householder peel.

## THE CRITICAL LEVER (de-risk FIRST)
`genBoostLin_comp_inv`: for unit ŵ (`wx²+gFormC wv wv=1`) and `a²−b²=1`,
  `genBoostLin wx wv a b * genBoostLin wx wv a (-b) = 1`   (operator identity)
(the reverse boost a(−b) inverts the boost a b). Both directions follow from this one lemma
(swap b ↔ −b, a²−(−b)²=a²−b²=1). Same arithmetic family as the banked `genBoostLin_isQvIsomC`
(per-coordinate ring / linear_combination after gFormC bilinearity).

## GO / NO-GO
- GO if `genBoostLin_comp_inv` compiles clean (foundations-only, no inflated heartbeats, < ~60s).
  Then assemble: read-off `B e₀ = p e₀` (degenerate nrm=0 branch: p e₀=e₀, B=1, k=p), `k`
  isometry (`isQvIsomC_mul`), `k e₀ = e₀`, factorization `p = B·k`, JoinedIdQvC corollary.
- NO-GO / DECOMPOSE further if `genBoostLin_comp_inv` resists: bank the smaller piece
  (the read-off `B e₀ = p e₀` alone, or the boost-inverse on e₀ only) and child the rest.

## KILL (classify a fight as INSTRUMENT failure, not theory)
- If `genBoostLin_comp_inv` needs `maxHeartbeats` inflation or a monolithic brute over expanded
  coordinates, or any single obligation compiles > 60s → W9 instrument wall: STOP, do not inflate,
  decompose into per-coordinate sub-lemmas or reframe through `genBoostLin_apply` + gFormC bilinearity.
- If the spectral/full `p = B` (k = id) is attempted and FIGHTS (it needs `B⁻¹p` self-adjoint, which
  needs commutation) → THE ONE LAW (W5): that is the heavy spectral remainder; do NOT grind it. Bank
  the peel reduction `p = B·k` (unconditional) + child the time-fixing residual closure (N163 descent:
  certify `k` EvC-orthogonal + det=1 / proper-orthochronous). Failure/weakening NOT on the menu.

## ANTI-VACUITY (W8)
Headline phrased in `JoinedIdQvC` (NON-vacuous), not `JoinedIdC`. The factorization genuinely uses
the boost/isometry/positivity structure (read-off from `p e₀`, the reciprocal-pin geometry), not a
generic connectedness. Costume C201: a WRONG boost-peel / read-off / inverse claim reducing to a
false numeric DISTINCT from the battery (… C200 1=168 → use 1=169).

## DISCIPLINE
Probe isolated (workbench/N169-eigenframe-extraction/probes/, `lake env lean`, grep full errors).
Production new file Phys/Algebra/LorentzContinuumBoostPeel.lean; wire Phys.lean + Audits/AxiomAudit.lean
(import at tail + #print axioms). Verify #print axioms ⊆ {propext,Classical.choice,Quot.sound} vs built
olean. Costume = 1 row scripts/costume_manifest.tsv (C201). Gate bg. STANDARD check. Commit + LEDGER +
ROADMAP. Child the next node (time-fixing residual closure) onto the chain tail, max_retries=25.
