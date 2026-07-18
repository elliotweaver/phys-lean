import tempfile, subprocess, os, textwrap
lean = textwrap.dedent('''
    import Phys.Algebra.ComposedFreezeoutDissolved
    open Phys.Algebra.ComposedFreezeoutDissolved
    #print axioms bMass0_pos
    #print axioms bMass2_pos
    #print axioms cutLog_inv_pos
    #print axioms cutLog_div_pos
    #print axioms cutLog_confBundle
    #print axioms cutLog_downConfBundle
    #print axioms confinement_rung_rational
    #print axioms freezeout_summand_dissolved
    #print axioms freezeout_at_pinned_dissolved
    #print axioms composed_endpoint_determined
    #print axioms gem_nonzero
    #print axioms dissolved_uses_confinement
    #print axioms dissolved_matches_pins
    #print axioms composedFreezeoutDissolved_landing
''')
fd, path = tempfile.mkstemp(prefix='hermes-verify-', suffix='.lean')
os.write(fd, lean.encode()); os.close(fd)
try:
    env = dict(os.environ, LAKE='/Users/elliotweaver/.elan/bin/lake')
    r = subprocess.run([env['LAKE'],'env','lean',path], capture_output=True, text=True,
                       env=env, cwd='/Users/elliotweaver/phys-lean')
    out = r.stdout + r.stderr
    bad = [l for l in out.splitlines() if 'error' in l.lower()]
    def only_found(line):
        rest = line.split('axioms:')[1]
        for tok in ('propext','Classical.choice','Quot.sound','[',']',',',' '):
            rest = rest.replace(tok,'')
        return rest == ''
    nonfound = [l for l in out.splitlines() if 'axioms:' in l and not only_found(l)]
    n = out.count('depends on axioms')
    print(f"lean exit code: {r.returncode}")
    print(f"decls audited:  {n}")
    print(f"build errors:   {len(bad)}")
    print(f"non-foundational-axiom decls: {len(nonfound)}")
    print("VERDICT:", "ALL 14 FOUNDATIONS-ONLY, BUILD CLEAN"
          if (r.returncode==0 and not bad and not nonfound and n==14) else "FAIL")
finally:
    os.remove(path)
    print(f"temp file removed: {not os.path.exists(path)}")
