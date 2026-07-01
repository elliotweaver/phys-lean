import sqlite3, os
c = sqlite3.connect(os.environ["HERMES_KANBAN_DB"]); c.row_factory=sqlite3.Row
print("=== full dependency picture ===")
for tid,label in [("t_ddc1dfb6","N233"),("t_e7d08d4a","N235-dissolution"),("t_606cf8ac","N234")]:
    r=c.execute("SELECT status,block_kind,current_run_id,claim_lock FROM tasks WHERE id=?",(tid,)).fetchone()
    parents=[p[0] for p in c.execute("SELECT parent_id FROM task_links WHERE child_id=?",(tid,))]
    pstat={p: c.execute("SELECT status FROM tasks WHERE id=?", (p,)).fetchone()[0] for p in parents}
    print(f"{label} {tid}: status={r['status']} block_kind={r['block_kind']} run={r['current_run_id']} lock={r['claim_lock']}")
    print(f"    parents={pstat}")
print("\n=== any OTHER running/ready tasks (single-flight check) ===")
for r in c.execute("SELECT id,status,substr(title,1,40) t FROM tasks WHERE status IN ('running','ready') ORDER BY created_at DESC"):
    print("  ", dict(r))
c.close()
