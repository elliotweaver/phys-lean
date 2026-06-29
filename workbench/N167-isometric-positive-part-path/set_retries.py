import sqlite3, os
db = os.environ.get('HERMES_KANBAN_DB', '/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db')
con = sqlite3.connect(db)
cur = con.cursor()
tid = 't_77b5a48f'
row = cur.execute('SELECT id, max_retries, status FROM tasks WHERE id=?', (tid,)).fetchone()
print('before:', row)
cur.execute('UPDATE tasks SET max_retries=25 WHERE id=?', (tid,))
con.commit()
row = cur.execute('SELECT id, max_retries, status FROM tasks WHERE id=?', (tid,)).fetchone()
print('after :', row)
con.close()
