from fast import omul,oadd,osub,oneg,ostar,oz,E
def assoc(a,b,c): return osub(omul(omul(a,b),c), omul(a,omul(b,c)))
for (a,b,c) in [(1,2,4),(1,4,2),(2,4,1),(1,2,3),(2,4,6),(4,2,1)]:
    v=assoc(E[a],E[b],E[c])
    print(a,b,c,'->',[str(x) for x in v])
# the not_associative_witness coordinate banked: im.re.im of (w1*(w2*w3) - (w1*w2)*w3) was used.
