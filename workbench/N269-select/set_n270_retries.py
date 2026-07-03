import sqlite3
con = sqlite3.connect('/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db')
c = con.cursor()
c.execute('PRAGMA table_info(tasks)')
cols = [r[1] for r in c.fetchall()]
if 'max_retries' in cols:
    c.execute('UPDATE tasks SET max_retries=25 WHERE id=?', ('t_731701de',))
    con.commit()
    c.execute('SELECT id, max_retries, max_runtime_seconds FROM tasks WHERE id=?', ('t_731701de',))
    print('final:', c.fetchone())
else:
    print('no max_retries column; dispatcher default applies')
con.close()
