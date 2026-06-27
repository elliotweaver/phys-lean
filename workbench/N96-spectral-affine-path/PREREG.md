# N96 PREREG — frozen before compute

## NODE
The one-parameter SPECTRAL AFFINE PATH realising the positive part's connectedness to the
identity over the derived ℝ `Cut` — priority (i) of the N96 forward frontier, REFRAMED through
the trunk to dissolve the missing continuous power `(c i)^t`.

## MEASUREMENT (done before PREREG froze)
- `cutRpow`/`cutPow`/operator-`exp` over `Cut`: ABSENT (confirmed; a continuous real power
  `(c i)^t` is genuinely missing, exactly as the ticket warned).
- NO operator topology over `Cut` (`TopologicalSpace (Module.End)` / `ContinuousLinearMap`):
  ABSENT — so literal topological connectedness of the operator group is the W1 HEAVY remainder.
- BUT: `specOpN l u = ∑ i, l i • projC (u i)` is AFFINE/linear in the eigenvalue family `l`
  (banked `Phys/Algebra/LorentzContinuumSpectralN.lean`); the positive cone `{l ≥ 0}` is CONVEX
  over the ordered field `Cut`; `Cut` has `OrderTopology` + `IsTopologicalRing` (N34).
- Banked levers ALL present: `specOpN_apply/_isEvCSymm/_nonneg/_read/_comp/_op_sqrt` (N68),
  `specOpN_one_eq_sum_projC`, `stvc_resolution_of_identity` (`∑ projC (u i) = id`),
  `specOpN_comp_two` (N87); `cutSqrt_nonneg/_sq/_four_eq_two` (N57).

## THE TRUNK REFRAME (W1 step 2 — the dissolution)
The literature connects the positive part `p^{1/2}` to `id` via the operator EXPONENTIAL of the
(self-adjoint) generator — `exp(t·log p^{1/2})` — which needs the missing continuous power /
`exp` / operator topology. The TRUNK dissolves it: because `specOpN` is AFFINE in the eigenvalue
family and the positive cone is CONVEX, the STRAIGHT-LINE eigenvalue segment
  γ(t) := specOpN (fun i => (1−t)·1 + t·cutSqrt(c i)) u
connects γ(0) = specOpN 1 u = id (resolution-of-identity) to γ(1) = specOpN (cutSqrt∘c) u = p^{1/2}
(the banked positive operator square root of p = specOpN c u), staying EvC-SELF-ADJOINT and
EvC-POSITIVE-SEMIDEFINITE for every t∈[0,1] — a path of positive operators through the cone.
No power, no exp, no analysis, no operator topology: pure ordered-field convex arithmetic over
the derived ℝ `Cut`. The transcendental rapidity/operator-power flow becomes the affine segment.

## GO / NO-GO
- GO if: the affine path def + endpoints (γ0=id, γ1=p^{1/2}) + self-adjointness ∀t + cone
  positivity ∀t∈[0,1] + the p^{1/2}-is-opsqrt endpoint all compile foundations-only, with a
  concrete non-vacuity witness (the resolution family, c = fun _ => 4, midpoint eigenvalue 3/2).
- NO-GO / DECOMPOSE if: any single obligation needs an unbanked analytic fact (continuity of the
  path in an operator topology that does not exist) — then bank the ALGEBRAIC path family (the
  positive-cone segment, endpoints, self-adjoint+positive ∀t) and child the operator-topology
  continuity / global reverse-surjectivity remainder.

## KILL BUDGET (W9 — classify a fight as INSTRUMENT failure, not theory)
- Each obligation is `LinearMap.ext` + `specOpN_apply` + `Finset.sum_congr` + `ring`/`nlinarith`
  over a FINITE sum — bounded, no coordinate blow-up, no monolithic brute.
- KILL: if any one sub-lemma does not elaborate in a bounded scratch probe within ~60s, or wants
  an inflated `maxHeartbeats`, STOP — it is an instrument wall: decompose that obligation into
  smaller banked steps or reframe. NO inflated ceiling, NO monolithic `ring`/`simp`/`decide` on a
  fully-expanded coordinate goal. `lake build Phys` is cached ~5-35s when oleans warm.
- Bank-as-you-go: the instant the path family + endpoints compile, MOVE to production + commit
  BEFORE chasing the witness/costume. Finalize with turns to spare.

## COSTUME C128 (W8 teeth — must BITE)
A WRONG midpoint reading of the affine path: the genuine midpoint (t=1/2, c=fun _=>4) eigenvalue
reading is 3/2 (via specOpN_read), so 2·reading = 3; a bogus claim that it equals some other
value forces a FALSE numeric DISTINCT from C115 1=7 … C127 1=12 (target: 3 = 13).

## PHYSICS-WORDS-REMOVABLE
Delete "Lorentz/boost/isometry/connectedness/path/positive part/spectral/eigen*/identity-
component/KAK/polar/rapidity/SO(9)/Spin": the statements stand as pure math about
specOpN/cutSqrt/projC/EvC/IsEvCOpSqrt over the derived `Cut` + the convex positive cone.
