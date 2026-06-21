# N2d-MIDDLE-core — RUN 34 FINDINGS (the close — committed)

Runs 32/33 did full recon and ASSEMBLED the complete production block in
`Phys/Cascade/ForcedStop.lean` (276 uncommitted lines), verified each piece
foundations-only in isolation, but ran out of iterations (90/90) before build +
gate + commit. Run 34 = the disciplined close on top of that on-disk work.

## WHAT WAS ON DISK (runs 32/33, uncommitted)
The full polarization core, namespace `CDcore`, over the doubled-base home
`A = CD (CD B)` (carrier `CD (CD (CD B))`):
- `narCD`/`srCD` — local NonAssocRing/StarRing instances one rung past associativity.
- Ported Part-A bricks over `[NonAssocRing A]`: `mul_add_na`, `Nrm_add_na`,
  `bilin_add_left_na`, `bilin_neg_left_na`, `P2_na`, `bilin_diag_na`.
- `adjoint3` — THE ADJOINT IDENTITY, an `ext`+`ring` fact over the doubled-double
  shape (centrality structural, never posited).
- `bilin_L_zero` (the Hurwitz chain), `scaling_of_H` (Hcore: H + anisotropy ⟹
  scaling law — A-valued nondegeneracy DISSOLVES to scalar positivity at w=L),
  `base_assoc_of_H`, `comm_of_base_assoc`, `Nrm_mul_iff_base_assoc` (THE FORCED IFF).
- `aniso_S2` (Born positivity discharged: (Nrm z).re.re.re = sum of 16 squares / ℚ),
  `Nrm_mul_iff_O_assoc` + `Nrm_not_mul_on_S` (hypothesis-free at the stop).

## RUN 34 — THE CLOSE (what was missing)
The on-disk block already compiled (`lake build Phys.Cascade.ForcedStop` clean,
3291 jobs, only cosmetic unusedSimpArgs warnings). Runs 32/33 simply never reached:
1. AXIOM AUDIT — added 17 new `#print axioms` lines to `Audits/AxiomAudit.lean`
   (94 audited theorems total; all ⊆ {propext, Classical.choice, Quot.sound}).
2. THE COSTUME THAT BITES THIS NODE'S CRUX — `C15`,
   `Counterexamples/ForcedStopCoreAdjointNonCentralCostume.lean`: the ADJOINT IDENTITY
   asserted on the NON-CENTRAL base `M₂ ℚ` (the structure the cascade's doubling does
   NOT produce). At witness u=⟨E₀₁,0⟩, v=⟨E₁₀,0⟩, w=⟨E₀₀,0⟩ on `CD (M₂ ℚ)`, entry (0,0):
   `bilin(u·v)w = 2` (proved `adj_lhs`), `bilin v (star u·w) = 0` (proved `adj_rhs`) →
   bogus equality reduces to false core `2 = 0` → MUST fail to compile. This guards
   anti-vacuity (W8): `adjoint3` genuinely USES the cascade's centrality.
   - Witness found numerically in Lean (`#eval`): adjoint LHS row [2,0,0,0],
     RHS row [0,0,0,2] — disagree exactly where centrality would be needed.
3. GATE GREEN (D0–D6): 15/15 costumes bite, 94 theorems foundations-only.
4. LEDGER: N2d-MIDDLE-core marked ✅, forced iff CLOSED, OWED entry retired.

## STANDARD CHECK (the second gate)
- UNBROKEN: everything forward from banked CD product/star; adjoint/anisotropy
  DERIVED over the doubled structure / discharged as squares, never posited; no
  Mathlib Hurwitz/CompositionAlgebra import (grep-verified — all mentions are
  docstrings asserting the opposite).
- COMPLETE: #print axioms ⊆ {propext, Classical.choice, Quot.sound} on all 17;
  no sorry/axiom/native_decide/bridge (D1/D2/D3 green).
- PHYSICS-WORDS-REMOVABLE: delete Born/composition/octonion → "the self-overlap
  form on CD A is multiplicative ⟺ A associative, and dies at S because O is
  non-associative" stands as pure algebra. `Nrm_not_mul_on_S` is hypothesis-free.

## THE CAPSTONE
"One cause, many terminations" is now a PROVED CONNECTION: the same octonionic
non-associativity (`O ℚ` not associative) that stops the division/zero-divisor
cascade (N2c) FORCES the loss of the composition/Born law (`Nrm_not_mul_on_S`),
via the forced iff. The backward Hurwitz direction — the crown of N2 — is closed.
