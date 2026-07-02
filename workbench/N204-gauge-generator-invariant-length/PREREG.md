# PREREG — N204 (frozen GO/NO-GO + KILL before compute)

## NODE
THE CANONICAL INVARIANT-FORM NORMALIZATION OF THE WEAK-ISOSPIN su(2) INSIDE g₂ = Der(O ℚ).
The Killing-type defining trace form `B = LieModule.traceForm ℚ derivationLieQ (O ℚ)` (banked
N23/N24, `DerivationCompact.lean`: negative-definite, nondegenerate) restricted to the embedded
weak-isospin triple `DI, DJ, DK` (N202 ℚ-realization of N187 inner derivations) has GRAM MATRIX
`−16 • I₃`:
  • B(DI,DI) = B(DJ,DJ) = B(DK,DK) = −16   (equinormalized)
  • B(DI,DJ) = B(DJ,DK) = B(DK,DI) = 0      (orthogonal)
so the three generators form a CANONICALLY-NORMALIZED ORTHOGONAL COMPACT FRAME inside g₂ —
the convention-free normalization the SM POSITS by hand, here FORCED by the unique invariant
form of the simple ambient algebra.

## WHY GENUINELY NEW (not a re-pin of N201/N202/N203, not gold-plating N24)
- N201/N202/N203 worked the BRACKET / SUBMODULE / NORMALIZER layer (the Lie-algebraic skeleton:
  centralizer, meet, ideal-structure). THIS node is the METRIC layer — the invariant bilinear
  form evaluated ON the gauge generators, never done before.
- N24 banked B negative-definite on the WHOLE algebra and computed it only on the abstract
  witness `witnessLieQ` (value stated merely as `< 0`). It never evaluated B on a NAMED gauge
  generator, never produced an explicit value, never the isospin Gram matrix.
- THE NON-MECHANICAL DATUM: the explicit value `B(DI,DI) = −16`. The brackets ALONE do not fix
  it (they are scale-covariant); it is the embedding/normalization index — which su(2) the weak
  isospin is, metrically, inside g₂. This is the new content. Equinorm + orthogonality then
  propagate from this ONE value THROUGH THE TRUNK (invariance `B ⁅x,y⁆ z = B x ⁅y,z⁆` +
  the banked structure constants) — a genuine CONNECTION N24(metric) ↔ N187/N203(brackets),
  NOT a coordinate juxtaposition.

## THE ROUTE (THE ONE LAW reframe — invariance, not 6 coordinate bashes)
1. Lift the two missing cyclic brackets to `derivationLieQ` (copy N203 `bracket_DI_DJ_eq`):
   `bracket_DJ_DK_eq : ⁅DJ,DK⁆ = 2•DI`, `bracket_DK_DI_eq : ⁅DK,DI⁆ = 2•DJ`.
2. ONE coordinate computation (measured ~28s, tractable): `traceForm_DI_DI : B DI DI = −16`
   via `traceForm_apply_neg` + `gForm_self_sum_sq` + explicit `bO j` + `norm_num`.
3. Equinorm via invariance: `2·B(DK,DK) = B(⁅DI,DJ⁆,DK) = B(DI,⁅DJ,DK⁆) = B(DI,2•DI) = 2·B(DI,DI)`
   ⟹ B(DK,DK)=−16; cyclically B(DJ,DJ)=−16.
4. Orthogonality via invariance + skew: `B(DI,DJ) = ½B(⁅DJ,DK⁆,DJ) = ½B(DJ,⁅DK,DJ⁆)
   = ½B(DJ,−2•DI) = −B(DI,DJ)` ⟹ 0; cyclically the other two.
5. HEADLINE: assemble the Gram matrix `= −16 • (1:Matrix)` OR the structural conclusion that
   B restricted to the isospin span is negative-definite & nondegenerate with this normalization.
6. TEETH (W8): `B(DI,DI) ≠ 0` and `B(DI,DI) < 0` (the frame is genuinely compact, not null).

## GO / NO-GO
GO if: traceForm_DI_DI = −16 compiles clean foundations-only (MEASURED: full sum closes ~28s,
exit 0, probe4); the two cyclic bracket lifts compile (MEASURED: bracket_DI_DJ_eq is banked,
same shape); invariance derivations close cheaply.
NO-GO / look wider if: the value comes out 0 (vacuous), or the node reduces to a re-statement of
N24 / N203 with no new datum.

## KILL (W9)
- Per-obligation KILL = 90s wall / 800000 heartbeats. The single coordinate bash measured ~28s;
  if ANY obligation exceeds 90s, STOP, do not inflate — decompose or reframe through invariance.
- Whole-module olean build KILL = 200s. If exceeded, split the file.
- If ≥2 routes blow up: W1 dissolution ticket, not a grind.

## ANTI-VACUITY (W8)
Costume C236: a WRONG normalization value. The genuine `B(DI,DI) = −16` (`traceForm_DI_DI`); the
wrong claim that it is some other value forces a false numeric. Use a DISTINCT pair from the
battery (… C233 201=8, C234 202=1, C235 203=2): e.g. `204 = -16` (or `-16 = 204`). PASS_SIGNATURE
an ERE.

## NAME-COLLISION CHECK (before finalize)
grep: traceForm_DI_DI / traceForm_DJ_DJ / traceForm_DK_DK / traceForm_DI_DJ / traceForm_DJ_DK /
traceForm_DK_DI / bracket_DJ_DK_eq / bracket_DK_DI_eq / isospin_gram / traceForm_DI_DI_neg
across Phys/ Counterexamples/ Audits/ Phys.lean.

## STANDARD (words-removable)
Delete colour/isospin/su(2)/g₂/gauge/Cartan/normalization/compact/Killing: what remains is — over
the derived field ℚ and the Cayley–Dickson double O ℚ = CD (H ℚ), the defining trace form of the
inner-derivation Lie algebra takes value −16 on each of the three inner derivations
innerDeriv hI/hJ/hK and 0 on each distinct pair; pure algebra, no theorem statement needs a
physics word.
