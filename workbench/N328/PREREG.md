# N328 — SEEDED GAUGE ROUTE B2 (★ BRIDGE, route-finder cont., 5th touch of the exponent):
#         BUILD the DERIVED GAUSS-SPHERE RETURN-ACTION FLUX MEASURE on the derived ℝ —
#         the meridian-flux integration primitive (FTC antiderivative-difference on `cutSin`) +
#         the 2-sphere solid-angle assembly `= 4·cutPi`, DERIVED, never a literal.
#         SELECT + the named-staircase BUILD + ONE directed successor (which-sphere + count).

FRESH worker, run 630. Task t_1e75a0db. DIRECTED single successor of N327 (t_d92cca55). This is the
★ BRIDGE route-finder's 5th touch of B2's exponent (N321→N322→N326→N327→here). N327 named the precise
structural ceiling: the carrier has the 1-D angle `cutPi` but LACKS the derived Gauss-sphere FLUX
measure (grep-confirmed EMPTY). This node BUILDS the first forced rung of that measure.

Duplicate-instance check: my PPID=31231 = board `spawned.pid` (run 630); `ps` shows my only siblings
are the dashboard/TUI (a different profile run); I am the legit and only live worker. State at run
start: HEAD `b14abf8` (N327 banked, PREREG-only), git tree CLEAN, `workbench/N328` empty (genuine
fresh start — NO probe to resume). RESUME CHECK done: no prior N328 probe existed.

════════════════════════════════════════════════════════════════════════════
## STEP A — SELECT (worker-body STEP A / docs/NODE_SELECTION.md), run theory-native FIRST

The ticket DIRECTS the flux-measure build (the shared B2/B3/E3 prerequisite N327 named). I ran SELECT
fresh from the THEORY and it CONFIRMS the directed target as the genuine next forced beat — this is the
DECLARED staircase step (SOUL repeated-deferral clause): cutSin/cutCos (N323) → addition (N324) →
cutPi (N325) → **Gauss-sphere FLUX measure (HERE)**. The theory-native reading (asked FIRST): the
fold's self-look-back CLOSES on a return surface; the 1-D Born-circle gave `cutPi` (the azimuthal
angle), and the NEXT return surface accumulates self-overlap over its meridian — the meridian flux
`∫₀^π cutSin` — whose value is FORCED by the banked half-turn antipode `cutCos cutPi = −1` to be
`1 − (−1) = 2`. The 2-sphere solid angle is then `(azimuthal full turn 2·cutPi) × (meridian flux 2) =
4·cutPi` — the derived "4π", built via the derived integral, NEVER written as a literal. This is real
forward structure the chain lacked; NOT a lateral wander.

════════════════════════════════════════════════════════════════════════════
## S1 — STATE SURVEY (grep-confirmed this run)

Banked raw material:
- `cutSin`/`cutCos` (N323, `ContinuumTrig`) with the Pythagorean identity; the alternating series
  `sinTermC x m = (-1)ᵐ x^(2m+1)/(2m+1)!`, `cosTermC x n = (-1)ⁿ x^(2n)/(2n)!`, both absolutely
  summable, `cosTermC_summable`, `cosTermC x 0 = 1`, `tsum_eq_zero_add`.
- `cutPi` + full periodicity; the LOAD-BEARING banked landing `cutCos_cutPi = −1` (the half-turn
  antipode), `cutCos_zero = 1` (N325, `ContinuumTrigPi`).
