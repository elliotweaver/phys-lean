import numpy as np

Cmat = np.array([
 [0,0,0,0,0,0,0],[0,0,-1,0,0,0,0],[0,1,0,0,0,0,0],
 [0,0,0,0,-1,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,1],[0,0,0,0,0,-1,0]],float)
Imat = np.array([
 [0,0,0,0,0,0,0],[0,0,-2,0,0,0,0],[0,2,0,0,0,0,0],
 [0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,-2],[0,0,0,0,0,2,0]],float)
Jmat = np.array([
 [0,0,2,0,0,0,0],[0,0,0,0,0,0,0],[-2,0,0,0,0,0,0],
 [0,0,0,0,0,0,0],[0,0,0,0,0,0,2],[0,0,0,0,0,0,0],[0,0,0,0,-2,0,0]],float)
def comm(A,B): return A@B-B@A
Kmat = comm(Imat,Jmat)/2.0

# colour subspaces (0-indexed): singlet=e1(0); Uhol=span{e2,e4,e6}=coords{1,3,5}; Uah=span{e3,e5,e7}=coords{2,4,6}
Uhol = [1,3,5]; Uah = [2,4,6]; colour_singlet=[0]
# su(2)_L: singlet e4(coord3); T1=span{e1,e2,e3}=coords{0,1,2}; T2=span{e5,e6,e7}=coords{4,5,6}
T1=[0,1,2]; T2=[4,5,6]; iso_singlet=[3]

print("=== (a) su(2)_L closure structure constants ===")
print("[I,J]=2K?", np.allclose(comm(Imat,Jmat),2*Kmat))
print("[J,K]=2I?", np.allclose(comm(Jmat,Kmat),2*Imat))
print("[K,I]=2J?", np.allclose(comm(Kmat,Imat),2*Jmat))
print("Kmat=\n",Kmat.astype(int))

def restrict(M, idxs):
    return M[np.ix_(idxs,idxs)]

print("\n=== (b) triplets are su(2)_L-invariant & irreducible ===")
for name,T in [("T1{e1,e2,e3}",T1),("T2{e5,e6,e7}",T2)]:
    inv = all( np.allclose(M[np.ix_([i for i in range(7) if i not in T],T)],0) for M in [Imat,Jmat,Kmat])
    print(f"{name}: su(2)_L-invariant={inv}")
    # irreducible: the restricted so(3) acts transitively -> only invariant subspaces are 0 and whole (spin-1 is irreducible)
    Ir,Jr,Kr = restrict(Imat,T),restrict(Jmat,T),restrict(Kmat,T)
    C = Ir@Ir+Jr@Jr+Kr@Kr
    print(f"   Casimir on {name} = {np.unique(np.round(np.linalg.eigvals(C),3))} (scalar => irreducible spin-1)")

print("\n=== (c) TRANSVERSALITY to colour: how each su(2)_L triplet sits in colour ===")
def where(coord):
    if coord in colour_singlet: return "colour-singlet(u1)"
    if coord in Uhol: return "Uhol(3)"
    if coord in Uah: return "Uah(3bar)"
labels=['e1','e2','e3','e4','e5','e6','e7']
for name,T in [("T1",T1),("T2",T2),("iso-singlet",iso_singlet)]:
    print(f"  {name}: "+", ".join(f"{labels[c]}∈{where(c)}" for c in T))

print("\n=== (d) su(2)_L triplets CROSS-CUT N276 Cartan weight blocks ===")
# N276: sgl=e1(0 for charge)... but N276 blocks: singlet span{u1=e1}?  Actually N276 sgl = charge-singlet = e1.
# Winert = span{e4,e5}=coords{3,4}; Wactive=span{e2,e3,e6,e7}=coords{1,2,5,6}
Winert=[3,4]; Wactive=[1,2,5,6]
print("  Winert{e4,e5}: e4∈iso-singlet, e5∈T2  => Winert SPLITS across iso-singlet & T2")
print("  Wactive{e2,e3,e6,e7}: e2,e3∈T1 ; e6,e7∈T2 => Wactive SPLITS across T1 & T2")
print("  => the non-abelian su(2)_L irreps (1+3+3) are DIFFERENT from the Cartan blocks (1+2+4)")

print("\n=== isospin-singlet is charged+coloured; colour-singlet is isospin-charged ===")
print("  iso-singlet e4: charge? Cmat e4 ->", (Cmat@np.eye(7)[3]).astype(int), " (nonzero=>charged) ; colour: e4∈Uhol(3)")
print("  colour-singlet e1(u1): isospin? Imat e1 ->", (Imat@np.eye(7)[0]).astype(int), "(0) but in triplet T1 (Jmat e1=",(Jmat@np.eye(7)[0]).astype(int),")")
