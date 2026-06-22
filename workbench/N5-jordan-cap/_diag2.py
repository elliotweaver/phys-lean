from faithful_cd import *
# nrm_assocL compiled in Lean (probe_g): (g*star g)*(x*y) = ((g*star g)*x)*y
g, x, y = symO('g'), symO('x'), symO('y')
N = mulO(g, starO(g))
lhs = mulO(N, mulO(x, y))
rhs = mulO(mulO(N, x), y)
print("nrm_assocL holds (model):", isO0(addO(lhs, negO(rhs))))
# A FALSE identity Lean would reject: general associativity (a*b)*c = a*(b*c) -- should be False
a,b,cc=symO('a'),symO('b'),symO('c')
print("general assoc (should be False):", isO0(addO(mulO(mulO(a,b),cc), negO(mulO(a,mulO(b,cc))))))
# Test the SPECIFIC bracket b1 that Lean's coordinate showed nonzero:
# b1 = (a*Sp)*(a*c) - a*(Sp*(a*c))
p=symO('p'); Sp=starO(p); ac=mulO(a,cc)
b1 = addO(mulO(mulO(a,Sp),ac), negO(mulO(a,mulO(Sp,ac))))
print("b1 zero (model says):", isO0(b1), " #re.re terms:", len(b1[0][0]))
# b2 = (p*Sa)*(a*c) - (p*(Sa*a))*c
Sa=starO(a)
b2 = addO(mulO(mulO(p,Sa),ac), negO(mulO(mulO(p,mulO(Sa,a)),cc)))
print("b2 zero (model says):", isO0(b2))
print("b1+b2 zero (model says):", isO0(addO(b1,b2)))
# Is the issue that star B is being treated as a NONTRIVIAL involution but my swap is wrong?
# Test: in B commutative, star(star x)=x. Check pstarB(pstarB(var))==var
v=pvar('q.rr')
print("pstarB involutive:", pstarB(pstarB(v))==v)
