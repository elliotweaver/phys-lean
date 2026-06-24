# N14 PREREG — DISCHARGE THE N2 ℝ-SCAFFOLDING in `ComplexUnit.lean`
*Frozen BEFORE compute. THE ONE LAW: if it fights, the framing is wrong, not the theory —
the why-double obstruction is the trunk's positivity (Born = self-overlap ≥ 0), a fact about
ANY linearly ordered field, NOT about ℝ. Reframe through the trunk; do NOT inflate
maxHeartbeats; do NOT weaken; do NOT bridge; do NOT reach for Mathlib `Real`.*

## TARGET
Retire the imported-Mathlib-ℝ stand-in in `Phys/Cascade/ComplexUnit.lean`. The load-bearing
imported-ℝ declarations (CONTENT, not metalanguage — exactly the ⚠ UNEARNED-IMPORT case):
  - `isFoldRoot_linearMap_iff` (`[Module ℝ W]`, `J : W →ₗ[ℝ] W`)
  - `foldRoot_forces_even_dim` (`[Module ℝ W][Module.Finite ℝ W]`, the WHY-DOUBLE LAW via
    `det(J)² = (-1)^finrank ≥ 0`)
  - `no_foldRoot_dim1` / `no_foldRoot_dim1_of_evenLaw` (`J : ℝ →ₗ[ℝ] ℝ`)
  - the witness `J₂ : (ℝ × ℝ) →ₗ[ℝ] (ℝ × ℝ)`, `J₂_isFoldRoot`, `J₂_self_blind`
Plus the imported-ℚ non-vacuity witnesses `obstruction_nonvacuous` (`∀ j : ℚ, …`),
`J_nonvacuous` (`Dbl ℚ`) — swap to the DERIVED ℚ/ℝ ground.

## THE FRAMING (reframe through the trunk FIRST — THE ONE LAW)
The why-double law is NOT a fact about ℝ. It is the trunk's positivity: `det(J)` is a scalar
in the base field, its SELF-OVERLAP `det(J)² ≥ 0` (Born), and `det(J∘J) = det(-id) =
(-1)^finrank`, so `(-1)^finrank ≥ 0` forces `finrank` EVEN. This holds over ANY linearly
ordered field. So the HONEST derivation is ABSTRACT over `[Field K][LinearOrder K]
[IsStrictOrderedRing K]` — ℝ is never mentioned. The Mathlib machinery
(`LinearMap.det`/`det_comp`/`det_smul`/`det_id`, `finrank`, `sq_nonneg`, `Odd.neg_one_pow`) is
field-generic (operates on the DERIVED objects), so the argument PORTS by replacing the
coefficient field ℝ ↦ K. Then:
  - INSTANTIATE the law's witnesses at the DERIVED ℝ `Phys.Foundation.ContinuumQ.Cut`
    (banked N11–N13: `[Field Cut][LinearOrder Cut][IsStrictOrderedRing Cut]`), demonstrating
    the obstruction + its dim-2 resolution genuinely live over the FOLD-DERIVED continuum, with
    imported Mathlib `ℝ` NOWHERE in the file.
  - `J₂` becomes `(Cut × Cut) →ₗ[Cut] (Cut × Cut)`, `J₂(a,b) = (-b,a)`.
  - the dim-1 obstruction becomes `¬ ∃ J : Cut →ₗ[Cut] Cut, IsFoldRoot J` (the derived LINE is
    blocked — odd dim 1).
  - non-vacuity witnesses over the derived `Cut` (or derived `Q`), not imported ℚ.

This is STRICTLY STRONGER than the original (a law about every ordered field, not just ℝ) ⟹
NO scope reduction. Physics-words-removable: the law is pure math about ordered fields.

## BANKED API (verified W6 — inherited tree builds clean, ~3s cached, 429f81c)
- `Phys.Foundation.ContinuumQ.Cut` : `[Field Cut]` (ContinuumFieldInverse `field`),
  `[LinearOrder Cut]` (ContinuumField `linearOrder`), `[IsStrictOrderedRing Cut]`
  (ContinuumFieldInverse `isStrictOrderedRing`), `[Nontrivial Cut]`, `[ZeroLEOneClass Cut]`.
- `Phys.Foundation.Q` : `[Field Q][LinearOrder Q][IsStrictOrderedRing Q]` (OrderedTower).
- N1 `Phys.Foundation.fold_self_blind`, `IsFold`, `fold_eq_neg`.
- Import chain: `Phys.Foundation.ContinuumFieldInverse` transitively pulls the whole continuum
  + number tower + Fold (NO cascade/algebra import → no cycle). ComplexUnit will import it.

## THE ROUTE
1. PROBE (bounded, scratch): generalize `isFoldRoot_linearMap_iff` + `foldRoot_forces_even_dim`
   over abstract `K`; instantiate dim-1 + `J₂` at `Cut`. MEASURE compile time. KILL if any
   single obligation > 90s (the continuum/cascade construction is LIGHT ~3–9s/file; heaviness =
   framing signal → reframe, NOT inflate).
2. Rewrite `ComplexUnit.lean`: ℝ ↦ abstract `K` in the law; witnesses at `Cut`/`Q`; drop
   `import Mathlib.Data.Rat.Defs`; keep `ZMod 5` tightness (legitimate counterexample, like N1's
   `ZMod 2` — order is load-bearing). Reorder `Phys.lean` so continuum precedes ComplexUnit.
