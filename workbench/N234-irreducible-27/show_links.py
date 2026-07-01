import sqlite3, os
c = sqlite3.connect(os.environ["HERMES_KANBAN_DB"])
ids = ("t_ddc1dfb6","t_606cf8ac","t_e7d08d4a")
print("LINKS (parent -> child):")
for r in c.execute("SELECT parent_id,child_id FROM task_links WHERE parent_id IN (?,?,?) OR child_id IN (?,?,?)", ids+ids):
    print("  ", r[0], "->", r[1])
print("STATUS:")
for r in c.execute("SELECT id,status,block_kind,max_retries FROM tasks WHERE id IN (?,?,?)", ids):
    print("  ", dict(zip(("id","status","block_kind","max_retries"), r)))
c.close()
