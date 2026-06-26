import sqlite3, os
db = os.environ["HERMES_KANBAN_DB"]
c = sqlite3.connect(db)
for tid in ("t_85cbd906", "t_a7d7f65d"):
    r = c.execute("SELECT id, status, max_retries FROM tasks WHERE id=?", (tid,)).fetchone()
    print("before:", r)
c.execute("UPDATE tasks SET max_retries=25 WHERE id='t_85cbd906'")
c.commit()
r = c.execute("SELECT id, status, max_retries FROM tasks WHERE id='t_85cbd906'").fetchone()
print("after: ", r)
c.close()
