import sqlite3, os
db = os.environ.get('HERMES_KANBAN_DB', '/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db')
con = sqlite3.connect(db)
cur = con.cursor()
cols = [r[1] for r in cur.execute('PRAGMA table_info(tasks)').fetchall()]
print('db:', db)
print('has max_retries col:', 'max_retries' in cols)
for tid in ('t_040d6ba0','t_5c1c6e26'):
    row = cur.execute('SELECT id, max_retries, status FROM tasks WHERE id=?', (tid,)).fetchone()
    print('before:', row)
cur.execute('UPDATE tasks SET max_retries=25 WHERE id=?', ('t_040d6ba0',))
con.commit()
row = cur.execute('SELECT id, max_retries, status FROM tasks WHERE id=?', ('t_040d6ba0',)).fetchone()
print('after :', row)
con.close()
