#!/usr/bin/env python3
# run67: is jdef(E,B)=0 and the deg-2 cross =0 by E-NUCLEAR-ONLY (NOT central)?
# E nuclear means E associates in all 3 positions but does NOT commute. Free model.
import sys
from collections import defaultdict
sys.setrecursionlimit(1000000)

def pmul(P,Q):
    r=defaultdict(int)
    for ta,ca in P.items():
        for tb,cb in Q.items(): r[('*',ta,tb)]+=ca*cb
    return {k:v for k,v in r.items() if v}
def padd(*Ps):
    r=defaultdict(int)
    for P in Ps:
        for k,v in P.items(): r[k]+=v
    return {k:v for k,v in r.items() if v}
def pneg(P): return {k:-v for k,v in P.items()}
def jb(P,Q): return padd(pmul(P,Q),pmul(Q,P))
def jdef(A,B):
    AA=jb(A,A); return padd(jb(jb(A,B),AA),pneg(jb(A,jb(B,AA))))

# E-nuclearity normal form: E associates in all positions => bracketing irrelevant AROUND E.
# Implement: repeatedly apply directed rewrites to a fixpoint:
#   E*(P*Q) -> (E*P)*Q   [LA]
#   (P*E)*Q -> P*(E*Q)   [MA]
#   (P*Q)*E -> P*(Q*E)   [RA]
# These push E rightward/downward; terminating? LA moves E deeper-left, RA deeper-right.
# To avoid loops use a canonical measure: count inversions. Simpler: use a NORMAL FORM via
# leaf-sequence equality MODULO re-bracketing that only touches E-junctions. We test soundly:
# two monomials are E-nuclear-equal iff equal after removing the EFFECT of E-bracketing, i.e.
# their leaf sequence is equal AND the non-E bracketing is equal. Build key = (leaf_seq with E,
# bracketing of the X/B-subtree obtained by splicing E out but RECORDING E positions in seq).
def flatten(t):
    if isinstance(t,str): return (t,)
    return flatten(t[1])+flatten(t[2])
# splice E out, keep X/B bracketing
def stripE(t):
    if isinstance(t,str):
        return None if t=='E' else t
    l=stripE(t[1]); r=stripE(t[2])
    if l is None and r is None: return None
    if l is None: return r
    if r is None: return l
    return ('*',l,r)
def ecount(t):
    if isinstance(t,str): return 1 if t=='E' else 0
    return ecount(t[1])+ecount(t[2])
# E-nuclear key: (#E, leaf-sequence-with-E, X/B-bracketing). E nuclear => bracketing around E
# irrelevant but E's POSITION in the linear sequence matters (E doesn't commute). So key uses
# the full leaf SEQUENCE (preserves order => non-commutative) + the spliced X/B bracket.
def nuc_key(t): return (flatten(t), stripE(t))
def nuc_nf(P):
    r=defaultdict(int)
    for t,c in P.items(): r[nuc_key(t)]+=c
    return {k:v for k,v in r.items() if v}

E={'E':1}; X={'X':1}; B={'B':1}
print("jdef(E,B) under E-nuclear-only NF:", len(nuc_nf(jdef(E,B))), "(0 => provable by E nuclear alone)")
# deg-2 cross L2 = jdef(E+X,B) deg-2-in-E part
def edeg(t):
    return ecount(t)
full=jdef(padd(E,X),B)
L2={t:c for t,c in full.items() if edeg(t)==2}
L1={t:c for t,c in full.items() if edeg(t)==1}
print("L2 (deg-2 E) under E-nuclear-only NF:", len(nuc_nf(L2)))
print("L1 (deg-1 E) under E-nuclear-only NF:", len(nuc_nf(L1)), "(the hard kernel if >0)")
# Sanity: but matrix model showed L2 vanishes, L1 survives. The single-symbol free model may
# differ from the matrix model (distinct diagonal entries). Note this is single-symbol E.
