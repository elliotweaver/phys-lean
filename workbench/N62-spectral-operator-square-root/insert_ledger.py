path = 'docs/LEDGER.md'
lines = open(path, encoding='utf-8').readlines()
assert lines[111].startswith('| N61 '), lines[111][:30]
row = open('workbench/N62-spectral-operator-square-root/ledger_row.txt', encoding='utf-8').read().rstrip('\n')
lines.insert(112, row + '\n')
open(path, 'w', encoding='utf-8').writelines(lines)
print('inserted; total now', len(lines))
print('112:', lines[111][:18])
print('113:', lines[112][:18])
print('114:', lines[113][:18])
