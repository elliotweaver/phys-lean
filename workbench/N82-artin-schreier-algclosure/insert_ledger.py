path='docs/LEDGER.md'
with open(path) as f: lines=f.readlines()
assert lines[125].startswith('| N81 THE TRUNK-NATIVE ARTIN'), lines[125][:60]
with open('/tmp/n82_ledger_row.txt') as f: row=f.read()
lines.insert(126, row)
with open(path,'w') as f: f.writelines(lines)
print('inserted; total lines now', len(lines))
print('line127 starts:', lines[126][:40])
