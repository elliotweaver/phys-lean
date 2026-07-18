"""Ad-hoc verification for DressingSeamResolved (task t_c488fbdc).
NOT a suite-green claim — a focused check of the changed behavior:
  (1) the new module built into the lake cache (olean present),
  (2) its 15 decls are foundations-only (#print axioms subset check),
  (3) the anti-vacuity costume BITES (fails to compile at goal '1 = 543').
Uses an OS-safe tempfile (hermes-verify- prefix) for the audit probe; cleans it up.
"""
import os, re, subprocess, tempfile

REPO = "/Users/elliotweaver/phys-lean"
LAKE = "/Users/elliotweaver/.elan/bin/lake"
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}
env = {**os.environ, "LAKE": LAKE}

def run(cmd):
    return subprocess.run(cmd, cwd=REPO, env=env, capture_output=True, text=True)

ok = True

olean = os.path.join(REPO, ".lake/build/lib/lean/Phys/Algebra/DressingSeamResolved.olean")
present = os.path.exists(olean)
ok &= present
print(f"(1) olean present: {present}")

decls = ["leading_topBand", "leading_conf", "totalScreening_topBand", "dressed_topBand_moves",
         "dressed_conf_moves", "dressed_topBand_at_w0", "dressed_conf_at_w0",
         "dressed_reproduces_only_at_w0", "resolved_composed_is_leading", "dressing_seam_resolved",
         "dressed_topBand_ne", "dressed_conf_ne", "leading_ne_dressed", "derived_weight_nontrivial",
         "dressingSeamResolved_landing"]
body = "import Phys.Algebra.DressingSeamResolved\n" + "".join(
    f"#print axioms Phys.Algebra.DressingSeamResolved.{d}\n" for d in decls)
fd, path = tempfile.mkstemp(prefix="hermes-verify-", suffix=".lean")
try:
    with os.fdopen(fd, "w") as f:
        f.write(body)
    r = run([LAKE, "env", "lean", path]); out = r.stdout + r.stderr
    blocks = re.findall(r"depends on axioms:\s*\[([^\]]*)\]", out, re.S)
    found = {a.strip() for blk in blocks for a in blk.replace("\n", " ").split(",") if a.strip()}
    clean = len(blocks) == len(decls) and found <= ALLOWED
    ok &= clean
    print(f"(2) axiom audit: {len(blocks)}/{len(decls)} decls; axioms={sorted(found)}; foundations-only={clean}")
finally:
    if os.path.exists(path):
        os.remove(path)
        print(f"    (temp {os.path.basename(path)} removed)")

r = run([LAKE, "env", "lean", "Counterexamples/DressingSeamResolvedVacuityCostume.lean"])
cout = r.stdout + r.stderr
bites = r.returncode != 0 and "1 = 543" in cout
ok &= bites
print(f"(3) costume bites (rc={r.returncode}, goal '1 = 543' present={'1 = 543' in cout}): {bites}")

print("\nAD-HOC VERIFY:", "PASS" if ok else "FAIL")
