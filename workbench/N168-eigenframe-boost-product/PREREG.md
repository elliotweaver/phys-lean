# N168 — PREREG (frozen before compute)

## NODE
N168 — THE GENERAL-AXIS BOOST FACTOR (the genuinely-new per-factor lever toward the eigenframe
boost-product closure of `JoinedIdQvC p`, `p = specOpN (cutSqrt∘c) u`).

## MEASURE-FIRST VERDICT (W1/W9, before compute)
The FULL closure `JoinedIdQvC p` is the genuinely-heavy multi-run remainder, exactly as N167
measured. Three independent facts pin this:
  - N96 already banked `specPathOp` — the AFFINE CONE path `id → p^{1/2}` — but it stays in the
    CONE OF POSITIVE OPERATORS, NOT the isometry group (the affine eigenvalue interpolation
    `(1−t)+t·λ` does NOT preserve the reciprocal pair `(λ,1/λ)`, so γ(t) is generically not a
    QvC-isometry). That is precisely why `JoinedIdQvC p` is still open.
  - `JoinedIdQvC` has NO inverse/conjugation closure banked (only RIGHT-mult continuity
    `endOpC_mul_right_cont`), so the standard `R·B·R⁻¹` conjugation route is itself blocked —
    the same obstruction the rotation-path file (N156) recorded. THE ONE LAW: do not grind the
    standard conjugation path; build the trunk-native general-axis lever.
  - The eigenframe extraction (reading the reciprocal-pair `(λ,1/λ)` boost plane off the
    EvC-orthonormal eigenframe `u` of `p`, pairing the timelike axis with the extracted spatial
    direction) is a substantial spectral argument — multi-run.

THE TRUNK GEOMETRY: QvC(t,x,v) = t² − x² − gFormC v v has signature (1,9) — exactly ONE timelike
direction. A positive self-adjoint QvC-isometry is therefore a SINGLE boost in the plane spanned
by the timelike axis and ONE spatial unit direction ŵ ∈ (Cut × O Cut) (the 9-dim spatial space),
acting as identity on ŵ's orthogonal complement. N164 banked only the t–x boost (`boostEndC`,
spatial axis = the x-coordinate). The genuinely-new lever the closure needs is the boost in the
t–ŵ plane for an ARBITRARY spatial unit direction ŵ — the hyperbolic mirror of N156's general-axis
rotation `axisRotLin` (which generalized the real-axis rotation to any octonion axis).

## THE IMMEDIATELY-BANKABLE PIECE (the W3 decomposition target, explicitly sanctioned by the task:
"the single-axis-boost extraction lemma")
THE GENERAL-AXIS BOOST `genBoostLin wx wv a b` — the boost in the t–ŵ plane, ŵ = (wx, wv) a
spatial unit vector (`wx² + gFormC wv wv = 1`):
  `genBoostLin wx wv a b (t,x,v) = (a·t + b·σ, x + δ·wx, v + δ•wv)`
  where σ := wx·x + gFormC v wv  (the ŵ-component of the spatial part)
        δ := b·t + (a−1)·σ        (the boost increment along ŵ).
