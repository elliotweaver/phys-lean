
# ==== N294 probe9: the CLEAN commuting-pair + disjointness lever (fold-root's two orthogonal faces) ====
flav=centralizer_in_f4(colour_lift)
FL=np.array([m.reshape(-1) for m in flav])
CA=np.array([m.reshape(-1) for m in colour_lift])

print("=== LEVER 1: colour acts WITHIN each generation slot (jAct_slotX banked); flavour MIXES slots ===")
# colour = jActL(D) : slotX(c) -> slotX(Dc). Preserves the slot position. Check on the 3 slots x {1,u1}.
sample=[("A1",slotA(I8[0])),("B1",slotB(I8[0])),("C1",slotC(I8[0])),("Au1",slotA(u1)),("Bu1",slotB(u1)),("Cu1",slotC(u1))]
def slot_of(vec):
    # which slot-positions have nonzero content: A=idx3..10, B=11..18, C=19..26, diag=0,1,2
    pos=set()
    if any(abs(vec[k])>1e-6 for k in range(0,3)): pos.add("diag")
    if any(abs(vec[k])>1e-6 for k in range(3,11)): pos.add("A")
    if any(abs(vec[k])>1e-6 for k in range(11,19)): pos.add("B")
    if any(abs(vec[k])>1e-6 for k in range(19,27)): pos.add("C")
    return pos
print(" colour[0] slot-map:")
for nm,S in sample:
    r=colour_lift[0]@mat_to_vec(S); print(f"   colour(slot{nm}) hits slots {slot_of(r)}  (expect same slot only)")
print(" famC slot-map (MIXES):")
for nm,S in sample[:3]:
    r=famC@mat_to_vec(S); print(f"   famC(slot{nm}) hits slots {slot_of(r)}")
print(" kAB slot-map (MIXES):")
for nm,S in sample[:3]:
    r=kAB@mat_to_vec(S); print(f"   kAB(slot{nm}) hits slots {slot_of(r)}")

print("\n=== LEVER 2: every colour element preserves ALL slot-positions (block-diagonal in gen index)? ===")
allblock=True
for D in colour_lift:
    for nm,S in sample:
        r=D@mat_to_vec(S)
        src=slot_of(mat_to_vec(S)); dst=slot_of(r)
        if not dst.issubset(src):
            allblock=False
print(" colour is block-diagonal in generation index (preserves each slot)? ",allblock)

print("\n=== LEVER 3: whole-algebra commuting — colour centralizes flavour via Jacobi on 6 gens ===")
# colour kills each of the 6 gens (banked); centralizer is a subalgebra => centralizes generated flavour
mx6=0.0
for D in colour_lift:
    for k in [famA,famB,famC,kAB,kBC,kCA]:
        mx6=max(mx6,np.max(np.abs(comm(D,k))))
print(" max|[colour, {6 gens}]| =",mx6,"(0 => colour centralizes all 6 gens; Jacobi => centralizes flavour)")

print("\n=== LEVER 4: disjointness colour ∩ flavour = 0 (colour block-diag, flavour has NO nonzero block-diag element) ===")
# Does flavour contain any nonzero element that preserves every slot (is block-diagonal in gen index)?
# Build the 'block-diagonal projector': operator preserves slot iff its image on each slot-basis stays in that slot.
# Test: is there a nonzero X in flavour that maps slotX-space into slotX-space for all X and diag into diag?
# Equivalently: X's off-block components must vanish. Construct constraints.
slot_ranges={"diag":range(0,3),"A":range(3,11),"B":range(11,19),"C":range(19,27)}
slot_basis_vecs=[]  # all 27 unit arena directions grouped by slot
def which_slot(idx):
    if idx<3: return "diag"
    if idx<11: return "A"
    if idx<19: return "B"
    return "C"
# X in flavour = sum c_r flav[r]. block-diagonal constraint: for each arena basis dir j, X(e_j) has no component in a different slot.
rows=[]
for j in range(N):
    sj=which_slot(j)
    for i in range(N):
        si=which_slot(i)
        if si!=sj:
            row=np.zeros(len(flav))
            for r,fm in enumerate(flav): row[r]=fm[i,j]
            rows.append(row)
A=np.array(rows)
_,sbd,_=np.linalg.svd(A); rbd=int(np.sum(sbd>1e-7))
print(" dim {X in flavour : X block-diagonal in gen index} =",len(flav)-rbd,"(0 => flavour ∩ block-diag = 0 => colour ∩ flavour = 0)")
print("\nDONE probe9")
