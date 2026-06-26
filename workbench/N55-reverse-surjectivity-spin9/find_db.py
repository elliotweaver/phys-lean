import sqlite3, glob, os
home = os.path.expanduser("~/.hermes")
for db in glob.glob(home + "/**/kanban.db", recursive=True):
    try:
        c = sqlite3.connect(db)
        cols = [r[1] for r in c.execute("PRAGMA table_info(tasks)").fetchall()]
        rows = c.execute("SELECT id, status, "
                         + ("max_retries" if "max_retries" in cols else "NULL")
                         + " FROM tasks WHERE id IN ('t_85cbd906','t_a7d7f65d')").fetchall()
        if rows:
            print("DB:", db)
            for r in rows:
                print("   ", r)
        c.close()
    except Exception as e:
        pass
