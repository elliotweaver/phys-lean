
# ==== N294 probe4: RIGIDITY structural tractability + banked-lever route for whole-algebra colour-neutrality ====
flav=centralizer_in_f4(colour_lift)
FL=np.array([m.reshape(-1) for m in flav])
CA=np.array([m.reshape(-1) for m in colour_lift])
COSET3=[kAB,kBC,kCA]

print("\n=== R1: does the coset {kAB,kBC,kCA} alone Lie-generate flavour (dim 8)? which brackets give the 2 diagonal dirs? ===")
def spanrank(mats,tol=1e-7): return np.linalg.matrix_rank(np.array([m.reshape(-1) for m in mats]),tol=tol)
lvl0=[kAB,kBC,kCA]
print(" dim span{kAB,kBC,kCA} =",spanrank(lvl0))
br1=[comm(a,b) for a in lvl0 for b in lvl0]
lvl1=lvl0+br1
print(" dim span{coset + [coset,coset]} =",spanrank(lvl1))   # +family (N293)
br2=[comm(a,b) for a in lvl1 for b in lvl1]
lvl2=lvl1+br2
print(" dim span{coset + brackets + double-brackets} =",spanrank(lvl2),"(want 8)")
# So flavour = Lie<coset>. Good => colour centralizes coset => centralizes flavour (Jacobi).

print("\n=== R2: whole-algebra colour-neutrality via banked levers (colour kills each coset gen) ===")
for nm,k in [("kAB",kAB),("kBC",kBC),("kCA",kCA)]:
    mx=max(np.max(np.abs(comm(D,k))) for D in colour_lift)
    print(f"  max|[colour,{nm}]| = {mx:.2e}  (banked N291/292: colour kills u1 => coset colour-neutral)")

print("\n=== R3: RIGIDITY structural test — flavour-module decomposition of f4 (any flavour-INVARIANTS outside colour?) ===")
# Z_{f4}(flavour) = { X in f4 : [X, flav_i]=0 all i } = flavour-invariants of the adjoint f4-module.
# Structural claim: f4 = colour[8] (+ flavour[8] adjoint) + complement[36]; colour is flavour-trivial.
# If the 36-complement has NO flavour-trivial (invariant) vector, then Z_{f4}(flavour)=colour EXACTLY.
Zflav=centralizer_in_f4(flav)
print(" dim Z_{f4}(flavour) =",len(Zflav),"  dim colour =",len(colour_lift))
ZFL=np.array([m.reshape(-1) for m in Zflav])
print(" Z_{f4}(flavour) == colour? rank(union)=",rankof(np.vstack([ZFL,CA])),"(==8 => EXACT rigidity)")
# build the 36 complement: f4 minus (colour + flavour); check flavour-invariants inside it
F4=np.array([b.reshape(-1) for b in f4basis])
cf=np.vstack([CA,FL])   # colour+flavour, dim16
# complement basis: f4 vectors orthogonal to colour+flavour
Qcf,_=np.linalg.qr(cf.T)
compl=[]
for b in f4basis:
    v=b.reshape(-1); r=v-Qcf@(Qcf.T@v)
    if np.max(np.abs(r))>1e-6: compl.append(r)
CM=np.array(compl); print(" complement rank =",rankof(CM),"(want 36)")
# flavour-invariants inside complement: solve [X, flav_i]=0 for X in complement span
# reuse: any X in Z_{f4}(flavour) that's outside colour would be a complement-invariant
Zextra=[]
for m in Zflav:
    v=m.reshape(-1); r=v-Qcf[:, :8]@(Qcf[:, :8].T@v) if False else v
# simpler: is Z_{f4}(flavour) entirely within colour?
print(" Z_{f4}(flavour) subset colour? maxres=",max(proj_res(m,CA) for m in Zflav),"(0 => rigidity holds, structural)")

print("\n=== R4: is the exact-rigidity a heavy exhaustion or reducible? measure the DEFINING constraint size ===")
# Z_{f4}(flavour) = commutant of flavour. Since flavour=Lie<coset>, commutant of flavour = commutant of {kAB,kBC,kCA}.
Zcoset=centralizer_in_f4([kAB,kBC,kCA])
print(" dim Z_{f4}({kAB,kBC,kCA}) =",len(Zcoset),"(== dim Z_{f4}(flavour) since coset generates)")
print(" Z_{f4}(coset)==colour? rank=",rankof(np.vstack([np.array([m.reshape(-1) for m in Zcoset]),CA])),"(==8 => can prove rigidity via 3 generators only)")
print("\nDONE probe4")
