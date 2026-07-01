import sqlite3, os
c = sqlite3.connect(os.environ["HERMES_KANBAN_DB"]); c.row_factory=sqlite3.Row
print("running tasks + their worker pids:")
for r in c.execute("SELECT id,current_run_id,worker_pid,claim_lock,substr(title,1,30) t FROM tasks WHERE status='running'"):
    d=dict(r); pid=d['worker_pid']
    alive="?"
    if pid:
        try:
            os.kill(int(pid),0); alive="ALIVE"
        except ProcessLookupError: alive="DEAD"
        except PermissionError: alive="ALIVE(perm)"
    print(f"  {d['id']} run={d['current_run_id']} pid={pid}({alive}) lock={d['claim_lock']} :: {d['t']}")
c.close()
