# N219 PREREG — THE EXPLICIT GLUING-OBSTRUCTION COCYCLE = THE ASSOCIATOR

## The three fronts, MEASURED (W9 measure-first, W1 repeated-deferral rule)

N218T (parent, banked) delivered the RUNG-DEPENDENT gather staircase: WHICH inter-world
pairs glue across `Dbl/H/O/S ℚ`. The §N218T-superseded frontier names three fronts:

- **(1) DEEPER CUT of the gather frontier — the associator/alternativity-defect AS the
  explicit gluing cocycle (the sheaf-like local→global obstruction made EXPLICIT).**
  MEASURED LIGHT + genuinely-NEW. The obstruction to `WorldsGlue a b`
  (`L_a ∘ L_b = L_{a·b}`) is exactly the map `x ↦ (a·b)·x − a·(b·x)`, which on the
  octonion shape `CD (CD B)` is **definitionally the banked associator** `assoc a b x`
  (`Phys/Algebra/Alternative.lean`). Every obligation is a one-line citation of a banked
  fact: `alt_left` (diagonal vanishes), `assoc_swap12` (antisymmetric), `assoc_nonvanishing`
  (genuinely nonzero), `H_associative` (identically zero on H), `s_self_glue_fail_coord`
  (nonzero self-defect on S). NO coordinate ring, NO W9 risk. **CHOSEN.**

- **(2) resume the PAUSED hypercharge ascent** (N218 parked: full matrix Freudenthal
  sharp `(A#)# = jN·A` / Peirce projector for the forced isospin `T₃`). MEASURED: the N217
  handoff records `(A#)#=jN·A` as a **W9 crime-scene risk** (octonion 3×3 matrix squares +
  power-associativity) and the forced isospin split as **posit-risky** (which idempotent
  difference is `T₃` is a convention unless a banked fact breaks the S₃ frame symmetry). By
  the W1 repeated-deferral rule this is NOT a clean lateral pick — the front needs a named
  route-finding node (the frame-symmetry-breaking supplier), not another grind. DEFERRED,
  still-named (unchanged from N214–N217 honest ascent verdict).

- **(3) a genuinely different physics joint.** Nothing ready-to-hand is cleaner or more
  forced than (1). SET ASIDE.

## THE OBJECT (derived, not posited — the deeper cut of N218T)

The obstruction to two worlds gluing is a MAP, not just a yes/no:
```
gluingDefect a b : A → A := fun x => (a·b)·x − a·(b·x)
```
`WorldsGlue a b ↔ gluingDefect a b = 0` (the coherence question IS the vanishing of this
explicit obstruction). On the octonion shape it is **the banked associator** `[a,b,·]`.

## WHAT THIS NODE BANKS (target decls, `Phys/Algebra/TowerGatherObstruction.lean`)

1. `gluingDefect` (def) + `worlds_glue_iff_gluingDefect_zero` — the N218T predicate is
   the vanishing of this explicit obstruction (ties the deeper cut to the parent).
2. `o_gluingDefect_eq_assoc : gluingDefect a b = assoc a b` on `O ℚ` (`rfl` / defeq) —
   THE IDENTIFICATION: the inter-world obstruction IS the octonion associator.
3. `o_gluingDefect_self : gluingDefect a a = 0` (from `alt_left`) — self-glue survives
   because the obstruction is LEFT-ALTERNATING (diagonal vanishes).
4. `o_gluingDefect_antisymm : gluingDefect a b x + gluingDefect b a x = 0` (from
   `assoc_swap12`) — the obstruction is ANTISYMMETRIC in the two standpoints.
5. `o_gluingDefect_ne_zero : ∃ a b, gluingDefect a b ≠ 0` (from `assoc_nonvanishing`) —
   pairwise glue genuinely fails (the obstruction is a NONZERO alternating form).
6. `h_gluingDefect_zero : ∀ a b : H ℚ, gluingDefect a b = 0` (from `H_associative`) —
   the obstruction is the TRIVIAL (identically-zero) cocycle on the associative rung.
7. `dbl_gluingDefect_zero` — same on `Dbl ℚ` (floor of the staircase).
8. `s_gluingDefect_self_ne_zero : ∃ a : S ℚ, gluingDefect a a ≠ 0` (from
   `s_self_glue_fail_coord`, witness `zdX`) — the obstruction LOSES its alternating
   diagonal-vanishing past the stop: even the SELF-obstruction is nonzero.
9. CAPSTONE `gluing_obstruction_staircase` — one statement exhibiting the degradation of
   the SINGLE explicit obstruction cocycle: identically-zero (H) → nonzero-but-ALTERNATING
   (O: diagonal 0 + antisymmetric) → non-alternating (S: diagonal ≠ 0).

## THE DISCOVERED CONTENT (withheld — read off the banked associator, NOT posited)

N218T said WHICH worlds glue. N219 says WHY, with one object: the coherence question is
the vanishing of the associator `[a,b,·]`, and self-coherence survives EXACTLY as long as
that obstruction stays ALTERNATING (diagonal-vanishing). The last rung where it alternates
is `O ℚ` — the cascade stop. The self-glue/Born-self-overlap shadow of N218T is now
EXPLAINED: self-gluing = the alternating (diagonal-vanishing) property of the associator
cocycle, and it is lost at `S` precisely where left-alternativity is lost.

## PHYSICS-WORDS-REMOVABLE

Delete "world / gather / glue / cocycle / obstruction": the statement is that the
associator `[a,b,·] = (a·b)·(−) − a·(b·(−))` of the tower's left regular representation is
identically zero on the associative rungs `Dbl/H ℚ`, a NONZERO ALTERNATING trilinear form
on `O ℚ` (diagonal `[a,a,·]=0` + antisymmetric `[a,b,·]+[b,a,·]=0`), and non-alternating
on `S ℚ` (`[a,a,·]≠0`). Pure associator algebra; no theorem statement needs a physics word.

## W9 COST BUDGET / KILL
Every obligation is `rfl` / a one-line banked citation / `funext + sub_eq_zero + mul_assoc`.
KILL = 60s per obligation; the ONLY nontrivial cost is the reuse of the banked S-coordinate
lemma `s_self_glue_fail_coord` (already banked, no re-elaboration). If ANY obligation runs
past 60s, that is a framing signal — STOP, do not inflate heartbeats. Expected: whole-module
build well under default heartbeats.

## COSTUME C251 (must BITE)
A WRONG claim that the octonion self-obstruction is nonzero (that `O ℚ` self-gluing fails /
the associator does NOT alternate at O) — reduce via banked `alt_left`/`o_gluingDefect_self`
to a false numeric `0 = 251` in ℚ. Dash-free signature `0 = 251`.
