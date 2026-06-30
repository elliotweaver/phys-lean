# N202 — PREREG (frozen before compute)

## TARGET (front iv, measured WIDEST; fronts ii/iii rejected)
THE MEET OF THE TWO NON-ABELIAN SM GAUGE SUBALGEBRAS INSIDE g₂ = Der(O ℚ):
the embedded weak-isospin su(2) = ⟨innerDeriv hI, innerDeriv hJ, innerDeriv hK⟩ (N187, only
bracket constants banked, NEVER realized as a ℚ-LieSubalgebra of derivationLieQ) and the colour
su(3) = colourCentralizer = stabLieQ = {D : D u1 = 0} (N201/N42a) intersect in EXACTLY the
1-dimensional isospin Cartan line ℚ·(innerDeriv hI). I.e. the two factors are neither transverse
(meet ≠ 0) nor nested (meet ≠ either factor) — they share precisely a u(1).

## WHY GENUINELY NEW (not re-pin / not mechanical / not vacuous)
- N197 banked only PER-GENERATOR facts: innerDeriv hI u1 = 0 (commutes), innerDeriv hJ u1 ≠ 0
  (off-Cartan rotates J). It NEVER realized su(2) as a ℚ-subalgebra of g₂, NEVER computed the
  EXACT dimension of the colour-commuting part of su(2), NEVER handled a general combination
  a·DI+b·DJ+c·DK, NEVER touched innerDeriv hK u1.
- N201 banked colourCentralizer = stabLieQ dim 8 — the colour side alone, not its meet with su(2).
- NEW: (a) the ℚ-LieSubalgebra realization of isospin su(2) inside derivationLieQ (the embedded
  su(2) was only a triple of ℤ-derivations with the right brackets); (b) the meet = ℚ·DI, finrank 1
  — the precise statement "colour ∩ isospin = u(1)_Cartan". Requires linear independence of DI,DJ,DK
  AND the kernel computation on a general combination (beyond N197's single-generator checks).

## KEY MATH (worked out by hand)
innerDeriv hI u1 = 0                       (N197 innerDeriv_hI_u1)
innerDeriv hJ u1 = ιO(−2•hK)               (N197 innerDeriv_hJ_u1)
innerDeriv hK u1 = ιO(adHom hK hI) = ιO(hK·hI − hI·hK) = ιO(hJ − (−hJ)) = ιO(2•hJ)   [DK new]
⟹ (a DI + b DJ + c DK) u1 = ιO(−2b•hK + 2c•hJ) = 0 ⟺ b=c=0 (hJ,hK lin indep in H ℚ).
⟹ {colour-commuting isospin combos} = ℚ·DI, the 1-dim Cartan.

## MAKE-OR-BREAK (probe FIRST, W9 MEASURE)
Realize innerDeriv hI/hJ/hK (ℤ-linear Module.End ℤ (O ℚ)) as ℚ-linear Module.End ℚ (O ℚ) with
IsDerivQ, hence ∈ derivationLieQ. Route: an additive map on a ℚ-vector space is ℚ-linear
(AddMonoidHom.toRatLinearMap), and IsDerivQ transfers from the banked ℤ-Leibniz innerDeriv_isDeriv.
If this is light (< KILL), proceed. If heavy, look for a g₂-basis-coordinate realization or
DOWNSCOPE to the submodule-meet headline.

## GO / NO-GO
GO if: (1) ℚ-linearization + IsDerivQ probe compiles clean foundations-only; (2) DK u1 = ιO(2hJ)
compiles; (3) the meet/independence argument compiles. Each obligation under KILL.
NO-GO / DOWNSCOPE if: the ℚ-LieSubalgebra closure proof is heavy → bank the submodule-level meet
(span{DI,DJ,DK} ⊓ colourCentralizer.toSubmodule = ℚ∙DI) which is the same headline content; child
the LieSubalgebra packaging as optional.

## KILL (instrument-failure thresholds — frozen)
- Per obligation: 90s wall / 600000 heartbeats. If any single lemma exceeds → instrument wall,
  decompose or reframe through the trunk, NEVER inflate the ceiling.
- ≥2 probes ending at full budget banking nothing → W9 dissolution ticket, not another grind.
- O ℚ has NO Ring/Sub/MulOneClass: additive forms only, simp for unit facts,
  attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ, LinearMap.ext not `ext z`.

## COSTUME (W8, next id C234)
Must bite a WRONG meet dimension. The meet finrank GENUINELY = 1; a wrong claim (meet trivial/0,
or meet = whole su(2)/3, or transverse) forces e.g. `202 = 1` in ℕ. DISTINCT pair from battery
(… C232 200=-2, C233 201=8): use (202, 1).
