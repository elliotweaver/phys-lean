import sqlite3, os
db = os.environ.get('HERMES_KANBAN_DB') or os.path.expanduser('~/.hermes/kanban/boards/phys-novelty/kanban.db')
print('DB:', db)
con = sqlite3.connect(db); cur = con.cursor()
cols = [r[1] for r in cur.execute('PRAGMA table_info(tasks)').fetchall()]
print('has max_retries col:', 'max_retries' in cols)
if 'max_retries' in cols:
    cur.execute("UPDATE tasks SET max_retries=25 WHERE id=?", ('t_b00ebfc5',))
    con.commit()
    row = cur.execute("SELECT id, max_retries FROM tasks WHERE id=?", ('t_b00ebfc5',)).fetchone()
    print('N206 after update:', row)
con.close()
