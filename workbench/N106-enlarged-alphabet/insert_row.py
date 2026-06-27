path='docs/LEDGER.md'
with open(path) as f: lines=f.readlines()
assert lines[149].startswith('| N105 THE WORD-MEMBERSHIP OBSTRUCTION'), lines[149][:60]
with open('workbench/N106-enlarged-alphabet/ledger_row.txt') as f: row=f.read()
lines.insert(150,row)
with open(path,'w') as f: f.writelines(lines)
print('Inserted. total lines now', len(lines))
print('line151 prefix:', lines[150][:30])
print('line152 prefix:', lines[151][:30])
