# PREREG — REVERSE-PROVENANCE SWEEP (auditor deep item 2) — recon lane, frozen
Date: 2026-08-08. Head: 3f4629e0. NO repo modification. Deliverable = SWEEP-REPORT.md.

## THE QUESTION
The repo's audit pattern is production → later audit module imports it and refines/corrects.
Because the import arrow points backward, an audit's correction can sit banked but OUTSIDE
the production dependency graph (the base-gem case proved this happens). Find EVERY such
case across the alpha production ancestry.

## METHOD
1. ROOT SET: the transitive import closure of Phys/Algebra/MirrorFixedPoint.lean +
   Phys/Algebra/AlphaLandingFinal.lean (the alpha production ancestors). Build it
   mechanically: parse `import Phys.` lines recursively (python, os.walk; the repo is
   C:/Users/ellio/phys-lean). Everything else in Phys/ is 'non-ancestor'.
2. NAVIGATION SCAN (names are navigation, never evidence): grep the WHOLE repo for
   modules whose names or theorem names match: corrected|overcount|rederived|reattest|
   audit|discharged|resolved|recomposition|activeSpan|active_span|seam|double.?count|
   one_cause|superseded|defect|drop|lockstep. Collect every (module, theorem) hit.
3. FOR EACH HIT, classify by READING THE THEOREM STATEMENTS (not docstrings):
   (a) does it prove a REPLACEMENT/REFINEMENT of a value/def used by an ancestor module?
       (e.g. proves X = v' where an ancestor computes with X = v, or proves an ancestor's
       def decomposes with a corrected component)
   (b) if yes: is the corrected form IN the production graph (do any ancestors import it
       or restate its result)? → status: INTEGRATED / UNRECONCILED / SUPERSEDED-BY(name)
   (c) if intentionally non-production (exploration, killed branch): is there a banked
       theorem showing it does NOT alter the endpoint, or only prose? → status:
       EXEMPT-BY-THEOREM(name) / EXEMPT-BY-PROSE-ONLY (the dangerous kind)
4. KNOWN CASE (calibration): BaseNormalFormAudit/PerEdgeCensusRederived vs
   D7DepthTwoComposed must come out UNRECONCILED — if your method doesn't flag it,
   the method is broken; fix the method before trusting other results.
5. Also sweep the OTHER direction: production values with NO later audit coverage at all
   (never re-derived ab initio) — list them as UNAUDITED (not wrong, just never checked).

## REPORT FORMAT (SWEEP-REPORT.md)
Table: module | theorem(s) | what it corrects/refines | production consumer | status
(INTEGRATED / UNRECONCILED / EXEMPT-BY-THEOREM / EXEMPT-BY-PROSE-ONLY / UNAUDITED) |
endpoint-relevant? (does the value feed F0/the landing) | exact size of the discrepancy
if computable (Fractions).
Then: a ranked list of UNRECONCILED + EXEMPT-BY-PROSE-ONLY items by endpoint impact.
Then: a self-check — confirm the calibration case was found; list modules too ambiguous
to classify with the specific question that would disambiguate each.

## HARD RULES
NO-FIT: the measured value adjudicates nothing. Theorems bind; docstrings orient.
Exact rationals (python Fraction) for any arithmetic. NO repo file modified; work dir
C:/Users/ellio/phys-lean/workbench/reverse-provenance/ (create it).


## RE-DISPATCH ADDENDUM (first sweep agent timed out; its ARTIFACTS SURVIVE — USE THEM)
In workbench/reverse-provenance/ you already have: build_closure.py + closure.txt (the
production import closure), edges.json (import graph), non_ancestors.txt, nav_scan.py +
nav_hits.json (navigation-term hits), hits_statements.txt (extracted statements around
hits), read_hits.py, trace.py (path/importer tracer — usage: python trace.py <Module>).
DO NOT REBUILD ANY OF THESE. Steps: (1) FIRST write SWEEP-REPORT.md skeleton (sections +
the calibration row marked pending) — within your first 2 tool calls; (2) classify the
hits in nav_hits.json/hits_statements.txt using trace.py to check production-graph
membership (closure.txt = the ancestor set); (3) calibration check (base-gem must come
out UNRECONCILED); (4) fill the report incrementally as you go — save after EVERY
classification batch, never hold results in memory only. Budget ~9 minutes: if running
short, mark remaining rows PENDING-with-question rather than leaving the file thin.
Known findings from the first agent's trail worth verifying and including: EdgeLogArgAudit
(N576) header says the dissolved summand IS the active-span 40/27 form — check whether
EdgeLogArgAudit is in the production closure and which form the production consumes;
PerEdgeCensusRederived freezeoutActive_summand_dissolved (corrected weights 3, 10/3, 5/3)
vs ComposedFreezeoutDissolved freezeout_summand_dissolved (old weights 7/3, 11/3, 5/3) —
the SECOND known-unreconciled candidate pair beyond the base gem.
