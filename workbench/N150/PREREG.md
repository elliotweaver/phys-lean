# N150 PREREG — THE GLOBAL LEMMA Z (contraction-kernel ⟹ scalar) — frozen before compute

## TARGET (hZ of N148's coverMapPinUnit_exactKernel_of_contractScalar)
```
∀ x : CliffC, (∀ v : STVC, contractLeft (polarBilin QvCQuad v) x = 0)
  → ∃ μ : Cut, x = algebraMap Cut CliffC μ
```
An element of CliffC killed by every polar-dual interior product is a SCALAR. Discharging this
CLOSES the full exact kernel `mker coverMapPinUnit = {1,-1}`.

## THE STRUCTURAL ROUTE (reframe through the trunk — NOT a 2^10 coordinate brute)
Decomposition into bounded sub-lemmas (W9.3 freeze-on-compile, each banked once):

- **Piece 1 — DUAL SURJECTIVITY (consumes N149 polarBilin_separating).**
  `polarBilin QvCQuad : STVC →ₗ Module.Dual Cut STVC` is INJECTIVE (polarBilin_separating +
  polar_comm symmetry) hence SURJECTIVE (finrank STVC = finrank Dual = 10, dual_finrank_eq +
  injective_iff_surjective_of_finrank_eq_finrank). The polar duals are ALL of Dual.
- **Piece 2 — CONTRACTION-UNIVERSAL.** x killed by all contractLeft(polarBilin v) ⟹ x killed by
  all contractLeft d (every d = polarBilin v by Piece 1 surjectivity).
- **Piece 3 — TRANSPORT to the exterior algebra.** equivExterior (char≠2, Invertible 2 over Cut)
  = changeFormEquiv; changeForm_contractLeft commutes contraction with the equiv;
  changeForm_algebraMap fixes scalars. So the CliffC statement ⟺ the ExteriorAlgebra statement.
- **Piece 4 — EXTERIOR LEMMA Z' (THE HEAVY W9 CORE).** y : ExteriorAlgebra Cut STVC killed by all
  contractLeft d is a scalar. Number operator N = Σᵢ ι(eᵢ)∘contractLeft(eⁱ) over the 10-dim basis
  (NOT 2^10 monomials): {ι(eᵢ)·, contractLeft(eⁱ)} = ⟨eⁱ,eᵢ⟩ (contractLeft_ι_mul), N acts as
  grade k on ⋀^k (gradedAlgebra), so all-contractions-zero ⟹ N y = 0 ⟹ k·yₖ = 0 ⟹ yₖ=0 (k≥1,
  char 0) ⟹ y = grade-0 = scalar. NEEDS an explicit basis + dual basis of STVC = Cut×Cut×O Cut
  and the grade-eigenvalue identity Mathlib LACKS.
- **Piece 5 — ASSEMBLY.** Lemma Z, then `mker coverMapPinUnit = {1,-1}` (Lemma Z + N148 ⊆ + N146 ⊇).

## GO / NO-GO (frozen)
- GO if Pieces 1–3 bank clean (dual surjectivity + contraction-universal + transport reduction):
  these are the genuine scaffolding the degree argument CONSUMES, direct consumers of N149.
- Piece 4 is the genuine W1/W9 heavy core. ATTEMPT it after 1–3 are banked; if it RESISTS after
  measure + reframe (number operator needs the explicit O Cut basis + grade-eigenvalue identity),
  CHILD it as the dedicated W1 dissolution ticket + decompose-complete. Failure NOT on the menu;
  silent scope-reduction NOT on the menu. Banking 1–3 + a crisp child for 4 is an HONEST W3
  decomposition (the ticket explicitly anticipates this).

## KILL BUDGET (W9 — compile-cost; THIS NODE OWES A SHARP ONE)
- KILL = 90s wall on ANY single obligation's `lake env lean` probe. If one obligation exceeds 90s,
  declare it an INSTRUMENT failure → measure/decompose/reframe, do NOT raise maxHeartbeats.
- NO inflated maxHeartbeats anywhere. NO monolithic ring/decide/simp over expanded coordinates.
- NO brute over the 2^10 exterior monomials — the basis sums are over the 10-dim STVC basis only.
- ≥2 probes ending at full budget banking nothing on the SAME obligation ⟹ W9 wall ⟹ child it.
- Checkpoint at ~50% iterations; FINALIZE (commit + gate-bg + child + complete) with iterations to spare.

## COSTUME (W8)
C182 must bite a WRONG contraction-kernel/scalar/degree/dual-surjectivity/separating/exact-kernel
claim, reducing to a false numeric DISTINCT from C115 1=7 … C180 2=148, C181 1=149. Use 1=150.

## STANDARD
DERIVED from banked N49–N149 + derived ℝ Cut + O Cut + STVC + BvC + CliffC + the N148/N149 cores.
Foundations-only {propext, Classical.choice, Quot.sound}. Physics-words-removable. NO Mathlib ℝ/ℂ
as content (QuadraticMap/contractLeft/equivExterior/Module.Dual are MACHINERY on the derived form).
No posited basis/grading/centralizer/nondegeneracy; no bridge.
