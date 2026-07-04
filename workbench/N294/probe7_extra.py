
# ==== N294 probe7: candidate B leg [family,coset] ⊆ coset + theta-involution (fold-root conjugation) ====
flav=centralizer_in_f4(colour_lift)
FL=np.array([m.reshape(-1) for m in flav])
FAMv=np.array([m.reshape(-1) for m in [famA,famB,famC]])
COSv=np.array([m.reshape(-1) for m in [kAB,kBC,kCA]])

print("=== B-leg: [family, coset] ⊆ coset ? (the symmetric-pair module leg) ===")
for fn,F in [("famA",famA),("famB",famB),("famC",famC)]:
    for kn,K in [("kAB",kAB),("kBC",kBC),("kCA",kCA)]:
        br=comm(F,K); mag=np.max(np.abs(br))
        print(f"  [{fn},{kn}] mag={mag:.3f}  in coset span? {proj_res(br,COSv):.1e}  in family? {proj_res(br,FAMv):.1e}")

print("\n=== the full 5-dim coset (with 2 diagonal u1-dressed) — is it family-so(3)-invariant? ===")
# 5-dim coset = flavour minus family
Qf,_=np.linalg.qr(FAMv.T)
coset5=[]
for v in FL:
    r=v-Qf@(Qf.T@v)
    coset5.append(r)
CO5=np.array(coset5)
rk5=rankof(np.vstack([CO5,FAMv]))-3
print(" coset dim =",rk5)
for fn,F in [("famA",famA),("famB",famB),("famC",famC)]:
    mx=max(proj_res(comm(F,fm.reshape(N,N)),np.vstack([CO5,FAMv])) for fm in FL)  # stays in flavour trivially
# check [family, coset5] subset coset5
coset5mats=[c.reshape(N,N) for c in coset5 if np.max(np.abs(c))>1e-6]
maxleg=0.0
for F in [famA,famB,famC]:
    for cm in coset5mats:
        maxleg=max(maxleg, proj_res(comm(F,cm), CO5))
print(" [family, coset5] stays in coset5? maxres =",maxleg,"(0 => coset is a family-so(3) module)")

print("\n=== theta-involution: is the Cartan involution = fold-root conjugation (u1 -> -u1)? ===")
# theta on f4: conjugate the fold-root in the arena. Represent 'star on the u1-line' as: 
# the map induced by A -> conj(A) where conj negates the u1-component of every octonion entry?
# Simplest test: family generators use real-unit slots (theta-even); coset uses u1-slots (theta-odd).
# So under 'negate u1 in the arena', family invariant, coset flips sign. Verify via the operators:
# theta(op) := conj o op o conj where conj = arena map negating u1 comp. Build conj:
def conj_u1(vec):
    v=vec.copy()
    # negate the u1 (idx1) octonion component in every slot: idx1(A)=4? no.
    # slot layout: diag 0,1,2 (all real); A: idx3..10 (oct comp0..7), so u1 comp of A = idx4; B: 11..18 u1=12; C:19..26 u1=20
    v[4]=-v[4]; v[12]=-v[12]; v[20]=-v[20]
    return v
CONJ=np.diag([1.0]*N); 
for i in [4,12,20]: CONJ[i,i]=-1.0
def theta(op): return CONJ@op@CONJ
for nm,op in [("famA",famA),("famB",famB),("famC",famC)]:
    d=np.max(np.abs(theta(op)-op)); print(f"  theta({nm})-{nm} = {d:.3f} (0 => family theta-EVEN)")
for nm,op in [("kAB",kAB),("kBC",kBC),("kCA",kCA)]:
    d=np.max(np.abs(theta(op)+op)); print(f"  theta({nm})+{nm} = {d:.3f} (0 => coset theta-ODD)")
print("  (=> Cartan involution theta = negate the fold-root in generation slots; family=+1, coset=-1)")

print("\n=== does theta preserve flavour su(3) (is it an automorphism)? ===")
mx=max(proj_res(theta(fm.reshape(N,N)),FL) for fm in FL)
print(" theta(flavour) subset flavour? res =",mx)
print("\nDONE probe7")
