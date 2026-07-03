import sqlite3, os
db = os.path.expanduser("~/.hermes/kanban/boards/phys-novelty/kanban.db")
con = sqlite3.connect(db)
con.execute("UPDATE tasks SET max_retries=25 WHERE id='t_9db83d4e'")
con.commit()
print("FINAL:", con.execute("SELECT id, max_runtime_seconds, max_retries, status, assignee FROM tasks WHERE id='t_9db83d4e'").fetchone())
con.close()
