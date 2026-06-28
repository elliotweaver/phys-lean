import sqlite3
db = '/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db'
con = sqlite3.connect(db); cur = con.cursor()
cur.execute("UPDATE tasks SET max_retries=25, max_runtime_seconds=2700 WHERE id=?", ('t_3d9e3462',))
con.commit()
row = cur.execute("SELECT id,max_retries,max_runtime_seconds FROM tasks WHERE id=?",('t_3d9e3462',)).fetchone()
print('after update:', row)
con.close()
