#!/usr/bin/env python3
# run66: ABSTRACT structural analysis of pieceB reduction jdef(D+X, Y) = jdef(X, Y).
# Model A,X,Y,D as free non-associative noncommutative matrix symbols; D is NUCLEAR
# (associates in all 3 positions) but NOT necessarily commuting, NOT central as octonion.
# Question: does jdef(D+X,Y) - jdef(X,Y) vanish by NUCLEARITY of D alone (matrix level),
# or does it need octonion alternativity of the X-entries (coordinate level)?
#
# jdef A Y = jb(jb A Y)(jb A A) - jb A (jb Y (jb A A));  jb P Q = P*Q + Q*P.
# We work in the FREE nonassociative ring on matrix symbols, then impose D-nuclearity as
# rewrite: any product with a maximal-left/middle/right D-association can be re-bracketed.
# We test at the MATRIX level (symbols D, X, Y are noncommuting matrices; * nonassoc),
# applying ONLY: D associates: D*(P*Q)=(D*P)*Q, (P*D)*Q=P*(D*Q), (P*Q)*D=P*(Q*D).
# If residual != 0 at matrix level, pieceB needs coordinate (octonion) alternativity.

import itertools, sys
sys.setrecursionlimit(100000)

# Represent a term as a binary tree: leaf is 'D','X','Y'; node is ('*',l,r).
# A "word" (monomial) is a tree. A polynomial is a dict {canonical_tree_key: coeff}.

def mul(a,b): return ('*',a,b)
def add_poly(p,q):
    r=dict(p)
    for k,v in q.items(): r[k]=r.get(k,0)+v
    return {k:v for k,v in r.items() if v}
def neg_poly(p): return {k:-v for k,v in p.items()}
def scal_poly(c,p): return {k:c*v for k,v in p.items()}
# polynomial of trees: dict tree->coeff
def pmul(P,Q):
    r={}
    for ta,ca in P.items():
        for tb,cb in Q.items():
            t=('*',ta,tb)
            r[t]=r.get(t,0)+ca*cb
    return {k:v for k,v in r.items() if v}
def padd(*Ps):
    r={}
    for P in Ps:
        for k,v in P.items(): r[k]=r.get(k,0)+v
    return {k:v for k,v in r.items() if v}
def pneg(P): return {k:-v for k,v in P.items()}

def jb(P,Q): return padd(pmul(P,Q), pmul(Q,P))
def jdef(A,Y):
    AA=jb(A,A)
    return padd(jb(jb(A,Y),AA), pneg(jb(A,jb(Y,AA))))

D={('D',):1}; X={('X',):1}; Y={('Y',):1}
def leaf(s): return ((s,),)
# fix leaf encoding: use string leaves directly
D={'D':1}; X={'X':1}; Y={'Y':1}

# tree mul/encoding with string leaves
def pmul(P,Q):
    r={}
    for ta,ca in P.items():
        for tb,cb in Q.items():
            t=('*',ta,tb)
            r[t]=r.get(t,0)+ca*cb
    return {k:v for k,v in r.items() if v}

DpX=padd(D,X)
lhs=jdef(DpX,Y)
rhs=jdef(X,Y)
diff=padd(lhs,pneg(rhs))
print("jdef(D+X,Y) raw monomials:", len(lhs))
print("jdef(X,Y)   raw monomials:", len(rhs))
print("diff (before D-nuclearity) monomials:", len(diff))

# Now apply D-nuclearity as a confluent rewrite: re-associate so that wherever a D sits,
# the tree is bracketed canonically. Simplest faithful test: define a normal form where
# association is irrelevant ONLY for subtrees that contain D at the associating junction.
# Practical proxy: collapse association completely (treat * as associative) ONLY for
# monomials whose ENTIRE bracketing can be flattened past D — i.e. count monomials by their
# leaf-sequence (the multiset/sequence of leaves) and see if diff vanishes when association
# is fully free (upper bound: associative model). If even the ASSOCIATIVE model is nonzero,
# pieceB fails by nuclearity alone. If associative model = 0 but nonassoc != 0, the residual
# is pure association of NON-D (X,Y) factors -> needs octonion alternativity.

def flatten(t):
    if isinstance(t,str): return (t,)
    return flatten(t[1])+flatten(t[2])
def assoc_key(t): return flatten(t)

def assoc_collapse(P):
    r={}
    for t,c in P.items():
        k=assoc_key(t)
        r[k]=r.get(k,0)+c
    return {k:v for k,v in r.items() if v}

diff_assoc=assoc_collapse(diff)
print("diff under FULL associativity (assoc model):", len(diff_assoc), "nonzero seqs")
if not diff_assoc:
    print("  => jdef(D+X,Y)-jdef(X,Y) VANISHES in the associative model.")
    print("  => residual is pure RE-ASSOCIATION of factors; with D nuclear, only X,Y assoc remains.")
else:
    print("  => NONZERO in associative model: leftover sequences (sample):")
    for k,v in list(diff_assoc.items())[:20]:
        print("    ", v, ''.join(k))

# Refine: how many surviving sequences contain a D? (D-containing seqs SHOULD cancel if the
# reduction is about dropping D; X/Y-only seqs surviving in assoc model would be a real bug.)
withD=[(k,v) for k,v in diff_assoc.items() if 'D' in k]
noD=[(k,v) for k,v in diff_assoc.items() if 'D' not in k]
print(f"  surviving seqs WITH D: {len(withD)};  WITHOUT D (pure X,Y): {len(noD)}")
