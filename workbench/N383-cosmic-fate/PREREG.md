# N383 — arc-H H5: the fate of the universe / the eternal approach (theorem-grade)

## Target (SELECTED, S4-passed — see kanban comment 289)
DERIVE that the universe never reaches heat death, from C6 (the fold's own dynamical
engine) — not by positing an arrow of time. TWO faces, both banked:

1. **KL / self-coincidence face (N375).** Heat death = completed totalization =
   the KL divergence to maxent reaching 0 = completed self-coincidence. Banked:
   `relInfo_zero_iff` (relInfo p q = 0 ↔ p = q — the UNIQUE zero, the state-level
   Born self-overlap) and `gibbs_pos` (an off-equilibrium start p≠q has relInfo>0).
2. **Dynamical / analytic-fold face (N174/N369).** The coherence gap relaxes under
   the fold's OWN exponential `g(t)=g₀·cutExp(−λt)`; `cutExp_pos` keeps it `>0` at
   every finite t (never 0); the analytic fold `cutExp'=cutExp` (N369) makes the
   flow velocity `g'=−λg`, which never vanishes while g>0 — a concrete realization
   of the Picard–Lindelöf "no finite-time arrival at the fixed point". The unique
   fixed point (gap 0) is unreachable. The arrow = finite-past boundary (S_init=0,
   banked) / infinite-future asymptote, restated — NOT posited.

## New file: Phys/Algebra/CosmicFateEternalApproach.lean (ns Phys.Algebra)
Objects/theorems (all over derived ℝ Cut):
- `coherenceGap (g₀ λ t : Cut) : Cut := g₀ * cutExp (-λ * t)`  (the relaxing gap)
- `CutHasDerivAt.const_mul` — machinery (Mathlib lacks it on Cut; build like `.add`, N369)
- `heat_death_never_reached` : `0 < g₀ → 0 < coherenceGap g₀ λ t`  (∀t; cutExp_pos)  ★★
- `gap_ne_zero` : `0 < g₀ → coherenceGap g₀ λ t ≠ 0`
- `gap_strictly_decreasing` : `0<g₀ → 0<λ → t₁<t₂ → coherenceGap g₀ λ t₂ < coherenceGap g₀ λ t₁`  (the arrow; cutExp_strictMono)  ★
- `flow_velocity_eq` : `λ≠0 → CutHasDerivAt (coherenceGap g₀ λ) (-λ * coherenceGap g₀ λ t) t`  (g'=−λg; N369)  ★
- `flow_velocity_ne_zero` : `0<g₀ → 0<λ → -λ * coherenceGap g₀ λ t ≠ 0`  (flow never stops = no finite-time fixed pt)  ★
- `fixed_point_iff_gap_zero` : `λ≠0 → (-λ * coherenceGap g₀ λ t = 0 ↔ coherenceGap g₀ λ t = 0)`
- `fixed_point_unreachable` : `0<g₀ → λ≠0 → -λ * coherenceGap g₀ λ t ≠ 0`  (the no-arrival theorem)  ★★
- `kl_gap_never_reaches_coincidence` : off-eq pair p≠q ⇒ setting g₀=relInfo p q>0, `0 < coherenceGap (relInfo p q) λ t` ∀t — the relaxing KL datum never reaches the relInfo=0 coincidence (relInfo_zero_iff tie)  ★★
- `cosmic_fate_eternal_approach` : ★★★ capstone bundle (never-reached ∧ decreasing ∧ velocity≠0 ∧ fixed-pt-iff-gap-0 ∧ KL tie)

## Costume C408 (bites 1=408)
Counterexamples/CosmicFateEternalApproachVacuityCostume.lean.
Flag=1 tied to `gap_ne_zero` (at g₀=λ=t=1: `coherenceGap 1 1 1 ≠ 0`, i.e. the gap
GENUINELY stays positive). Bogus "heat death IS reached in finite time (gap=0)"
mis-reading ⇒ min 408 1 = 408 ⇒ 1=408.

## Discipline
- G1/G2: no asserted/empirical value; λ, g₀ free — NO number fit (no cosmic time, no
  heat-death temperature). removable prose only.
- G3: DERIVED not posited — gap>0 is `cutExp_pos`, velocity is `cutExp'=cutExp`, never
  an assumed ODE / assumed arrow.
- G5 words-removable: delete heat-death/universe/arrow/entropy — pure Cut facts: a
  positive constant times cutExp of a real argument is positive & never 0 (∀ arg);
  strictly decreasing in t for λ>0; its N369-derivative is −λ times itself, nonzero
  while positive; a KL divergence with unique zero at coincidence, relaxing, stays >0.
- G6 foundations-only ⊆ {propext, Classical.choice, Quot.sound}; NO Mathlib Real
  analysis / number-system as content (Cut only). NO gate-trigger tokens in prose.
- W9: measure every reduction in probe1 BEFORE production. Smallest obligations are
  const_mul (Tendsto.const_mul), div/mul_pos, strictMono — all cheap.

## Cost budget / KILL
Each obligation is a one-to-few-line reduction on banked lemmas — no brute
normalization, no expansion. KILL: if `flow_velocity_eq`'s const_mul plumbing does not
close in the probe within a couple tactic families, decompose the const_mul rule into
its own lemma (already planned) — no ceiling raise, ever.
