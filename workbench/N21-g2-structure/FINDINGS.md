# N21 FINDINGS — numerics (reconnaissance, re-verified independently W6)

## Independent reconstruction (NOT from nullbasis.pkl)
The 14 matrices were transcribed DIRECTLY from the banked Lean `D0E..D13E` definitions
(DerivationLowerBound.lean), as sparse `out[i] += coeff·c[j]` specs, then verified against the
EXACT octonion product (model.py mirror of the Lean CD product).

Results (structure_constants.py, EXACT Fraction):
- **All 14 are genuine derivations** of the exact octonion product. ✓
- **rank = 14** (independent). ✓ (matches banked `Dvec_linearIndependent` + `finrank=14`.)
- **The commutator bracket CLOSES in span(D)** — `[Di,Dj] = Σ cᵏ Dk` for every pair. ✓
- **All structure constants are INTEGERS in {-2,-1,1,2}.** Distribution: 1→47, -1→40, 2→8, -2→5.
- **84 nonzero brackets** out of 91 distinct pairs (7 pairs bracket to 0).

## The full bracket table (c such that [Di,Dj] = Σ cᵏ Dk)
[D0,D1]=-2 D2   [D0,D2]=2 D1    [D0,D3]=0       [D0,D4]=D7     [D0,D5]=-D6
[D0,D6]=D5      [D0,D7]=-D4     [D0,D8]=D2      [D0,D9]=D12    [D0,D10]=-D11
[D0,D11]=D10    [D0,D12]=-D9    [D0,D13]=-D1
[D1,D2]=-2 D0   [D1,D3]=-D2     [D1,D4]=D6      [D1,D5]=D7     [D1,D6]=-D4
[D1,D7]=-D5     [D1,D8]=0       [D1,D9]=D11     [D1,D10]=D12   [D1,D11]=-D9
[D1,D12]=-D10   [D1,D13]=D0
[D2,D3]=D1      [D2,D4]=-D5     [D2,D5]=D4      [D2,D6]=D7     [D2,D7]=-D6
[D2,D8]=-D0     [D2,D9]=-D10    [D2,D10]=D9     [D2,D11]=D12   [D2,D12]=-D11   [D2,D13]=0
[D3,D4]=D7      [D3,D5]=2 D6    [D3,D6]=-2 D5   [D3,D7]=-D4    [D3,D8]=D13
[D3,D9]=-D6     [D3,D10]=D7+D11 [D3,D11]=D4-D10 [D3,D12]=-D5   [D3,D13]=-D8
[D4,D5]=-D2     [D4,D6]=D1      [D4,D7]=2 D0+2 D3   [D4,D8]=D6-D12   [D4,D9]=D2+D13
[D4,D10]=0      [D4,D11]=-D0-D3 [D4,D12]=D1+D8  [D4,D13]=-D5-D9
[D5,D6]=2 D3    [D5,D7]=D1      [D5,D8]=-D11    [D5,D9]=0      [D5,D10]=D2+D13
[D5,D11]=D8     [D5,D12]=D3     [D5,D13]=D4-D10
[D6,D7]=D2      [D6,D8]=-D4+D10 [D6,D9]=D3      [D6,D10]=-D1-D8  [D6,D11]=D13
[D6,D12]=0      [D6,D13]=-D11
[D7,D8]=D9      [D7,D9]=-D8     [D7,D10]=-D0-D3 [D7,D11]=0     [D7,D12]=D13   [D7,D13]=-D12
[D8,D9]=-2 D11  [D8,D10]=D12    [D8,D11]=2 D9   [D8,D12]=-D10  [D8,D13]=D3
[D9,D10]=-D2    [D9,D11]=-2 D8  [D9,D12]=D0     [D9,D13]=D4-D10
[D10,D11]=-D0   [D10,D12]=2 D1+2 D8  [D10,D13]=D5+D9
[D11,D12]=D2    [D11,D13]=D6    [D12,D13]=D7

## Costume design (W8)
A WRONG structure constant — e.g. claiming `[D0,D1] = D2` (true value is -2 D2) — must fail to
compile. The diagonal-functional refutes it: evaluate both sides at a probe and read the pivot coord.

## Easiest brackets to bank first (single-term, coefficient ±1 or ±2)
[D0,D4]=D7, [D0,D1]=-2 D2, [D11,D12]=D2, [D12,D13]=D7, [D6,D7]=D2, [D7,D8]=D9 — single term, cheap.
Two-term ones (e.g. [D4,D7]=2D0+2D3) are the genuinely-octonionic associator entries.
