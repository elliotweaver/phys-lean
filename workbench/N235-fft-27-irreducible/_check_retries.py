import sqlite3, os
db = os.environ.get('HERMES_KANBAN_DB', os.path.expanduser('~/.hermes/kanban/boards/phys-novelty/kanban.db'))
con = sqlite3.connect(db); con.row_factory = sqlite3.Row
cur = con.cursor()
cur.execute("SELECT id,title,status FROM tasks WHERE id='t_816934fb'")
r = cur.fetchone()
print("t_816934fb:", dict(r) if r else "MISSING")
# also its parents
cur.execute("SELECT parent_id FROM task_links WHERE child_id='t_816934fb'")
print("  parents:", [x[0] for x in cur.fetchall()])
con.close()
