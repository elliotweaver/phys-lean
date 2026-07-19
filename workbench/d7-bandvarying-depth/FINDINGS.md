# FINDINGS — t_374df70b — FIT DETECTED in the requested band-varying-depth target

## RESUME/ORIENT
Read STANDARD, RUNBOOK, SEED_DIGITS, and the banked modules: DepthWeight, DepthTwoBandVaryingRunning,
LowTailFoldForcedWeight, D7DepthTwoComposed. Exact-rational probe: workbench/d7-bandvarying-depth/probe_*.py.

## THE EXACT-RATIONAL PICTURE (chain's own banked numbers, foundations-only)
endpoint(f) = 2425/18 + f*S,  base 2425/18 = 134.7222,  S = 1.5849658 (recomposedEndpoint at f=1).
Geometric partial sums at the FOLD-FORCED, BAND-INDEPENDENT weight w=1/3 (banked DepthWeight.depthWeight_eq):
  S1=1  S2=4/3=1.3333  S3=13/9=1.4444  S4=40/27=1.4815  Sinf=3/2=1.5 (all-orders fixed point).
Endpoints: f=1 ->136.3072 ; f=13/9 ->137.0116 ; f=40/27 ->137.0703 ; f=3/2 ->137.0997.
Measured 1/alpha(0) ~137.036 => effective f=1.4598, which sits INSIDE (S3,S4)=(1.4444,1.4815).
The FORCED all-orders 3/2 (137.0997) sits ABOVE that window.

## THE FIT (mechanical anti-bullshit gate, in writing)
The requested target = "derive a band-varying FINITE TRUNCATION of the census-in-census (some bands at
depth-3, some at depth-4) so the effective factor lands in (13/9, 40/27), all-orders 3/2 EXCLUDED."

1. TRACE FOLD->NODE, EACH ARROW FORCED?  NO. The fold forces w=1/3 (DepthWeight) and the ALL-ORDERS
   resummation kappa0/(1-w)=3/2*kappa0 (the census-in-census self-reference kappa=kappa0+w*kappa is a
   FIXED POINT with the UNIQUE solution kappa0/(1-w); banked dressedOverlap_selfref /
   bandVaryingBandScreen_selfref). A fixed point CANNOT be "terminated" at finite depth and still satisfy
   its own equation. There is NO forced arrow from the fold to "band A truncates at depth-3, band B at
   depth-4." That per-band depth assignment is CHOSEN, not forced.
2. WINDOW IS DEFINED BY THE DATA.  (S3,S4) are precisely the two consecutive geometric partial sums that
   BRACKET the measured value. The task excludes the fold's forced answer (3/2) BECAUSE it disagrees with
   137.036, and demands a finite truncation that agrees. That is the fit, stated outright.
3. CONTRADICTS BANKED FOUNDATIONS-ONLY THEOREMS.  A per-band-varying / finite-depth truncation directly
   contradicts:
     - DepthWeight.depthWeight_eq (w=1/3 band-INDEPENDENT) + the all-orders geometric closed form;
     - LowTailFoldForcedWeight (IN CHAIN): "the per-band VARYING low-tail second-depth weight COLLAPSES to
       the single fold-forced depthWeight=1/3; per-band variation is a knob the fold KILLS" and verbatim
       "THE ONLY MOTIVE FOR VARYING WEIGHTS IS TO TUNE - I.E. A FIT (FORBIDDEN)."
   Building the requested object would require OVERTURNING these banked theorems or POSITING a new
   per-band truncation rule (a second axiom). Both are forbidden without owner authority.
4. WORDS-REMOVABLE CHECK.  Delete census/depth/screening: the content is "choose per-term truncation
   orders n_b of a geometric series so the partial-sum-weighted total lands in an interval defined by an
   external measured number." The only constraint pinning n_b is hitting that interval. No fold-native
   reason survives. Fit.

## WHY THIS IS A DEFENSE OF THE THEORY, NOT A DOUBT OF IT
The constant IS derived: 137.0997, a banked theorem (D7DepthTwoComposed). The task asks me to UN-derive it
and fit it to 137.036 via a truncation knob the chain's own theorems forbid. Refusing is the ONE LAW: the
fold forces the answer; the disagreement with the measured value is either (a) the fold's standing
PREDICTION (SEED_DIGITS D7/G2 explicitly: "if the certified bracket excludes the measured value, that is a
PREDICTION the fold makes with its whole chest - state it, never bend it") or (b) a signal an EARLIER
genuinely-FORCED piece is mis-derived. It is NEVER a license for a per-band truncation knob.

## THE CONFLICT REQUIRING OWNER INPUT (fit-or-new-axiom block; the task's own permitted block)
The task's OWNER EXACTNESS STANDARD ("ledger-closed + endpoint-not-exact => a banked composition step is
WRONG; narrowing is FORBIDDEN as polishing a defect; exact or unfinished, NO disagreement-as-prediction at
coarse digits") DIRECTLY CONTRADICTS the binding SEED_DIGITS D7 standard (state the disagreement as the
fold's prediction, never bend). Together the two owner directives forbid BOTH non-fit paths:
  (A) narrow the forced 137.0997 to >=15 digits and STATE the ~0.046% disagreement as the fold's
      prediction (SEED_DIGITS-licensed, fully autonomous) -- FORBIDDEN by "narrowing = polishing a defect";
  (B) the requested band-varying truncation -- a FIT (this document).
That leaves no non-fit autonomous path => fit-or-new-axiom wall => kanban_block(needs_input).

## THE OWNER DECISION NEEDED
Pick the non-fit path:
  (A) Accept the fold-FORCED endpoint 137.0997 as the arc's landing; un-forbid the narrowing campaign;
      state the ~0.046% disagreement with measured 137.036 as the fold's standing PREDICTION
      (SEED_DIGITS D7). This EXITS the arc honestly. OR
  (B) Name a SPECIFIC earlier genuinely-FORCED contribution suspected mis-derived (a real defect hunt on
      FORCED structure -- a missing derived band/census/correction), NOT a re-truncation of the
      already-forced all-orders resummation. I will then hunt that forced piece.
I will NOT build the band-varying finite-depth truncation: it is a fit that contradicts banked theorems.
