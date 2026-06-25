# N38 — THE OPERATOR-EXP CORE, increment 8 (run 165). PREREG — FROZEN before compute.

## The arc
N37 banked `CompleteSpace Cut` (Cauchy-completeness of the derived ℝ). N38 = the operator-exp
core `Der(𝕆) → Aut(𝕆)`. Decomposition (from the ticket): (b) operator norm on `End(O Cut)` /
`Matrix(Fin 8)(Fin 8) Cut`; (c) tsum power-series `exp(D)=∑Dⁿ/n!`; (d) `exp(D)∈AutO`;
(e) `d/dt exp(tD)|₀=D`. THIS RUN scopes increment (b) ONLY (the operator-norm olean), per the
DECOMPOSE-AGGRESSIVELY W3/W9 directive. (c)–(e) childed onto the chain tail.

## THE W9 CONTENT-TRAP RISK (the thing to MEASURE before committing)
Mathlib's `Norm`/`NormedRing`/`NormedSpace` typeclass is **ℝ-VALUED** (`norm : α → ℝ`). Trying
to instantiate `Norm (Matrix … Cut)` would cast a `Cut`-valued magnitude into Mathlib's ℝ =
importing ℝ as content (STANDARD §3) — the SAME trap the metric (N35→N36) and CompleteSpace
(N37) dodged. So the operator norm here must be a **Cut-VALUED function** `opNorm : Matrix … Cut
→ Cut`, NOT a `Norm` instance — MACHINERY (`abs`, `Finset.sum`) on the DERIVED `Cut`, no
typeclass that forces ℝ.

## The route (trunk-native, Cut-valued)
`opNorm M := ∑ i, ∑ j, |M i j|` — the entrywise ℓ¹ sum norm on `Matrix (Fin 8) (Fin 8) Cut`.
Chosen because it is **submultiplicative with NO dimension factor**:
  ‖MN‖ = ∑ᵢₖ |∑ⱼ Mᵢⱼ Nⱼₖ| ≤ ∑ᵢⱼₖ |Mᵢⱼ||Nⱼₖ| ≤ ∑ᵢⱼₖₗ |Mᵢⱼ||Nₖₗ| = ‖M‖‖N‖.
Submultiplicativity is the load-bearing property for increment (c): it gives `‖Dⁿ‖ ≤ ‖D‖ⁿ`, so
`∑ ‖Dⁿ‖/n! ≤ ∑ ‖D‖ⁿ/n!` converges (Archimedean N35 + Cauchy-complete N37) — the C6
eternal-approach as a convergent series. That is the whole point of banking (b) first.

## GO / NO-GO (frozen)
GO (increment (b)) — bank in a new file `Phys/Algebra/DerivationAutOpNorm.lean`:
  • `opNorm : Matrix (Fin 8) (Fin 8) Cut → Cut := fun M => ∑ i, ∑ j, |M i j|`
  • `opNorm_nonneg`        : `0 ≤ opNorm M`
  • `opNorm_zero`          : `opNorm 0 = 0`
  • `opNorm_eq_zero`       : `opNorm M = 0 ↔ M = 0`  (definiteness — non-vacuity teeth)
  • `entry_abs_le_opNorm`  : `|M i j| ≤ opNorm M`     (entry bound — the unit-box handle)
  • `opNorm_add_le`        : `opNorm (M + N) ≤ opNorm M + opNorm N`   (subadditive / triangle)
  • `opNorm_smul`          : `opNorm (c • M) = |c| * opNorm M`        (absolute homogeneity)
  • `opNorm_mul_le`        : `opNorm (M * N) ≤ opNorm M * opNorm N`   ★ SUBMULTIPLICATIVE (the
                              load-bearing convergence seed for (c))
  • `opNorm_pow_le`        : `opNorm (M ^ n) ≤ opNorm M ^ n`          (the series-term bound)
  • `opNorm_autMatrix_le`  : `opNorm (autMatrix φ) ≤ 64`  (the N32 unit-box: 64 entries ≤ 1) —
                              lands the automorphism group in a banked bounded region
  • non-vacuity: `opNorm_one`/a positive witness so the seminorm is not the zero map.

NO-GO / escalate (W1 dissolution child + block) if: a Cut-valued submultiplicative norm is
genuinely unreachable after measure+reframe (NOT expected — this is elementary abs/Finset
machinery on the banked `Cut`), OR `Matrix (Fin 8) (Fin 8) Cut` does not carry a `Ring` instance
making `M*N`/`M^n` typecheck (would force a different carrier).

## KILL / compile-cost budget (W9)
  • Per-obligation KILL: any single theorem that does not elaborate in **≤ 90 s** at DEFAULT
    `maxHeartbeats` is an INSTRUMENT failure → MEASURE the sub-obligation, DECOMPOSE, never
    inflate heartbeats. The submultiplicativity `∑ᵢⱼₖ` manipulation is the only nontrivial one;
    it MUST be done with abstract `Finset.sum` lemmas (`Finset.sum_mul_sum`, `Finset.abs_sum_le`,
    `Finset.sum_le_sum`), NEVER by `Fin 8` expansion / `decide` / `ring` on 64 expanded entries.
  • Whole-file build KILL: if the file does not build in ≤ 6 min, decompose into ≤2 files.
  • NEVER run an unbounded compile in the turn budget — MEASURE in a bounded scratch probe first.

## TURN CHECKPOINT (anti-timeout — W9)
At ~55% of the turn budget: if the production file + #print axioms are green, FINALIZE
IMMEDIATELY (costume + manifest + gate-bg + AxiomAudit + Phys.lean + LEDGER + ROADMAP + child +
commit) — do NOT start (c). If the norm file is NOT green by ~55%, COMMIT whatever compiled,
child the remainder, complete as DECOMPOSED. Every recent node (N28–N37) timed out finalizing
AFTER committing the derivation — finalize with turns to spare.

## Anti-vacuity (W8) — the costume MUST bite
C60 must assert a WRONG operator-norm fact (e.g. submultiplicativity with `<` reversed, or
`opNorm M = 0` for a nonzero M, or an entry exceeding the norm, or `opNorm (M*N) > opNorm M *
opNorm N` for a concrete pair) and FAIL to compile. Reuse the banked `Cut`/`autMatrix`/N32 —
NEVER a fresh table.

## Physics-words-removable (STANDARD §2)
Delete "operator/gauge/exp/G₂/colour": the file is a complete proof that the entrywise-ℓ¹
magnitude `∑ᵢⱼ|Mᵢⱼ|` on 8×8 matrices over the completion-of-the-gather-of-closures of the
derived rationals is a submultiplicative, subadditive, absolutely-homogeneous, definite,
Cut-valued seminorm dominating each entry, finite on the orthonormal-isometry image. NO physics
name load-bearing.

## NOT on the menu
NO `import Mathlib.Data.Real` as content; NO `Norm`/`NormedRing`/`NormedSpace`/`exp` typeclass
(ℝ-valued trap); NO posited exp/G₂/metric; NO bridge; NO weakening; NO heartbeat inflation.
