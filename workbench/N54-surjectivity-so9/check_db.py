import sqlite3, os
db = os.path.expanduser('~/.hermes/kanban.db')
con = sqlite3.connect(db); cur = con.cursor()
row = cur.execute("SELECT id,status,max_retries FROM tasks WHERE id='t_a7d7f65d'").fetchone()
print('row:', row)
# how many tasks total
print('count:', cur.execute("SELECT COUNT(*) FROM tasks").fetchone())
# recent ids
for r in cur.execute("SELECT id,status,max_retries FROM tasks ORDER BY created_at DESC LIMIT 5").fetchall():
    print(r)
con.close()
