# N167 — PREREG (frozen before compute)

## TARGET (from ROADMAP §N167 FORWARD FRONTIER, re-read run 377)
Close the single residual `JoinedIdQvC p` for the positive self-adjoint `QvC`-isometry `p` of
N166's `bvIsomLin_polar_reduction_isom` — a continuous path of `QvC`-ISOMETRIES from `1` to `p`,
closing the UNCONDITIONAL full `SO⁺(1,9)` identity component `JoinedIdQvC g` for every proper
orthochronous `g`.

## MEASURE-FIRST VERDICT (W1/W9, before committing)
The FULL closure is the genuinely-heavy remainder. Two trunk-native routes, each measured:
- (a) THE SPECTRAL t-POWER `specOpN (fun i => cutSqrt(c i)^t) u`: needs a CONTINUOUS REAL POWER
  `cutRpow` over the derived ℝ `Cut`. GREP-CONFIRMED GENUINELY MISSING (no `def cutRpow`/`cutPow`
  exists; only doc/comment mentions). Building it from `Cut` is itself a number-tower sub-node
  (needs exp/log or a limit construction over `Cut`) — multi-run.
- (b) THE KAK FRAME-PRODUCT: express `p = specOpN (cutSqrt∘c) u` (eigenvalues `dᵢ=cutSqrt(c i)` on
  the EvC-orthonormal frame `u`) as a FINITE product of single-axis `boostEndC`, each a `boostPath`
  point, glued by `joinedIdQvC_listProd` (N157). Needs: (1) the eigenvalues come in reciprocal
  pairs `(λ,1/λ)` BECAUSE `p` is a `J`-isometry; (2) each pair on an eigenplane is one boost. The
  eigenvalue-pairing + eigenframe extraction is the heavy combinatorial/spectral part — multi-run.

⭐ THE ONE LAW REFRAME (the clean trunk lever bankable THIS run): `p` is EvC-self-adjoint
(`IsEvCSymm p` = `IsEvCAdjoint p p`) AND a `QvC`-isometry (N166). By the BANKED metric-condition
characterization `isQvIsom_iff_metric_condition` (h := p), this is EQUIVALENT to
    `p ∘ sigOpC ∘ p = sigOpC`   (i.e. `J p J = p⁻¹`),
the RECIPROCAL-PAIR / PURE-BOOST characterization — the precise structural pin the eigenframe
route (b) consumes. This is EXACTLY the "eigenvalue-reciprocal-pair characterization" the task
sanctions as a W3 decomposition lever.

## GO / NO-GO
- GO (bank, W3 DECOMPOSE): the reciprocal characterization of the polar positive part
  (`evCSymm_isQvIsomC_recip` engine + `bvIsomLin_polar_part_recip` application + the explicit
  inverse form `J p J = p⁻¹`), foundations-only, costume C199 bites, child the full
  eigenframe-extraction + path closure (the heavy remainder) onto the chain tail.
- NO-GO (block instead): if the reciprocal characterization does NOT compile cleanly from
  `isQvIsom_iff_metric_condition` (defeq `IsEvCSymm`↔`IsEvCAdjoint p p` fails unexpectedly), AND no
  cheaper trunk lever banks — then honest W1 dissolution ticket + block. (Not expected: it is a
  ~3-line application of a banked iff.)

## KILL (classifies a fight as INSTRUMENT failure, not theory)
- If ANY single obligation's smallest sub-proof burns >5 min OR needs `maxHeartbeats` above default
  → STOP, it is a W9 instrument wall (the reciprocal char must be cheap; if it isn't, the framing
  is wrong — return to trunk, do NOT inflate the ceiling).
- If I find myself trying to BUILD `cutRpow` or extract the eigenframe inside this run's budget →
  STOP, that is the heavy childed remainder, not this node. Bank the reciprocal lever, child the rest.
- NO new hypothesis/axiom to force a fight closed. NO weakening to the vacuous `JoinedIdC`.

## ANTI-VACUITY (W8)
Costume C199 (next id) bites a WRONG reciprocal / J-conjugation / positive-part claim, reducing to a
false numeric DISTINCT from the banked battery (… C197 1=165, C198 1=166 → use 1=167). The
reciprocal char is phrased in the operator identity `p∘J∘p = J` over the derived `Cut`, NON-VACUOUS
(the concrete boost `(5/3,4/3)` positive part satisfies it with a genuine non-identity operator).

## PHYSICS-WORDS-REMOVABLE
Delete Lorentz/boost/reciprocal/pure-boost/self-adjoint/isometry/positive-part/polar/KAK/eigenvalue/
signature/metric/Minkowski → the statements stand as pure math over the derived ℝ `Cut`, the
terminal algebra `O Cut`, `STVC`, the form `QvC`/`EvC`/`BvC`, the involution `sigOpC`: if `p` is
EvC-self-adjoint and preserves `QvC`, then `p∘sigOpC∘p = sigOpC`. No theorem STATEMENT needs a
physics word.
