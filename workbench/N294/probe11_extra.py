
# ==== N294 probe11: is the RIGIDITY Z_{f4}(flavour)=colour structurally reducible (non-exhaustion)? ====
flav=centralizer_in_f4(colour_lift)
FL=np.array([m.reshape(-1) for m in flav])
CA=np.array([m.reshape(-1) for m in colour_lift])
GA=np.array([m.reshape(-1) for m in gauge_lift])

print("=== step-down: Z_{f4}(family so(3)) — what commutes with just the 3 family gens? ===")
Zfam=centralizer_in_f4([famA,famB,famC])
print(" dim Z_{f4}(family so(3)) =",len(Zfam))
ZFAMv=np.array([m.reshape(-1) for m in Zfam])
print(" contains colour? rank(Zfam ∪ colour)=",rankof(np.vstack([ZFAMv,CA])),"(colour dim 8)")
print(" contains flavour? rank(Zfam ∪ flavour)=",rankof(np.vstack([ZFAMv,FL])))

print("\n=== Z_{f4}(family so(3)) ∩ requiring commute with ONE coset elt kAB => colour? ===")
Zfam_kAB=centralizer_in_f4([famA,famB,famC,kAB])
print(" dim Z_{f4}(family + kAB) =",len(Zfam_kAB))
Zv=np.array([m.reshape(-1) for m in Zfam_kAB])
print(" == colour? rank(∪colour)=",rankof(np.vstack([Zv,CA])),"(8 => equals colour)")

print("\n=== is Z_{f4}(coset {kAB,kBC,kCA}) = colour already (coset generates flavour)? ===")
Zcos=centralizer_in_f4([kAB,kBC,kCA])
print(" dim Z_{f4}(coset) =",len(Zcos),"  == colour? rank=",rankof(np.vstack([np.array([m.reshape(-1) for m in Zcos]),CA])))

print("\n=== KEY structural lever: does colour = jActL(g2) ∩ Z_{f4}(flavour)?  (colour = gauge that commutes with flavour) ===")
# Everything in jActL(g2) commuting with flavour: is it exactly colour?
# jActL(g2)=14; the elements commuting with flavour among them:
rows=[]
for L in gauge_lift:
    pass
# compute centralizer of flavour WITHIN gauge_lift span
gaugeInFlavCent=[]
Aro=[]
for fm in flav:
    for a in range(N):
        for b in range(N):
            row=np.zeros(len(gauge_lift))
            for r,L in enumerate(gauge_lift): row[r]=(comm(L,fm))[a,b]
            Aro.append(row)
_,sg,vg=np.linalg.svd(np.array(Aro)); rg=int(np.sum(sg>1e-6))
gcent=[sum(vg[k][r]*gauge_lift[r] for r in range(len(gauge_lift))) for k in range(rg,len(gauge_lift))]
print(" dim {X in jActL(g2): [X,flavour]=0} =",len(gcent),"(== colour? =8)")
print(" == colour? rank=",rankof(np.vstack([np.array([m.reshape(-1) for m in gcent]),CA])))

print("\n=== does jActL(g2) ⊓ flavour = 0 (gauge and flavour meet only in 0)? then Z_{f4}(flavour)⊆? ===")
print(" rank(gauge ∪ flavour)=",rankof(np.vstack([GA,FL])),"(22=14+8 => gauge ⊓ flavour = 0)")

print("\n=== the deep one: Z_{f4}(flavour) — is every element block-diagonal (gen-preserving)? ===")
Zflav=centralizer_in_f4(flav)
def which_slot(idx):
    if idx<3: return "diag"
    if idx<11: return "A"
    if idx<19: return "B"
    return "C"
allbd=True
for X in Zflav:
    for j in range(N):
        for i in range(N):
            if which_slot(i)!=which_slot(j) and abs(X[i,j])>1e-6: allbd=False
print(" every Z_{f4}(flavour) element block-diagonal in gen index? ",allbd,"(=> equals colour, which is block-diag)")
print("\nDONE probe11")
