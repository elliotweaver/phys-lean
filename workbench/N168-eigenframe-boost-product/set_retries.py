import sqlite3, os
db = os.environ.get('HERMES_KANBAN_DB', '/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db')
con = sqlite3.connect(db); cur = con.cursor()
tid = 't_85d954d4'
print('before:', cur.execute('SELECT id, max_retries, status FROM tasks WHERE id=?', (tid,)).fetchone())
cur.execute('UPDATE tasks SET max_retries=25 WHERE id=?', (tid,)); con.commit()
print('after :', cur.execute('SELECT id, max_retries, status FROM tasks WHERE id=?', (tid,)).fetchone())
print('--- open tasks (not done/archived) ---')
for r in cur.execute("SELECT id, status, substr(title,1,40) FROM tasks WHERE status NOT IN ('done','archived') ORDER BY created_at").fetchall():
    print(r)
con.close()
