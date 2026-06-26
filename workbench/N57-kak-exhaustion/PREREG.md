# N57 PREREG — frozen before compute

## Node
N57 — childed from N56. The heavy remainder is the REVERSE KAK exhaustion
(`qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`) + the full
`Spin(9)→SO(9)` exhaustion. The ROADMAP §N57 names the **MEASURE-FIRST** target:
the positive-definite SQUARE-ROOT lemma over the derived ℝ `Cut` — the first true
prerequisite the polar "boost part" `exp(p) = √(g*g)` rests on.

## The W1 reframe (THE ONE LAW — attack from the trunk, not the classical hard path)
Mathlib has NO general `sqrt` over `Cut` (only the specific derived `√2`). But the
square root does NOT need a bespoke lub construction: it DISSOLVES through the
COMPLETENESS THE CONTINUUM WAS BUILT WITH. `Cut` carries (all banked, N33–N37):
  - `ConditionallyCompleteLinearOrder Cut` (N33)
  - `OrderTopology Cut` + `IsTopologicalRing Cut` + `CompactIccSpace` (N34)
  - `Archimedean Cut` (N35), `CompleteSpace Cut` (N37)
The intermediate value theorem `intermediate_value_Icc` consumes exactly
(CCLO + OrderTopology + OrderClosedTopology) on the domain and a continuous map.
Squaring `fun x => x*x` is continuous because the derived ℝ is a topological ring.
So for `a ≥ 0`, pick `c = max 1 a` (⟹ `c² ≥ a` and `0² = 0 ≤ a`); IVT on `[0,c]`
yields `b ∈ [0,c]` with `b² = a`. The completeness is the SAME engine that built
the cut — this is the trunk, not a classical grind.

## GO / NO-GO (frozen)
GO (the bankable structural piece this run):
  `cutSqrt_exists : ∀ a : Cut, 0 ≤ a → ∃ b : Cut, 0 ≤ b ∧ b * b = a`
  via `intermediate_value_Icc` + continuity of squaring + `c = max 1 a`.
  Plus the immediate corollaries the polar boost part will consume:
  - uniqueness on the nonneg branch: `0 ≤ b → 0 ≤ b' → b*b = b'*b' → b = b'`
  - the named nonneg square root `cutSqrt a` (the witness) with `cutSqrt a ^ 2 = a`
    for `a ≥ 0`, `0 ≤ cutSqrt a`.

NO-GO / DECOMPOSE (W3): the GLOBAL reverse surjectivity
`qvIsomMonoidC (connected component) ≤ genIsomMonoidC2`, the polar decomposition
`g = k·exp(p)` assembly, connectedness, and the full `Spin(9)→SO(9)` exhaustion
are the genuine heavy group-manifold remainder. If they resist after this piece is
banked, child them onto the chain tail (the immediately-bankable square-root lemma
banks; the global exhaustion childs). Failure / silent scope-reduction NOT on the menu.

## KILL (W9 — instrument-failure budget, classifies a fight as instrument not theory)
- The square-root lemma is a single IVT application; KILL = 90s per obligation. If
  `intermediate_value_Icc` + continuity does NOT close the existence in a bounded
  scratch probe within 90s wall, that is an INSTRUMENT signal: STOP, do not inflate
  maxHeartbeats, re-measure the continuity lemma in isolation. No monolithic brute.
- No `native_decide`, no `sorry`, no `axiom`, no inflated `maxHeartbeats`.
- MEASURE the IVT existence in a throwaway probe BEFORE moving to production.

## Anti-vacuity (W8) — costume C88
The costume must bite a WRONG square-root claim. Candidate: a wrong square-root
identity — e.g. `(cutSqrt a)² = 2a` or a wrong witness `b` with `b*b = a` at a
concrete value (e.g. claim `√4 = 3` ⟹ `9 = 4`), reducing to a false numeric that
FAILS to compile. Reuse banked `Cut`; the WRONG claim must error.

## Physics-words-removable
Delete "Lorentz/boost/KAK/polar/square-root/isometry/positive-definite/Spin/SO(9)":
the statement is pure math — over the derived complete ordered field `Cut`, every
nonnegative element has a nonnegative square root (a²=given), unique on the nonneg
branch. No physics word is load-bearing.

## Discipline
PREREG frozen (this file). Scratch probe isolated → grep full errors → rm probe.
Production: new file `Phys/Algebra/LorentzContinuumSqrt.lean`. Wire Phys.lean +
AxiomAudit (import AT END OF IMPORT LIST + #print axioms). Costume = 1 row C88 in
scripts/costume_manifest.tsv. Gate bg. STANDARD check. Commit + LEDGER + ROADMAP.
Bank-as-you-go: the instant the sqrt lemma compiles clean → production + commit
BEFORE chasing anything bigger. Checkpoint ~50% turns; finalize with turns to spare.
