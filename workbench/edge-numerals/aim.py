from fractions import Fraction as F

def partialExp(q, N):
    s = F(0); fact = 1
    for i in range(N):
        if i > 0: fact *= i
        s += q**i / F(fact)
    return s

def expRemBound(q, N):
    fact = 1
    for i in range(1, N+1): fact *= i
    return (q**N / F(fact)) * (F(1) / (1 - q/F(N+1)))

def check_ge(name, c, a, N):
    # cutLog_ge_certified: partialExp(a,N)+rem <= c  => a <= cutLog c
    b = partialExp(a,N) + expRemBound(a,N)
    ok = b <= c
    print(f"[GE] {name}: pExp({a},{N})+rem={float(b):.6f} <= {float(c):.6f} ? {ok}")
    assert ok

def check_le(name, c, b, N):
    # cutLog_le_certified: c <= partialExp(b,N)  => cutLog c <= b
    p = partialExp(b,N)
    ok = c <= p
    print(f"[LE] {name}: {float(c):.6f} <= pExp({b},{N})={float(p):.6f} ? {ok}")
    assert ok

# ---- L_b0 = cutLog(mass0), clean intermediate rationals 56/10, 57/10 ----
# mass0 in [5.6617, 5.6617]; 56/10 <= mass0 <= 57/10
print("mass0 clean bounds: 5.6 <=", 5.6616871249, "and", 5.6617347136, "<= 5.7")
check_ge("cutLog(56/10) >= 17/10", F(56,10), F(17,10), 12)
check_le("cutLog(57/10) <= 18/10", F(57,10), F(18,10), 14)
print()

# ---- L_b2 via cutLog(1/mass2), intermediate 100/34, 100/33 ----
# mass2 in [0.33663, 0.33666]; 33/100 <= mass2 <= 34/100 => 100/34 <= 1/mass2 <= 100/33
print("mass2 clean bounds: 0.33 <=", 0.33663204, "and", 0.3366552484, "<= 0.34")
check_ge("cutLog(100/34) >= 1", F(100,34), F(1), 8)
check_le("cutLog(100/33) <= 12/10", F(100,33), F(12,10), 10)
print("  => cutLog(1/mass2) in [1,12/10]; cutLog(mass2) in [-12/10,-1]")
print()

# ---- L_dcb = cutLog(downConfBundle), bounds ARE rationals 7280/100, 7288/100 ----
check_ge("cutLog(7280/100) >= 4", F(7280,100), F(4), 6)
check_le("cutLog(7288/100) <= 45/10", F(7288,100), F(45,10), 12)
print()

# ---- assembled edge logs ----
# L_mb in [-41/10,-4] (banked); L_b0 in [17/10,18/10]; L_b2 in [-12/10,-1]
# bottom edge log = L_mb + L_b0 - L_b2 in [-41/10+17/10-(-1), -4+18/10-(-12/10)]
bl_lo = F(-41,10)+F(17,10)-F(-1)      # -L_b2 max = 1
bl_hi = F(-4)+F(18,10)-F(-12,10)      # -L_b2 min = 12/10
print("bottom edge log in", float(bl_lo), float(bl_hi), "=", bl_lo, bl_hi)
# light edge log = cutLog(dcb) + L_b2 in [4+(-12/10), 45/10+(-1)]
ll_lo = F(4)+F(-12,10); ll_hi = F(45,10)+F(-1)
print("light edge log in", float(ll_lo), float(ll_hi), "=", ll_lo, ll_hi)
# charm edge log = cutLog(1/mbRatioDerived) in [4,41/10] (banked re-export)
print("charm edge log in [4, 41/10] (banked)")
print("\nALL CHECKS PASS")