- The scalar power-series derivative machinery `cut_powerseries_deriv`(N41g)/`cut_powerseries_deriv2`
  (N182) over the derived ℝ — the analytic-derivative primitives already banked (NOT needed for THIS
  node's route, but confirm the analytic infrastructure exists).
- `alphaStar = 1/42`; physics-prose `g² = 4π·α* = 4π/42` carries the Gauss-sphere `4π` factor.

GREP-CONFIRMED EMPTY (the missing structure): no `cutIntegral`/`intervalIntegral`/`sinAntideriv`/
`solidAngle`/`GaussSphere`/`fluxMeasure`/`meridian` over `Cut` in `Phys/`. The integration primitive
and the flux measure are genuinely unbanked — this node builds them.

════════════════════════════════════════════════════════════════════════════
## S2 — THE BUILD (deliverable B: the flux-measure machinery + the 2-sphere solid angle)

The route is the W9 STRUCTURAL REDUCTION the ticket flagged as preferred: NO Lebesgue/interval-integral
apparatus, just the banked derivative + evaluation (the FTC antiderivative-difference). Term-by-term,
the antiderivative of `sinTermC x m` is `sinAntiderivTerm x m := (-1)ᵐ x^(2m+2)/(2m+2)!`, which is
EXACTLY `− cosTermC x (m+1)` (proved: `sinAntiderivTerm_eq_neg_cosTermC`). Summing (a shift of the
banked cosine summability) gives:

    ★ `sinAntideriv x := ∑' m, sinAntiderivTerm x m = 1 − cutCos x`   (`sinAntideriv_eq`)

— the FTC antiderivative-difference form `∫₀ˣ cutSin = −(cutCos x − cutCos 0) = 1 − cutCos x`. This IS
the derived-ℝ integration primitive for the sine series (the missing machinery), built with NO Mathlib
integral, NO Real.pi, NO ℝ-valued norm — pure `tsum` reindex over the banked `Cut`.

Then the FORCED landings:
    ★ `sinAntideriv cutPi = 2`   (the full-meridian flux, FORCED by the banked `cutCos_cutPi = −1`)
    ★ `gaussSphereSolidAngle := (2·cutPi) · sinAntideriv cutPi = 4·cutPi`  (`gaussSphereSolidAngle_eq`)

— the derived 2-sphere solid angle, assembled from the azimuthal full turn (`2·cutPi`, the banked full
period) times the meridian flux (`2`), NEVER asserted as a literal `4π`. Plus `gaussSphereSolidAngle_pos`
and the non-vacuity `gaussSphereSolidAngle_ne_azimuthal` (the flux is genuinely `2`, not `1`).

PROBES: `workbench/N328/probe1.lean` (the FTC-difference + flux, `$LAKE env lean` EXIT=0),
`probe2.lean` (the full solid-angle assembly + non-vacuity, EXIT=0). Cheap tactics throughout
(`ring`/`linarith`/`tsum_congr`/`tsum_neg` + one `tsum_eq_zero_add`) — no W9 compile-cost risk.

════════════════════════════════════════════════════════════════════════════
## S3 — ANTI-BULLSHIT GATE (the ★ BRIDGE bar; crux G4)

NAME-THE-TEMPTATION, each REJECTED:
  (a) declare the derived `4·cutPi` IS the exponent's numerator normalization, set `b₀ = 14`, get
      `6π`, bank B2 → FISHING the seed's answer-key (the predecessor's asserted-`2/9` death). The
      2-sphere is ONE candidate return surface; WHICH sphere (2-sphere `4π` / S³ `2π²` / S⁴ `8π²`) is
      the fold's forced return surface is UNRESOLVED and coupled to the count. NOT claimed. NO value of
      c/b₀/N is written anywhere in production or costume.
  (b) build S³ `2π²` / S⁴ `8π²` too and pick the one that reproduces `6π` → same fishing. NOT done —
      I bank the FIRST forced rung (the 2-sphere, the minimal next surface after the 1-D circle) and
      DEFER the dimension selection to the child, which must DERIVE which is forced.
  (c) import Mathlib `Real.pi` / a Mathlib sphere-measure to supply `4π` → UNEARNED-IMPORT (content).
      The `4·cutPi` is the DERIVED one, via the derived integral of the banked `cutSin`. NOT done.
  (d) assemble a standard one-loop `b₀` from loop factors 11/3, 2/3, 1/6 → C1 forbidden hidden bridge.
      NOT attempted.

WORDS-REMOVABLE (G5): delete "Gauss-sphere / flux / meridian / solid-angle / return-action". What
survives: `∫₀ˣ` of the sine series (the antiderivative-difference `1 − C(x)`) `= 2` at `x = P` via the
banked `C(P) = −1`, and `2·P · 2 = 4·P`. Pure real analysis on the derived `Cut`. No name load-bearing.

FREE-FLOATING check: every production theorem's TYPE mentions the banked `Cut`/`cutSin`/`cutCos`/
`cutPi` — grounded on the tower, not generic. PASSES.

NOT a runway / not a new axiom: c/b₀/N stay unasserted; the flux measure is DERIVED, not axiomatized,
not an empirical number ⇒ route-not-yet-found ≠ new axiom ⇒ autonomous forward work remains (the
which-sphere + count child) ⇒ directed child, not a block. This is a BUILD node (production Lean banked),
not a DEFER.

════════════════════════════════════════════════════════════════════════════
## DECISION — BUILD (deliverable B). Bank `Phys/Foundation/ContinuumSphereFlux.lean`:
##   the derived-ℝ meridian-flux integration primitive (`sinAntideriv`, FTC antiderivative-difference,
##   `= 1 − cutCos`) + the FORCED full-meridian flux (`= 2`, via banked `cutCos_cutPi = −1`) + the
##   2-sphere solid-angle assembly (`= 4·cutPi`, via the derived integral, no literal) + non-vacuity.
##   NO c/b₀/N asserted; the coupled (which-sphere-is-the-return-surface + count) selection is CHILDED.

ONE-SUCCESSOR RAIL: exactly one directed successor — a route-finder toward the COUPLED Face-1
(which sphere dimension is the fold's forced return surface: 2-sphere `4π` / S³ `2π²` / S⁴ `8π²`) +
Face-2 (the gauge-dof count b₀) selection, USING the now-banked `gaussSphereSolidAngle`. Pre-complete
fork check run before `kanban_complete`.
