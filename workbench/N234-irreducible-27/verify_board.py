#!/usr/bin/env python3
"""Ad-hoc verification (NOT suite-green): assert the N234/N235 board invariants
this run established. READ-ONLY — opens the shared kanban DB immutable so it
cannot perturb the live N235 worker. Copied to an OS tempfile before running."""
import sqlite3, os, sys

db = os.environ["HERMES_KANBAN_DB"]
con = sqlite3.connect(f"file:{db}?mode=ro&immutable=1", uri=True)
con.row_factory = sqlite3.Row

def status(tid):
    r = con.execute("SELECT status,block_kind,current_run_id,worker_pid FROM tasks WHERE id=?", (tid,)).fetchone()
    return dict(r) if r else None

def parents(tid):
    return sorted(p[0] for p in con.execute("SELECT parent_id FROM task_links WHERE child_id=?", (tid,)))

N233, N235, N234 = "t_ddc1dfb6", "t_e7d08d4a", "t_606cf8ac"
checks = []
checks.append(("N235 is a parent of N234 (dissolution gates the wall)", N235 in parents(N234)))
checks.append(("N234 parents == {N233, N235}", set(parents(N234)) == {N233, N235}))
checks.append(("N235 parent == {N233}", parents(N235) == [N233]))
s234 = status(N234)
checks.append(("N234 status == todo", s234["status"] == "todo"))
checks.append(("N234 block_kind == dependency", s234["block_kind"] == "dependency"))
checks.append(("N234 no live run/worker", s234["current_run_id"] is None and s234["worker_pid"] is None))
undone = con.execute(
    "SELECT p.id,p.status FROM task_links l JOIN tasks p ON p.id=l.parent_id "
    "WHERE l.child_id=? AND p.status NOT IN ('done','archived')", (N234,)).fetchall()
checks.append(("N234 gated by undone parent == N235", [dict(x) for x in undone] == [{"id": N235, "status": "running"}]))
active = [dict(r) for r in con.execute("SELECT id,status FROM tasks WHERE status IN ('running','ready')")]
checks.append(("single active node == N235", active == [{"id": N235, "status": "running"}]))
r490 = con.execute("SELECT status,outcome FROM task_runs WHERE id=490").fetchone()
checks.append(("rogue run 490 closed (not running)", r490 is not None and r490["status"] != "running"))
con.close()

ok = True
for name, passed in checks:
    print(f"  [{'PASS' if passed else 'FAIL'}] {name}")
    ok = ok and passed
print(f"\n{'ALL PASS' if ok else 'SOME FAILED'} ({sum(p for _,p in checks)}/{len(checks)})")
sys.exit(0 if ok else 1)
