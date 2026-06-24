#!/usr/bin/env python3
"""Dump the explicit 14-element nullbasis in readable e_i -> coeff e_a form."""
import pickle
from fractions import Fraction as F
d = pickle.load(open('nullbasis.pkl', 'rb'))
mats = [[[F(x) for x in row] for row in m] for m in d['mats']]
N = 8
for idx, M in enumerate(mats):
    nz = [(a, i, M[a][i]) for a in range(N) for i in range(N) if M[a][i] != 0]
    terms = []
    for a, i, v in nz:
        sign = '+' if v > 0 else '-'
        mag = abs(v)
        magstr = '' if mag == 1 else f'{mag}'
        terms.append(f'e{i}->{sign}{magstr}e{a}')
    print(f'D{idx}: ' + ', '.join(terms))
