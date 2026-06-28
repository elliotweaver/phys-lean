# N152 PREREG — THE OPERATOR TOPOLOGY OVER Cut FOR THE CONNECTEDNESS OF SO⁺(1,9)

Frozen BEFORE compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## TARGET (front (i), measured-open)
Mathlib has NO topology on `Module.End Cut STVC` over the derived ℝ `Cut`. N96 dissolved the
*cone* connectedness of the positive part by convex arithmetic and EXPLICITLY childed the literal
topological connectedness ("N97", never built — chain pivoted to the Clifford/Pin arc). So the
genuinely-open structural gap is: BUILD the operator topology over `Cut` and prove the banked N96
affine spectral path `specPathOp c u : Cut → Module.End Cut STVC` is CONTINUOUS in it, so the
positive part is JOINED to the identity by a continuous path (path-connectedness, the identity
component of SO⁺(1,9)).

## GROUND (all banked, derived back to the fold)
- Derived ℝ `Cut` (ContinuumQ): OrderTopology (N34), CompleteSpace (N37), Archimedean (N35),
  IsTopologicalRing — instTopologicalSpaceCut, instOrderTopologyCut (ContinuumTopology.lean).
- `O Cut = CD (H Cut)`: ContinuousAdd, ContinuousSMul Cut, T2, CompleteSpace (OctonionTopology.lean).
- `STVC = Cut × Cut × O Cut`: product topology + Prod.continuousAdd + Prod.continuousSMul (MEASURE).
- N96 `specPathOp`, `specPathOp_zero` (γ0=id), `specPathOp_one`, `specPathOp_nonneg`,
  `specPathOp_connects` (LorentzContinuumSpectralPath.lean).

## GO / NO-GO (measured before commit)
- GO-1: `TopologicalSpace STVC`, `ContinuousAdd STVC`, `ContinuousSMul Cut STVC` all resolve by
  inferInstance (product instances). [MEASURE FIRST]
- GO-2: define operator topology `endOpC := induced (⇑·) inferInstance` on `Module.End Cut STVC`;
  evaluation `g ↦ g v` continuous; `Continuous f ↔ ∀ v, Continuous (fun x => (f x) v)`.
- GO-3: the affine path `fun t => (1-t)•A + t•B` is continuous (Cut topological ring + smul).
- GO-4: `specPathOp c u` continuous in `t`; γ joins id to p^{1/2} (Joined / a continuous path).
- NO-GO trigger: if STVC product topology instances do NOT resolve, or smul/add discontinuous —
  return to trunk, do NOT add a hypothesis. If the operator topology cannot be defined from the
  banked Cut-topology, that is the W1 dissolution ticket, not a grind.

## KILL BUDGET (W9 — instrument wall)
- KILL = 90s per single obligation. Whole-file probe target < 60s. Build < 90s.
- If any single tactic exceeds 90s, or ≥2 probe runs bank nothing → INSTRUMENT failure: MEASURE the
  smallest sub-obligation, DECOMPOSE, reframe through trunk. NO inflated maxHeartbeats, NO monolithic
  brute. The topology is pure typeclass + continuity-of-affine-combination — must be LIGHT.

## SCOPE / SUFFICIENCY (W4.5)
Classification-sufficient bank = the topology instance + evaluation continuity + affine-path
continuity + the N96 path continuous ⟹ id Joined to p^{1/2}. If path-connectedness of the FULL
group resists (needs surjectivity-of-cover transport + KAK), DECOMPOSE: bank the topology +
continuity + cone path-connectedness; child the full-group connectedness remainder.

## COSTUME C184
Must bite a WRONG operator-topology / continuity / path / connectedness read-off, reducing to a
false numeric DISTINCT from the banked battery (… C183 1=151). Use 1=152.
