# PREREG — N86: THE GLOBAL POLAR POSITIVE PART (g*g positive-self-adjoint + its operator √)

FROZEN before finalize. KILL classifies a fight as INSTRUMENT failure, not theory.

## TARGET (the chosen N86 front, after MEASURE-FIRST)
The GLOBAL POSITIVE PART of the polar/KAK decomposition, over the derived ℝ `Cut` + the
terminal algebra `O Cut`, riding the banked N85 full spectral existence + N68 spectral square
root + N59 form-adjoint composite:

For an arbitrary `Module.End Cut STVC` operator `g` with an EvC-adjoint `h` (`IsEvCAdjoint g h`):
  - `g*g := h∘g` is EvC-self-adjoint (N59 `comp_isEvCSymm`) AND EvC-positive-semidefinite
    (N59 `comp_nonneg`);
  - by the FULL spectral existence N85 `stvc_selfadj_specExists`, `g*g = specOpN c u` for an
    EvC-ORTHONORMAL eigen-family `{u i}`, with EVERY eigenvalue `0 ≤ c i`
    (`comp_specExists_nonneg`);
  - its positive operator square root EXISTS and is `specOpN (cutSqrt ∘ c) u` (N68
    `specOpN_op_sqrt`) — `comp_op_sqrt_exists` (the `p^{1/2}` factor of `g = k·p^{1/2}`);
  - the STRICT-POSITIVITY-via-INJECTIVITY lever: if `specOpN c u` is injective then every
    eigenvalue `0 < c i` (`specExists_eigen_pos`) — the invertibility prerequisite the inverse
    `(p^{1/2})⁻¹` (and hence the compact part `k := g·(p^{1/2})⁻¹`) consumes.

This is the immediately-bankable structural piece the ticket + ROADMAP §N86 name:
"the g*g-is-positive-self-adjoint lemma" + "the p^{1/2}-via-existence step (apply N85 to
p = g*g, then N68 for the root)".

## GO / NO-GO
GO if: all decls compile foundations-only `[propext, Classical.choice, Quot.sound]`; the costume
C117 bites a WRONG positive-part / square-root / eigenvalue claim (a false numeric DISTINCT from
the banked battery); gate D0–D6 green; physics-words-removable.

NO-GO / DECOMPOSE if: the global positive part is banked but the full assembly
`g = k·p^{1/2}` (the resolution of identity `∑ projC u_i = id` → the operator inverse
`(p^{1/2})⁻¹` → the compact part `k` with `k*k = 1` → connectedness → global reverse
surjectivity → `Spin(9)→SO(9)` exhaustion) resists — child the global remainder.

## KILL (instrument budget, W9)
KILL = 180s for any single obligation's compile. The probe family compiled clean at 7.6s
(measured). If any production obligation exceeds 180s, it is an INSTRUMENT failure → measure /
decompose / reframe through the trunk, NOT a longer grind. Max runtime 2700s/45min: checkpoint
(commit production + wiring) at ~50% turns, finalize (gate + child + complete) with turns to spare.

## DERIVATION CHAIN (unbroken, back to the fold)
g*g positivity = N59 `IsEvCAdjoint.comp_nonneg` = N58 `EvC_nonneg` = N56 Born self-overlap
positivity `gFormC_nonneg` (the trunk); the spectral existence = N85 ← N84 ← N83 ← … ← the
order-completeness of the derived ℝ `Cut`; the operator √ = N68 `specOpN_op_sqrt` = N57 `cutSqrt`
per N63 `projC`. NO posited Lorentz group, NO Mathlib ℝ/ℂ as content, NO bridge.

## COSTUME (C117) — must BITE
A WRONG eigenvalue-positivity / square-root claim that fails to compile, reducing to a false
numeric DISTINCT from the banked battery (… C115 1=7, C116 4=13). Candidate: a wrong operator
square root of a concrete g*g forcing a false scalar identity.
