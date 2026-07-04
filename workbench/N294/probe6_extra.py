
# ==== N294 probe6: the su(3)/so(3) coset as the TEXTURE space; diagonal (generation-weight) action ====
flav=centralizer_in_f4(colour_lift)
FL=np.array([m.reshape(-1) for m in flav])

# The 5-dim coset = flavour minus family. dim symmetric-traceless-real-3x3 = 5. Coincidence?
print("dim flavour =",len(flav)," dim family so(3) =3  dim coset =",len(flav)-3," (symmetric-traceless-real-3x3 = 5)")

# Diagonal 3-space: Dg(d0,d1,d2). Traceless part = 2-dim. Off-diagonal real-symmetric part lives in slots.
# The su(3) acting on the 3-generation index: so(3)=antisymmetric (family), coset=symmetric-traceless (breaking).
# TEST: family famX acts on the 3 generation slots ANTISYMMETRICALLY; coset kX acts SYMMETRICALLY.
# Represent action on the 3 "real-unit slot" generation directions {slotA1,slotB1,slotC1} -> project.
sA,sB,sC = slotA(I8[0]),slotB(I8[0]),slotC(I8[0])
gens3=[mat_to_vec(sA),mat_to_vec(sB),mat_to_vec(sC)]
G3=np.array(gens3)
def proj3(v): 
    Q,_=np.linalg.qr(G3.T); c=Q.T@v; return c  # coeffs won't be slot-basis directly; use direct
def slot_coeffs(vec):
    # vec in R^27; slotA real-unit comp = idx3, slotB=idx11, slotC=idx19 (octonion comp 0)
    return np.array([vec[3],vec[11],vec[19]])
print("\n=== 3x3 matrix of family famA/famB/famC on {slotA1,slotB1,slotC1} (real-unit comps) ===")
for nm,op in [("famA",famA),("famB",famB),("famC",famC)]:
    M=np.array([slot_coeffs(op@mat_to_vec(S)) for S in [sA,sB,sC]]).T
    sym=np.max(np.abs(M+M.T)); asym=np.max(np.abs(M-M.T))
    print(f"  {nm}: 3x3=\n{np.round(M,3)}  |sym part|={sym:.3f} |asym part|={asym:.3f}")

print("\n=== 3x3 matrix of coset kAB/kBC/kCA on {slotA_u1,slotB_u1,slotC_u1} (u1 comps) ===")
sAu,sBu,sCu = slotA(u1),slotB(u1),slotC(u1)
def slot_u1_coeffs(vec):
    return np.array([vec[4],vec[12],vec[20]])  # u1 component (idx1) of each slot
for nm,op in [("kAB",kAB),("kBC",kBC),("kCA",kCA)]:
    M=np.array([slot_u1_coeffs(op@mat_to_vec(S)) for S in [sAu,sBu,sCu]]).T
    print(f"  {nm} on u1-slots: 3x3=\n{np.round(M,3)}")

print("\n=== coset action on {slotA1,slotB1,slotC1} (real-unit) => symmetric? ===")
for nm,op in [("kAB",kAB),("kBC",kBC),("kCA",kCA)]:
    # coset maps real-slot to u1-slot; read the u1-comp
    M=np.array([slot_u1_coeffs(op@mat_to_vec(S)) for S in [sA,sB,sC]]).T
    sym=np.max(np.abs(M-M.T)); asym=np.max(np.abs(M+M.T))
    print(f"  {nm}: real->u1 3x3=\n{np.round(M,3)}  |M-M^T|={sym:.3f} |M+M^T|={asym:.3f}")

print("\n=== KEY: family=antisymmetric index rotations, coset=symmetric index (the su(3)=so(3)+sym decomposition) ===")
# index-rotation representation on the 3 generation slots
print(" family famC ~ index rot A<->B via real unit (antisymmetric); coset kAB ~ index A<->B via u1 (symmetric under transpose+u1)")
print("\nDONE probe6")
