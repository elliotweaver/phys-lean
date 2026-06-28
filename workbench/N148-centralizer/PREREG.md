# N148 — THE CENTRALIZER DISSOLUTION CORE (covers-id ⟹ scalar)

Frozen GO/NO-GO + KILL before compute. The honest W1 node measured at N147: the
Clifford supercenter=scalars theorem Mathlib LACKS, which with N147's
`coverMapPinUnit_injmodcenter_of_scalar` assembles the EXACT KERNEL
`MonoidHom.mker coverMapPinUnit = {1,-1}`.

## THE MEASURED TRUNK-NATIVE REFRAME (W1 step 2 / THE ONE LAW)

The target hypothesis `hcent` of N147's reduction is:
  every `u ∈ mker coverMapPinUnit` is a scalar `algebraMap μ`.

`u ∈ mker coverMapPinUnit` means `coverOp u = id`, i.e. `u` COVERS the identity:
  `∀ v, involute(↑u) · ι v · ↑u⁻¹ = ι v`     (CliffCovers ↑u id)
Multiply on the right by `↑u`:
  `∀ v, involute(↑u) · ι v = ι v · ↑u`.       (★ the covering-id identity)

REFRAME (do NOT classify the supercenter abstractly — DISSOLVE through the
cascade's own Clifford contraction, the Born/overlap pairing). Mathlib's
`contractLeft d` (interior product by a dual `d`) satisfies the super-Leibniz
generator rule `contractLeft_ι_mul`:
  `d⌋(ι a * b) = d a • b - ι a * (d⌋b)`.
With `d = polarBilin QvCQuad a` (so `d a' = polar a a'`), an induction over the
left-generated form (`left_induction`) gives THE MASTER IDENTITY:
  **`ι a * x - involute(x) * ι a = contractLeft (polarBilin QvCQuad a) x`**   (M)
for every `x : CliffC`, every `a : STVC`. (Both sides are `Cut`-linear in `x`;
they agree on `algebraMap r` (0=0), and the generator step `x = ι m * x'` is the
super-Leibniz rule with the involute sign flip. Verify by `left_induction`.)

Now if `↑u` covers id then (★) gives `involute(↑u)·ι v = ι v·↑u`. Apply (M) with
`x = ↑u`, swapping the roles — actually the cleanest route: the covering-id
identity (★) is exactly `involute(↑u)·ι v - ι v·↑u = 0`. There is a SECOND master
identity (right form, by `right_induction` / `contractRight_mul_ι`):
  **`involute(x) * ι a - ι a * x = contractRight x (polarBilin QvCQuad a) · (sign)`** —
MEASURE the exact right-contraction form in probe. The upshot we DRIVE TO:
  covering-id  ⟹  `contractLeft (polarBilin QvCQuad v) (↑u) = 0` for all v
  (every interior product of `↑u` by a polar-dual vanishes).

Then LEMMA Z (the precise, Mathlib-shaped remaining gap):
  **an element `x : CliffC` with `contractLeft (polarBilin QvCQuad v) x = 0` for
  ALL `v : STVC` is a SCALAR `algebraMap μ`** — because `polarBilin QvCQuad` is
  NONDEGENERATE over the derived ordered field `Cut` (the polar duals span the
  whole `Module.Dual Cut STVC`), so all interior products of `x` vanish, and an
  element killed by every interior product has no part of grade ≥ 1 (the
  contraction detects the top generator of any monomial) ⟹ grade 0 ⟹ scalar.

## THE DECISION (priority)
- (i) MASTER IDENTITY (M) + covering-id ⟹ contraction-kernel REDUCTION:
  bounded, trunk-native, GENUINELY NEW content (the supercenter condition
  DISSOLVED into the contraction condition via the cascade's own Born pairing).
  BANK FIRST. Confidence HIGH.
- (ii) LEMMA Z (contraction-kernel ⟹ scalar via nondegeneracy of polarBilin):
  the precise remaining gap. ATTEMPT in probe. Needs nondegeneracy of the
  derived `BvC`/`polarBilin` (polar duals span the dual) + a grading/degree
  detection argument. If it closes within budget → bank, COMPLETE the centralizer
  fact + assemble `mker coverMapPinUnit = {1,-1}`. If it RESISTS after measure +
  reframe → CHILD it precisely (N149) as the immediately-bankable remainder, bank
  (i) + the conditional assembly, complete this node as a DECOMPOSITION.

## GO / NO-GO
- GO if the master identity (M) compiles clean and the covering-id ⟹
  contraction-kernel reduction compiles clean (these are the bankable core).
- Assemble the FULL exact kernel ONLY if Lemma Z also closes; else child Lemma Z.

## KILL BUDGET (W9 — instrument failure, not theory)
- max runtime 2700s / iteration budget 90. Checkpoint ~50%.
- Per-obligation KILL: 90s. Any single tactic > 90s on a sub-obligation = INSTRUMENT
  failure → measure/decompose/reframe, do NOT raise heartbeats.
- The master identity is `left_induction` (3 cases, each a rewrite chain) — bounded,
  no brute, no tsum, no exponential. If it does NOT close in a few `rw`/`simp`,
  the FRAMING is wrong (re-check the involute sign / contraction direction), not
  the budget.
- Lemma Z grading argument: if the degree-detection blows up or needs a coordinate
  brute over 2^10 monomials, that is the W9 signal → CHILD it, do not grind.

## COSTUME (next id C180)
Must bite a WRONG centralizer/supercenter/scalar/covers-id/commutant/contraction/
exact-kernel claim, reducing to a false numeric DISTINCT from C179 1=147. Use 1=148.

## PHYSICS-WORDS-REMOVABLE
Delete centralizer/supercenter/commutant/scalar/cover/spinor/Clifford/Pin/Spin/
kernel/exact-kernel/contraction/Born/interior-product: the statements stand as pure
algebra over the derived field `Cut`, the Clifford algebra `CliffC` of `QvCQuad`,
its `ι`, `involute`, `contractLeft`, and the submonoid `PinUnitSub`.
