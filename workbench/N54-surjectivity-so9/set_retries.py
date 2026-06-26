import sqlite3
db = '/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db'
con = sqlite3.connect(db); cur = con.cursor()
tables = [t[0] for t in cur.execute("SELECT name FROM sqlite_master WHERE type='table'").fetchall()]
cols = [r[1] for r in cur.execute('PRAGMA table_info(tasks)').fetchall()]
print('tables:', tables)
print('cols has max_retries:', 'max_retries' in cols)
print('before:', cur.execute("SELECT id,status,max_retries FROM tasks WHERE id='t_a7d7f65d'").fetchone())
if 'max_retries' in cols:
    cur.execute("UPDATE tasks SET max_retries=25 WHERE id='t_a7d7f65d'")
    con.commit()
    print('after:', cur.execute("SELECT id,status,max_retries FROM tasks WHERE id='t_a7d7f65d'").fetchone())
con.close()
