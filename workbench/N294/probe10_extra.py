
# ==== N294 probe10: clean disjointness lever — colour annihilates slotX(1); flavour moves them ====
flav=centralizer_in_f4(colour_lift)
FL=np.array([m.reshape(-1) for m in flav])
CA=np.array([m.reshape(-1) for m in colour_lift])

print("=== colour annihilates slotA1, slotB1, slotC1 (D 1 = 0)? ===")
mx=0.0
for D in colour_lift:
    for S in [slotA(I8[0]),slotB(I8[0]),slotC(I8[0])]:
        mx=max(mx,np.max(np.abs(D@mat_to_vec(S))))
print(" max |colour . slotX(1)| =",mx,"(0 => colour KILLS the real-unit generation directions, since D1=0)")

print("\n=== rank of map  flavour -> (Y slotA1, Y slotB1, Y slotC1) : ker = flavour ∩ {kills real-slots} ===")
rows=[]
for m in flav:
    v=np.concatenate([m@mat_to_vec(S) for S in [slotA(I8[0]),slotB(I8[0]),slotC(I8[0])]])
    rows.append(v)
M=np.array(rows)
r=np.linalg.matrix_rank(M,tol=1e-7)
print(" rank =",r," dim flavour =",len(flav)," ker dim =",len(flav)-r)
print(" (ker=0 => no nonzero flavour element kills all real-slots => flavour ∩ colour = 0 CLEAN)")

print("\n=== if ker>0, add u1-slots: colour also kills slotX(u1) (D u1=0). rank of full 6-target map ===")
rows2=[]
for m in flav:
    v=np.concatenate([m@mat_to_vec(S) for S in [slotA(I8[0]),slotB(I8[0]),slotC(I8[0]),slotA(u1),slotB(u1),slotC(u1)]])
    rows2.append(v)
M2=np.array(rows2)
r2=np.linalg.matrix_rank(M2,tol=1e-7)
print(" rank(6-target) =",r2," ker dim =",len(flav)-r2,"(ker=0 => flavour ∩ colour=0, colour kills all slotX(1),slotX(u1))")

print("\n=== W8 non-vacuity: famC in flavour, commutes with colour, NOT in colour (moves a diagonal colour fixes) ===")
# famC moves Dg? 
r=famC@mat_to_vec(Dg(0,1,0))
print(" famC(Dg(0,1,0)) nz:",{k:round(r[k],3) for k in range(N) if abs(r[k])>1e-6},"(nonzero => famC moves a diagonal)")
mxfix=max(np.max(np.abs(D@mat_to_vec(Dg(0,1,0)))) for D in colour_lift)
print(" max|colour . Dg(0,1,0)| =",mxfix,"(0 => colour FIXES diagonals => famC not a colour element)")

print("\n=== bundling: colour ⊕ flavour direct sum dim 16, [colour,flavour]=0 ===")
print(" rank(colour ∪ flavour) =",rankof(np.vstack([CA,FL])),"(16 => direct sum)")
mxc=max(np.max(np.abs(comm(D,fm.reshape(N,N)))) for D in colour_lift for fm in FL)
print(" max|[colour,flavour]| =",mxc)
print("\nDONE probe10")
