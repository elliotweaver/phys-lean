
# ==== N294 probe8: DECISIVE — disjointness flavour ∩ jActL(g2)=0 via the banked diagonal-fixing lever ====
flav=centralizer_in_f4(colour_lift)
FL=np.array([m.reshape(-1) for m in flav])
GA=np.array([m.reshape(-1) for m in gauge_lift])   # entrywise gauge jActL(g2), dim 14

print("=== jActL(g2) fixes the diagonal (banked jAct_Dg)? ===")
diags=[Dg(1,0,0),Dg(0,1,0),Dg(0,0,1)]
maxfix=0.0
for L in gauge_lift:
    for D in diags:
        maxfix=max(maxfix,np.max(np.abs(L@mat_to_vec(D))))
print(" max |jActL(g2) . diagonal| =",maxfix,"(0 => entrywise gauge FIXES the diagonal, N268 jAct_Dg)")

print("\n=== the diagonal-action map on flavour: X |-> X restricted to diagonals; rank? ===")
# For X in flavour, the vector (X(Dg100), X(Dg010), X(Dg001)) in arena^3. 
# If this map is INJECTIVE on flavour, then no nonzero flavour element fixes all diagonals,
# hence flavour ∩ {diagonal-fixers} = 0, and since jActL(g2) fixes diagonals, flavour ∩ jActL(g2)=0.
rows=[]
for m in flav:
    v=np.concatenate([m@mat_to_vec(D) for D in diags])
    rows.append(v)
M=np.array(rows)
print(" rank of (flavour -> action on 3 diagonals) =",np.linalg.matrix_rank(M,tol=1e-7),"(dim flavour=8; ==8 => injective => flavour has NO diagonal-fixer)")

print("\n=== => flavour ∩ jActL(g2) = 0 ? (colour ⊆ jActL(g2), so colour ∩ flavour = 0) ===")
print(" rank(jActL(g2) ∪ flavour) =",rankof(np.vstack([GA,FL])),"(==22=14+8 => fully disjoint)")

print("\n=== the two su(3)'s COMMUTE (colour centralizes flavour) — recheck bundled ===")
mx=0.0
for D in colour_lift:
    for fm in flav:
        mx=max(mx,np.max(np.abs(comm(D,fm))))
print(" max|[colour, flavour]| =",mx)

print("\n=== do the 6 banked generators {famA,B,C,kAB,BC,CA} Lie-generate all of flavour (dim 8)? ===")
def spanrank(mats,tol=1e-7): return np.linalg.matrix_rank(np.array([m.reshape(-1) for m in mats]),tol=tol)
G6=[famA,famB,famC,kAB,kBC,kCA]
print(" dim span(6 gens) =",spanrank(G6))
L1=G6+[comm(a,b) for a in G6 for b in G6]
print(" dim span(6 gens + brackets) =",spanrank(L1),"(want 8 = whole flavour su(3))")
print(" == flavour? rank(gen1 ∪ flav)=",rankof(np.vstack([np.array([m.reshape(-1) for m in L1]),FL])))

print("\n=== DIAGONAL-FIXER WITNESS for disjointness (which flavour gen moves which diagonal) ===")
for nm,op in [("famC",famC),("kAB",kAB)]:
    for dn,D in [("Dg(0,1,0)",Dg(0,1,0)),("Dg(0,0,1)",Dg(0,0,1))]:
        r=op@mat_to_vec(D)
        print(f"  {nm}({dn}) nz:",{k:round(r[k],3) for k in range(N) if abs(r[k])>1e-6})
print("\nDONE probe8")