3. Build Phys; verify `#print axioms ⊆ {propext, Classical.choice, Quot.sound}` for the new/
   changed declarations (independently + via AxiomAudit).
4. Costume that BITES: a WRONG even-dim claim (e.g. odd-dim fold-root exists, or the obstruction
   asserted to give 0 < -1) fails to compile. Add 1 row to scripts/costume_manifest.tsv.
5. Gate D0–D6 (bg). STANDARD check (unbroken/complete/words-removable). LEDGER + ROADMAP.

## GO / NO-GO
GO when: `ComplexUnit.lean` is IMPORTED-ℝ-FREE (no `import Mathlib.Data.Real`, no `Module ℝ`/
`finrank ℝ`/`LinearMap.det … ℝ` as content; `Mathlib.Data.Rat` swapped to derived `Q`), the
why-double law re-derived abstractly + instantiated at the DERIVED `Cut`, foundations-only
(`#print axioms ⊆ {propext, Classical.choice, Quot.sound}`), costume that BITES, gate D0–D6
green, LEDGER+ROADMAP updated (gate flips RESOLVED). OR honest W3 decomposition: bank the
abstract law + Cut instantiation, child the remainder, complete as "decomposed".
NO-GO / KILL: see below. Failure / silent scope-reduction / bridge / posited-or-imported-ℝ-as-
content are NOT on the menu.

## KILL BUDGET (W9 — compile cost)
- Per-obligation KILL: **90s**. Any single lemma/instance > 90s to elaborate = INSTRUMENT
  failure → STOP, MEASURE the smallest sub-obligation, decompose; do NOT inflate maxHeartbeats.
- Specific risk: `Module Cut (Cut × Cut)` / `Module.Finite Cut` / `finrank Cut` instance
  synthesis (Cut is a noncomputable quotient/set-based Field). If instance resolution gets heavy
  → that is a framing signal; the law is abstract over K, so the heavy part is ONLY the `Cut`
  instantiation — if THAT fights, the dim-2 witness can stay over abstract K (still derived, the
  field-genericity IS the point) while the dim-1 + scalar obstruction instantiate at Cut cheaply.
- ≥2 runs at full budget banking nothing = W9 wall → reframe.
- BANK-AS-YOU-GO (W9.8): freeze ComplexUnit the instant it compiles clean. Reserve last ~400s
  for the bank ceremony (commit) + W3 decomposition if needed. NEVER run out mid-task.

## ANTI-CIRCLING LOG (routes attempted + outcome)
- (start) inherited tree verified clean W6 (~3s cached, 429f81c). Cut API confirmed:
  Field/LinearOrder/IsStrictOrderedRing/Nontrivial/ZeroLEOneClass all banked.
- PROBE (scratch/probe.lean): generalized `isFoldRoot_linearMap_iff` + `foldRoot_forces_even_dim`
  over abstract `[Field K][LinearOrder K][IsStrictOrderedRing K]`; instantiated dim-1 obstruction
  + `J₂` witness + `J₂_self_blind` + non-vacuity at the DERIVED `Cut`/`Q`. ELABORATED CLEAN 6.5s
  (exit 0), all 5 key decls `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. The ONLY
  fix vs imported-ℝ: `J₂` needs `noncomputable` (Cut is a noncomputable set-based Field). KILL
  budget (90s) UNTOUCHED — the construction stayed LIGHT exactly as predicted. NO W9 pressure.
  THE ONE LAW vindicated: the why-double law was never about ℝ — it is the trunk's positivity
  over ANY ordered field, so the imported-ℝ was pure scaffolding, dissolved by abstraction.
- PRODUCTION: rewrote `Phys/Cascade/ComplexUnit.lean` — dropped `import Mathlib.Data.Rat.Defs`,
  added `import Phys.Foundation.ContinuumFieldInverse`; why-double law abstract over `K`;
  `no_foldRoot_dim1`/`_of_evenLaw`/`J₂`/`J₂_isFoldRoot`/`J₂_self_blind` over `Cut`;
  `obstruction_nonvacuous`/`J_nonvacuous` over derived `Q`. ZMod 5 tightness kept (legit finite-ring
  counterexample, order load-bearing). Builds isolated 5.6s; full Phys (downstream cascade+Jordan
  recompiled, legitimate) GREEN 3327 jobs. All changed decls foundations-only (AxiomAudit).
- COSTUME C33 (ComplexUnitDerivedRealObstructionCostume): identity asserted a fold-root on the
  derived line `Cut` → fails to elaborate, goal `⊢ x = -x`. BITES (the derived-ℝ dim-1 obstruction
  is load-bearing). Manifest row appended.
- CONTENT-grep confirmed: no `→ₗ[ℝ]`/`Module ℝ`/`finrank ℝ`/`Dbl ℚ`/`import Mathlib.Data.{Real,Rat,Complex}`
  in ComplexUnit.lean content (only the words "ℝ"/"derived ℝ" in removable comments).
- GO criterion MET: ComplexUnit imported-ℝ-free, why-double re-derived abstractly + instantiated at
  the DERIVED Cut, foundations-only, C33 bites, gate (running). The ⚠ NUMBER-TOWER/CONTINUUM gate
  flips RESOLVED with this node.
