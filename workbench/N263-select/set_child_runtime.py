import sqlite3, glob, os
cands = glob.glob(os.path.expanduser("~/.hermes/kanban/boards/phys-novelty/*.db"))
cands += [os.path.expanduser("~/.hermes/kanban.db")]
db = None
for c in cands:
    if os.path.exists(c):
        try:
            con = sqlite3.connect(c)
            row = con.execute("SELECT id FROM tasks WHERE id='t_9db83d4e'").fetchone()
            if row:
                db = c; con.close(); break
            con.close()
        except Exception as e:
            pass
print("DB:", db)
if db:
    con = sqlite3.connect(db)
    cols = [r[1] for r in con.execute("PRAGMA table_info(tasks)").fetchall()]
    has_rt = "max_runtime_seconds" in cols
    print("has max_runtime_seconds col:", has_rt)
    for tid in ("t_44157598","t_9db83d4e","t_ab4486de"):
        sel = "SELECT id, %s, max_retries, status FROM tasks WHERE id=?" % ("max_runtime_seconds" if has_rt else "NULL")
        print(con.execute(sel, (tid,)).fetchone())
    if has_rt:
        con.execute("UPDATE tasks SET max_runtime_seconds=5400 WHERE id='t_9db83d4e'")
        con.commit()
        print("AFTER:", con.execute("SELECT id, max_runtime_seconds, max_retries FROM tasks WHERE id='t_9db83d4e'").fetchone())
    con.close()
