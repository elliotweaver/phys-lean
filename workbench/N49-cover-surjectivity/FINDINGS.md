# N49 FINDINGS — measurements (frozen as discovered)

## PROBE 1 (Phys/N49Probe1.lean — compiles clean, ~8s)
- `O Cut` (octonions over the DERIVED ℝ) TYPECHECKS. `Cut` has banked `CommRing`/`Field`.
- `StarRing Cut := starRingOfComm` (trivial star=id) feeds the CD construction. Works.
- `Dbl Cut`, `H Cut`, `O Cut` all build; octonion product + star exist on `O Cut`.
- ★ `boostC_isom`: the CONTINUUM boost `(t,x,v) ↦ (a·t+b·x, b·t+a·x, v)` over `Cut`
  PRESERVES the continuum Born form `t²−x²−gFormC v v` iff `a²−b²=1`, by PURE FIELD
  ARITHMETIC (`linear_combination (t²−x²)·h`). No analysis, no cosh/sinh, no Mathlib ℝ.
  ⟹ THE ONE LAW confirmed: the cosh/sinh RAPIDITY coordinatization is a standard-physics
     habit; the theory-native object is the algebraic hyperbola point, which transfers to
     ANY field incl. the derived ℝ.

## PROBE 2 (Phys/N49Probe2.lean — compiles clean, ~9s)
- ★ Generic Born multiplicativity `CD.Nrm_mul_of_doubled_base` AVAILABLE over `O Cut`
  (base `H Cut` associative). ⟹ the rotation's Born composition law `gFormC_comp`
  transfers to Cut for free.
- `Qcut 2 = (2 : Cut)` via `Qcut_add` + `one_add_one_eq_two`.
- `sqrt2_sq : sqrt2 ^ 2 = (2 : Cut)` from banked `sqrt2_mul_sqrt2`.
- ★★ `irr_point : ((3·√2)/4)² − (√2/4)² = 1` — an IRRATIONAL point on the Cut-hyperbola
  (built from the derived √2, banked `sqrt2_not_rational`). THE W8 NON-VACUITY / the
  continuum content: a boost the RATIONAL generators of N48 CANNOT reach.

## SCOPE DECISION (W3 — frozen)
The full surjectivity onto the continuous 45-dim SO⁺(1,9) is a heavy Cartan/polar-
decomposition theorem; Mathlib has NO SO⁺(1,9), no octonionic spinor cover, no Lie
machinery for it. ⟹ CHILD it as N50 (heavy Cartan-generation core / honest W1
dissolution ticket).

N49 = THE CONTINUUM RE-GROUNDING of the isometry structure over the DERIVED ℝ `Cut`:
the form + boost/rot isometries + isometry monoid over `Cut`, AND the headline that the
continuum isometry structure STRICTLY EXTENDS the rational cover — there is an isometry
(the irrational √2-boost) NOT reachable by the rational generators. THIS is precisely the
content "surjectivity onto the CONTINUOUS group requires the derived ℝ": the rational
`spinorCoverMonoid` (N48) is NOT the whole continuous component; the continuum is.

## REMAINING MEASUREMENT: `Module Cut STVC` for the bundled isometry monoid.
