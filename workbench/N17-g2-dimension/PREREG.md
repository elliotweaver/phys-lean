# N17 — PREREG (frozen BEFORE any Lean compute)

**Node.** N17 — the exact dimension `dim Der(O ℚ) = 14` + the g₂ structure; W1/W9
dissolution child of N16. Build `Module ℚ (O ℚ)`, prove the count FORWARD via the
so(7) skew reduction + explicit basis, then the g₂ structure / ≅ g₂.

**Frozen:** 2026-06-24. Re-verified the N16 numerics independently this run (W6):
`deriv_dim.py` → rank 50 / nullity 14 ⟹ dim = 14; `structural.py` → every basis
derivation kills the unit, is skew (M = −Mᵀ), preserves Im, commutes with star;
14 integer-sparse basis matrices (nnz=4 each), rank 14.

---

## STANDARD §3 FRAMING DECISION (frozen — verify, do not smuggle)
The carrier is `O ℚ = CD (CD (Dbl ℚ))` at **Lean** `ℚ`, exactly as N6 (`witnessDeriv`
on `O ℚ`) and N16 (`witnessDeriv_one`) — both ✅ DONE. PRECEDENT: the Emergent layer
instantiates its concrete witnesses at Lean `ℚ` as a NON-VACUITY ground; the abstract
content lives over `[CommRing B] [StarRing B]`. The ⚠ number-tower gate is RESOLVED for
the FOUNDATION (the tower itself descends from the fold; ZERO `Mathlib.Data.{Nat,Int,
Rat,Real,Complex}` imports in Phys/). `ℚ` enters here only transitively (core, not
`Mathlib.Data.Rat`), as the witness ground.

`Module ℚ (O ℚ)` is **linear-algebra MACHINERY on the DERIVED object** `O ℚ` — the
coefficient field for `Module`/`finrank` (explicitly blessed machinery, STANDARD §3,
like `Matrix`/`Module`/`Subring` at N3/N4). The OBJECT (the octonions) is derived from
the cascade; ℚ is the metalanguage the linear-algebra statement is written in. This
follows the accepted N6 precedent. NOTE for the STANDARD check: a future re-grounding of
the count over the DERIVED ℚ `Phys.Foundation.Q` would be a separate node (like N10
re-grounded the continuum) — it does NOT block N17, since N6/N16 set the precedent that
the concrete Emergent witness ground is Lean `O ℚ`. Do NOT import `Mathlib.Data.Rat`.

If building `Module ℚ (O ℚ)` fights toward needing a NEW number system → STOP (THE ONE
LAW); it is machinery, constructed componentwise over the existing `SMul ℚ (Dbl ℚ)`.

---

## THE THEORY-NATIVE FORWARD ROUTE (NOT the brute 512×64 rank — W9-forbidden)
The N16 FINDINGS route: `Der(O) ⊆ so(Born) = so(7)` (skew, dim ≤ 21), then the
per-generator Leibniz constraints cut 21→14. The skew reduction is the bankable forward
HEART. Forward chain (each a bounded ext/simp/linear_combination, NOT a coordinate brute):

1. `Module ℚ (O ℚ)` — componentwise ℚ-action; module axioms. (Measured-missing infra.)
   ⟹ ℤ-linear `D` is automatically ℚ-linear (Mathlib `map_rat_smul`).
2. `deriv_one`: `D 1 = 0` — BANKED (N16). Reuse.
3. `star_trace`: `x + star x = 2 • Re_ℚ(x) • 1` (Re_ℚ x := x.re.re.re), so for imaginary
   `u` (`star u = -u`): `Re_ℚ u = 0`. Cheap ext+simp.
4. `selfMul_scalar`: `x * star x = nrmQ(x) • 1` (scalar norm, from banked `selfMul`).
   For imaginary `u`: `u * u = -nrmQ(u) • 1` (a SCALAR multiple of 1).