Banked decls (target):
  1. `genBoostLin` (def, Module.End) + `genBoostLin_apply`.
  2. `genBoostLin_eq_boostEndC` — at ŵ = (1, 0) it IS `boostEndC a b` (the t–x boost; the genuine
     generalization, mirroring `axisRotLin_one_eq_planeRotLin`).
  3. ★ `genBoostLin_isQvIsomC` — QvC-isometry for a UNIT ŵ and `a²−b²=1` (completing-the-square
     over the derived ℝ + `nlinarith`/`linear_combination`).
  4. `genBoostPath wx wv m := genBoostLin wx wv (cutSqrt(1+m²)) m` (the cutSqrt-steered hyperbolic
     path, NO continuous power / NO exp).
  5. `genBoostPath_cont` (operator topology `endOpC`), `genBoostPath_zero` (=1),
     `genBoostPath_isQvIsomC` (unit ŵ — stays IN the isometry group), `genBoostPath_reaches`.
  6. `genBoostPath_image_preconnected`.
  7. ★★ `joinedIdQvC_genBoostLin` — THE GENERAL-AXIS BOOST FACTOR is the NON-VACUOUS `JoinedIdQvC`
     (unit ŵ, `a²−b²=1`, `0<a`). The genuine generalization of N164's `joinedIdQvC_boostEndC`
     (t–x only) to ANY spatial unit direction. Mirror of N156's `joinedIdC_axisRotLin`.
  8. W8 non-vacuity: a CONCRETE general-axis boost (octonion axis, e.g. ŵ=(0, oneO) or a genuine
     octonion direction) is `JoinedIdQvC` and genuinely moves a coordinate distinct from the t–x
     plane (so it is NOT covered by N164's `boostEndC`).

## GO / NO-GO (frozen)
- GO if: genBoostLin + apply + eq_boostEndC + isQvIsomC + the path facts + joinedIdQvC_genBoostLin
  + W8 witness all compile foundations-only, costume C200 bites (distinct numeric), gate D0–D6
  green. Then child N169 (the eigenframe extraction: p = a single genBoostLin in the extracted
  direction; the full `JoinedIdQvC p` closure) + complete.
- NO-GO / FALLBACK (KILL): if the FULLY-GENERAL ŵ=(wx,wv) `genBoostLin_isQvIsomC` or
  `genBoostPath_cont` proof FIGHTS after ≤15 probe iterations (nlinarith blowup over the mixed
  (x,v) structure / continuity of the mixed increment), FALL BACK to the OCTONION-AXIS-ONLY
  version `genBoostLin e a b` (e ∈ O Cut, wx≡0, the EXACT mirror of `axisRotLin` — guaranteed
  clean via `gFormC_add_axis_self`). Bank that; child the fully-general version + eigenframe
  extraction N169. Banking the octonion-axis lever is still a genuine non-vacuous advance
  (boosts in the 8 octonion spatial directions, beyond N164's t–x boost).

## KILL (instrument-failure classifier — W9)
- A single tactic with no output > 60s, or RSS climbing into GB, or `nlinarith`/`ring` not
  closing the isometry identity after `set σ, δ` + the `gFormC_add_axis_self` expansion ⟹
  INSTRUMENT failure, NOT theory. Switch to `linear_combination` with explicit coefficients of
  (a²−b²−1) and (unit−1), or fall back to the octonion-axis version. Do NOT inflate maxHeartbeats.
  Do NOT grind a route already shown to blow up.
- If BOTH versions resist after measure+reframe ⟹ honest W1 dissolution ticket + block (NOT a
  weaker claim, NOT a bridge).

## ANTI-VACUITY (W8)
`joinedIdQvC_genBoostLin` is phrased in `JoinedIdQvC` (the NON-VACUOUS predicate: a JoinedIdQvC
operator MUST preserve QvC, `joinedIdQvC_isQvIsomC`), NOT the vacuous `JoinedIdC`. The path stays
IN the isometry group (`genBoostPath_isQvIsomC` needs the UNIT axis). The W8 witness uses a
GENUINE octonion-direction boost not reachable by `boostEndC`. Deleting the physics words leaves a
real linear-algebra constraint over the derived `Cut`. A too-easy proof is a BUG — verify the
derivation genuinely uses the hyperbola/isometry structure, not generic connectedness.

## STANDARD
Unbroken (every object from the banked chain: boostEndC/axisRotLin templates, gFormC machinery,
cutSqrt, endOpC topology, JoinedIdQvC engine N157, boostPath template N164 — NO Mathlib ℝ/ℂ as
content, the field is the derived `Cut`). Complete (#print axioms ⊆ {propext,Classical.choice,
Quot.sound}, verified vs the built olean). Physics-words-removable (the statements are pure linear
algebra over `Cut`).
