# PREREG — N195: THE (3,1) SUMMAND IS IRREDUCIBLE under su(2)_S (the adjoint 3 = ImH)

FROZEN before the full proof compiles. Worker run 422, task t_9f1b2cdc.

## TARGET (W4.5 verdict — front (i), MEASURED LIGHT + GENUINELY NEW)
Of the ROADMAP §N194-superseded fronts, **front (i)** — the irreducibility of the OTHER
branching summand, the OLD line `ιO(ImH)` (dim 3, the `(3,1)` of the joint bigrading N193) under
`su(2)_S` (the adjoint action `secondSU2`). N194 banked irreducibility of the `(2,2) = κO(⊤)`
ONLY. Every prior branching node (N189–N193) proved only INVARIANCE of the pieces; N194 is the
first irreducibility, and it is for the `(2,2)`. The `(3,1)` summand's irreducibility is a
SEPARATE, UNBANKED question, and it lives on a DIFFERENT object (the 3-dim adjoint/cross-product
rep `ImH`, not the 4-dim left-regular module `H ℚ`) requiring a DIFFERENT lever.

REJECTED alternatives: (ii) full isotypic Schur statement — a mechanical juxtaposition of (i)+N194
(no new lever); (iii) so(4)⊕complement in g₂ — ℤ↔ℚ type bridge, heavier; (iv) hypercharge — deferred.
NOT a re-pin of N25/N28 (`g₂` on the `7`); this is `su(2)_S = so(3)` on its own 3-dim `ImH`.

## THE MECHANISM (THE ONE LAW reframe — the trunk's Born positivity, applied to the ADJOINT rep)
The adjoint action `ad_p(x) = p·x − x·p` on imaginary quaternions is (twice) the cross product.
The DOUBLE-BRACKET LEVER (MEASURED, compiles, foundations-only — probe3):
    (4·quatNorm w)•p = ad_w(ad_p w) − (4·(w·p).re.re)•w          for imaginary w, p.
For any submodule `W ⊆ ImH` closed under all `ad_Q` (imaginary Q) and any `0 ≠ w ∈ W`:
  • `ad_p w ∈ W` (w∈W, p imaginary), then `ad_w(ad_p w) ∈ W` (w imaginary);
  • `(4·(w·p).re.re)•w ∈ W`; so `(4·quatNorm w)•p ∈ W`;
  • `quatNorm w ≠ 0` (Born ANISOTROPY over ℚ, N194 `quatNorm_eq_zero`) ⟹ `p ∈ W` for EVERY
    imaginary p ⟹ `W = ImH`.
The SAME Born positivity that stops the cascade at the octonions (and irreducibilizes the (2,2)
in N194) now irreducibilizes the rational ADJOINT 3. Over ℂ the form is isotropic and the lever
fails — a RATIONAL / derived-ℚ division fact, NOT base associativity.

## GO / NO-GO
GO: prove `iotaImH_irreducible` (any `W ≤ ImH` closed under `ad_Q`, imaginary Q, is ⊥ or ImH),
transport through `iotaO` to `iotaImH_su2S_irreducible` (the `(3,1) = ιO(ImH)` is irreducible
under `secondSU2`, since `secondSU2 P (ιO a) = ιO (adHom P a)`, N193 `secondSU2_iotaO`).
Bank `double_bracket_id` as the lever. W8: a proper nonzero candidate (e.g. ℚ·hI) FAILS
ad-invariance (`adHom hJ hI = -2 hK ∉ ℚ·hI`).
NO-GO: if the transport needs an unbanked fact, or the front collapses to a re-pin.

## KILL (instrument budget — W9)
Each coordinate obligation in `double_bracket_id` / the irreducibility closes by `ext <;> simp [...] <;> ring`
at default maxHeartbeats in <15s (MEASURED: probe3 ~13s whole file incl. import). KILL: if any single
obligation exceeds 200000 heartbeats or 60s in isolation → STOP, it is an instrument wall (W9),
decompose the coordinate bash into the banked `double_bracket_id` lever applied abstractly (NO
re-expansion). DO NOT inflate maxHeartbeats. DO NOT re-run a blown route.

## NON-VACUITY (W8)
costume C227: a WRONG numeric DISTINCT from the battery (… C226 194=1) — use `195 = 1` style but
DISTINCT value. The W8 in-file witness: `iotaImH_ne_bot` + a proper nonzero ad-NON-invariant line.

## PHYSICS-WORDS-REMOVABLE
Delete colour/isospin/su(2)/so(3)/so(4)/adjoint/3/branching/irreducible/rep → pure statement: the
left/adjoint action `ad_Q` (Q conjugation-antifixed) of `H ℚ = CD(Dbl ℚ)` on its antifixed subspace
`ImH` has no proper nonzero invariant submodule, via the four-square anisotropy of `quatNorm` over ℚ.
