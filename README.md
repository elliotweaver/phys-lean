# phys-lean

Deriving physics as mathematics, in an unbroken chain from the **fold** (self-look-back),
formally verified in Lean 4 + Mathlib. One origin, one forced chain, no bridges.

**Read `docs/STANDARD.md` first — it is the constitution. Then `docs/RUNBOOK.md`.**

## Layout (organized by DERIVATION DEPTH, not physics sector — the chain is what matters)

```
Phys/
  Foundation/   depth 0: the fold, self-blindness, Born = self-overlap, C6. The root.
  Cascade/      depth 1: the forced algebra cascade ℝ → ℂ → ℍ → 𝕆 and its STOP.
  Algebra/      depth 2: structures forced by 𝕆 (Jordan J₃(𝕆), derivations, automorphisms…).
  Emergent/     depth 3+: the structures physics recognizes (gauge content, generations,
                masses, mixing, spacetime…) — each a THEOREM whose physics name is removable.
Counterexamples/  one costume per production claim: a WRONG value the kernel MUST reject.
Audits/           axiom / trust-base audit files (#print axioms over the whole tree).
scripts/          the gate (gate.sh), the parallel costume runner, the costume manifest.
workbench/        per-node scratch: prereg (frozen), numerics (with teeth), scratch lean.
docs/             STANDARD.md (the bar), RUNBOOK.md (the walls), ROADMAP.md (the nodes),
                  LEDGER.md (chain status — every node, what's proved, what's owed).
Phys.lean         the aggregator: imports every banked production module. The gate builds this.
```

## The discipline (every node, no skipping — see RUNBOOK)
prereg (frozen GO/NO-GO + KILL) → numerics with teeth (a costume that MUST fail) →
scratch lean (isolated) → production lean (zero axioms, foundations-only) → costume (register
one row in the manifest) → gate (parallel, green) → STANDARD check (unbroken / complete /
physics-words-removable) → commit.

## Build (reuses a shared prebuilt Mathlib — never rebuild it)
`.lake/packages` is a SYMLINK to a shared, already-built Mathlib v4.29.1. Never `rm` it,
never copy it, never commit it. Build with:
`export LAKE=/Users/elliotweaver/.elan/bin/lake && $LAKE build Phys`

## The gate (scripts/gate.sh) enforces, every commit:
zero `axiom` · zero `sorry` · zero `native_decide` · structural soundness · every costume
rejected at the math field (parallel) · every theorem foundations-only · **zero bridge/
residual markers** (the no-bridge detector — the thing that makes THE STANDARD mechanical).
