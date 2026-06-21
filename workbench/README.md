# workbench/ — per-node scratch (prereg, numerics, scratch lean)

Each node gets ONE subdirectory: `workbench/<NodeId>/` (e.g. `workbench/N1-fold/`).

Inside each node dir:
```
PREREG.md      Frozen BEFORE any compute. GO/NO-GO bars + KILL conditions. A KILL must
               classify a fight as INSTRUMENT failure (drift), never theory failure (THE
               ONE LAW). Once written, do not edit to fit the result — that is cheating.
FINDINGS.md    The numerics-with-teeth result: what the probe showed, and the garbage
               witness it MUST reject. References the exact script.
numerics.py    The probe. Exact arithmetic where possible (Fraction/mpmath), reusing the
               BANKED structures (never a fresh ad-hoc table). Its costume MUST fail.
scratch/       Isolated scratch Lean (one rung at a time, grep the full error list for the
               root cause). NOT imported by Phys.lean. Promoted to Phys/ when it closes.
```

Why separate from production: the workbench is *how we got there*; `Phys/` is *what is
proved*. The gate audits `Phys/`, `Counterexamples/`, `Audits/`. The workbench is the lab
notebook — kept in git (prereg + findings are the honesty trail), but never imported into
the trust base. A claim is real only when it lives in `Phys/` and passes the gate + THE
STANDARD.

The prereg is the anti-drift contract: it freezes what would count as success BEFORE the
agent sees the result, so a wall cannot be retroactively reframed as a smaller win.
