import sqlite3
con=sqlite3.connect('/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db')
cur=con.cursor()
print('N227 t_22d1191e:', cur.execute("SELECT id,status,current_run_id FROM tasks WHERE id='t_22d1191e'").fetchone())
for r in cur.execute("SELECT id,status,started_at,ended_at,outcome,error FROM runs WHERE task_id='t_22d1191e' ORDER BY id DESC LIMIT 5").fetchall():
    print(' run', r)
con.close()
