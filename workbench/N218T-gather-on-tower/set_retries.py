import sqlite3, os
db = os.environ.get('HERMES_KANBAN_DB') or os.path.expanduser('~/.hermes/kanban.db')
print('db:', db)
con = sqlite3.connect(db)
cur = con.cursor()
cols = [r[1] for r in cur.execute('PRAGMA table_info(tasks)').fetchall()]
print('has max_retries:', 'max_retries' in cols)
if 'max_retries' in cols:
    cur.execute('UPDATE tasks SET max_retries=25 WHERE id=?', ('t_7bf96cf6',))
    con.commit()
    print('set max_retries=25 on t_7bf96cf6; rows:', cur.rowcount)
    print(cur.execute('SELECT id,max_retries FROM tasks WHERE id=?', ('t_7bf96cf6',)).fetchall())
con.close()
