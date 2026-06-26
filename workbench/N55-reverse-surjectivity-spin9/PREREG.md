# N55 — PREREG (frozen before compute)

## Node target (specified against the chain as it ACTUALLY is — ROADMAP §N55 frontier)
N54 banked the FORWARD half of the finite-product surjectivity:
`genIsomMonoidC := ⟨boostOPS ∪ rotGenSetC⟩ ≤ qvIsomMonoidC` where `rotGenSetC` = all
SINGLE-UNIT rotations (each a single LEFT-multiplication `rotFunC (c•1+s•a)`, an SO(2) circle
subgroup around one imaginary unit). The remaining HEAVY core (ROADMAP) is:
  (i) the REVERSE inclusion `qvIsomMonoidC` (connected component) `≤ gen…` — polar/KAK
      `g = k·exp(p)`, square-root extraction over the derived ℝ, connectedness;
  (ii) the full non-associative SO(9)/Spin(9) spacelike rotation completion — rotations in
      ARBITRARY planes, where two single-unit rotations around NON-associating units do NOT
      compose; the 2:1 cover Spin(9)→SO(9), the Moufang/bimultiplication `v ↦ u·(v·u')`.

## MEASURE FIRST (W9) — the smallest immediately-bankable obligation
The ticket names the immediately-bankable Moufang/Spin(9) piece: the TWO-SIDED bimultiplication
`v ↦ u·(v·u')` for Born-units `u, u'`, proved a `QvC`-isometry via the banked `gFormC_comp`
(N50) applied TWICE:
  gFormC (u·(v·u')) (u·(v·u'))
    = gFormC u u · gFormC (v·u') (v·u')        [gFormC_comp u (v·u')]
    = gFormC u u · (gFormC v v · gFormC u' u')  [gFormC_comp v u']
    = 1 · (gFormC v v · 1) = gFormC v v          [hu, hu']
This is the genuine Spin(9) generator BEYOND the single-unit circle subgroups: with both u,u'
nontrivial imaginary units, `u·(v·u')` is NOT a single left-multiplication `rotFunC w` (by
non-associativity), so it OPENS new structure (W4.5: forward, not re-confirmation).

## GO / NO-GO
- GO (bank): `biMulFun` + `biMulFun_isom`/`biMulFun_mem` (two-sided Moufang isometry via
  gFormC_comp twice) + the EXTENDED generator set `biMulGenSetC` + extended generated group
  `genIsomMonoidC2 := ⟨boostOPS ∪ rotGenSetC ∪ biMulGenSetC⟩` + FORWARD soundness
  `genIsomMonoidC2_le_isom ≤ qvIsomMonoidC` + `genIsomMonoidC ≤ genIsomMonoidC2` (monotone) +
  W8 teeth (a concrete genuinely-two-sided biMul, not a single left-mult / not identity).
- This is a DECOMPOSITION (W3): bank the Moufang/Spin(9) forward generator; CHILD N56 = the
  global REVERSE surjectivity (polar/KAK over derived ℝ from Born positivity) + connectedness.

## KILL (W9 instrument budget)
- `biMulFun_isom` MUST be a structural `rw [gFormC_comp, gFormC_comp, hu, hu', …]` — bounded,
  no coordinate brute. KILL: if it needs `decide`/monolithic `simp`/`ring` over expanded O Cut
  coordinates, that is the instrument wall → measure/decompose, do NOT inflate heartbeats.
- The concrete W8 octonion value computation (e2·(e3·e2)=e3 etc.) is the ONLY risk of a heavy
  coordinate compile. KILL: if a single concrete-unit computation exceeds ~60s or needs an
  inflated ceiling, scope the teeth to the cheaper non-identity / u'=1-collapse witness and
  child the harder reachability claim. NEVER grind.
- Forward soundness `genIsomMonoidC2_le_isom` MUST close by `Submonoid.closure_le` +
  `Set.union_subset` (like N54) — NO grind.

## Costume (C86) — MUST bite a WRONG Moufang/bimultiplication claim
The two-sided product `u·(v·u')` multiplies the Born norm by BOTH factors (gFormC_comp twice →
`N(u)·N(v)·N(u')`). The WRONG claim treats it as a SINGLE-sided product (`N(u)·N(v)`,
forgetting the right multiplication by `u'`). At all norms = 3: correct three-factor = 27,
wrong single = 9. So the wrong identity `27 = 9` MUST fail to compile. Signature `27 = 9`
(distinct from C84 `8=4`, C85 `0=2`, C83 `2=3`). Reuses banked Cut.

## Words-removable
Delete "Lorentz/boost/rotation/Spin/SO(9)/SO⁺(1,9)/isometry/cover/generator/Moufang/
bimultiplication/triality": what remains is — over the derived ordered field `Cut` and the
CD-double³ `O Cut`, the map `(t,x,v) ↦ (t,x, u·(v·u'))` with `gFormC u u = gFormC u' u' = 1`
preserves `t²−x²−gFormC v v` (via `gFormC (x·y)(x·y) = gFormC x x · gFormC y y` applied twice),
such maps lie in the form-preserving submonoid, and the submonoid they generate with the
boost+single-mult families is contained in it and strictly larger. Pure math.
