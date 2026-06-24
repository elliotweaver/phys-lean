# N17 — FINDINGS (anti-circling record + route taken)

## Numerics re-verified this run (W6, independent)
- `deriv_dim.py`: rank 50 / nullity 14 ⟹ dim_ℚ Der(O ℚ) = 14.
- `structural.py`: every basis derivation kills the unit, is skew (M = −Mᵀ),
  preserves Im, commutes with star; 14 integer-sparse basis matrices, rank 14.
- `check_skew.py` (this run): for every basis derivation, `reQ(Dx)=0` (trace-free),
  `bQ(Dx,y)+bQ(x,Dy)=0` (literal scalar skew), `reQ(x·Dy)+reQ(y·Dx)=0` all hold.

## INFRASTRUCTURE — built and MEASURED (all under the 90 s KILL budget)
All probes elaborated in 5–7 s (well under the 90 s/obligation budget):
- probe1 (7.5 s): `AddCommGroup (O ℚ)` synthesizes from `narCD`. ✓
- probe2 (5.6 s): `Module ℚ (CD A)` constructs componentwise (needs `@[reducible]`). ✓
- probe3 (6.3 s): the full ℚ-module TOWER `Dbl ℚ → H ℚ → O ℚ`. ✓
- probe4 (6.7 s): `map_rat_smul` gives ℚ-linearity of ℤ-linear `D` FREE; trace identity
  `x + star x = (2 reQ x)•1` by `ext;simp;ring`. ✓
- probe5/6 (6.6 s): `deriv_star` (`D(star x)=-Dx`), `deriv_real_zero` (D kills
  self-conjugates), `deriv_norm_preserve` (`Dx·star x = x·Dx`). ✓
- probe9 (6.4 s): `deriv_skew_polar` (polarized: `Dx·star y+Dy·star x = x·Dy+y·Dx`). ✓

## THE THEORY-NATIVE FORWARD ROUTE TAKEN (the trunk reframe — THE ONE LAW)
The literature derives `Der ⊆ so(7)` by a coordinate skew-matrix computation. THE
TRUNK gives it coordinate-FREE: the Born self-overlap `x·star x` is SELF-CONJUGATE
(`star(x·star x) = x·star x` by anti-mult + involutive star), and a derivation KILLS
every self-conjugate element (`deriv_real_zero`, from `D(star x)=-Dx` + char 0). So
`D(x·star x)=0`, which by Leibniz IS skew-adjointness `Dx·star x = x·Dx`. Polarizing
gives the bilinear skew. NO 8-coordinate expansion, NO 512×64 rank — the W9 monolith
is entirely AVOIDED for the structural reduction. This is the bankable HEART of N17.

## WHAT IS BANKED (this node, forward, foundations-only)
1. `Module ℚ (O ℚ)` (+ the Dbl/H tower) — machinery on the DERIVED object (STANDARD §3).
2. `deriv_qsmul` — every ℤ-linear derivation is ℚ-linear (`map_rat_smul`).
3. `deriv_star` — `D(star x) = -Dx` (a derivation reflects conjugation).
4. `deriv_real_zero` — D kills every self-conjugate (real) element.
5. `deriv_norm_preserve` — `Dx·star x = x·Dx` (multiplicative skew-adjointness = the
   `Der ⊆ so(Born)` containment, coordinate-free).
6. `deriv_skew_polar` — the polarized bilinear skew form.

## W9 ANTI-CIRCLING — routes NOT to attempt (childed to the dissolution ticket)
- The EXACT `dim = 14` count = the 512×64 ℚ-rank OR the explicit-14-basis span proof =
  the fully-expanded-octonion-coordinate computation W9 FORBIDS. Do NOT `decide`/`ring`
  it in Lean, do NOT inflate maxHeartbeats. (CHILD.)
- The literal SCALAR bilinear skew `bQ(Dx,y)+bQ(x,Dy)=0` (probe8) reduces to a residual
  that tangles with trace-free `reQ(Dx)=0`; the MULTIPLICATIVE form (`deriv_norm_preserve`/
  `deriv_skew_polar`) is the clean coordinate-free statement and is what we bank. The
  scalar `bQ` form + trace-free can be childed if a future node needs the literal so(7)
  matrix embedding.
- The `≅ g₂` Lie isomorphism: W1 (Mathlib may lack a usable `g₂`; do NOT posit/import
  one to match — reframe through the trunk). CHILD.

## CHILDED onto the chain tail (W3 dissolution)
The EXACT `dim_ℚ Der(O ℚ) = 14` (the so(7)→g₂ cut, 21→14, the W9-prime rank/span) + the
explicit g₂ basis + bracket structure constants + the `≅ g₂` Lie isomorphism. The child
starts from: `Module ℚ (O ℚ)` built, the skew/so(7) containment banked, dim=14 confirmed
numerically, the explicit 14-basis in nullbasis.pkl.
