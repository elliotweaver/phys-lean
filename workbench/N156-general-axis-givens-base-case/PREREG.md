# N156 PREREG — THE GENERAL-AXIS GIVENS-ROTATION BASE CASE for the SO(9) word-exhaustion

FROZEN before compute. GO/NO-GO + KILL stated. This is a W3 DECOMPOSITION of the heavy
unconditional `hword` discharge (the full SO(9) exhaustion).

## MEASUREMENT (W1/W9) — why decompose, not grind the full discharge

The N156 ticket's front (i) is the UNCONDITIONAL discharge of the `hword` hypothesis of
`bvIsom_joinedIdC_of_compact_word` (N155): every compact `QvC`-isometry `k` is a finite
product of `JoinedIdC` factors → the full `SO⁺(1,9)` path-connectedness, no residual.

This unconditional discharge IS the full `SO(9)` Cartan–Dieudonné exhaustion. Measured HEAVY:
- N105 (`...WordMembershipObstruction`) PROVED the literal residual FALSE for the `biMulLin`
  alphabet (the ninth-direction `x↔𝕆` rotations are not reached).
- The reflection-route exhaustion `reflection_exhaustion_M_aniso` (N125) is ITSELF conditional
  (on `haniso_exists`, the totally-isotropic existence question, childed N128 — not banked).
- A single Householder reflection has det = −1, so it is NOT `JoinedIdC` (the identity
  component is the EVEN products = rotations). The reflection route would need (a) unbanked
  `houseHolder` operator-continuity (only RIGHT-mult continuity `endOpC_mul_right_cont` is
  banked — no reflection-deformation continuity), and (b) a parity/even-pairing argument.
  This is the standard-math path that FIGHTS the trunk (THE ONE LAW).

THE TRUNK-NATIVE route: the compact factor is a ROTATION (an element of the connected `SO(9)`),
and rotations are reached by Givens 2-plane rotations `axisRotLin e c s`, each of which is
`JoinedIdC` by the SAME Cayley-chart path construction N153/N155 used — generalized from the
single real axis `e = 1` to ANY unit octonion axis `e`. N155 banked the base case for `e = 1`
ONLY (`joinedIdC_planeRotLin`). The genuinely-new structural lever is the GENERAL-AXIS base
case, which reaches strictly beyond the real-axis plane (the N114 separator
`enlargedAxisNinth_ne_enlargedTwoPlaneNinth`) — the exact per-factor building block the full
`SO(9)` word-exhaustion will consume.

So: BANK the general-axis base case + word corollary + the refined conditional; CHILD the full
`SO(9)` Givens-word exhaustion residual (discharge `hword`). Honest W3 decomposition — the
bankable lever is genuinely-new structure, NOT a re-pin of N155's real-axis case.

## THE NODE (what this run banks)

Production file `Phys/Algebra/LorentzContinuumGeneralAxisRotationPath.lean`:

1. `axisRotPath e m := axisRotLin e (cayleyC m) (cayleyS m)` — the general-axis rotation path.
2. `axisRotPath_cont (e) : Continuous (axisRotPath e)` — continuous in the operator topology
   `endOpC` (the `gFormC v e` functional is fixed; no `he` needed for continuity).
3. `axisRotPath_zero (e) : axisRotPath e 0 = 1` (via `cayleyC_zero`/`cayleyS_zero` +
   `axisRotLin_one_zero`).
4. `axisRotPath_reaches (e) (c s) (h:c²+s²=1) (hc:1+c≠0) : axisRotPath e (s/(1+c)) = axisRotLin e c s`
   (via `cayley_surj`).
5. `axisRotPath_isQvIsomC (e) (he:gFormC e e=1) (m) : IsQvIsomC (axisRotPath e m)`
   (via `axisRotLin_isQvIsomC` + `cayley_on_circle`).
