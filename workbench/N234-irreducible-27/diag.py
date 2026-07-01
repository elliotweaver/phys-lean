import sqlite3, os
c = sqlite3.connect(os.environ["HERMES_KANBAN_DB"]); c.row_factory=sqlite3.Row
t="t_606cf8ac"
r=c.execute("SELECT id,status,block_kind,current_run_id,worker_pid,claim_lock FROM tasks WHERE id=?", (t,)).fetchone()
print("N234:", dict(r))
print("\nrecent events N234:")
for e in c.execute("SELECT kind,created_at,run_id FROM task_events WHERE task_id=? ORDER BY created_at DESC LIMIT 8", (t,)):
    print("  ", dict(e))
print("\nruns N234:")
for e in c.execute("SELECT id,status,outcome,started_at,ended_at FROM task_runs WHERE task_id=? ORDER BY id DESC LIMIT 5", (t,)):
    print("  ", dict(e))
print("\nmy env run id:", os.environ.get("HERMES_KANBAN_RUN_ID"))
c.close()
