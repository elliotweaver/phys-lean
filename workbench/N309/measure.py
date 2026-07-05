import math
sqrt2 = math.sqrt(2)
def amps(delta):
    return [1 + sqrt2*math.cos(delta + 2*math.pi*k/3) for k in range(3)]
def report(name, delta):
    a = amps(delta)
    m = [x*x for x in a]  # masses = amplitude^2
    print(f'--- {name}: delta={delta:.6f} rad ---')
    print('  amps        =', [round(x,6) for x in a])
    print('  sqrt-masses (abs) =', [round(abs(x),6) for x in a])
    print('  masses      =', [round(x,6) for x in m])
    ms = sorted(m)
    print('  sorted mass ratios m/m_min =', [round(x/ms[0],4) for x in ms])
    print('  sum a =', round(sum(a),6), ' sum a^2 =', round(sum(x*x for x in a),6))
    Q = sum(x*x for x in a)/(sum(a)**2)
    print('  Q =', round(Q,8))
    print('  cos(3 delta) =', round(math.cos(3*delta),6))
    prod = a[0]*a[1]*a[2]
    print('  prod a =', round(prod,6), ' formula (1/2)(sqrt2 cos3d -1) =', round(0.5*(sqrt2*math.cos(3*delta)-1),6))
# lepton masses MeV
me,mmu,mtau = 0.51099895, 105.6583755, 1776.86
sm = [math.sqrt(x) for x in (me,mmu,mtau)]
S = sum(sm)
print('=== MEASURED LEPTONS ===')
print('  sqrt-masses =', [round(x,6) for x in sm])
print('  normalized sqrt (a_k = 3*sqrt m / sum) =', [round(3*x/S,6) for x in sm])
print('  mass ratios mmu/me, mtau/me =', round(mmu/me,4), round(mtau/me,4))
print('  Q_lepton =', round((me+mmu+mtau)/S**2,8))
cosvals = sorted([(3*x/S - 1)/sqrt2 for x in sm])
print('  implied cos(delta+phase) sorted =', [round(x,6) for x in cosvals])
# infer Brannen delta from data by matching the smallest amplitude
print()
report('Brannen delta=2/9 rad', 2/9)
report('geometric delta=2pi/9 rad', 2*math.pi/9)
# also which delta best fits the leptons?
best=None
for i in range(1,100000):
    d=i*1e-5
    a=sorted(amps(d))
    n=[x/sum(a) for x in a]
    dn=sorted([x/S for x in sm])
    err=sum((n[j]-dn[j])**2 for j in range(3))
    if best is None or err<best[1]:
        best=(d,err)
print()
print('best-fit delta to leptons =', round(best[0],6),'rad  err=',best[1])
print('  2/9 =',round(2/9,6),'  2pi/9=',round(2*math.pi/9,6))
