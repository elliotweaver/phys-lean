import numpy as np, math

# DISCOVER (not assert) the effective single CP phase delta_eff of the two-sector overlap
# V = Ou^T D Od, D = diag(1, e^{i2P}, e^{iP}), defined by J = sqrt(g12 g23 h13) * sin(delta_eff),
# in the LEADING-ORDER (small real angles) limit. Determine delta_eff(P).

def rot(i,j,ang,n=3):
    R=np.eye(n,dtype=complex); c,s=math.cos(ang),math.sin(ang)
    R[i,i]=c;R[j,j]=c;R[i,j]=s;R[j,i]=-s;return R

def jarlskog(V):
    return np.imag(V[0,0]*V[1,1]*np.conj(V[0,1])*np.conj(V[1,0]))

# leading-order small angles (both sectors nontrivial)
def build(P, s):
    # s = overall scale of the real mixing angles (take small to isolate leading order)
    Ou = rot(0,1,0.5*s)@rot(1,2,0.15*s)@rot(0,2,0.02*s)
    Od = rot(0,1,1.0*s)@rot(1,2,0.30*s)@rot(0,2,0.04*s)
    D  = np.diag([1.0, np.exp(1j*2*P), np.exp(1j*P)])
    V  = Ou.conj().T @ D @ Od
    return V

# The three angle-products g12,g23,h13 in terms of |V| entries (standard):
#   s12=|Vus|/sqrt(|Vud|^2+|Vus|^2) etc; but simpler: use J and the "reduced" combination
#   K = |V12 V21 V13 V23 ...|. Instead extract sin(delta_eff) = J / (product of sin*cos of the 3 mixing angles).
# Standard PDG:  J = c12 s12 c23 s23 c13^2 s13 sin(delta)
def observables(V):
    aV=np.abs(V)
    s13 = aV[0,2]
    c13 = math.sqrt(max(0.0,1-s13**2))
    s12 = aV[0,1]/c13
    c12 = aV[0,0]/c13
    s23 = aV[1,2]/c13
    c23 = aV[2,2]/c13
    return s12,c12,s23,c23,s13,c13

for s in [0.02, 0.05, 0.1]:
    print(f"\n=== angle-scale s={s} ===")
    for k in range(0,9):
        P=k*math.pi/8
        V=build(P,s)
        J=jarlskog(V)
        s12,c12,s23,c23,s13,c13=observables(V)
        denom = c12*s12*c23*s23*c13**2*s13
        sind = J/denom if abs(denom)>1e-30 else float('nan')
        # delta_eff
        sd=max(-1,min(1,sind))
        de=math.asin(sd)
        print(f"  P={P:.4f}(={k}pi/8)  J={J:+.4e}  sin(delta_eff)={sind:+.5f}  delta_eff={de:+.4f}  delta_eff/P={(de/P) if k>0 else float('nan'):.4f}  sin(P)={math.sin(P):.4f}")
