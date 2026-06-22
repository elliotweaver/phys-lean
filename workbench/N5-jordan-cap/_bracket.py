from faithful_cd import *
a, c, p = symO('a'), symO('c'), symO('p')
Sa, Sp = starO(a), starO(p)
ac = mulO(a, c)
# bracket1 = (a*Sp)*(a*c) - a*(Sp*(a*c))   [associator a,Sp,ac]
b1 = addO(mulO(mulO(a, Sp), ac), negO(mulO(a, mulO(Sp, ac))))
# bracket2 = (p*Sa)*(a*c) - (p*(Sa*a))*c
b2 = addO(mulO(mulO(p, Sa), ac), negO(mulO(mulO(p, mulO(Sa, a)), c)))
print("bracket1 zero:", isO0(b1))
print("bracket2 zero:", isO0(b2))
print("b1+b2 zero:", isO0(addO(b1, b2)))
# full p-piece (no factor): -a(Sp(ac)) + (aSp)(ac) + (pSa)(ac) - (p(Sa a))c
piece = addO(addO(negO(mulO(a, mulO(Sp, ac))), mulO(mulO(a, Sp), ac)),
             addO(mulO(mulO(p, Sa), ac), negO(mulO(mulO(p, mulO(Sa, a)), c))))
print("full piece zero:", isO0(piece))
# print the .re.re coordinate of the piece (should be empty if zero)
print("piece.re.re monomials:", len(piece[0][0]), "| .re.im:", len(piece[0][1]),
      "| .im.re:", len(piece[1][0]), "| .im.im:", len(piece[1][1]))
# Cross-check: a known NONZERO degree-4: (a*b)*(c*a) - a*((b*c)*a)  [moufang_mid, TRUE so zero]
b, = (symO('b'),)
mm = addO(mulO(mulO(a, b), mulO(c, a)), negO(mulO(a, mulO(mulO(b, c), a))))
print("moufang_mid zero (should True):", isO0(mm))
# a genuinely false degree-4: (a*b)*(c*p) - a*(b*(c*p))
fls = addO(mulO(mulO(a, b), mulO(c, p)), negO(mulO(a, mulO(b, mulO(c, p)))))
print("random assoc zero (should False):", isO0(fls))
