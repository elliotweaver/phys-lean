import io
path='docs/ROADMAP.md'
with io.open(path,'r',encoding='utf-8') as f: lines=f.readlines()
# lines[7045] (index) is line 7046 = the §N164 FORWARD FRONTIER start; lines[7075] (index) = line 7076 end of block.
assert lines[7045].startswith('  - **★ §N164 FORWARD FRONTIER'), 'start mismatch: '+lines[7045][:50]
assert 'finrank_O_eq_eight_Cut' in lines[7075], 'end mismatch: '+lines[7075][:50]
with io.open('workbench/N164-boost-polar-factor/roadmap_block.txt','r',encoding='utf-8') as f: block=f.read()
# Replace lines index 7045..7075 inclusive (the old frontier) with the new block.
newlines = lines[:7045] + [block] + lines[7076:]
with io.open(path,'w',encoding='utf-8') as f: f.writelines(newlines)
print('replaced §N164 frontier with §N164 LANDED + §N165 frontier; total lines now', len(newlines))
