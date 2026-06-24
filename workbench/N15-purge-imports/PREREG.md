# N15 PREREG — purge the last vestigial Mathlib number-content imports (FROZEN before compute)

## Target (mechanical, subtractive; NO new derivation)
Make the ⚠ NUMBER-TOWER/CONTINUUM gate LITERALLY resolved: ZERO
`import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` anywhere in `Phys/`.

Three stragglers (verified present, commit ea442c4):
  1. `Phys/Foundation/Continuum.lean`  — `import Mathlib.Data.Rat.Defs` + `Rat.Lemmas`
  2. `Phys/Foundation/CompletionContinuum.lean` — imports Continuum (imported-ℚ resolution half)
  3. `Phys/Foundation/Fold.lean`  — `import Mathlib.Data.Int.Basic`

## Reconnaissance findings (verified, not assumed — W6)
- ContinuumDerived.lean genuinely SUPERSEDES Continuum.lean + CompletionContinuum.lean:
  every load-bearing theorem (IsGather/IsCoherent, sqrtTwoGather_isGather,
  sqrtTwoGather_not_coherent, ground_not_coherence_closed, Cut, le_total,
  completion_coherence_closed, coherent_gather, Qcut, sqrt2, sqrt2_not_rational,
  sqrt2_fills_gap) has a derived-ℚ analogue in `ContinuumQ` namespace. VERIFIED by reading.
- Importers of the EXACT modules Continuum / CompletionContinuum:
    Phys.lean (lines 37,38), Audits/AxiomAudit.lean (lines 42,43 + #print block 663-704),
    C23 ContinuumGroundCoherentCostume (imports Continuum),
    C24 CompletionHoleCostume (imports CompletionContinuum),
    CompletionContinuum imports Continuum.
  NOTHING load-bearing on the derived spine imports them. Safe to retire.
- `fold_int_nonzero_not_fixed` downstream uses: ONLY AxiomAudit line 59 (#print axioms) +
  docs (ROADMAP/LEDGER/FINDINGS prose). NOT used in any proof. Pure tightness/non-vacuity witness.
- ⚠ CYCLE: Fold.lean is N1 ROOT; chain is Fold → Counting → CountingArith → IntegerTower(Z).
  Importing the derived `Z` into Fold.lean = CYCLIC dependency = IMPOSSIBLE.
  THE ONE LAW fallback (ticket-anticipated): the witness is a TIGHTNESS witness (machinery,
  like the existing ZMod 2 companion + N2's ZMod 5), so re-express over `ZMod 3` — already-imported
  machinery, 2-torsion-free (char 3 ≠ 2), nonzero element genuinely moved. This is NOT
  "keeping imported ℤ because it's a witness"; the imported Int import is REMOVED, replaced by
  machinery `ZMod` which is NOT in the forbidden content list {Nat,Int,Rat,Real,Complex}.

## Plan (bank-as-you-go; subtractive first, safe)
STEP A (safe, subtractive): retire Continuum.lean + CompletionContinuum.lean.
  - drop both imports from Phys.lean and Audits/AxiomAudit.lean (lines 42,43)
  - delete the #print axioms block for the imported-ℚ theorems (AxiomAudit 663-704)
  - retire C23 (redundant with C28 over derived ℚ): remove row from manifest + delete file
  - re-point C24 (CompletionHole) to derived `ContinuumQ.sqrt2`: rewrite to import
    ContinuumDerived, target `ContinuumQ.sqrt2.S (3/2)`; keep PASS_SIGNATURE `⊢ False`
  - delete Continuum.lean + CompletionContinuum.lean
STEP B (Fold.lean N1 root — forces full-tree rebuild ~3min cold, legitimate):
  - remove `import Mathlib.Data.Int.Basic`
  - replace `fold_int_nonzero_not_fixed` (over ℤ) with `fold_nonzero_not_fixed`
    over `ZMod 3`: `∃ x : ZMod 3, x ≠ 0 ∧ (fun y => -y) x ≠ x := ⟨1, by decide, by decide⟩`
  - update docstring; update AxiomAudit line 59 to the new name

## GO / NO-GO
GO if, after both steps:
  - grep `import Mathlib.Data.(Nat|Int|Rat|Real|Complex)` in Phys/ returns ZERO
  - full tree builds clean
  - gate D0–D6 green; costume battery green; every remaining costume BITES (incl. re-pointed C24)
  - #print axioms ⊆ {propext, Classical.choice, Quot.sound} (D6 audit)
NO-GO / BLOCK if a load-bearing theorem turns out to depend on the imported-ℚ Continuum
(it does not, per recon) — then re-point to ContinuumDerived FIRST, do not delete blind.

## KILL budget (W9 compile-cost)
- Per-obligation KILL: 90s. Fold.lean witness re-expression is LIGHT (a single ∃ + 2 `decide`s).
- Full-tree rebuild after Fold.lean edit: legitimate ~3min cold (N1 root cascade). NOT a W9 signal.
- If `decide` on ZMod 3 fights (it will not — DecidableEq Fintype), or derived-Q norm_num in the
  re-pointed C24 fights → that is a framing signal; reframe, do NOT inflate maxHeartbeats.
- KILL the whole approach and DECOMPOSE (W3) if: ZMod 3 witness fights → child the Fold witness;
  bank STEP A (subtractive, safe) first regardless.

## Costume battery disposition
- C23 → RETIRED (its role is C28 over the derived ground — exact derived analogue, no coverage lost)
- C24 → RE-POINTED to derived `ContinuumQ.sqrt2` (completion-hole anti-vacuity preserved over derived ℚ)
- All other costumes untouched; must stay green and bite.

## Physics-words-removable
Trivially satisfied: this node REMOVES content and proves nothing physical. The deliverable is
that the chain's ground is LITERALLY (not merely substantively) fold-derived. NO bridge created.
