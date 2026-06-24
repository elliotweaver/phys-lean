#!/usr/bin/env python3
"""Emit Lean constructor forms for the 14 basis derivations + the functional coords.

Each O ℚ element z has coords (model.py layout, index = oct_im*4 + h_im*2 + dbl_im):
  c0=z.re.re.re c1=z.re.re.im c2=z.re.im.re c3=z.re.im.im
  c4=z.im.re.re c5=z.im.re.im c6=z.im.im.re c7=z.im.im.im
A matrix M acts: output coord a = sum_i M[a][i] c_i.  Output element rebuilt as
  ⟨⟨⟨f0,f1⟩,⟨f2,f3⟩⟩,⟨⟨f4,f5⟩,⟨f6,f7⟩⟩⟩  with f_a the (sparse) linear form.
"""
import pickle, os
from fractions import Fraction as F
HERE = os.path.dirname(os.path.abspath(__file__))
os.chdir(os.path.join(HERE, '..', 'N16-g2-dimension'))
d = pickle.load(open('nullbasis.pkl', 'rb'))
mats = [[[F(x) for x in row] for row in m] for m in d['mats']]
N = 8

def fform(a, M):
    # output coord a = sum_i M[a][i] c_i  (each row has 0 or 1 nonzero here)
    terms = []
    for i in range(N):
        v = M[a][i]
        if v == 0: continue
        if v == 1: terms.append(f"c{i} z")
        elif v == -1: terms.append(f"-c{i} z")
        else: terms.append(f"({v})*c{i} z")
    if not terms: return "0"
    return " + ".join(terms) if len(terms) == 1 else "(" + " + ".join(terms) + ")"

for k, M in enumerate(mats):
    f = [fform(a, M) for a in range(N)]
    body = f"⟨⟨⟨{f[0]}, {f[1]}⟩, ⟨{f[2]}, {f[3]}⟩⟩, ⟨⟨{f[4]}, {f[5]}⟩, ⟨{f[6]}, {f[7]}⟩⟩⟩"
    print(f"def d{k}fun (z : O ℚ) : O ℚ := {body}")

# functional unique coords: (out a, in i) where Dk is unique nonzero
print("\n-- functional coords (out,in,val):")
for k, M in enumerate(mats):
    for a in range(N):
        for i in range(N):
            if M[a][i] != 0 and all(mats[j][a][i] == 0 for j in range(len(mats)) if j != k):
                print(f"--   D{k}: phi reads coord out={a} in={i}, value {M[a][i]}")
                break
        else:
            continue
        break
