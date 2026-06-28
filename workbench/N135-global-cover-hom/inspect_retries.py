import sqlite3
db = '/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db'
con = sqlite3.connect(db); con.row_factory = sqlite3.Row; cur = con.cursor()
for tid in ['t_e7eb3966','t_9910eeda','t_b16df173','t_9065257b','t_3d9e3462']:
    row = cur.execute("SELECT id,title,max_retries,max_runtime_seconds FROM tasks WHERE id=?",(tid,)).fetchone()
    if row:
        print(row['id'], 'max_retries=', row['max_retries'], 'max_runtime=', row['max_runtime_seconds'], '|', row['title'][:40])
con.close()
