import sqlite3, os
c = sqlite3.connect(os.environ["HERMES_KANBAN_DB"])
print("task_runs cols:", [r[1] for r in c.execute("PRAGMA table_info(task_runs)")])
print("task_events cols:", [r[1] for r in c.execute("PRAGMA table_info(task_events)")])
c.close()
