#!/usr/bin/env python3
"""Ad-hoc, READ-ONLY verification of the N254 docs-wiring artifact.

Checks the *effect* of workbench/N254-forced-second-neutral/append_ledger.py on
docs/LEDGER.md WITHOUT re-running it (the append is idempotent and was already
exercised live this turn — it printed "already present — skipping"). This is
ad-hoc verification of the docs artifact only; the mathematical node is verified
by the canonical gate-fast D0-D6 + foundations audit (green this turn).
"""
import pathlib, sys

REPO = pathlib.Path("/Users/elliotweaver/phys-lean")
LEDGER = REPO / "docs/LEDGER.md"

rows = [ln for ln in LEDGER.read_text().splitlines()
        if ln.startswith("| N254 THE FORCED SECOND NEUTRAL DIRECTION")]
fails = []

if len(rows) != 1:
    fails.append(f"expected exactly 1 N254 row, found {len(rows)}")
else:
    r = rows[0]
    if r.count("|") < 6:
        fails.append(f"{r.count('|')} pipes; expected >=6 (5-col table row)")
    if not r.rstrip().endswith("|"):
        fails.append("row not closed with a trailing pipe")
    for t in ["charge_isospin_commute", "grading_misaligned", "joint_neutral_kernel",
              "C285", "foundations-only", "\u2705"]:
        if t not in r:
            fails.append(f"missing token {t!r}")

print("=== N254 docs-artifact ad-hoc verification (read-only) ===")
print(f"N254 rows: {len(rows)}"
      + (f" | pipes: {rows[0].count('|')} | closed: {rows[0].rstrip().endswith('|')}"
         if rows else ""))
if fails:
    print("FAIL:")
    for f in fails:
        print("  - " + f)
    sys.exit(1)
print("PASS: exactly one well-formed N254 LEDGER row (idempotent append)")
