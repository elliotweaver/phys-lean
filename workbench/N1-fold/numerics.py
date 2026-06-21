#!/usr/bin/env python3
"""
N1 numerics-with-teeth — the fold (self-look-back) on concrete carriers Z/n.

The fold law is  look(x) + x = 0  (mod n), i.e. look(x) = -x (mod n).
SELF-BLINDNESS is the claim:  look(x) = x  =>  x = 0.

This probe shows the TEETH of N1: self-blindness holds EXACTLY on the
2-torsion-free carriers (n odd), and FAILS on carriers with 2-torsion (n even),
where x = n/2 is a NONZERO fixed point of the fold. So the torsion-free
hypothesis in the Lean theorem `fold_self_blind` is not decorative — it is the
precise boundary between "self-blind" and "not self-blind".

The GARBAGE WITNESS the kernel must reject (the costume): claiming self-blindness
on a char-2 carrier (ZMod 2), where look(1) = -1 = 1 is a nonzero fixed point.
"""

def look(x, n):
    return (-x) % n

def fold_law_holds(n):
    # look(x) + x == 0 (mod n) for all x
    return all((look(x, n) + x) % n == 0 for x in range(n))

def fixed_points(n):
    # x with look(x) = x  (i.e. -x = x mod n, i.e. 2x = 0 mod n)
    return [x for x in range(n) if look(x, n) == x]

def is_self_blind(n):
    # self-blindness: the ONLY fixed point is 0
    return fixed_points(n) == [0]

def two_torsion_free(n):
    # no nonzero y with y + y = 0  (mod n)
    return [y for y in range(n) if (y + y) % n == 0] == [0]

print("n  fold_law  fixed_points        self_blind  2-torsion-free")
print("-" * 64)
mismatches = 0
for n in range(1, 21):
    fl = fold_law_holds(n)
    fp = fixed_points(n)
    sb = is_self_blind(n)
    tf = two_torsion_free(n)
    flag = "" if sb == tf else "   <-- MISMATCH"
    if sb != tf:
        mismatches += 1
    assert fl, f"fold law must hold on Z/{n}"
    print(f"{n:<3}{str(fl):<10}{str(fp):<20}{str(sb):<12}{str(tf)}{flag}")

print("-" * 64)
print(f"fold law holds on every Z/n: True")
print(f"self_blind(n) == two_torsion_free(n) for all tested n: {mismatches == 0}")
print()
print("TEETH:")
print("  * n=2 (char 2): fixed points =", fixed_points(2),
      "-> x=1 is a NONZERO fixed point -> self-blindness FALSE.")
print("    This is the COSTUME: 'self-blind on ZMod 2' must be REJECTED by Lean.")
print("  * n odd (2-torsion-free): only fixed point is 0 -> self-blindness TRUE.")
print("  * Boundary is EXACTLY 2-torsion-freeness => the Lean hypothesis is load-bearing.")
print()
print("NON-VACUITY (over Z): x=1 is nonzero and look(1) = -1 != 1,")
print("  so 'no nonzero fixed point' is non-vacuously true and such states exist.")
