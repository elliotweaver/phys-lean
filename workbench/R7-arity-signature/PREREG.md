# PREREG — N451 arc-R R7: THE ARITY SIGNATURE

## Target (theory-native, SELECT-decided)
The gather's gluing obstruction (banked octonion associator on `O ℚ`, = `gluingDefect` via
`o_gluingDefect_eq_assoc`) is EXACTLY trilinear: pairwise-clean, triadically-torn — the GRAIN of
the obstruction.

## Claims (all DERIVED, foundations-only)
- (A) ★ `assoc_span2_vanishes` — any 3 elements of any 2-dim ℚ-span associate (arbitrary spanning
  pair, forced by the three banked alternative laws + slot-linearity).
- (A') ★ `assoc_span4_vanishes` — any 3 elements of `span{1,a,b,ab}` associate (via `assoc_gen_triple`,
  64 cases, + slot-span inductions).
- (B) `arity3_tear` (= banked `assoc_nonvanishing`) — arity 3 has a genuinely nonzero associator.
- (Σ) ★ `arity_signature` — non-hollow bundle: gluing-defect hook ∧ pairs-glue ∧ generated-content
  ∧ triples-tear.

## Scope decision (W3 decompose, J-R7)
Literal generated-subalgebra Artin (`⟨a,b⟩ associates`) needs `⟨a,b⟩ ⊆ span{1,a,b,ab}` via the
quadratic norm-scalar closure (`Nrm z` a tower-scalar — recursive machinery CD ℚ→Dbl→H→O). That
is the DIRECTED R7b successor. This node banks the arity-signature CORE (complete, non-hollow).

## Guards
G1 no asserted values. G2 no empirical number. G3 alternativity a THEOREM (banked alt laws), never
posited. G4 mind-words-removable. G5 foundations-only ⊆ {propext,Classical.choice,Quot.sound}.
G7 IDENTIFICATION FIREWALL — NO identification anywhere (deferred to R8). Non-hollow / not
free-floating: every type about `O ℚ`; capstone anchored to banked `o_gluingDefect_eq_assoc` +
`assoc_nonvanishing`.

## Cost budget / KILL
Coordinate bash confined to `obash_ab` (single triple, ~16s under 4M heartbeats). 64-case
`assoc_gen_triple` via `simp only` (~21s) — `first|…|` KILLED (timed out 60s in probes).
Production build ~33s. If any obligation exceeds ~2min → decompose (none did).

## Costume
C476 `Counterexamples/StandpointArityVacuityCostume.lean`, bites `1 = 476`, anchored to
`assoc_span2_vanishes` ∧ `assoc_span4_vanishes` ∧ `arity3_tear` ∧ `arity_signature`.

## Successor
ONE directed child → R7b (generated-subalgebra Artin via quadratic norm-scalar closure), which
then hands R8. No generic SELECT ticket (fork guard).
