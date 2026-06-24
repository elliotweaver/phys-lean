#!/usr/bin/env python3
"""Emit the FULL N19 lower-bound Lean file from nullbasis.pkl (correctness by
construction). dim >= 14: 14 explicit derivations, each an IsDerivQ, linearly
independent via the diagonal-functional route, then 14 <= finrank derivationQ
via span <= derivationQ + finrank_span_eq_card."""
import pickle, os
from fractions import Fraction as F
HERE = os.path.dirname(os.path.abspath(__file__))
os.chdir(os.path.join(HERE, '..', 'N16-g2-dimension'))
d = pickle.load(open('nullbasis.pkl', 'rb'))
mats = [[[F(x) for x in row] for row in m] for m in d['mats']]
N = 8

# accessor for output coord a
ACC = {0:'re.re.re',1:'re.re.im',2:'re.im.re',3:'re.im.im',
       4:'im.re.re',5:'im.re.im',6:'im.im.re',7:'im.im.im'}

def fform(a, M):
    terms = []
    for i in range(N):
        v = M[a][i]
        if v == 0: continue
        if v == 1: terms.append(f"c{i} z")
        elif v == -1: terms.append(f"-c{i} z")
        else: terms.append(f"({v})*c{i} z")
    if not terms: return "0"
    return terms[0] if len(terms) == 1 else "(" + " + ".join(terms) + ")"

def coords_used(M):
    used = set()
    for a in range(N):
        for i in range(N):
            if M[a][i] != 0: used.add(i)
    return sorted(used)

# which input coords appear (for the simp accessor list per Dk)
def ebody(i):
    # element with 1 at coord i, layout (oct_im*4 + h_im*2 + dbl_im)
    bits = [(i>>2)&1, (i>>1)&1, i&1]  # oct_im, h_im, dbl_im
    def dbl(d): return f"⟨{1 if (d==1 and not bits[2]) else 0}, {1 if (d==1 and bits[2]) else 0}⟩"
    # simpler: build the 8 coords
    v = [0]*8; v[i] = 1
    return (f"⟨⟨⟨{v[0]}, {v[1]}⟩, ⟨{v[2]}, {v[3]}⟩⟩, ⟨⟨{v[4]}, {v[5]}⟩, ⟨{v[6]}, {v[7]}⟩⟩⟩")

# unique (out,in,val) per Dk
uniq = []
for k, M in enumerate(mats):
    for a in range(N):
        for i in range(N):
            if M[a][i] != 0 and all(mats[j][a][i] == 0 for j in range(len(mats)) if j != k):
                uniq.append((a, i, M[a][i])); break
        else: continue
        break

L = []
P = L.append
P('''/-
  Phys.Algebra.DerivationLowerBound — N19 (L): the LOWER BOUND dim_ℚ Der(O ℚ) ≥ 14.
  ===========================================================================
  N19's scaffold (DerivationFinrank.lean) made `Module.finrank ℚ derivationQ` a
  well-typed ℕ and pinned `1 ≤ dim ≤ 64`. THIS module sharpens the lower frame to
  the EXACT `≥ 14` by EXHIBITING 14 explicit linearly-independent derivations of
  the terminal algebra `O ℚ`.

  ★ THE 14 DERIVATIONS are the explicit integer-sparse nullbasis of the Leibniz
  ℚ-system (workbench/N16-g2-dimension/nullbasis.pkl, re-verified exact-rational
  every node N16–N19). Each `DkE` is built directly as a `Module.End ℚ (O ℚ)` from
  8 coordinate functionals — MACHINERY on the DERIVED object (docs/STANDARD.md §3),
  NOT a posited number system — and each satisfies the Leibniz law `IsDerivQ`.

  ★ THE INDEPENDENCE IS DIAGONAL (the W1 reframe that dissolves a 14×14 determinant
  into a triangular read-off, docs/RUNBOOK.md W9.4 structure-over-expansion). Each
  `DkE` has a coordinate `(out aₖ, in iₖ)` where it is the UNIQUE nonzero among the
  14, so the functional `φₖ(D) := (D eᵢₖ).coord_aₖ` gives `φₖ(Dⱼ) = -δₖⱼ` — a
  negated identity ⟹ the 14 are linearly independent with no determinant.

  ★ THE BOUND. `span ℚ {D0E…D13E} ≤ derivationQ` (each is a derivation) and
  `finrank (span) = 14` (the 14 are independent), so `Submodule.finrank_mono` gives
  `14 ≤ finrank ℚ derivationQ`. Forward, foundations-only, NO posited `G₂`.

  THE MOAT — posit-vs-derive. The division-algebra field POSITS `𝕆` and reads
  `dim Der(𝕆) = 14` off `g₂` by hand. Here the 14 derivations are CONSTRUCTED and
  PROVED to be derivations + independent; the bound `≥ 14` is derived forward. The
  matching upper bound `≤ 14` (the so(7)→g₂ cut 21→14) + the `≅ g₂` structure are
  the downstream child N20, never asserted, never a bridge.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "gauge / g₂ / automorphism":
  what remains is the pure statement that the Leibniz-derivation ℚ-submodule of the
  Cayley–Dickson double of a double of a double has dimension at least 14, exhibited
  by 14 explicit linearly-independent derivations. No theorem STATEMENT needs a
  physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## The 8 coordinate functionals on `O ℚ` (model.py layout, index
    `oct_im*4 + h_im*2 + dbl_im`). Machinery on the DERIVED object. -/
''')
for i in range(N):
    P(f"def c{i} (z : O ℚ) : ℚ := z.{ACC[i]}")
