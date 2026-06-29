# N177 PREREG (frozen before compute)

## Front chosen (after MEASURE of both)
Front (i) — but the task body's framing ("exp(D)∈Aut(O Cut) product-preservation is the missing
content") is STALE. That static automorphism is ALREADY banked at N41:
  - `expO_mul` (product-preservation, N41e, DerivationOProductPreserving)
  - `expOEquiv` + `expOEquiv_isAlgAut` (the Cut-linear algebra automorphism, N41f, DerivationOAutomorphism)
  - `expO_one` (unital), `expOLin_comp_neg`/`expOLin_neg_comp` (the B=−A inverse), `expO_tangent` (N41g)

The GENUINELY-OPEN structure (W4.5: OPENS, does not re-pin) is the **ONE-PARAMETER FLOW LAW**:
    expO(sD) ∘ expO(tD) = expO((s+t)D)
the continuous one-parameter SUBGROUP inside G₂ = Aut(O). N41 banked only the static automorphism
and the discrete B=−A inverse special case. This is EXACTLY parallel to how N176's `specPow_flow`
generalized N68's static `specOpN_comp` from a=b to the continuous flow — here we generalize N41's
`expOLin_comp_neg` (the t↦−t inverse) to `expOLin (s•D) ∘ expOLin (t•D) = expOLin ((s+t)•D)` for
ALL real s,t (the continuous one-parameter group, not just the discrete inverse).

## Route (all levers BANKED — reframe through the trunk, no new analysis)
- `derivMatrix_smul` (N41g): derivMatrix (t • D') = t • derivMatrix D'
- `expMap_mul_of_commute` (N40): expMap A * expMap B = expMap (A+B) for Commute A B
- commute: Commute (s • M) (t • M) since both are scalar multiples of the same M (Cut commutative)
- The proof mirrors `expOLin_comp_neg` (which used expMap_mul_neg) but uses
  expMap_mul_of_commute + ← add_smul instead — the s,t↦s+t generalization of t↦−t.

## Decls planned (production: Phys/Algebra/LorentzContinuumExpFlow.lean OR extend DerivationOAutomorphism)
1. commute_derivMatrix_smul : Commute (s • derivMatrix D') (t • derivMatrix D')
2. expOLin_flow_apply : expOLin (s•D') (expOLin (t•D') x) = expOLin ((s+t)•D') x   ★ THE FLOW (pointwise)
3. expOLin_flow : (expOLin (s•D')).comp (expOLin (t•D')) = expOLin ((s+t)•D')       (LinearMap level)
4. expO_flow : expO ((s•D').restrictScalars ℤ) (expO ((t•D').restrictScalars ℤ) x)
               = expO (((s+t)•D').restrictScalars ℤ) x                              (in terms of expO)
5. expOEquiv_flow : (expOEquiv (t•D')).trans (expOEquiv (s•D')) = expOEquiv ((s+t)•D')  ★★ one-param SUBGROUP
6. expOLin_smul_zero : expOLin ((0:Cut)•D') x = x                                   (the flow IDENTITY element)
7. expOEquiv_flow_one_zero : (expOEquiv (1•D')).trans (expOEquiv (0•D')) = expOEquiv (1•D')  (identity-on-right, non-vacuity)
8. expOEquiv_flow_isAlgAut : each flow member of a derivation is an algebra automorphism
   (if IsDeriv ((t•D').restrictScalars ℤ) ∀t — OR concrete D'=0 witness via expOEquiv_isAlgAut)
9. NON-VACUITY concrete witness: the flow at concrete scalars over D'=0 OR a banked derivation,
   plus the costume.

## GO / NO-GO
GO if expOLin_flow_apply compiles clean foundations-only in the probe.
NO-GO (→ front (ii) discrete component-group, OR W1 dissolution ticket) if the flow law resists
after measure + trunk reframe.

## KILL (instrument-failure threshold, W9)
- Probe `lake env lean` of the flow law must finish < 60s (it is a finite rw chain over banked
  lemmas — same shape as expOLin_comp_neg which is instant). If a SINGLE flow lemma's elaboration
  exceeds 90s or OOMs, that is an INSTRUMENT failure → decompose / reframe, NOT a longer grind.
- Whole-module production olean budget: < 200s cold (DerivationOAutomorphism is the heaviest import;
  N176 analogue olean was 123s). If > 300s, decompose the file.

## Costume (next id C209)
Bite a WRONG flow composition: claim expOLin (s•D')∘expOLin(t•D') = expOLin ((s·t)•D') (product
instead of SUM of the parameters), reduced to a false numeric 1=177 DISTINCT from the battery
(… C207 1=175, C208 1=176). The flow is ADDITIVE in the parameter (one-parameter group), not
multiplicative — the costume forces the wrong law to a false scalar identity.

## Anti-vacuity (W8)
The flow law is UNCONDITIONAL in D' (no IsDeriv needed — it is the matrix one-parameter subgroup
transported), but it is NOT trivial: it rests on expMap_mul_of_commute (the genuine Cauchy-product
homomorphism law N40). Delete "exp/flow/derivation/automorphism/one-parameter group" → it is a
complete proof that t ↦ E(t•D') is a homomorphism from (Cut,+) into the Cut-linear automorphisms
of the 8-dim non-associative algebra O Cut: E(s•D')∘E(t•D') = E((s+t)•D'), E(0)=id. A real
constraint (the additive one-parameter group law), not a tautology.

## Physics-words-removable
Delete G₂/Aut/Lorentz/gauge/one-parameter-group → pure math about the banked expO/expOLin/expOEquiv
over the derived ℝ Cut + the terminal algebra O Cut + the matrix expMap (N39/N40) + derivMatrix (N41).
