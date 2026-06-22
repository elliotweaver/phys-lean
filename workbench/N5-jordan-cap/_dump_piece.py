from faithful_cd import *
a, c, p = symO('a'), symO('c'), symO('p')
Sa, Sp = starO(a), starO(p)
ac = mulO(a, c)
piece = addO(addO(negO(mulO(a, mulO(Sp, ac))), mulO(mulO(a, Sp), ac)),
             addO(mulO(mulO(p, Sa), ac), negO(mulO(mulO(p, mulO(Sa, a)), c))))
print("piece.re.re num terms:", len(piece[0][0]))
print("piece.re.re:", dict(list(piece[0][0].items())[:8]))
# Also dump ka's re.re to cross-check structure vs Lean ka (which compiles=zero)
x,y,w=symO('x'),symO('y'),symO('w')
Sx,Sy,Sw=starO(x),starO(y),starO(w)
yx=mulO(y,x); SxSy=mulO(Sx,Sy)
ka=addO(addO(mulO(mulO(Sx,Sw),yx), negO(mulO(Sx,mulO(Sw,yx)))),
        addO(negO(mulO(mulO(SxSy,w),x)), mulO(SxSy,mulO(w,x))))
print("ka.re.re num terms (should be 0):", len(ka[0][0]), len(ka[0][1]), len(ka[1][0]), len(ka[1][1]))
