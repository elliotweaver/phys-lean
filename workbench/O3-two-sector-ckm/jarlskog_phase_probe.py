import numpy as np

# Two-sector CKM overlap V = Ou^T D O_d, D = diag(1, e^{i*phi2}, e^{i*phi3})
# Ou, Od are REAL orthogonal (the Born-eigenvector frames per sector).
# GOAL: find how the Jarlskog invariant J depends on the phases (phi2, phi3),
# to DERIVE (not assert) the phase combination that enters sin(delta).

def rot3(a12, a23, a13):
    # small real orthogonal 3x3 built from 3 planar rotations (tridiagonal-ish: 1-3 via 2)
    c12,s12 = np.cos(a12), np.sin(a12)
    c23,s23 = np.cos(a23), np.sin(a23)
    c13,s13 = np.cos(a13), np.sin(a13)
    R12 = np.array([[c12,s12,0],[-s12,c12,0],[0,0,1.0]])
    R23 = np.array([[1.0,0,0],[0,c23,s23],[0,-s23,c23]])
    R13 = np.array([[c13,0,s13],[0,1.0,0],[-s13,0,c13]])
    return R12@R23@R13

def jarlskog(V):
    # standard rephasing invariant J = Im( V[0,0] V[1,1] conj(V[0,1]) conj(V[1,0]) )
    return np.imag(V[0,0]*V[1,1]*np.conj(V[0,1])*np.conj(V[1,0]))

# up and down frames (generic small angles)
Ou = rot3(0.10, 0.04, 0.003)
Od = rot3(0.13, 0.05, 0.004)

for (phi2, phi3, label) in [
    (np.pi/2, np.pi/2, "maximal both pi/2"),
    (2*np.pi/8, np.pi/8, "seed: 2P, P with P=pi/8"),
    (np.pi/4, np.pi/8, "same (2P=pi/4, P=pi/8)"),
    (np.pi/8, 0.0, "only gen2 at P"),
    (0.0, np.pi/8, "only gen3 at P"),
]:
    D = np.diag([1.0, np.exp(1j*phi2), np.exp(1j*phi3)])
    V = Ou.T @ D @ Od
    J = jarlskog(V)
    print(f"{label:32s}: phi2={phi2:.4f} phi3={phi3:.4f}  J={J:.6e}")

# Now: scan phase to see J ~ sin(?) dependence.  Fix phi3=0, vary phi2.
print("\n--- J vs phi2 (phi3=0), check sin dependence ---")
import math
for k in range(0,9):
    phi2 = k*np.pi/8
    D = np.diag([1.0, np.exp(1j*phi2), 1.0])
    V = Ou.T @ D @ Od
    J = jarlskog(V)
    print(f"phi2={phi2:.4f} (={k}*pi/8)  J={J:.6e}  J/sin(phi2)={ (J/math.sin(phi2)) if k>0 else float('nan'):.6e}")

# scan with the seed assignment scaled: phi2=2t, phi3=t
print("\n--- seed assignment phi2=2t, phi3=t: J vs t ---")
for k in range(0,9):
    t = k*np.pi/16
    D = np.diag([1.0, np.exp(1j*2*t), np.exp(1j*t)])
    V = Ou.T @ D @ Od
    J = jarlskog(V)
    ratios = []
    for f,nm in [(math.sin(t),"sin t"),(math.sin(2*t),"sin2t"),(math.sin(3*t),"sin3t")]:
        ratios.append(f"{nm}:{(J/f) if abs(f)>1e-9 else float('nan'):.4e}")
    print(f"t={t:.4f} (={k}*pi/16) J={J:.6e}  " + "  ".join(ratios))
