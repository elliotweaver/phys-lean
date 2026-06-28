# N121 PREREG — THE SUBSPACE-PRESERVING REFLECTION-ON-ePerp (the finrank-recursion crux)

Frozen BEFORE compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## TARGET (ROADMAP §N121 priority (i)(a) — the named immediately-bankable structural piece)
The bisector reflection's octonion-block v-block `octReflBlock e w := biMulV n n`
(`n := r⁻¹•(e−w)`, the v-block of the banked `octDeflate e w = biMulLin n n`):
  - is a DIAGONAL `gFormC`-isometry on `O Cut` (`octReflBlock_gFormC_diag`, from `biMul_gFormC`
    + `octBisector_unit`);
  - FIXES any imaginary axis `e₀` Born-orthogonal to the bisector `e − w`
    (`octReflBlock_fixes_orthogonal`, the O-Cut-level mirror of N120's
    `octDeflate_fixes_orthogonal_axis`, via `octRefl_reflect_imag` at the unit bisector);
  - therefore (instantiating N119's `isom_fixes_mapsTo_ePerp` / `isomRestrict` /
    `isomRestrict_gFormC_isom` with `S := octReflBlock e w` and the fixed axis `e₀`) MAPS
    `ePerp e₀` INTO `ePerp e₀` (`octReflBlock_mapsTo_ePerp`), RESTRICTS to an operator on the
    codim-1 Born-orthogonal complement (`octReflBlockRestrict`), and the restriction is STILL a
    `gFormC`-isometry on `ePerp e₀` (`octReflBlockRestrict_gFormC_isom`).

This is THE subspace-preservation core N120's MEASURE-FIRST finding flagged as the genuine
obstruction: "a reflection of two vectors lying inside a subspace W need not preserve W". RESOLVED
here: the bisector reflection, restricted to the Born-orthogonal complement of an axis it FIXES,
is a `gFormC`-isometry on that codim-1 subspace — exactly what the Cartan–Dieudonné
finrank-strong-recursion needs to descend INTO the complement. Combined with N119's `ePerp_finrank`
(codim-1 drop) it gives: an n-dim block isometry moving an axis = one bisector reflection · an
isometry on the (n−1)-dim complement.

W8 TEETH (non-vacuous concrete subspace-reflection): `octReflBlock e₂ je2` FIXES `ke2je2`
(`ke2je2 ⊥ e₂ − je2`, `twoaxis_witness_self_overlap`), so maps `ePerp ke2je2` into itself
non-vacuously, the deep coordinate reading `ke2je2` back; its Born self-overlap reads
`gFormC ke2je2 ke2je2 = 1`.

## GO / NO-GO
GO if: every crux obligation (A) `octReflBlock_fixes_orthogonal`, (B) `octReflBlock_gFormC_diag`,
(C) the three N119 instantiations, isolated-typechecks clean (`lake env lean` exit 0), each well
under the 90s KILL; production builds an olean; `#print axioms` ⊆ {propext, Classical.choice,
Quot.sound} for every decl, INDEPENDENTLY audited vs the built olean; costume C153 bites.

NO-GO / DECOMPOSE if: the full subspace-preservation family lands clean but the FULL
finrank-strong-recursion assembly (Nat.strong_induction on finrank with the moved-axis hypothesis
transporting to the subspace) does NOT close in remaining budget → bank the subspace-preservation
family (this node), child the full finrank-recursion assembly + the Cut-basis of O Cut + the
operator topology over Cut as N122.

## KILL (INSTRUMENT failure, not theory)
- Any single crux obligation exceeding 90s isolated `lake env lean` = W9 instrument wall → MEASURE
  the sub-obligation, DECOMPOSE, do NOT inflate maxHeartbeats, do NOT brute. (N119/N120 were LIGHT
  ~7-8s; this is the same structural machinery — expect light. A blow-up means wrong framing.)
- NO inflated maxHeartbeats, NO native_decide, NO monolithic ring/decide/simp on expanded
  coordinates. Every step a structural rewrite through banked identities.
- If after measure+reframe the full assembly resists → honest W1 child + bank the subspace piece.

## ANTI-DRIFT (THE ONE LAW)
If a proof fights: return to the trunk (the reflection identity `octRefl_reflect_imag` is the
half-turn governed by the single alternative law `mul_mul_left`; the isometry is `biMul_gFormC`;
the rank-drop is N119's `gFormC_polarize` + rank–nullity). NEVER add a hypothesis to pass a fight.
NEVER weaken the target. NO posited orthogonal-group induction, NO operator topology, NO Mathlib
ℝ/ℂ as content, NO bridge.

## COSTUME C153
A WRONG subspace-preservation / reflection-restriction coordinate claim, reducing to a false
numeric DISTINCT from the banked battery (… C151 1=113, C152 0=115): the v-block reflection
`octReflBlock e₂ je2` FIXES `ke2je2` (because `ke2je2 ⊥ e₂ − je2`), so its Born self-overlap reads
`gFormC (octReflBlock e₂ je2 ke2je2) (octReflBlock e₂ je2 ke2je2) = gFormC ke2je2 ke2je2 = 1`; the
BOGUS claim that it reads `117` (the reflection does NOT fix the orthogonal axis / does NOT preserve
the complement) forces `1 = 117`, must NOT compile. False numeric 117 distinct from the battery.

## ANTI-CIRCLING ROUTE LOG
(routes attempted + failure modes appended here as they happen)
