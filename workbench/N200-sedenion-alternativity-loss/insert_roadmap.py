with open('docs/ROADMAP.md') as f:
    c = f.read()
with open('workbench/N200-sedenion-alternativity-loss/roadmap_block.txt') as f:
    block = f.read().rstrip('\n')
assert c.count('__N200_BLOCK__') == 1, c.count('__N200_BLOCK__')
c = c.replace('__N200_BLOCK__', block)
with open('docs/ROADMAP.md', 'w') as f:
    f.write(c)
print('done; ROADMAP lines now', c.count(chr(10)))
print('sentinel remaining:', c.count('__N200_BLOCK__'))
