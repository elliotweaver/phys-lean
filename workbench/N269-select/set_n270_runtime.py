import sqlite3
db = "/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db"
con = sqlite3.connect(db)
cur = con.cursor()
cur.execute("PRAGMA table_info(tasks)")
cols = [r[1] for r in cur.fetchall()]
col = "max_runtime_seconds" if "max_runtime_seconds" in cols else None
print("has max_runtime_seconds:", col is not None)
if col:
    cur.execute("UPDATE tasks SET max_runtime_seconds=? WHERE id=?", (5400, "t_731701de"))
    con.commit()
    cur.execute("SELECT id, max_runtime_seconds, max_retries FROM tasks WHERE id=?", ("t_731701de",))
    print("N270:", cur.fetchone())
con.close()
