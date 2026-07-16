# PREREG — N429 (arc-P P4): THE GAUGE-θ TERM + HYPERCHARGE NORMALIZATION

## TARGET (SEED_FINAL_RECKONING §P4)
Pay the F2-childed debt (StrongCPTheta.lean lines 37–40): the full gauge-θ construction
(θ-weight ≡ 1 per configuration; −I ∉ Aut(J₃(𝕆))) AND derive the hypercharge normalization
from the banked charge structure (never a posited convention).

## FRONT CHOSEN (theory-native, S2/S4 in comment 379)
Two pieces, both discharging named deferrals, both at the arena/automorphism-invariant level:

PIECE A — the gauge-θ dissolution (F2's explicit childed debt):
- thetaWeight ≡ 0: the θ-weight (imaginary part of the arena determinant jN) vanishes for EVERY
  configuration (= theta_det_phase_zero) — θ-weight ≡ 1 (trivial phase) per configuration.
- negId ∉ IsAlgAut: the central inversion −I fails unitality (−1 ≠ 1). No central inversion in
  the derived gauge group Aut(O ℚ)=g₂⊂F₄ to generate a distinct θ=π sector.
- jN_neg_all: the reduced determinant is degree-3 homogeneous; full inversion flips its sign.
- neg_not_preserves_jN: full inversion does NOT preserve jN (F₄=Aut(J₃(𝕆)) preserves jN, N269),
  so it is not a Jordan automorphism — the θ=π sector has no automorphism to reach it.
- scalar_aut_forces_one: the ONLY central scalar dilation x↦c•x that is an algebra automorphism
  is c=1 — no nontrivial center scalar (−I excluded a fortiori).

PIECE B — the hypercharge normalization is FORCED (the ≥5–6×-deferred convention):
- weinberg_scale_invariant / hyperRatio_scale_invariant: the observables are invariant under any
  overall λ≠0 of the (Schur-unique, g₂-irreducible fund-7 N234) invariant trace form.
- weinberg_normalization_forced / hyperRatio_normalization_forced: for ANY λ≠0, sin²θ_W=3/8 and
  the ratio=5/3, computed from the banked derived traces (N317/N318). The normalization
  "convention" is physically inert — it cancels from every observable; the value is forced.
- weinberg_single_sided_breaks (W8 teeth): single-sided (independent-scale) rescaling BREAKS
  the invariance — the forcing genuinely relies on the SHARED single scale (one irreducible piece).

## GRADE: THEOREM-route throughout.
θ-weight≡0, −I∉Aut, jN homogeneity/flip, scalar-aut⟹1, scale-invariance, forced 3/8 & 5/3 — all
foundations-only over ℚ / O ℚ. MECHANISM/removable-prose (never a Lean eq): "θ-weight = e^{iθ}",
"−I = the θ=π central inversion", "the overall form normalization = the GUT/coupling convention".

## GUARDS
- G1 no asserted values (θ-weight 0, c=1, 3/8, 5/3 all FALL OUT; never premised).
- G2 no empirical number (measured sin²θ_W≈0.231, θ̄<1e-10 removable prose only).
- G3 DERIVED not posited (normalization forced by Schur-uniqueness+scale-invariance, NOT a convention).
- G4 words-removable (see production docstring).
- G5 foundations-only ⊆ {propext,Classical.choice,Quot.sound}; no sorry/axiom/native-decide/heartbeat.
- ℝ-vigilance: ground ℚ / O ℚ; banked jN/detArena/IsAlgAut/weinberg/hyperRatio/ladderChargeTrace/
  isospinTrace/fund2Weight/finrank Uhol/singlet. NO Mathlib-ℝ/ℂ as content.
- FREE-FLOATING: every headline TYPE mentions the banked derived objects (jN, detArena, IsAlgAut,
  Module.finrank ℚ Uhol/singlet, the banked trace functionals).
- W8 non-vacuity: costume C454 (next after C453).

## COST BUDGET / KILL
Whole-module `lake env lean` KILL = 90s (probes each ~13s). If any single obligation exceeds that,
MEASURE + DECOMPOSE. No brute normalizer on expanded octonion coordinates (route uses banked lemmas).

## MODULE
Phys/Algebra/GaugeThetaHyperchargeNormalization.lean (ns Phys.Algebra), ~12 decls.
Wire: import into Phys.lean AND Audits/AxiomAudit.lean (same commit). Costume C454.

## ONE-SUCCESSOR RAIL
Directed successor → arc-P P5 (∇^μ G_μν = 0 at the derivative level), per SEED_FINAL_RECKONING §P5.
