import sqlite3, os, time, signal

db = os.environ["HERMES_KANBAN_DB"]
c = sqlite3.connect(db); c.row_factory = sqlite3.Row

# 1. Identify the rogue N234 worker (run 490)
row = c.execute("SELECT status, current_run_id, worker_pid, claim_lock FROM tasks WHERE id='t_606cf8ac'").fetchone()
print("N234 before:", dict(row))
rogue_pid = row["worker_pid"]
rogue_run = row["current_run_id"]

# 2. Kill the rogue worker process if alive
if rogue_pid:
    try:
        os.kill(int(rogue_pid), 0)
        os.kill(int(rogue_pid), signal.SIGTERM)
        print(f"SIGTERM sent to rogue N234 worker pid={rogue_pid}")
        time.sleep(2)
        try:
            os.kill(int(rogue_pid), 0)
            os.kill(int(rogue_pid), signal.SIGKILL)
            print(f"SIGKILL sent to pid={rogue_pid}")
        except ProcessLookupError:
            print(f"pid {rogue_pid} exited after SIGTERM")
    except ProcessLookupError:
        print(f"rogue pid {rogue_pid} already dead")

# 3. End run 490 in the DB (mark reclaimed) and gate N234 back to todo behind N235
now = int(time.time())
with c:
    if rogue_run:
        c.execute(
            "UPDATE task_runs SET status='reclaimed', outcome='reclaimed', "
            "ended_at=?, error=? WHERE id=? AND ended_at IS NULL",
            (now, "duplicate worker killed: N234 mis-promoted by dependency-block loop; re-gated behind N235 dissolution", rogue_run),
        )
    c.execute(
        "UPDATE tasks SET status='todo', claim_lock=NULL, claim_expires=NULL, "
        "worker_pid=NULL, current_run_id=NULL, block_kind='dependency' WHERE id='t_606cf8ac'",
    )
    c.execute(
        "INSERT INTO task_events (task_id, kind, payload, created_at, run_id) VALUES (?,?,?,?,?)",
        ("t_606cf8ac", "reclaimed",
         '{"reason":"duplicate worker killed; re-gated behind N235 dissolution (t_e7d08d4a)"}',
         now, rogue_run),
    )

row2 = c.execute("SELECT status, current_run_id, worker_pid, claim_lock, block_kind FROM tasks WHERE id='t_606cf8ac'").fetchone()
print("N234 after:", dict(row2))
c.close()