P('')
P('/-! ## The 14 explicit derivations (the integer-sparse nullbasis). -/\n')

for k, M in enumerate(mats):
    f = [fform(a, M) for a in range(N)]
    body = f"⟨⟨⟨{f[0]}, {f[1]}⟩, ⟨{f[2]}, {f[3]}⟩⟩, ⟨⟨{f[4]}, {f[5]}⟩, ⟨{f[6]}, {f[7]}⟩⟩⟩"
    cu = coords_used(M)
    clist = ", ".join(f"c{i}" for i in cu)
    P(f"/-- Derivation {k} of the nullbasis. -/")
    P(f"def D{k}E : Module.End ℚ (O ℚ) where")
    P(f"  toFun z := {body}")
    P(f"  map_add' a b := by")
    P(f"    ext <;> simp [{clist}, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring")
    P(f"  map_smul' q z := by")
    P(f"    ext <;> simp [{clist}, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring")
    P('')

P('/-! ## Each `DkE` is a Leibniz-derivation (`IsDerivQ`). -/\n')
for k, M in enumerate(mats):
    cu = coords_used(M)
    clist = ", ".join(f"c{i}" for i in cu)
    P(f"theorem D{k}E_isDerivQ : IsDerivQ D{k}E := by")
    P(f"  intro x y")
    P(f"  ext <;>")
    P(f"    simp [D{k}E, {clist}, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,")
    P(f"      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,")
    P(f"      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring")
    P('')

# basis elements needed (the distinct 'in' coords)
ins = sorted(set(u[1] for u in uniq))
P('/-! ## Basis elements for the diagonal functionals. -/\n')
for i in ins:
    P(f"def e{i}elt : O ℚ := {ebody(i)}")
P('')

# the matrix of 14
vec = "![" + ", ".join(f"D{k}E" for k in range(len(mats))) + "]"

P('/-! ## The 14 are linearly independent (diagonal-functional route). -/\n')
P(f"theorem Dvec_linearIndependent : LinearIndependent ℚ {vec} := by")
P("  rw [Fintype.linearIndependent_iff]")
P("  intro g hg")
P("  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,")
P("    Matrix.cons_val_succ, add_zero] at hg")
# per k functional read
for k, (a, i, v) in enumerate(uniq):
    P(f"  have h{k} := congrArg (fun z => z.{ACC[a]}) (LinearMap.congr_fun hg e{i}elt)")
# combined simp
allc = ", ".join(f"c{i}" for i in range(N))
hlist = " ".join(f"h{k}" for k in range(len(mats)))
defs = ", ".join(f"D{k}E" for k in range(len(mats)))
edefs = ", ".join(f"e{i}elt" for i in ins)
P(f"  simp only [LinearMap.add_apply, LinearMap.smul_apply, LinearMap.zero_apply,")
P(f"    {defs}, {edefs}, {allc}, LinearMap.coe_mk, AddHom.coe_mk,")
P(f"    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,")
P(f"    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] at {hlist}")
P("  intro i")
P("  fin_cases i")
for k in range(len(mats)):
    P(f"  · simpa using h{k}")
P('')

# membership + bound
P('/-! ## The lower bound `14 ≤ dim_ℚ Der(O ℚ)`. -/\n')
P(f"theorem Dvec_mem (i : Fin {len(mats)}) : {vec} i ∈ derivationQ := by")
P("  fin_cases i")
for k in range(len(mats)):
    P(f"  · exact D{k}E_isDerivQ")
P('')
P("/-- ★★ THE LOWER BOUND: `14 ≤ dim_ℚ Der(O ℚ)`. Exhibited by the 14 explicit")
P("    linearly-independent derivations; their span sits inside `derivationQ`, and")
P("    a span of 14 independent vectors has dimension 14. Forward, NO posited G₂. -/")
P("theorem finrank_derivationQ_ge_14 : 14 ≤ Module.finrank ℚ derivationQ := by")
P(f"  have hspan : Module.finrank ℚ (Submodule.span ℚ (Set.range {vec})) = 14 := by")
P("    rw [finrank_span_eq_card Dvec_linearIndependent]; rfl")
P(f"  have hle : Submodule.span ℚ (Set.range {vec}) ≤ derivationQ := by")
P("    rw [Submodule.span_le, Set.range_subset_iff]")
P("    exact Dvec_mem")
P("  calc 14 = Module.finrank ℚ (Submodule.span ℚ (Set.range " + vec + ")) := hspan.symm")
P("    _ ≤ Module.finrank ℚ derivationQ := Submodule.finrank_mono hle")
P('')
P("end Phys.Algebra")

out = "\n".join(L) + "\n"
dest = os.path.join(HERE, 'scratch', 'DerivationLowerBound_gen.lean')
open(dest, 'w').write(out)
print(f"wrote {dest} ({len(out)} bytes, {out.count(chr(10))} lines)")
print("uniq coords:", uniq)
print("ins:", ins)
