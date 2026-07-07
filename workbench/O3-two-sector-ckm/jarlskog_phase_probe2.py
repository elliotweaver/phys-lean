import numpy as np, math

# THEORY STRUCTURE (seed O3):
#  V = Ou^T D Od.
#  Up sector: r_u = top-at-closure NO-survival => Ou ~ near-identity (anchored, trivial mixing).
#  Down sector: r_d = one Born-survival step => Od carries the rotation (Born-eigenvector frame).
#  D = diag(1, e^{i2P}, e^{iP}) with P = foldPhase = pi/8 (DERIVED, N416).
# GOAL: find how J factors in the phase P, to DERIVE (not assert) the sin-correction to N344.

def rot(i,j,ang,n=3):
    R=np.eye(n,dtype=complex); c,s=math.cos(ang),math.sin(ang)
    R[i,i]=c;R[j,j]=c;R[i,j]=s;R[j,i]=-s;return R

def jarlskog(V):
    return np.imag(V[0,0]*V[1,1]*np.conj(V[0,1])*np.conj(V[1,0]))

P=math.pi/8
# down-sector Born-eigenvector frame angles (leading order; will use generic small ones)
a12d, a23d, a13d = 0.22, 0.04, 0.003   # ~cabibbo-ish, ~cb, ~ub for a down-dominated frame
Od = rot(0,1,a12d)@rot(1,2,a23d)@rot(0,2,a13d)

print("=== up sector TRIVIAL (Ou=I), phase in down frame ===")
for scaleP in [ (0,"P=0 no phase"), (1,"P=pi/8 derived"), (4,"P=pi/2 maximal (N344)") ]:
    k,label=scaleP
    Pk = k*math.pi/8
    D=np.diag([1.0,np.exp(1j*2*Pk),np.exp(1j*Pk)])
    V = np.eye(3) @ D @ Od
    J=jarlskog(V)
    print(f"{label:24s} J={J:.6e}")

# If Ou = I, then V = D Od, and V_ij = D_ii Od_ij (real Od, diag phase). 
# J = Im(V00 V11 conj(V01) conj(V10)) = Im( (1*Od00)(e^{i2P}Od11) (conj(1*Od01))(conj(e^{i2P}Od10)) )
#   = Im( Od00 Od11 Od01 Od10 * e^{i2P} e^{-i2P} ) = Im(real) = 0.  => up-trivial gives J=0.
# So CP needs BOTH sectors nontrivial. The up sector is NOT fully trivial: r_u is the
# top-at-closure case but the lighter up rungs still rotate. Let up carry a small rotation too.
print("\n=== BOTH sectors nontrivial (up small, down larger), phase = fold P ===")
a12u,a23u,a13u = 0.05, 0.015, 0.0005
Ou = rot(0,1,a12u)@rot(1,2,a23u)@rot(0,2,a13u)
for k,label in [(0,"P=0"),(1,"P=pi/8 DERIVED"),(2,"P=pi/4"),(4,"P=pi/2 MAXIMAL")]:
    Pk=k*math.pi/8
    D=np.diag([1.0,np.exp(1j*2*Pk),np.exp(1j*Pk)])
    V=Ou.conj().T @ D @ Od
    J=jarlskog(V)
    # unitarity check
    u=np.allclose(V.conj().T@V, np.eye(3))
    print(f"{label:18s} J={J:+.6e}  unitary={u}")

# scan continuous P, fit J = A*sin(P)+B*sin(2P)+C*sin(3P)?
print("\n=== J vs P (continuous), both sectors fixed ===")
Ps=np.linspace(0,math.pi,19)
Js=[]
for Pk in Ps:
    D=np.diag([1.0,np.exp(1j*2*Pk),np.exp(1j*Pk)])
    V=Ou.conj().T@D@Od
    Js.append(jarlskog(V))
Js=np.array(Js)
# least squares fit to sinP, sin2P, sin3P
M=np.vstack([np.sin(Ps),np.sin(2*Ps),np.sin(3*Ps)]).T
coef,res,rk,sv=np.linalg.lstsq(M,Js,rcond=None)
print("coef [sinP, sin2P, sin3P] =",coef, " residual=",res)
for Pk,J in zip(Ps,Js):
    print(f"  P={Pk:.4f} J={J:+.5e}  fit={coef[0]*math.sin(Pk)+coef[1]*math.sin(2*Pk)+coef[2]*math.sin(3*Pk):+.5e}")
