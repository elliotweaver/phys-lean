import sqlite3, os
db = os.environ.get('HERMES_KANBAN_DB', '/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db')
con = sqlite3.connect(db)
cur = con.cursor()
cols = [r[1] for r in cur.execute('PRAGMA table_info(tasks)').fetchall()]
print('has max_retries col:', 'max_retries' in cols)
tid = 't_a43216bc'
print('before:', cur.execute('SELECT id, max_retries, status FROM tasks WHERE id=?', (tid,)).fetchone())
cur.execute('UPDATE tasks SET max_retries=25 WHERE id=?', (tid,))
con.commit()
print('after :', cur.execute('SELECT id, max_retries, status FROM tasks WHERE id=?', (tid,)).fetchone())
con.close()
