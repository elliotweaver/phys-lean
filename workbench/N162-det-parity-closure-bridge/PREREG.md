# N162 — THE DET-PARITY CLOSURE BRIDGE — PREREG (frozen before compute)

## TARGET (priority (i), specified against what the chain produced)
Every det +1 (SO(8)) `gFormC`-isometry `S` of `O Cut` lifts to the NON-VACUOUS `JoinedIdQvC`
(`JoinedIdQvC (octBlockEndC S)`). N124's `gFormC_isom_mem_closure` gives membership in
`Submonoid.closure houseHolderSet` — a FLAT reflection word of UNKNOWN length parity. The
residual: certify that det +1 forces an EVEN reflection word, re-pair two-at-a-time into general
bireflections, feed N161's banked `joinedIdQvC_octBlockEndC_bireflectionWord`.

## MEASURE-FIRST FINDINGS (levers located, costs estimated)
- `Submonoid.exists_list_of_mem_closure` (Mathlib, Algebra/Group/Submonoid/Membership.lean:253):
  `x ∈ closure s → ∃ l : List M, (∀ y ∈ l, y ∈ s) ∧ l.prod = x`. THE WORD LEVER.
- `LinearMap.det` is a `MonoidHom` (`det_comp`/`det_id`/`det.map_mul`/`det.map_one`,
  Determinant.lean) — word-det multiplicative; `Module.Finite/Free Cut (O Cut)` from
  `instFiniteOCut` + finrank 8 (N122 `finrank_O_eq_eight_Cut`).
- `det(houseHolder a) = -1`: the genuine content residual. Candidate routes:
  (R1) rank-one matrix lemma `Matrix.det_one_add_replicateCol_mul_replicateRow` after a
       `LinearMap.toMatrix` translation (W9 RISK — matrix translation heavy);
  (R2) eigenspace split: houseHolder negates the `a`-line, fixes `a^⊥` (dim 7) ⇒ det = (-1)^1·1^7.
       Needs a basis adapted to `span a ⊕ a^⊥` (also nontrivial).
  (R3) reframe: maybe avoid det entirely — see DECOMPOSITION below.
- N161 `joinedIdQvC_octBlockEndC_bireflectionWord` (BANKED): a `List (O Cut × O Cut)` of
  nonzero-norm pairs lifts to `JoinedIdQvC`. THE TARGET ENGINE — do NOT re-derive.

## PLAN (bank-as-you-go, smallest first)
1. **CORE (det-free, trunk-native):** the EVEN-list pairing lemma. Given `L : List (O Cut)` of
   nonzero-Born-norm axes with `Even L.length`, re-group two-at-a-time and show
   `(L.map houseHolder).prod = (pairs.map (fun t => houseHolder t.1 * houseHolder t.2)).prod`,
   hence `JoinedIdQvC (octBlockEndC ((L.map houseHolder).prod))` via N161. PURE list combinatorics
   + N161. Bank FIRST. This is the genuine core.
2. **DET lemma:** `det(houseHolder a) = -1` for `gFormC a a ≠ 0`. Measure R1 first (smallest
   matrix obligation). If genuinely heavy after measure + reframe → DECOMPOSE: child the det/parity
   homomorphism as a dedicated node, bank the even-pairing core + the closure-word-to-list
   plumbing now, and phrase the SO(8) bridge with the even-length hypothesis pending det discharge.
3. **BRIDGE:** assemble. `gFormC_isom_mem_closure S` → `exists_list_of_mem_closure` → reflection
   axis list `L` with `S = (L.map houseHolder).prod` → `det S = (-1)^L.length` → `det S = 1`
   forces `Even L.length` → pairing core → `JoinedIdQvC (octBlockEndC S)`.

## GO / NO-GO
- GO if: the even-pairing core compiles clean AND (det lemma compiles within budget OR a clean
  decomposition childs the det piece honestly). Production phrased in NON-VACUOUS JoinedIdQvC.
- NO-GO (block + dissolution child) if: after measure + reframe BOTH the det lemma and any
  det-free parity route resist, leaving the even-pairing core banked but the full SO(8) bridge
  unreachable this run.

## KILL (instrument-failure thresholds — declare W9 INSTRUMENT failure, not theory failure)
- det(houseHolder)=-1 via R1: if the SMALLEST matrix obligation (toMatrix of houseHolder, or the
  rank-one application) does not elaborate in a bounded probe within ~2 min OR needs maxHeartbeats
  above default → R1 is dead, try R2; if R2 also dead → DECOMPOSE det into a child, do NOT grind.
- Any single tactic with no output > 2 min, or RSS climbing into many GB → STOP, decompose.
- ≥2 probe runs on the same obligation banking nothing → that obligation is a child, not a grind.
- NEVER inflate maxHeartbeats and wait. NEVER run an unbounded compile in the turn budget.

## ANTI-VACUITY (W8)
- Result phrased in NON-VACUOUS `JoinedIdQvC` (N157), NEVER the vacuous `JoinedIdC`.
- Costume C194: a WRONG det-parity / even-word / closure-bireflection claim must FAIL to compile,
  reducing to a false numeric DISTINCT from the banked battery (… C192 1=160, C193 1=161) — use
  1=162 or another distinct value.

## WORD-REMOVAL (STANDARD §2)
Delete det/determinant/parity/even/reflection/Householder/bireflection/rotation/SO(8)/isometry/
word/closure/Lorentz: statements must stand as pure linear algebra over the derived field `Cut` —
"a finite product of involutive rank-one-perturbation maps whose `LinearMap.det` is `-1` each,
whose total `det` being `1` forces an even count, hence the `octBlockEndC` image lies in the
preconnected `JoinedIdQvC` set". No theorem statement needs a physics word.

## THE ONE LAW (W5)
If the parity bookkeeping fights, I am drifting — return to the trunk. The engines (N121–N161)
are banked; the residual is ONLY the even-pairing + det-parity. NO posited determinant/parity
homomorphism, NO posited connectedness, NO posited group. det is `LinearMap.det` (Mathlib
machinery on the DERIVED `O Cut`), NOT a posited hom.
