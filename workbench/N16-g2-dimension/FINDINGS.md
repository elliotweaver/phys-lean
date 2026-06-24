# N16 — FINDINGS (the anti-circling record + handoff for any child)

## Confirmed by faithful EXACT-rational numerics (workbench scripts, re-runnable)
The model (`model.py`) builds `O ℚ = CD(CD(Dbl ℚ))` from the EXACT banked CD product
+ star (byte-for-byte the Lean formula), flattens to 8 ℚ-coords e₀..e₇, and reproduces
the standard octonion table (e₀=1; e_i²=−1 for i≥1).

`deriv_dim.py` builds the full Leibniz linear system (512 eqns, 64 unknowns M[a,i] with
D(e_i)=Σ_a M[a,i] e_a) and does EXACT Gaussian elimination:
- **rank = 50, nullity = 14  ⟹  dim_ℚ Der(O ℚ) = 14.**  (matches g₂)
- Every basis derivation has `D(1)=0` (column 0 zero).
- Every basis derivation preserves the imaginary subspace.

`structural.py` — facts that hold for EVERY derivation (all 14 basis elements, exact):
- **`D 1 = 0`** (kills the unit).  [theory-native, cheapest to bank]
- **skew-symmetric**: `M = −Mᵀ`  ⟺  `bilin(Dx,y)+bilin(x,Dy)=0`  ⟹ `Der ⊆ so(Born)=so(7)`.
- **maps INTO the imaginary subspace** (row 0 of M is zero), hence preserves Im(O).
- **commutes with conjugation**: `D(star x) = star(D x)`.
- explicit 14 integer-sparse basis matrices, each nnz=4; rank of the 14 flattened = 14
  (independence confirmed). Saved in `nullbasis.pkl`.

## The g₂ ⊂ so(7) structural reduction (the theory-native reframe)
The Born self-overlap form (the trunk's positivity) IS the inner product g₂ is orthogonal
to. So the honest forward route to the count is: `Der(O) ⊆ so(Im O,Born)` (skew, dim ≤ 21),
then the Leibniz constraints on the imaginary generators cut so(7)→g₂ (21→14).

## W9 ANTI-CIRCLING — routes NOT to attempt (the upper bound is the hard half)
- The EXACT count needs either (a) the rank-50 of the 512×64 ℚ system, or (b) the span
  proof that 14 explicit derivations exhaust Der. BOTH are fully-expanded-octonion-coordinate
  computations = the monolithic-brute-on-coordinates signature W9 forbids. Do NOT `decide`/
  `ring` a 512×64 rank in Lean; do NOT inflate maxHeartbeats to wait it out.
- The honest path for the count is STRUCTURAL: the so(7) containment (skew) + a per-generator
  constraint reduction, or an explicit basis + a structural span argument — NOT a brute kernel.

## Scope taken THIS RUN vs childed
- THIS RUN (production, foundations-only): the clean theory-native structural core that
  places every derivation inside the orthogonal Lie algebra of the Born form — see
  `Phys/Algebra/DerivationDim.lean`.
- CHILDED onto the chain tail (W3 dissolution): the EXACT `dim = 14` upper bound (the
  rank/span, W9-prime) and the explicit `g₂` basis + bracket + `≅ g₂` Lie isomorphism.
  The child starts from: dim=14 confirmed, explicit basis in nullbasis.pkl, the so(7)
  reduction, and the structural lemmas banked here.
