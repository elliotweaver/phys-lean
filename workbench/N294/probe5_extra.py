
# ==== N294 probe5: is the generation-triplet a COMPLEX fundamental 3 of flavour su(3), complexified by the fold-root? ====
flav=centralizer_in_f4(colour_lift)
FL=np.array([m.reshape(-1) for m in flav])

# The generation-index x fold-complex-line 6-space: {slotX(1), slotX(u1) : X=A,B,C}
gen_basis = [("A1",slotA(I8[0])),("B1",slotB(I8[0])),("C1",slotC(I8[0])),
             ("Au1",slotA(u1)),("Bu1",slotB(u1)),("Cu1",slotC(u1))]
GB=np.array([mat_to_vec(m) for (_,m) in gen_basis])   # 6 x 27
def in_gen6(vecN): return proj_res_vec(vecN, GB)
def proj_res_vec(v, basisFlat):
    Q,_=np.linalg.qr(basisFlat.T); return np.max(np.abs(v-Q@(Q.T@v)))

print("=== closure of family so(3) {famA,famB,famC} and coset {kAB,kBC,kCA} on the gen6 space ===")
def gen_action_report(op,name):
    print(f"  -- {name} --")
    closed=True
    for (nm,S) in gen_basis:
        r=op@mat_to_vec(S)
        res=proj_res_vec(r,GB)
        nz={k:round(r[k],3) for k in range(N) if abs(r[k])>1e-6}
        # map nz back to gen labels
        print(f"    {name}({nm}) -> {nz}   in gen6? {res:.1e}")
        if res>1e-6: closed=False
    print(f"    => closed on gen6: {closed}")
for nm,op in [("famC",famC),("kAB",kAB)]:
    gen_action_report(op,nm)

print("\n=== does the WHOLE flavour su(3) close on gen6? ===")
allclosed=True
maxr=0.0
for r,fm in enumerate(flav):
    for (nm,S) in gen_basis:
        res=proj_res_vec(fm@mat_to_vec(S),GB)
        maxr=max(maxr,res)
        if res>1e-6: allclosed=False
print("flavour su(3) closes on gen6 (6-dim)? ",allclosed,"  max escape res =",maxr)

print("\n=== if not closed, WHERE does the coset send gen6? (identify the escaped directions) ===")
r=kAB@mat_to_vec(slotB(u1))
print("kAB(slotB u1) nz:",{k:round(r[k],3) for k in range(N) if abs(r[k])>1e-6})
r=kAB@mat_to_vec(slotA(u1))
print("kAB(slotA u1) nz:",{k:round(r[k],3) for k in range(N) if abs(r[k])>1e-6})
# slot index legend
print("\n slot index legend: idx 0,1,2=diag; then A(0,1)->cols3..10, B(0,2)->11..18, C(1,2)->19..26; within each +octonion component 0..7 (0=1,1=u1)")

print("\n=== the COMPLEX STRUCTURE: does 'multiply generation by u1' commute with the family so(3)? ===")
# J = the map slotX(c) -> slotX(u1*c)?  represented on gen6.
# Build J on gen6: slotX(1)->slotX(u1), slotX(u1)->slotX(-1) (since u1*u1=-1)
# Check: does famC commute with this J on the generation triplet? and is coset = J*famC-ish?
print("famC(slotB 1) =",{k:round((famC@mat_to_vec(slotB(I8[0])))[k],3) for k in range(N) if abs((famC@mat_to_vec(slotB(I8[0])))[k])>1e-6},"(expect slotA 1 = idx3)")
print("kAB (slotB 1) =",{k:round((kAB@mat_to_vec(slotB(I8[0])))[k],3) for k in range(N) if abs((kAB@mat_to_vec(slotB(I8[0])))[k])>1e-6},"(N292: slotA u1 = idx4)")
print("=> family: A<->B via real unit;  coset: A<->B via fold-root u1 (the imaginary/phase rotation)")
print("\nDONE probe5")
