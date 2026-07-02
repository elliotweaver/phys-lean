import io
path='docs/LEDGER.md'
with io.open(path,'r',encoding='utf-8') as f: lines=f.readlines()
assert lines[209].startswith('| N163'), 'line 210 not N163: '+lines[209][:30]
assert lines[210].startswith('| N67 '), 'line 211 not N67: '+lines[210][:30]
with io.open('workbench/N164-boost-polar-factor/ledger_row.txt','r',encoding='utf-8') as f: row=f.read().rstrip('\n')
lines.insert(210, row+'\n')
with io.open(path,'w',encoding='utf-8') as f: f.writelines(lines)
print('inserted; total lines now', len(lines))
