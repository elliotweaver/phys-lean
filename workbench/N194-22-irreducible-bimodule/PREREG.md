# N194 PREREG — THE (2,2) IS IRREDUCIBLE (the Born-anisotropy / division-ring lever)

FROZEN before compute. GO/NO-GO + KILL.

## W4.5 measure-first verdict (which front, why)
Ten consecutive gauge-structure nodes (N184–N193). The ROADMAP §N193-superseded fronts:
- (i) THE (2,2) as an irreducible H-bimodule — su(2)_T acts by L_Q, su(2)_S by R_P; do L,R commute?
- (ii) so(4) ⊕ complement in g₂ (dim 14) — type split ℤ↔ℚ, heavier.
- (iii) a third derivation family — likely a combination of banked families.
- (iv) hypercharge normalization / EW U(1) / Yang–Mills.

MEASURED:
- The bare "L and R commute" sub-front is REJECTED (W8): it is ALREADY banked
  (`secondSU2_commutes_leftImDeriv`, N191) AND follows trivially from base associativity
  (`L_Q R_P (κO b) = κO(Q·(b·P)) = κO((Q·b)·P) = R_P L_Q (κO b)` by `H_associative`). A re-pin /
  trivial-associativity consequence — not the genuine content.
- The GENUINELY-NEW content of front (i) is **IRREDUCIBILITY**: every prior branching node
  (N189/N190 diagonal, N192 su(2)_T, N193 su(2)_S + joint bigrading) proved only INVARIANCE of
  the pieces (`so4_pieces_invariant` etc.) — NONE proved any piece IRREDUCIBLE. The 7 is
  g₂-irreducible (N28 `ImLie_isIrreducible`) but so(4)-REDUCIBLE (it splits as (3,1)⊕(2,2)); the
  irreducibility of the SUMMANDS under the smaller so(4) is a DIFFERENT, unbanked statement.
  This OPENS the rep-theory the chain does not have: the bigrading becomes a genuine IRREDUCIBLE
  decomposition, not just an invariant one.

## The target (CHOSEN front (i), the irreducible part)
THE (2,2) `κO(⊤)` (dim 4, the new plane, N192) is IRREDUCIBLE already under the single factor
`su(2)_T = ⟨leftImDeriv hX⟩` (hence a fortiori under the full so(4)). Precisely: a submodule
`W ⊆ H ℚ` closed under left-multiplication by imaginary quaternions (`Q ∈ ImH`) is `⊥` or `⊤`.

## The mechanism (trunk-native — Born positivity ONE RUNG DOWN; THE ONE LAW reframe)
The (2,2) is `κO`-transport of the left-regular module of `H ℚ`, with su(2)_T acting by
`leftImDeriv Q (κO b) = κO (Q·b)` (left-mult by imaginary Q, N192). Why irreducible:
1. `W` closed under `L_Q` (Q ∈ ImH) ⟹ `W` is a LEFT IDEAL of `H ℚ`: for any `q : H ℚ`,
   `q = (reH q)•1 + q_im` with `q_im ∈ ImH`, so `q·x = (reH q)•x + q_im·x ∈ W`.
2. THE BORN LEVER (one rung down): `star w · w = (quatNorm w) • 1`, where
   `quatNorm w = w.re.re² + w.re.im² + w.im.re² + w.im.im²` is the FOUR-SQUARE Born self-overlap
   form. Over the DERIVED ℚ this form is ANISOTROPIC: `quatNorm w = 0 ↔ w = 0` (a sum of four
   rational squares vanishes iff each does). So for `0 ≠ w ∈ W`, `quatNorm w ≠ 0` and
   `star w · w = quatNorm w • 1 ∈ W` (left ideal), hence `1 = quatNorm w⁻¹ • (star w · w) ∈ W`.
3. `1 ∈ W` + left ideal ⟹ `q = q·1 ∈ W` for all q ⟹ `W = ⊤`.
This is the trunk: Born = self-overlap = positivity. The SAME positivity that is the division
law's survival at rung ≤ 3 (lost at the sedenions, N-Sedenion) makes the rational quaternion
left-module irreducible. Over ℂ the four-square form is ISOTROPIC and the (2,2) would split
2+2 — the irreducibility is a RATIONAL (derived-ℚ) division-algebra fact, genuinely new content.

## GO / NO-GO
GO: the probe proves, foundations-only over the banked objects:
- `starMulSelf_eq_quatNorm`: `star w * w = quatNorm w • (1 : H ℚ)` (ext <;> simp <;> ring).
- `quatNorm_eq_zero`: `quatNorm w = 0 ↔ w = 0` (four rational squares).
- `leftIdeal_of_su2T_invariant`: su(2)_T-invariant W is a left ideal.
- `kappaTop_su2T_irreducible` / `kappaTop_so4_irreducible`: invariant submodule ⊥ or ⊤
  (transported to κO(⊤)).
- W8 non-vacuity: module nonzero (`kappaO 1 ≠ 0`) AND a PROPER nonzero subspace fails invariance
  (the singlet line `ℚ·κO 1` is NOT su(2)_T-invariant: `leftImDeriv hI (κO 1) = κO hI ∉ span{κO 1}`),
  so the dichotomy is a real constraint, not vacuous.

NO-GO / look WIDER if: the irreducibility collapses to a re-statement of a banked invariance, or
the norm lever is already banked verbatim, or the proof needs a posited division-ring structure.

## KILL (instrument budget, W9)
Each obligation is a componentwise `ext <;> simp <;> ring` over ℚ or a finite submodule argument;
NONE should exceed ~60s in `lake env lean`. KILL = 120s/obligation → that obligation is an
instrument failure (decompose / reframe), NOT a longer grind. No `maxHeartbeats` inflation, no
monolithic brute normalizer over expanded octonion coordinates (W9.4 structure-over-expansion).

## Costume (C226)
Bite the BORN-ANISOTROPY LEVER (without which the (2,2) is reducible): the four-square Born norm
of the unit imaginary `hI` is `1`. Bogus: `(194 : ℚ) = quatNorm hI`, reduces to `194 = 1`, false.
Signature `194 = 1` (DISTINCT pair from the battery … C224 `1 = 192`, C225 `193 = -1`).
