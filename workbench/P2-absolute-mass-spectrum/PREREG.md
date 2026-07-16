# N427 — arc-P P2 — THE ABSOLUTE FERMION MASS SPECTRUM (not just ratios)

## SELECT (S1–S4) — done in comments 375+; target ALIGNS with arc P §P2, no redirect.

GOAL LENS: fold → self-blindness → complex unit → CD cascade → caps at 𝕆 → J₃(𝕆) maximal
arena → f₄=Der PRESERVES spectrum (kills identity, fixes degenerate diag(1,1,1)) → the arena's
OWN left-mult L₀ MOVES that identity (spectrum-mover, N295) → the split is the ℤ₃-cycle at the
derived phase δ_B (Koide-balanced, N340) → the overall scale is the minimal-wrap transmutation
amplitude (P1/N426, banked into N417's determined scale) → ∴ the ABSOLUTE spectrum = the derived
scale × the derived split eigenvalues, split by the derived direction L₀.

REFRAMING LENS: SM = v + ~N free Yukawas (the flavor puzzle). The theory DISSOLVES it: v forced
(P1), ratios forced (Koide + single derived phase δ_B, ZERO shape params, N340), scale forced
(N417 parameter-free), breaking direction = the arena's own L₀ (N295), NOT a bolted spurion. The
absolute mass — needing ~10 free numbers in the SM — becomes a product of derived objects with
ZERO new freedom.

## THE TARGET (theorem-route; genuine three-module WELD, NOT a hollow-AND)

Combine N417 (`absScaleChainDerived`, the parameter-free derived scale S) + N340 (`mass0/1/2`,
`b0/1/2`, the relative eigenvalues/amplitudes over derived ℝ at δ_B=2/9) + N295 (the L₀
spectrum-mover) to DEFINE and prove the FIRST ABSOLUTE mass objects:

  massScale := absScaleChainDerived           -- S, derived positive Cut (N417)
  ampScale  := cutSqrt massScale              -- sc, sc·sc = S (cutSqrt_sq), 0<sc (cutSqrt_pos)
  absAmp k  := ampScale · b_k                  -- absolute amplitude
  absMass k := massScale · mass_k              -- absolute mass = S · relative eigenvalue

New content (never co-occurred in one theorem before — N417×N340×N295 weld):

  (T1) absMass k = (absAmp k)^2  — the absolute mass IS the Born square of the absolute amplitude
       (sc²·b_k² = S·mass_k). Born=self-overlap at absolute scale.
  (T2) POSITIVITY + ORDERING: 0 < absMass1 < absMass2 < absMass0 — a determined ordered spectrum
       (massScale>0 × mass_pos/mass_distinct, N340).
  (T3) RATIO INHERITANCE (the "ratios × scale = absolutes" made precise): the absolute mass ratios
       carry the SAME banked brackets — 483/1e5·absMass2 ≤ absMass1 ≤ 485/1e5·absMass2 and
       594/1e4·absMass0 ≤ absMass2 ≤ 595/1e4·absMass0 (scale S>0 multiplies the banked N340
       brackets; S drops out of ratios).
  (T4) SCALE-INVARIANT KOIDE: (ΣabsMass)/(ΣabsAmp)² = 2/3 — the self-overlap quotient is scale-free
       (S cancels: S·6 / (sc·3)² = S·6/(S·9) = 2/3), so the ABSOLUTE masses satisfy the SAME Koide
       as the relative amplitudes. (Σb=3 by ring; Σmass=6 = koide_total, N340.)
  (T5) THE BREAKING DIRECTION L₀ (N295, banked facts + flagged identification): the arena's own
       Jordan left-mult `Lmul(slotA 1)` MOVES the identity (`Lmul_one`, `Lmul_moves_one_ne`) that
       every derivation of f₄ KILLS (`derH3_kills_one`), so it is genuinely OUTSIDE f₄
       (`Lmul_notMem_derH3`) — the derived direction that LIFTS the degeneracy f₄ fixes. The
       non-degeneracy of {absMass} (T2) is its physical shadow (identification = flagged prose).

Capstone `absolute_mass_spectrum` bundles T1–T5 (a theorem ABOUT the new object absMass + the
banked L₀ facts, NOT a bare conjunction of pre-existing facts).

## HONEST GRADE (NO deferral, NO "ratios-only" hedge — arc-P §0)
- THEOREM-route: T1–T4 (pure derived-Cut ring/bracket arithmetic on banked objects) + the T5 L₀
  facts (banked N295 theorems). The absolute spectrum is a DETERMINED parameter-free derived-ℝ
  object — this IS the absolute (non-ratio) spectrum, expressed in the theory's own natural unit
  (the derived closure scale, massScale=absScaleChainDerived pinned to M_oct=1).
- MECHANISM / removable prose (NEVER a Lean equation): the physical GeV value of each mass (needs
  the empirical closure/EW anchor M_oct — G2 prose only, NO FIT); the identification of the L₀
  degeneracy-lift with the non-degeneracy of {absMass}; which Cut number is e vs μ vs τ.
  ⚠ This is NOT the forbidden "ratios-only" hedge: T1–T4 produce ABSOLUTE (non-ratio) determined
  numbers over derived ℝ. The GeV conversion is a human unit choice, removable — the theory sets
  the number (EVERY-CONSTANT-IS-FORCED), the GeV is the unit.

## GUARDS
- G1 no asserted values: absMass/absAmp DEFINED from banked S and banked mass_k; every property
  FALLS OUT via rw/ring/nlinarith/banked lemmas. Never premised.
- G2 no empirical number in any proof: measured masses / v / M_oct / GeV — removable prose only.
- G3 derived not posited: S from N417, mass_k/b_k from N340, L₀ from N295 — all banked/derived.
- G4 physics-words-removable: over Cut, S·mass_k is a determined positive ordered product with
  bracket-inherited ratios and a scale-free 2/3 self-overlap quotient; over O ℚ, Lmul(slotA 1)∉derH3.
- G5 foundations-only ⊆ {propext,Classical.choice,Quot.sound}; no proof-hole/native-decide/heartbeat.
  ℝ-vigilance: everything over derived Cut + banked cutSqrt/cutCos/cutExp; O ℚ arena; NO Mathlib-ℝ/ℂ.
- W8 non-vacuity: C452 (next after C451). absMass genuinely ordered/distinct; Koide ≠ trivial;
  L₀ genuinely ∉ f₄.
- W4.5 SUFFICIENCY: derive exactly P2 (absolute spectrum + L₀ breaking direction), NOT P3 anomalies.
- W9 cost: MEASURE co-import (three heavy oleans) in a bounded probe FIRST. Proofs are light
  (ring/nlinarith/mul_lt). KILL: any single obligation > 90s → decompose.

## Module: Phys/Algebra/AbsoluteMassSpectrum.lean (ns Phys.Algebra.AbsMass), one commit.
Imports: ScaleTowerDischargeArcM (N417), GenerationMassRatiosNumeric (N340),
OctonionJordanSpectrumMovingSector (N295), LorentzContinuumSqrt (cutSqrt), Mathlib.Tactic.
Wire into Phys.lean + Audits/AxiomAudit.lean (same commit). Costume C452.

## ONE-SUCCESSOR RAIL: directed child → arc-P P3 (non-abelian + Witten anomaly, SEED §P3).