5. `deriv_star`: `D (star x) = - D x` (from 3: `star x = 2Re(x)•1 - x`, ℚ-linear, D1=0).
6. `(T)`: `D u * u + u * D u = 0` for imaginary `u` (D of the scalar `u*u`).
7. `trace_free`: `Re_ℚ(D x) = 0`. From (T) + star(T): `4 • Re_ℚ(D u) • u = 0` for
   imaginary u ⟹ `Re_ℚ(D u)=0` (u≠0, char 0); general `D x = D(Im x)`.
8. `deriv_star_comm`: `D (star x) = star (D x)` (from 5 + 7: `D x` imaginary).
9. `polarMul`: `x * star y + y * star x = G(x,y) • 1` (polarized selfMul, scalar).
10. `deriv_skew`: `G(D x, y) + G(x, D y) = 0` — differentiate polarMul with (5). ⟹
    `Der(O ℚ) ⊆ so(7)` (the structural reduction, dim ≤ 21). **THE HEADLINE.**

CHILD (W3 — genuinely W9-prime / W1): the EXACT `dim = 14` (the 21→14 cut: the 7
Leibniz constraints on imaginary generators, OR 14 explicit independent derivations
spanning — both fully-expanded-coordinate, the W9 monolithic signature) + the explicit
g₂ basis + bracket structure constants + the `≅ g₂` Lie isomorphism (W1: Mathlib may
lack a usable `g₂`; do NOT posit/import one to match — reframe through the trunk).

---

## GO / NO-GO (frozen)
- **GO (node LANDS as full):** `Module ℚ (O ℚ)` built + `deriv_skew` (`Der ⊆ so(7)`)
  proved forward + the exact `dim = 14` proved forward, all foundations-only, costume
  bites on a WRONG dimension/property, gate D0–D6 green, STANDARD met.
- **GO (node W3-DECOMPOSED — the expected outcome given W9):** `Module ℚ (O ℚ)` + the
  forward skew/so(7) structural reduction (+ trace-free + star-commute) banked
  foundations-only with a biting costume + gate green; the EXACT `dim = 14` and the g₂
  structure childed onto the chain tail as a dedicated dissolution ticket with the route
  specified. This is a legitimate decomposition (NOT scope reduction) because the exact
  count is W9-prime (FINDINGS) and the g₂ iso is W1.
- **NO-GO / DRIFT ALARMS (stop, return to trunk):**
  - Reaching to `import Mathlib.Data.Rat` or positing a number system → STOP (§3).
  - Importing `Mathlib.LieAlgebra.g2`/`G₂` to ASSERT the count or the iso → FORBIDDEN
    (the posit-vs-derive moat; a D3 bridge).
  - Any single tactic on a fully-expanded 8-coord / 512×64 goal running past the KILL
    budget → INSTRUMENT failure, decompose/reframe, do NOT inflate maxHeartbeats.
  - A "basis" or "dim" claim that passes only because it says nothing (W8) → re-check
    non-vacuity; the costume MUST bite on dim 13/15 or a ℚ-linear dependence.

## KILL BUDGET (compile-cost, frozen — W9)
- **90 s per obligation.** Any single lemma/`def` whose elaboration exceeds 90 s is an
  INSTRUMENT failure: stop, measure the smallest sub-obligation, decompose or reframe.
  NEVER inflate `maxHeartbeats` above default to "wait it out".
- Measure the `Module ℚ (O ℚ)` file build cost in a bounded probe BEFORE wiring it tree-wide.
- BANK-AS-YOU-GO: the instant a lemma elaborates clean (`#print axioms` ⊆ {propext,
  Classical.choice, Quot.sound}, no sorry), move it to production + commit. Never hoard.
- NEVER run an unbounded full-tree compile inside the turn budget; decompose with turns
  to spare (W3). If skew fights past budget → bank infra + the cheap forward facts,
  child skew + the exact count.
- ANTI-CIRCLING: record every dead route here; never re-run a measured-dead route.

## ANTI-CIRCLING LOG (routes attempted + outcome)
- (to be filled as the run proceeds)
