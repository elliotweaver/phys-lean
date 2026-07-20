# POST-GATE EXECUTION PLAN (mirror closure, nodes N587 + N588)
# Everything here is prepared; execute in order once gate-fast (proc_227348f52af1) verdict is in.

## 0. GATE VERDICT
- If GREEN: proceed.
- If D3 prose flag: scrub flagged phrases (check MirrorRootExistence/ChainTermGrammar docstrings
  BEFORE moving them in — they already use route-not-yet-found vocabulary, but re-grep:
  grep -inE 'named bridge|asserted at grade|at[ -]grade|NOT proved here|named residual|cited residual|structural obligation|not yet closed|strategy note|smuggl' workbench/mirror-closure/*.lean
- If D6 flag: AxiomAudit lines (drafted below) must go in the SAME commit as the modules.

## 1. COMPILE ORDER (one at a time, no parallel lake)
  a. cp workbench/mirror-closure/MirrorRootExistence.lean Phys/Algebra/MirrorRootExistence.lean
     wire into Phys.lean (after MirrorFixedPoint import)
     $LAKE build Phys.Algebra.MirrorRootExistence
     RISK: `fun_prop` may not close residual_continuous. FALLBACK (pre-written):
       theorem residual_continuous : Continuous residual := by
         have h1 : Continuous fun a : Cut => a * F0 := continuous_id.mul continuous_const
         have h2 : Continuous fun a : Cut => (16/9) * kappaLeading * a^3 :=
           continuous_const.mul (continuous_pow 3)
         -- note association: ((16/9)*kappaLeading) * a^3 — if needed, rewrite with mul_assoc
         have h3 : Continuous fun a : Cut => a * F0 - (16/9) * kappaLeading * a^3 := h1.sub h2
         simpa [residual] using h3.sub continuous_const
     SECOND FALLBACK if instance resolution fails on continuous_pow:
       a^3 = a*a*a via pow_succ/pow_zero rewrite, then continuous_id.mul continuous_id ...
     LAST RESORT (fully de-risked, no topology): Lipschitz + csSup argument
       (sSup {x ∈ [aL,aR] | residual x ≤ 0} is a root: standard sup-IVT, uses banked
        completeness isLUB_csSupCut; write only if both above fail).
  b. cp workbench/mirror-closure/ChainTermGrammar.lean Phys/Algebra/ChainTermGrammar.lean
     wire into Phys.lean
     $LAKE build Phys.Algebra.ChainTermGrammar
     RISK: push_cast/ring on ℚ-cast into Cut — if push_cast stalls, use norm_cast lemmas or
     rewrite censusWeight coercion explicitly: ((2425/18 : ℚ) : Cut) = 2425/18 via Rat.cast_div etc.
     RISK: `reattest_base_exempt` import heavy — FrameAuditedCompositionReattestation is cited in
     prose only (P1 anchor); actual proof only needs recomposedEndpointDressed_normalform +
     obstructionTerm_eq + mirrorCoeff_eq. If import is slow, drop to D7DepthTwoComposed import
     and adjust the prose anchor to name the theorem without importing its module.
  c. Costumes: cp both VacuityCostume files to Counterexamples/, verify each FAILS at 1=587 / 1=588:
     $LAKE env lean Counterexamples/MirrorRootExistenceVacuityCostume.lean  (expect error ⊢ 1 = 587)
     $LAKE env lean Counterexamples/ChainTermGrammarVacuityCostume.lean     (expect error ⊢ 1 = 588)
     Append manifest rows:
       C587\tCounterexamples/MirrorRootExistenceVacuityCostume.lean\t1 = 587
       C588\tCounterexamples/ChainTermGrammarVacuityCostume.lean\t1 = 588

## 2. AXIOM AUDIT LINES (append to Audits/AxiomAudit.lean, same commit)
-- N587 MirrorRootExistence (mirror closure: the root exists — IVT over Cut)
#print axioms Phys.Algebra.MirrorFixedPoint.residual_continuous
#print axioms Phys.Algebra.MirrorFixedPoint.mirror_root_exists
#print axioms Phys.Algebra.MirrorFixedPoint.mirror_root_unique
#print axioms Phys.Algebra.MirrorFixedPoint.invAlpha_certified
#print axioms Phys.Algebra.MirrorFixedPoint.root_interior
#print axioms Phys.Algebra.MirrorFixedPoint.root_is_fixed_point
-- N588 ChainTermGrammar (mirror closure: the banked terms parse)
#print axioms Phys.Algebra.ChainTermGrammar.base_parses
#print axioms Phys.Algebra.ChainTermGrammar.running_parses
#print axioms Phys.Algebra.ChainTermGrammar.obstruction_parses
#print axioms Phys.Algebra.ChainTermGrammar.mirror_parses
#print axioms Phys.Algebra.ChainTermGrammar.endpoint_parses
#print axioms Phys.Algebra.ChainTermGrammar.base_unique_kappa_free
#print axioms Phys.Algebra.ChainTermGrammar.others_log_free
#print axioms Phys.Algebra.ChainTermGrammar.mirror_unique_alpha
#print axioms Phys.Algebra.ChainTermGrammar.parse_weights_distinct

## 3. VERIFY: /tmp/axcheck2.lean with the same #print axioms list; expect
   [propext, Classical.choice, Quot.sound] everywhere (Classical.choice via IVT — the N325 pattern).

## 4. COMMIT (before gate), then gate-fast, then LEDGER N587/N588 (drafts below), commit ledger.

## 5. LEDGER DRAFT SKELETONS
N587 — MirrorRootExistence: SUCCEEDS N586. residual continuous (banked isTopologicalRing_cut,
polynomial over derived Cut) → intermediate_value_Icc on the banked sign change → root EXISTS in
[aL,aR]; unique there (banked strictMono); invAlpha_certified: UNCONDITIONAL certified landing
1370359990777677/1e13 ≤ 1/α★ ≤ 1370359990778029/1e13. Same C6 completeness engine as cutPi (N325).
Teeth: root_interior (strict), root_is_fixed_point (named form + strictly below F0), C587 bites.
Foundations-only; Classical.choice via IVT only. NO-FIT (measured value removable prose).
N588 — ChainTermGrammar: SUCCEEDS N587. The grammar as structure + FOUR parse theorems citing
banked normal forms (base/running/obstruction/mirror), endpoint_parses (exact re-assembly),
separation theorems (unique κ-free base, unique log-carrier, unique α-carrier), distinct weights.
ROUTE-NOT-YET-FOUND declared: the legality LAWS remain anchored-not-derived (no intrinsic
term-language of the chain to quantify over yet) — the honest boundary, named successor.

## 6. CLEANUP: git rm workbench probe files (ProbeCoherence*.lean, ProbeC013.lean, ProbeImport.lean)
   — keep PREREG.md, table.json, the module sources.
