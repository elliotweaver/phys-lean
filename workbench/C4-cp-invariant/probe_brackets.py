#!/usr/bin/env python3
"""C4 probe: the CP invariant built on the C3 survival-dressed mixing product.

The chain's convention-free CP invariant (mirroring N344's Jarlskog packaging but on the
arc-C NATIVE C3 mixing weights, and with N418's fold-phase magnitude folded in):

    jcpSq(P, v) = P * v^2 * cpFactorDerived,   cpFactorDerived = 1/2

where P = G12 * G23 * H13 is the C3 survival-dressed angle product
    G12 = mix12*(1-mix12) = s12^2 c12^2
    G23 = mix23*(1-mix23) = s23^2 c23^2
    H13 = mix13*(1-mix13)^2 = s13^2 c13^4  (far corner, double cosine)
and v = the associator value at the texture:
    v = assoc3_Fano = -1   -> v^2 = 1   (quark: CP present)
    v = assoc3_cline = 0   -> v^2 = 0   (lepton: CP EXACTLY zero)

C3 banked brackets over Cut:
    mix12 in [60740/1e7, 60770/1e7]
    mix23 in [5332/1e7,  5342/1e7]
    mix13 in [3191/1e8,  3197/1e8]
"""
from fractions import Fraction as F

mix12_lo, mix12_hi = F(60740,10**7), F(60770,10**7)
mix23_lo, mix23_hi = F(5332,10**7),  F(5342,10**7)
mix13_lo, mix13_hi = F(3191,10**8),  F(3197,10**8)

def interval_mul(a_lo,a_hi,b_lo,b_hi):
    # all positive here
    return a_lo*b_lo, a_hi*b_hi

# G12 = mix12*(1-mix12); 1-mix12 in [1-mix12_hi, 1-mix12_lo]
c12_lo, c12_hi = 1-mix12_hi, 1-mix12_lo
G12_lo, G12_hi = interval_mul(mix12_lo,mix12_hi, c12_lo,c12_hi)

c23_lo, c23_hi = 1-mix23_hi, 1-mix23_lo
G23_lo, G23_hi = interval_mul(mix23_lo,mix23_hi, c23_lo,c23_hi)

# H13 = mix13*(1-mix13)^2
c13_lo, c13_hi = 1-mix13_hi, 1-mix13_lo
c13sq_lo, c13sq_hi = c13_lo*c13_lo, c13_hi*c13_hi
H13_lo, H13_hi = interval_mul(mix13_lo,mix13_hi, c13sq_lo,c13sq_hi)

# P = G12*G23*H13
P12_lo, P12_hi = interval_mul(G12_lo,G12_hi, G23_lo,G23_hi)
P_lo, P_hi = interval_mul(P12_lo,P12_hi, H13_lo,H13_hi)

# cpFactorDerived = 1/2 (banked N418), full CP factor at Fano = 1*(1/2)=1/2
cpFac = F(1,2)
jcpSq_lo = P_lo*cpFac
jcpSq_hi = P_hi*cpFac

print("=== C3-native angle products (s^2 c^2 style) ===")
print(f"G12 in [{float(G12_lo):.8e}, {float(G12_hi):.8e}]")
print(f"G23 in [{float(G23_lo):.8e}, {float(G23_hi):.8e}]")
print(f"H13 in [{float(H13_lo):.8e}, {float(H13_hi):.8e}]")
print(f"P=G12*G23*H13 in [{float(P_lo):.8e}, {float(P_hi):.8e}]")
print()
print("=== jcpSq_quark = P * (1/2) (Fano: v^2=1, cpFac=1/2) ===")
print(f"jcpSq_quark in [{float(jcpSq_lo):.8e}, {float(jcpSq_hi):.8e}]")
print(f"  as exact: lo={jcpSq_lo}  hi={jcpSq_hi}")
import math
jcp_lo = math.sqrt(float(jcpSq_lo)); jcp_hi = math.sqrt(float(jcpSq_hi))
print(f"jcp_quark = sqrt(jcpSq) in [{jcp_lo:.8e}, {jcp_hi:.8e}]")
print()

# Choose clean rational brackets that SANDWICH the exact endpoints (widen outward)
def pick_bracket(lo, hi, name):
    print(f"--- pick bracket for {name}: exact [{float(lo):.10e}, {float(hi):.10e}]")
    # find a scale
    for exp in range(6,16):
        scale = 10**exp
        lo_n = math.floor(float(lo)*scale)
        hi_n = math.ceil(float(hi)*scale)
        if hi_n - lo_n >= 2 and hi_n - lo_n <= 60:
            print(f"    scale 1e{exp}: [{lo_n}/1e{exp}, {hi_n}/1e{exp}]  width={hi_n-lo_n}")
            # verify sandwich
            assert F(lo_n,scale) <= lo, f"lo fail {lo_n}"
            assert hi <= F(hi_n,scale), f"hi fail {hi_n}"
    print()

pick_bracket(G12_lo,G12_hi,"G12")
pick_bracket(G23_lo,G23_hi,"G23")
pick_bracket(H13_lo,H13_hi,"H13")
pick_bracket(P_lo,P_hi,"P")
pick_bracket(jcpSq_lo,jcpSq_hi,"jcpSq_quark")

# jcp bracket via sqrt: pick c with c^2 <= jcpSq_lo and jcpSq_hi <= d^2
print("=== jcp = sqrt(jcpSq) bracket (need c^2<=jcpSq_lo, jcpSq_hi<=d^2) ===")
for exp in range(6,14):
    scale=10**exp
    c = math.floor(jcp_lo*scale)
    d = math.ceil(jcp_hi*scale)
    if d-c>=1 and d-c<=60:
        c_ok = F(c,scale)**2 <= jcpSq_lo
        d_ok = jcpSq_hi <= F(d,scale)**2
        print(f"  scale 1e{exp}: c={c}/1e{exp} (c^2<=lo? {c_ok}), d={d}/1e{exp} (hi<=d^2? {d_ok}), width={d-c}")
