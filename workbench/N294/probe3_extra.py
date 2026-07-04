
# ==== N294 probe3 extra: ELECTROWEAK/isospin representation of the flavour-breaking coset ====
flav=centralizer_in_f4(colour_lift)
FL=np.array([m.reshape(-1) for m in flav])
COSET3=[kAB,kBC,kCA]
COS=np.array([m.reshape(-1) for m in COSET3])
DI_l,DJ_l,DK_l=su2L_lift

print("\n=== u1 under su(2)_L (does isospin move the fold-root?) ===")
for nm,D in [("DI",DI),("DJ",DJ),("DK",DK)]:
    print(f"  {nm}(u1)=",{k:round(v,3) for k,v in enumerate(D@u1) if abs(v)>1e-6})

print("\n=== isospin action on the 3 off-diagonal coset members {kAB,kBC,kCA} ===")
for nm,L in [("DI",DI_l),("DJ",DJ_l),("DK",DK_l)]:
    for kn,k in [("kAB",kAB),("kBC",kBC),("kCA",kCA)]:
        br=comm(L,k); mag=np.max(np.abs(br))
        print(f"  [{nm},{kn}] mag={mag:.3f}  in coset3? {proj_res(br,COS):.1e}  in flavour? {proj_res(br,FL):.1e}")

print("\n=== does su(2)_L COMMUTE with flavour su(3)? ===")
mxc=0.0
for L in [DI_l,DJ_l,DK_l]:
    for fm in flav:
        mxc=max(mxc,np.max(np.abs(comm(L,fm))))
print("max |[su(2)_L, flavour]| =",mxc,"(0 => commute; nonzero => coupled)")

print("\n=== [su(2)_L, flavour] stays in flavour? (flavour su(2)_L-invariant?) ===")
for nm,L in [("DI",DI_l),("DJ",DJ_l),("DK",DK_l)]:
    mx=max(proj_res(comm(L,fm),FL) for fm in flav)
    print(f"  [{nm}, flavour] in flavour? res={mx:.1e}")

print("\n=== Is su(2)_L IN f4?  does it commute with colour? ===")
F4=np.array([b.reshape(-1) for b in f4basis])
for nm,L in [("DI",DI_l),("DJ",DJ_l),("DK",DK_l)]:
    print(f"  jActL({nm}) in f4? res={proj_res(L,F4):.1e}")
mxcc=0.0
for L in [DI_l,DJ_l,DK_l]:
    for D in colour_lift:
        mxcc=max(mxcc,np.max(np.abs(comm(L,D))))
print("max |[su(2)_L, colour]| =",mxcc,"(N287: nonzero, su2L not in colour-centralizer)")
print("\nDONE probe3")