6. `axisRotPath_image_preconnected (e) (m)`.
7. `axisRotLin_joins_id (e) (he) (c s) (h) (hc)` — the packaged connectedness (∃ γ, …, parallel
   to N153's `rotPath_joins_id_rotation`).
8. ★ `joinedIdC_axisRotLin (e) (he) (c s) (h) (hc) : JoinedIdC (axisRotLin e c s)` — THE
   GENERAL-AXIS BASE CASE (the genuinely-new lever).
9. `joinedIdC_axisRotWord (e) (he) (L : List (Cut×Cut)) (hL : ∀ (cs) ∈ L, cs.1²+cs.2²=1 ∧
   1+cs.1≠0) : JoinedIdC ((L.map (fun cs => axisRotLin e cs.1 cs.2)).prod)` — finite product of
   general-axis Givens rotations (same axis or mixed axes — see actual statement) is `JoinedIdC`
   (via `joinedIdC_listProd`).
10. The refined conditional `bvIsom_joinedIdC_of_axisRotWord` — IF every compact `QvC`-isometry
    is a finite product of `JoinedIdC`-general-axis Givens rotations, THEN every `BvC`-isometry
    is `JoinedIdC` (makes the residual the concrete `SO(9)` Givens-word decomposition; via
    `bvIsom_joinedIdC_of_compact_word`).
11. W8 NON-VACUITY: `joinedIdC_axisRotLin_quarterTurn (e) (he) : JoinedIdC (axisRotLin e 0 1)`
    AND ★ `joinedIdC_axisRotLin_halfTurn (e) (he) : JoinedIdC (axisRotLin e (-1) 0)` — the
    GENERAL-AXIS antipode half-turn, NOT the real axis, NOT reachable by the single Cayley chart
    (`1+(-1)=0`), reached as the product of two quarter-turns via `axisRotLin_comp_same_axis`.
    Beyond N155's real-axis-only `joinedIdC_halfTurn` — the lever genuinely extends reach in BOTH
    the axis direction and beyond the chart.

## GO / NO-GO

GO if: `joinedIdC_axisRotLin` (the general-axis base case) compiles foundations-only AND the
general-axis half-turn W8 witness compiles (proving the lever reaches the general axis off the
chart). These are the genuinely-new structure.

NO-GO (decompose further / child) if: the base case itself resists (it should NOT — it is a
verbatim generalization of N155's `joinedIdC_planeRotLin` with `axisRotLin_isQvIsomC` in place
of `planeRotLin_isQvIsomC`). The full `SO(9)` exhaustion residual is CHILDED regardless (it is
the heavy remainder).

## KILL (W9 — instrument-failure classifier; max runtime 2700s/45min, ~90 iterations)

- If ANY single obligation's smallest sub-case exceeds ~60s in a bounded probe → INSTRUMENT
  failure, decompose that obligation, do NOT grind. (Expected: all obligations are cheap field
  arithmetic / continuity over the derived `Cut`, mirroring N153/N155 which compiled fast.)
- Checkpoint at ~50% iterations; finalize (commit + gate-bg + child + complete) with iterations
  to spare. Bank-as-you-go: the instant `joinedIdC_axisRotLin` compiles, move to production +
  wire + commit BEFORE chasing the corollaries.

## COSTUME C188 (W8 — must BITE)

A WRONG general-axis Givens / base-case / half-turn / SO(9)-word read-off that reduces to a
false numeric `1 = 156` (DISTINCT from banked C183 1=151 … C187 1=155). Reuse the banked
general-axis half-turn: `axisRotLin e (-1) 0` applied to a banked unit axis genuinely reads a
value; claiming `156` forces `1 = 156` in `Cut`.

## STANDARD

UNBROKEN: every object from the chain (`axisRotLin`/`axisRotLin_apply`/`axisRotLin_isQvIsomC`/
`axisRotLin_one_zero`/`axisRotLin_comp_same_axis` N113/N114, `cayleyC`/`cayleyS`/
`cayley_on_circle`/`cayley_surj`/`cayleyC_zero`/`cayleyS_zero` N153, `endOpC`/
`endOpC_continuous_iff` N152, `JoinedIdC`/`joinedIdC_mul`/`joinedIdC_listProd`/
`bvIsom_joinedIdC_of_compact_word` N155, `gFormC`/`reQC`, the derived ℝ `Cut`). No Mathlib ℝ/ℂ
as content, no posited rotation/angle/topology/connectedness, no bridge.
COMPLETE: foundations-only {propext, Classical.choice, Quot.sound}, no sorry/axiom/native bypass.
PHYSICS-WORDS-REMOVABLE: delete rotation/axis/Givens/isometry/path-connected/half-turn/Cayley/
circle/SO(9)/compact/word → over the derived complete ordered field `Cut`, `joinedIdC_axisRotLin`
says the linear operator `axisRotLin e c s` lies in a preconnected subset of the operator
topology `endOpC` containing `1`, for any unit-`gFormC` axis `e` and circle point `(c,s)` off the
antipode; pure topology, no theorem statement needs a physics word.
