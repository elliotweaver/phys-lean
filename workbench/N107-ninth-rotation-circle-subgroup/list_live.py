import json
d=json.load(open("/tmp/kb_list.json"))
tasks=d if isinstance(d,list) else d.get("tasks",d.get("items",[]))
live=[t for t in tasks if t.get("status") not in ("done","archived","cancelled")]
print("total:",len(tasks),"live:",len(live))
for t in live[:40]:
    print(t.get("id"),"|",t.get("status"),"|",t.get("assignee"),"|",(t.get("title") or "")[:75])
