from fractions import Fraction as F
isoDepth=F(2); chargeTraceDepth=F(16,3); gatherIsoSpinCensus=F(4)
funCas,adjCas=F(3),F(8); depthWeight=F(1,3)
casimirRatio=funCas/adjCas
print("casimirRatio 3/8 == isoDepth/chargeTraceDepth?", casimirRatio==isoDepth/chargeTraceDepth, casimirRatio)
s=casimirRatio*depthWeight
print("s = (3/8)*(1/3) =", s)
print("interior 0<s<2?", 0<s<isoDepth, "| netIsoDepth=2-s=", isoDepth-s, ">0", isoDepth-s>0)
print("s<casimirRatio(3/8)?", s<casimirRatio, "| s<1?", s<1, "s<3/2?", s<F(3,2))
print("s!=4?", s!=4, "s!=2?", s!=2, "s!=1?", s!=1, "s!=3/2?", s!=F(3,2))
for nm,ss in [("1",F(1)),("3/2",F(3,2)),("1/8",F(1,8))]:
    T=F(4865,1000)
    ep=112+(chargeTraceDepth-ss)*T*F(3,2)
    print("  bare dressedInvAlphaEM(1/3,s=%s) ~= %.2f"%(nm,float(ep)))
