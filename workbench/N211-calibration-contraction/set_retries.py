import sqlite3
db = '/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db'
con = sqlite3.connect(db)
cur = con.cursor()
cols = [r[1] for r in cur.execute('PRAGMA table_info(tasks)').fetchall()]
if 'max_retries' in cols:
    cur.execute("UPDATE tasks SET max_retries=25 WHERE id='t_2fd33e9b'")
    con.commit()
    print('set max_retries=25:', cur.execute("SELECT id, status, max_retries FROM tasks WHERE id='t_2fd33e9b'").fetchone())
else:
    print('cols:', cols)
print('--- open tasks (single-flight check) ---')
for r in cur.execute("SELECT id, status, title FROM tasks WHERE status IN ('todo','ready','running','blocked') ORDER BY created_at").fetchall():
    print(' ', r[0], r[1], '|', r[2][:70])
con.close()
