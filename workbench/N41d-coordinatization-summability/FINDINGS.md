# N41d — FINDINGS (measurements, then frozen GO)

## ALL PROBES COMPILE CLEAN (each ~8s wall incl import load; KILL=60s NEVER approached)
Git was CLEAN at start (no inherited WIP) — fresh build, not a crime-scene recovery.

### A1 — coordOCut (the Cut-side coordinatization) — CHEAP ✓ (probe1, ~10s)
`coordOCut : O Cut ≃ₗ[Cut] (Fin 8 → Cut)` mirrors the banked ℚ-side `coordO` EXACTLY:
`![d0..d7]` with `d0..d7 : O Cut → Cut` the nested `.re/.im` projections; invFun the nested
`Dbl`/`CD` constructor. map_add' via `CD.add_re/add_im`+`Dbl.add_re/add_im`; map_smul' via
`CD.genSmul_re/genSmul_im`+`Dbl.smul_re/smul_im`. left_inv by destructure+rfl; right_inv by
fin_cases+simp.

### A1b — continuity of coordOCut, BOTH directions — CHEAP ✓ (probe9, ~8s)
Forward: `continuous_pi` + fin_cases, each component = composition of `CD.continuous_re/im`
(O→H), `CD.continuous_re/im` (H→Dbl), `Dbl.continuous_re/im` (Dbl→Cut). All banked N41b.
Symm: `CD.continuous_mk`/`Dbl.continuous_mk` nesting + `continuous_apply i`.

### A2 — THE GATING CORE: UNCONDITIONAL summability — FEASIBLE ✓ (probes 4c/5/7/8)
ROUTE = MATRIX TRANSPORT (chosen; ROUTE-2 componentwise not needed). For a **Cut-linear**
endomorphism `D' : Module.End Cut (O Cut)`, with `e := coordOCut`, `M := toMatrix' (e.conjRingEquiv D')`:
  - matrix-rep identity `e ((D'^n) x) = M^n *ᵥ (e x)` (probe5, CLEAN): via
    `map_pow LinearMap.toMatrixAlgEquiv'` (M^n = toMatrix'((conj e D')^n)) +
    `LinearMap.toMatrix'_mulVec` + `map_pow (conjRingEquiv e)` + `conjRingEquiv_apply_apply` +
    `symm_apply_apply`.
  - scalar/expTerm step `e ((1/n!)•(D'^n x)) = expTerm M n *ᵥ (e x)` (probe8, CLEAN): `map_smul`
    + hrep + `expTerm` unfold + `Matrix.smul_mulVec`.
  - `Summable (fun n => expTerm M n *ᵥ ex)` (probe8, CLEAN): `(expTerm_summable M).map φ hcont`
    where φ = `(· *ᵥ ex)` AddMonoidHom, continuity via `Continuous.matrix_mulVec`.
  - summability transfer back `Summable (e∘g) → Summable g` (probe6, CLEAN): `h.map
    (e.symm.toLinearMap.toAddMonoidHom) he'` then `simpa`.
  ⟹ `Summable (fun n => (1/n!)•((D'^n) x))` UNCONDITIONALLY for any Cut-linear D'.

### A2c — bridging Cut-linear ↔ ℤ-linear (expO takes Module.End ℤ) — CHEAP ✓ (probe10)
`expO` is defined on `Module.End ℤ (O Cut)`. A Cut-linear D' restricts: `D'.restrictScalars ℤ`,
and `((D'.restrictScalars ℤ)^n) x = (D'^n) x` pointwise (probe10b first example, CLEAN, by
induction with `Module.End.mul_apply`). So state the summability for `D'.restrictScalars ℤ` and
discharge `expO_mul_of_summable (D'.restrictScalars ℤ) ...`.

## DECISION: the natural setting is a Cut-LINEAR endomorphism
The summability majorant (operator norm of a matrix) FUNDAMENTALLY needs the matrix rep, which
needs Cut-linearity. This is exactly the Lie-algebra-of-the-Lie-group setting (the derivation
algebra acts Cut-linearly on the Cut-vector-space O Cut). The deliverable summability/automorphism
is stated for `D' : Module.End Cut (O Cut)` (+ `IsDeriv (D'.restrictScalars ℤ)` for the product
law). NON-VACUITY: need a concrete nonzero Cut-linear Leibniz derivation — the banked ℚ-side
`witnessDeriv` base-changes; OR exhibit directly. MEASURE in production.

## FROZEN GO SCOPE (largest complete increment, anti-timeout — FINALIZE EARLY)
Production file `Phys/Algebra/DerivationOExpSummable.lean`:
  1. `coordOCut` + `coordOCut_continuous` + `coordOCut_symm_continuous`.
  2. `expO_matrix_rep`: `coordOCut ((D'^n) x) = M^n *ᵥ coordOCut x`.
  3. `expO_summable` (★ THE GATING CORE): `Summable (fun n => (1/n!)•((D'.restrictScalars ℤ ^n) x))`
     UNCONDITIONAL for Cut-linear D'. (+ the product family `hxy` via product-summability — MEASURE,
     likely `Summable.mul_of_nonneg`/`cut_summable`-style or the matrix `matrix_prod_summable`
     transported; if it resists, the discharge still needs it — measure carefully.)
  4. `expO_mul` (DISCHARGE): unconditional `expO (D'.restrictScalars ℤ) (x*y) = expO _ x * expO _ y`.
  5. Costume C66: a WRONG summability/coordinatization claim that FAILS.
BANK-AS-YOU-GO: commit coordOCut + matrix_rep first, then summability, then discharge.
BIJECTION (inverse expO(-D)) + DERIVATIVE (d/dt) → child N41e if budget tight (anti-timeout).

## KILL: 60s/obligation. All measured obligations ≤ ~2s actual elaboration. No W9 risk.
## The product family hxy is the one UNMEASURED piece — measure FIRST in production.
