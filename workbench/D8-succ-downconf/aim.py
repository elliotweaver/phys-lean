import mpmath as mp
mp.mp.dps=30
pi=mp.pi
q=mp.cos(pi/4)              # 1/sqrt2
mbRatio=(1-q)**2/(3*(1+q)) # up/down leg (Md/Mu)^2
confBundle=mp.e**(-8*pi/3)  # Lambda/v
print("mbRatioDerived (Md/Mu)^2 =", mbRatio, " => Md/Mu =", mp.sqrt(mbRatio))
print("confBundle Lambda/v =", confBundle)
dcb = mbRatio/confBundle
print("downConfBundle (Md/Mlam)^2 =", dcb, " => Md/Mlam =", mp.sqrt(dcb))
ewc=mp.e**(-28*pi/3)
cosP=mp.cos(pi/8)
absChain=ewc*(cosP*mp.mpf(2)/3)*1*mp.cos(mp.mpf(2)/3)
confRatio=mp.e**(-12*pi)
print("absScaleChainDerived Md/M =", absChain)
print("confinementScaleRatio Lambda/M =", confRatio)
print("downConfLeg Md/Lambda =", absChain/confRatio)
# note: Md/v = absChain / ewc  (down scale in EW units)
print("Md/v =", absChain/ewc)
