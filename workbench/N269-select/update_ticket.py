import sqlite3
db = "/Users/elliotweaver/.hermes/kanban/boards/phys-novelty/kanban.db"
con = sqlite3.connect(db)
cur = con.cursor()
title = "N269 — THE DERIVED GAUGE PRESERVES THE ARENA'S OBSERVABLE SPECTRUM (the cubic norm jN / spur jS / characteristic polynomial of J3(O Q) are gauge-invariant, finite + infinitesimal — the first g2 subset f4 inclusion, the star1<->star4 deepening)"
body = open("/Users/elliotweaver/phys-lean/workbench/N269-select/TICKET_BODY.txt").read()
cur.execute("UPDATE tasks SET title=?, body=? WHERE id=?", (title, body, "t_8f5a8132"))
con.commit()
cur.execute("SELECT substr(title,1,70), length(body) FROM tasks WHERE id=?", ("t_8f5a8132",))
print("updated:", cur.fetchone())
con.close()
