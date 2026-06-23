# N7 — ℕ FROM THE FOLD — PREREGISTRATION (frozen before compute)

## THE TARGET
Derive the CONTENT ℕ — counting/arity — as the fold's own iteration/re-entry of the
distinction (Spencer-Brown re-entry: re-entry of the form generates number), with NO
`import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` used to GET the result, NO posited ℕ,
NO bridge. The carrier is CONSTRUCTED from the fold's re-entry; the Peano/successor
structure is PROVED.

## THE TRUNK ROUTE (reframe through the fold FIRST, before any standard ℕ machinery)
- N1 banked: the fold `look` with `look x + x = 0`, `fold_involutive` (look² = id — the
  fold CLOSES on a fixed carrier), `fold_self_blind` (no nonzero fixed point).
- KEY TENSION (respect THE ONE LAW, do not force): the fold CLOSES (look²=id), so
  iterating `look` on a FIXED carrier V is PERIOD-2, NOT ℕ. Therefore counting is NOT
  iteration-on-fixed-V. Counting is RE-ENTRY AT A NEW LEVEL each time (the distinction
  re-enters its own indicational space — the form contains itself afresh), which never
  closes. This is exactly the cascade's own logic (the fold does not resolve on the base;
  you raise to a NEW level — N2 doubling 1→2→4→8). So the carrier of ℕ is the LEVEL/RE-ENTRY
  TOWER, the free structure on ONE generating act (the fold), NOT the look-orbit.
- ℕ = the free iteration count on one act = the initial algebra of `X ↦ 1 + X` (Lawvere):
  this intrinsic universal property IS what makes the tower genuinely the naturals, and it
  is IMPORT-FREE (no reference to Mathlib's `Nat` as content).

## WHAT WILL BE BANKED (production `Phys/Foundation/Counting.lean`)
- `Re` : the re-entry tower (carrier) — inductive `void | step`. The honest formalization of
  "the distinction re-entering itself" (epistemic status: a DERIVED construction, not a posit;
  cf. N1's `IsFold` formalizing self-look-back, and Continuum's `IsGather`).
- Peano laws as THEOREMS: `succ_inj` (re-entry injective), `succ_ne_zero` (re-entry never
  the void), `step_ne_self` (re-entry has NO fixed point — never rests; the eternal-approach
  / self-blindness echo), induction (`Re.rec`), recursion.
- THE UNIVERSAL PROPERTY (the "it IS ℕ" content): `iterate z s : Re → X` with the two
  recursion equations + `iterate_unique` — free point-and-endomap = ℕ, import-free.
- THE FOLD BINDING (fold genuinely load-bearing): `foldIter look x₀ := iterate x₀ look`
  (counting re-entries = iterating the look-back) + `foldIter_closes` (`look²=id` makes the
  FIXED-carrier orbit period-2 — uses banked `fold_involutive` — so the orbit is NOT the
  count; the open tower `Re` is).
- NON-VACUITY / costume: a WRONG (closing) successor structure FAILS — asserting the count
  closes (`step (step void) = void`, the period-2 fold-orbit masquerading as the count) → False.

## GO / NO-GO
- GO if: `Re` + Peano theorems + universal property + fold binding all compile
  foundations-only (`#print axioms` ⊆ {propext, Classical.choice, Quot.sound}), costume bites,
  gate D0–D6 green, physics-words-removable holds (delete fold/re-entry/level → pure construction
  of ℕ as the initial point-and-endomap algebra).
- NO-GO / drift alarm: if I reach for `import Mathlib.Data.Nat` as the CONTENT carrier, or try
  to prove `Re ≃ Nat` against Mathlib's Nat (smuggles Nat as content) → STOP, return to the
  universal-property characterization (intrinsic, import-free).

## KILL (compile-cost budget — W9)
This node is PURELY STRUCTURAL (inductive recursor, `injection`, small `induction`/`rfl`). It
must NOT need any heavy normalizer, the continuum, or any large `ring`/`decide`. KILL = ANY
single obligation that does not close in a few seconds with `injection`/`induction`/`rfl`/`simp`
is an INSTRUMENT signal — decompose or reframe, never grind. No `maxHeartbeats` inflation.

## METALANGUAGE/CONTENT DISCLOSURE (state in handoff)
Derives the CONTENT ℕ: the object the results are ABOUT is `Re`, a constructed type carrying
Peano + the universal property of ℕ, built from the fold's re-entry, with NO Nat/Int/Rat/Real
content import. Does NOT (and need not) purge metalanguage `Nat` (kernel `Fin n` arity, universe
levels) — that is substrate, like `propext`.

## SCOPE (W3)
ℕ this run. On success, child ℤ-from-derived-ℕ (additive/group closure) onto the chain tail,
then ℚ. Single-flight: `hermes kanban list` / link onto tail before creating.
