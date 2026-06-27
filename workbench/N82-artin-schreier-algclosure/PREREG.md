# N82 PREREG — THE FULL ARTIN–SCHREIER ALGEBRAIC CLOSURE IsAlgClosed Cut[i]

Frozen BEFORE the heavy compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## TARGET (route a — measured the SMALLER route)
Build `IsAlgClosed Cut[i]` over the derived ℝ `Cut` via the classical algebraic
Artin–Schreier theorem (the content Mathlib genuinely lacks — `grep Sylow FieldTheory/`
returns NOTHING; `IsRealClosed` is a 127-line stub with NO alg-closure, NO Artin–Schreier).

## MEASURE-FIRST FINDINGS (decisive — route a is the smaller route)
- Route (b) [variational/Rayleigh] needs Heine–Borel / sphere-compactness / continuity of
  bilinear forms / product topology on STVC — Mathlib has NONE of the analytic spectral
  machinery over the ABSTRACT `Cut` (only over concrete ℝ/ℂ). HEAVY, many-node.
- Route (a) [classical algebraic] — ALL components EXIST over arbitrary fields and typecheck:
  - `IsAlgClosed.of_exists_root k : (∀ p, Monic → Irreducible → ∃ x, eval x p = 0) → IsAlgClosed k`
  - `Field.exists_primitive_element` (finite separable ⟹ primitive element)
  - `IntermediateField.adjoin.finrank` (finrank K⟮x⟯ = (minpoly K x).natDegree)
  - `IsGalois.card_aut_eq_finrank`, `finrank_fixedField_eq_card`, fixedField/fixingSubgroup
  - `Sylow`, `IsPGroup`, p-group subgroup machinery (GroupTheory/Sylow.lean)
  - `PerfectField.ofCharZero` ⟹ CharZero Cut, Cut[i] are PerfectField (separable extensions)
  - trunk instances ALL resolve: CharZero/Field/PerfectField for both Cut and Cuti (probe A green)
  ⟹ route (a) chosen.

## GO / NO-GO
GO if: each brick compiles foundations-only ([propext, Classical.choice, Quot.sound]) and
banks a genuine structural piece of the Artin–Schreier chain. The DERIVATION is the deliverable.
NO-GO (do NOT do): import Mathlib ℝ/ℂ as content; posit IsAlgClosed; name a bridge; weaken target.

## THE BRICK CHAIN (route a, bank-as-you-go)
1. `cut_no_odd_ext` — every finite ODD-degree extension of `Cut` is trivial (degree 1).
   Rides N77 `cut_odd_degree_has_root` via primitive element + minpoly irreducibility. ✓ PROBED GREEN (8s).
2. The Sylow step: every finite extension of `Cut` has 2-POWER degree (the 2-Sylow fixed field
   has odd degree over Cut, = 1 by brick 1, so the Galois group is a 2-group). [MEASURE THIS RUN]
3. The p-group step over Cut[i]: Cut[i] has no proper finite extension (a nontrivial 2-group
   Galois group has an index-2 subgroup ⟹ degree-2 extension of Cut[i], contradicting N81
   `cuti_quadratic_has_root` degree-2-closure). [LIKELY CHILD]
4. `IsAlgClosed Cut[i]` via `of_exists_root`. [LIKELY CHILD — the assembly]

## KILL BUDGET (W9 — INSTRUMENT failure threshold)
- Per-brick scratch probe KILL = 120s. If a single obligation exceeds it, MEASURE/DECOMPOSE,
  do NOT inflate maxHeartbeats / grind. (Predecessors N43–N51 timed out on the gate ceremony;
  N76–N81 first runs all crashed/timed at finalize having ALREADY committed production.)
- CHECKPOINT EARLY (~50% turns): the instant a brick compiles clean, MOVE to production +
  wire + COMMIT before chasing the next. Run the gate in BACKGROUND.
- This is EXPECTED to be a DECOMPOSITION (multi-node build per N80/N81). Bank the clean
  structural bricks; child the global remainder onto the chain tail.

## COSTUME (W8 — next id C113)
Must bite a WRONG odd-extension / Sylow / alg-closure claim, reducing to a FALSE numeric
DISTINCT from C84..C112 (incl C112 169=200). Reuse banked objects.

## WORDS-REMOVABLE
Delete "Lorentz/spectral/eigen/Spin/SO(9)/isometry/Artin-Schreier/algebraic-closure/Galois/
Sylow/real-closed/..." → the statements stand as pure field/group/polynomial math over the
derived complete ordered field `Cut` and its quadratic extension `Cut[i]`.
