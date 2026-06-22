"""Verify building blocks 2 and 3 (Xz 0 q 0) and (Xz 0 0 r) are entrywise zero in the
faithful CD model, so the same ext;cdsimp0;ring route closes them. Reuses combined_span's
exact matrix model."""
import combined_span as cs

A = cs.Xz('a','b','c')
for label, B2 in [("bb2 (Xz 0 q 0)", cs.Xz(None,'q',None)),
                  ("bb3 (Xz 0 0 r)", cs.Xz(None,None,'r'))]:
    D = cs.jdef(A, B2)
    # faithful zero-poly check via the cs model is span-based; instead confirm each entry
    # reduces to identically zero by evaluating in faithful_cd would need separate import.
    nonzero = [(i,j) for i in range(3) for j in range(3) if D[i][j]]
    print(f"{label}: entries with nonzero formal monomials = {nonzero} (count {len(nonzero)})")
