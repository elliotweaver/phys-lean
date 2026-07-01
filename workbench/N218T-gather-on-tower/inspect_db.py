import sqlite3, os
db = os.path.expanduser('~/.hermes/kanban.db')
con = sqlite3.connect(db)
cur = con.cursor()
print('tables:', [r[0] for r in cur.execute("SELECT name FROM sqlite_master WHERE type='table'").fetchall()])
n = cur.execute("SELECT count(*) FROM tasks").fetchone()[0]
print('tasks count', n)
print('recent ids:', cur.execute("SELECT id, max_retries FROM tasks ORDER BY created_at DESC LIMIT 6").fetchall())
con.close()
