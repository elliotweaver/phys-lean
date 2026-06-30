# N187 PREREG — su(2) = Der(H) ↪ Der(O) = g₂, the Lie embedding induced by the Cayley–Dickson doubling

FROZEN BEFORE COMPUTE. (docs/RUNBOOK W9 measure-first, W4.5 sufficiency, W8 anti-vacuity, THE ONE LAW)

## TARGET (front (i) — CONNECT the banked gauge factors)
A PROVED non-trivial Lie relation between two DISTINCT banked algebras:
the weak-isospin `Der(H ℚ) = su(2)` (N184 bracket `⁅ad_i,ad_j⁆=2·ad_k` + N185 dim 3)
embeds into the colour-hosting `Der(O ℚ) = g₂` (N6 Lie algebra + N20 dim 14),
via the Cayley–Dickson rung inclusion `H ℚ ↪ O ℚ = CD (H ℚ)` — concretely the banked
componentwise lift `liftEnd`/`innerDeriv` (N6), which sends `ad_q` on `H` to the
genuine `O`-derivation `innerDeriv q = liftEnd (adHom q)`.

## THE MATHEMATICAL ROUTE (all from banked levers — W2 import-and-USE)
1. `liftEnd` is multiplicative on `End`: `liftEnd δ * liftEnd ε = liftEnd (δ.comp ε)`
   (composition acts componentwise on `.re`/`.im`).
2. `liftEnd` is additive: `liftEnd (δ+ε) = liftEnd δ + liftEnd ε`.
   ⟹ `liftEnd` is a ring/Lie hom on `End ℤ`; bracket goes to bracket.
3. Base End-commutator identity on the ASSOCIATIVE `H ℚ`:
   `(adHom p).comp (adHom q) − (adHom q).comp (adHom p) = adHom (p*q − q*p)`
   (the inner-derivation Lie-hom on the associative ring — N184's `adM_bracket` mirror;
   `noncomm_ring` on 4-dim associative `H`).
4. ⟹ `innerDeriv_bracket : ⁅innerDeriv p, innerDeriv q⁆ = innerDeriv (p*q − q*p)` — THE LIE-HOM.
5. ⟹ structure constants TRANSFER: `⁅innerDeriv hI, innerDeriv hJ⁆ = 2 • innerDeriv hK` (cyclic),
   exactly the N184 su(2) brackets, now realized in `Der(O) = g₂`.
6. `innerDeriv q ∈ derivation (B := Dbl ℚ)` for imaginary `q` (N6 `innerDeriv_isDeriv`) —
   the image LANDS in `Der(O) = g₂`. (hI/hJ/hK imaginary: `star = −`.)
7. Non-vacuity: `innerDeriv hK ≠ 0` and `⁅innerDeriv hI, innerDeriv hJ⁆ ≠ 0`
   (the embedded su(2) is genuinely non-abelian inside g₂, not the zero map).
8. (If cheap) injectivity of the lift on inner derivations, to make "embedding" explicit.

## GO / NO-GO
GO iff probe banks (4)+(5)+(6)+(7) clean, foundations-only, each lemma < ~45s compile.
The deliverable is the PROVED bracket-preserving map carrying su(2) into g₂ — a genuine
relation, NOT a juxtaposition (it equates a g₂-bracket to a g₂-element forced by the H-product)
and NOT a re-pin of either factor's dimension.

## KILL (instrument-failure classifier — W9)
- If `liftEnd_comp` or `innerDeriv_bracket` needs monolithic `simp`/`ring` over fully-expanded
  O-coordinates and exceeds ~60s OR needs maxHeartbeats above default → INSTRUMENT failure,
  STOP, reframe through the banked `adM_bracket` (N184) / structural `ext` route, do NOT inflate.
- If `noncomm_ring` on `H ℚ` struggles → reuse N184's already-proved H-side commutator.
- If the map turns out NOT to be a Lie hom (bracket does NOT transfer) → REJECT the front (W8),
  do NOT force; look WIDER (front (ii)).
- 2-run no-bank → decompose (W3), child the remainder onto the chain tail.

## W4.5 SUFFICIENCY VERDICT (frozen)
This OPENS new structure: a proved Lie embedding su(2) ↪ g₂ realized by the cascade's OWN
doubling — the unbroken-strand novelty (the field POSITS the algebras as islands; we DERIVE the
nesting from the one doubling that also STOPS the cascade). NOT a re-pin (neither dim-3 nor dim-14
is re-stated), NOT a conjunction.

## COSTUME (next id C219) — must BITE a WRONG claim, distinct false numeric
Candidate: the structure-constant transfer `⁅innerDeriv hI, innerDeriv hJ⁆ = 2 • innerDeriv hK`;
a WRONG coefficient (claiming the lifted bracket is `innerDeriv hK` i.e. coeff 1, or 0) collapses
to a false numeric `1 = 187` (distinct from C216 2=184, C217 3=185, C218 1=186).

## PHYSICS-WORDS-REMOVABLE
Delete isospin/colour/su(2)/g₂/gauge/SU(2)/SU(3): what remains is the pure statement that the
componentwise doubling lift `End(CD B) → End(CD (CD B))` carries the inner-derivation commutator
algebra of the associative ring `CD B` (with `⁅ad_i,ad_j⁆=2·ad_k`) injectively, bracket-preserving,
into the Leibniz-derivation Lie algebra of `CD (CD B)`. No theorem STATEMENT needs a physics word.
