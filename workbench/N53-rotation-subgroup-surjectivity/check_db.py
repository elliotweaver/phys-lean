import sqlite3
db = '/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db'
con = sqlite3.connect(db)
cur = con.cursor()
print('N53->N54 edge present:', cur.execute("SELECT * FROM task_links WHERE parent_id='t_1088275f' OR child_id='t_c9356b76'").fetchall())
# any OTHER children of t_1088275f (fork check)?
print('children of N53 (t_1088275f):', cur.execute("SELECT child_id FROM task_links WHERE parent_id='t_1088275f'").fetchall())
# any other ready/todo tasks (single-flight)?
print('todo/ready/running tasks:', cur.execute("SELECT id, status FROM tasks WHERE status IN ('todo','ready','running','blocked') ORDER BY created_at").fetchall())
con.close()
