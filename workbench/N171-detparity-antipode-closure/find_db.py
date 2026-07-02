import sqlite3, os, glob
# search for kanban DBs
paths = []
for base in [os.path.expanduser('~/.hermes'), os.path.expanduser('~/.hermes/profiles')]:
    paths += glob.glob(os.path.join(base, '**', '*.db'), recursive=True)
print("env HERMES_KANBAN_DB:", os.environ.get('HERMES_KANBAN_DB'))
print("env HERMES_KANBAN_BOARD:", os.environ.get('HERMES_KANBAN_BOARD'))
for db in sorted(set(paths)):
    try:
        con = sqlite3.connect(db)
        cur = con.cursor()
        tbls = [r[0] for r in cur.execute("SELECT name FROM sqlite_master WHERE type='table'").fetchall()]
        if 'tasks' in tbls:
            row = cur.execute("SELECT id, status, max_retries FROM tasks WHERE id='t_4f0fa8c8'").fetchone()
            n = cur.execute("SELECT COUNT(*) FROM tasks").fetchone()[0]
            print(f"{db}  tasks={n}  t_4f0fa8c8={row}")
        con.close()
    except Exception as e:
        print(db, "ERR", e)
