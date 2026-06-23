#!/usr/bin/env python3
# RUN 68: verify the per-entry pure-octonion associator LEVERS for pieceB block-1
# jdef(Hm, Xz p 0 0) entries, with ocR diagonal pulled OUT as central scalars d_i.
# We claim each entry = Sum_i d_i * (octonion associator combination), and each
# coefficient-of-d_i is an alternativity-vanishing octonion identity (no ocR).
# Verify those coefficient identities are IDENTICALLY ZERO in the faithful CD model.
from faithful_cd import symO, starO, addO, negO, mulO, isO0, zeroO

def assoc(P, Q, R):  # P*(Q*R) - (P*Q)*R
    return addO(mulO(P, mulO(Q, R)), negO(mulO(mulO(P, Q), R)))

# off-diagonal generators of Hm/Xz: x01,x02,x12 (and conjugates), y for second matrix
x01, x02, x12 = symO('x01'), symO('x02'), symO('x12')
y01, y02, y12 = symO('y01'), symO('y02'), symO('y12')
sx01, sx02, sx12 = starO(x01), starO(x02), starO(x12)
sy01, sy02, sy12 = starO(y01), starO(y02), starO(y12)

# Block-1: second matrix carries ONLY p at (0,1)/(1,0); so y01=p, y02=0, y12=0.
# But for the GENERAL lever family we keep all y; block-1 sets y02=y12=0.
# Hand-derived entry (0,1) coefficient identities (from pieceB_degsplit, full Y):
#   (I)  assoc(x01,x12,sy12) + assoc(x01,y12,sx12) = 0
#   (II) assoc(x02,sy02,x01)? ... let's just test candidate alternativity levers.

# The genuine question: in an ALTERNATIVE algebra, which associator SUMS vanish?
# Test a family of "swap" identities.
tests = {
  "assoc alternating (12 swap): assoc(u,v,w)+assoc(v,u,w)":
     lambda u,v,w: addO(assoc(u,v,w), assoc(v,u,w)),
  "assoc alternating (23 swap): assoc(u,v,w)+assoc(u,w,v)":
     lambda u,v,w: addO(assoc(u,v,w), assoc(u,w,v)),
  "(I) entry01-d0: assoc(x01,x12,sy12)+assoc(x01,y12,sx12)":
     lambda *_: addO(assoc(x01,x12,sy12), assoc(x01,y12,sx12)),
  "(II) entry01-d1: assoc(x02,sy02,x01)+assoc(y02,sx02,x01)":
     lambda *_: addO(assoc(x02,sy02,x01), assoc(y02,sx02,x01)),
}
u,v,w = x01, x12, sy12
for name, f in tests.items():
    try:
        r = f(u,v,w)
        print(f"{'ZERO ' if isO0(r) else 'NONZ '} {name}")
    except Exception as e:
        print(f"ERR  {name}: {e}")
