for path in ['docs/LEDGER.md', 'docs/ROADMAP.md']:
    s = open(path).read()
    s = s.replace(
        'Gate D0–D6 (running in background). [built→landing]',
        'Gate D0–D6 GREEN (costumes 249/249, C250 = 2=217 biting at the math field; axiom audit 2677 theorems foundations-only).')
    s = s.replace(
        'gate (running bg); foundations-only (11/11 vs built olean)',
        'gate D0–D6 GREEN (249/249 costumes; 2677 audited); foundations-only (11/11 vs built olean)')
    s = s.replace(
        'Gate\nD0–D6 (running in background). [built→landing]',
        'Gate D0–D6 GREEN (costumes 249/249, C250; axiom audit 2677 foundations-only).')
    open(path, 'w').write(s)
print('updated docs to GREEN')
