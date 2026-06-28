# N136 PREREG — THE COVER KERNEL {±1} (the two-to-one "double" half of the double cover)

FROZEN BEFORE COMPUTE. KILL budget classifies a fight as INSTRUMENT failure, not theory.

## THE MEASURED TARGET (W1/W4.5 — ADVANCE, do not re-pin)
N135 closed the cover sector's SURJECTIVITY end-to-end: `cover_global_bvIsom` — every
`g ∈ bvIsomLinMonoid = SO⁺(1,9)` has a Clifford covering unit `u : CliffCˣ` with `CliffCovers u g`.
That is the "cover" (onto) half. It does NOT capture the DEFINING feature of a *double* cover: the
**kernel {±1}** — the TWO-to-one structure. The forward joint (priority i) the global cover OPENS is
exactly this: the fiber over each isometry is `{u, -u}`, and the kernel of the cover map (the units
covering the IDENTITY) contains the nontrivial `{±1}`.

This is NOT re-pinning surjectivity (N135). It is the orthogonal structural fact: surjectivity says
the fiber is nonempty; the kernel says the fiber is a `{±1}`-torsor. Together they characterize the
map `Pin(1,9) ↠ SO⁺(1,9)` as a genuine two-to-one (double) cover.

## DERIVATION (the trunk — all from the banked CliffCovers predicate + Mathlib involute)
The cover predicate `CliffCovers u g := ∀ v, involute(↑u)·ι v·↑u⁻¹ = ι(g v)`. Negating the unit:
  involute(↑(-u))·ι v·↑(-u)⁻¹ = involute(-↑u)·ι v·(-↑u⁻¹)
    = (-involute ↑u)·ι v·(-↑u⁻¹)            [map_neg: involute is a RingHom]
    = involute(↑u)·ι v·↑u⁻¹                 [the two signs cancel]
    = ι(g v).
So `-u` covers the SAME `g` — the fiber over `g` is `{u, -u}`, the two-to-one. Applied to
`cliffCovers_one` (`1` covers `id`): `-1` also covers `id` — the nontrivial kernel element. And
`(-1 : CliffCˣ) ≠ 1` (the kernel is genuinely TWO elements) because `CliffC` is a nontrivial
char-0 algebra over the derived field `Cut`, so `(2 : CliffC) ≠ 0`, i.e. `-1 ≠ 1`.

## DECLS TO BANK (target)
- `cover_neg_unit`     : `CliffCovers u g → CliffCovers (-u) g` — THE TWO-TO-ONE: negate the unit,
                         same isometry; the fiber over `g` contains both `u` and `-u`.
- `cover_kernel_neg_one`: `CliffCovers (-1 : CliffCˣ) (1 : Module.End Cut STVC)` — `-1` covers the
                         identity, the NONTRIVIAL kernel element (with `cliffCovers_one`: `1` too).
- `cover_kernel_distinct`: `(-1 : CliffCˣ) ≠ (1 : CliffCˣ)` — the kernel `{±1}` is genuinely two
                         elements (char-0 nontrivial Clifford algebra over `Cut`).
- `cover_fiber_pair`   : `CliffCovers u g → CliffCovers w g → (w = u ∨ ...)` — OPTIONAL, only if the
                         full fiber-is-exactly-{±u} closes cheaply; else child it. (Full kernel =
                         {±1} EQUALITY requires the cover injective-mod-center; measure, may be W1.)
- W8 teeth:
  `cover_neg_global_boost` : the concrete boost `(5/3,4/3)` is covered by BOTH `u` and `-u`.
  `cover_kernel_two_distinct_units` : a numeric/structural read-off the costume C168 negates.

## GO / NO-GO
GO if `cover_neg_unit` + `cover_kernel_neg_one` + `cover_kernel_distinct` all compile clean
(foundations-only) within budget. These three ARE the two-to-one kernel structure — sufficient for
the node. `cover_fiber_pair` (full fiber = {±u}) is OPTIONAL: bank if cheap, else child.
NO-GO / W1 dissolution ticket if the kernel `≠`-distinctness (`-1 ≠ 1` in CliffC) genuinely resists
(would need a Nontrivial/char-0 fact Mathlib lacks for `CliffordAlgebra` over `Cut` — MEASURE first).

## KILL BUDGET (W9 — INSTRUMENT failure line)
- Per single obligation: KILL at 120s. If any one lemma's smallest sub-obligation exceeds 120s,
  it is an INSTRUMENT failure → measure/decompose/reframe, NOT a longer grind.
- Whole probe: KILL at 240s. If the probe as a whole exceeds 240s, decompose before committing.
- These are LIGHT cover identities (N133/N134/N135 were all ~10-25s); expect the same. Anything
  heavier is the signal the framing is wrong (THE ONE LAW) — return to the trunk, do not inflate.
- NO inflated `maxHeartbeats`, NO monolithic brute. `noncomm_ring` for the Clifford regroups (the
  banked pattern), `map_neg`/`neg_mul`/`mul_neg` for the sign cancellation.

## COSTUME C168 (W8 — MUST BITE)
A WRONG cover-kernel / two-to-one / double-cover / SO⁺(1,9)-structure claim, reducing to a false
numeric DISTINCT from C115 1=7 … C167 1=135. Candidate: the kernel of the cover has order ... read
off `cover_global_timelike_scalar_unit` ((QvC mTimeUnit)⁻¹ = 1) ⟹ claiming `136` forces `1 = 136`.
PASS_SIGNATURE matches a trailing `1 = 136` (ERE, no leading `-`, distinct from 1=135).

## PHYSICS-WORDS-REMOVABLE
Delete cover/Pin/Spin/kernel/double/two-to-one/spinor/Lorentz/isometry/grade/involution/SO⁺(1,9):
what remains is pure algebra over the derived field `Cut`, the Clifford algebra `CliffC` of `QvCQuad`,
Mathlib's `involute`, and the predicate `CliffCovers`: negating a covering unit preserves the covered
map; `-1` and `1` both cover the identity and are distinct. No theorem STATEMENT needs a physics word.
