p='docs/ROADMAP.md'
lines=open(p).readlines()
ins=open('workbench/N292-select/roadmap_n292.md').read()
idx=next(i for i,l in enumerate(lines) if l.startswith('## \u2705 N291 LANDED \u2014 THE GAUGE-COVARIANT'))
lines.insert(idx, ins)
open(p,'w').writelines(lines)
print('inserted N292 LANDED at line', idx+1)
