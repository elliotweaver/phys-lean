# N217 PREREG — frozen GO/NO-GO + KILL before compute

## Context / resume
Fresh run (run 452, no prior N217 runs, no inherited N217 WIP). Chain tail = N216
(OctonionJordanInvariantTower.lean, the completed invariant tower e1,e2,e3 + generic
char/minimal polynomial jN_shift/jN_charpoly). N217 is the single childed forward residual.

## FIRST ACT — frontier specified against what the chain ACTUALLY produced
Re-read §N216-superseded FORWARD FRONTIER. Candidate fronts:
 (a) THE FREUDENTHAL SHARP / ADJOINT A# — named next ascent step, buildable from the tower.
 (b) FORCED ISOSPIN T3 inside charge plane — DANGER: still risks a POSIT (which idempotent-
     difference is T3 by hand). Legitimate only if FORCED by a banked structural fact.
 (c) PEIRCE decomposition w.r.t. a frame idempotent — candidate sub-frame supplier for (b).
 (d) a genuinely DIFFERENT physics joint.

## MEASURE-FIRST verdict (W9)
Front (a) chosen, in its LIGHTEST genuinely-new NON-MECHANICAL form: **THE FIRST
POLARIZATION OF THE CUBIC NORM** — the algebraic identity from which the sharp map and the
whole Freudenthal cross-product structure descend, WITHOUT any octonion matrix square
(which would be W9-heavy and would need power-associativity infra).

Rejected sub-forms of (a):
 - trace(A#) = jS as a standalone: MECHANICAL (sum of the defined cofactor diagonals = e2 by
   construction = ring). W8 reject.
 - the full matrix sharp identity (A#)# = jN·A: needs octonion 3x3 matrix squares +
   power-associativity — W9 crime-scene risk. DEFER as a W3 remainder child if reached.
 - the diagonal Cayley-Hamilton: diagonal-only, mechanical from jN_shift. W8 reject.

Rejected (b): still posit-risk (the honest ascent verdict, unchanged from N214/N215/N216).
Named as still-deferred; NOT silently deferred a 12th time (see handoff).

## THE TARGET (genuinely-new, forced, LIGHT-if-linearity-banked, non-vacuous)
Define the FIRST POLAR jNpolar (bilinear-ish: quadratic in first Hermitian arg, linear in
second) and prove the CUBIC POLARIZATION IDENTITY:
    jN (d0+s*e0)(d1+s*e1)(d2+s*e2) (a+s•p)(b+s•q)(c+s•r)
      = jN d0 d1 d2 a b c
        + s   * jNpolar d0 d1 d2 a b c  e0 e1 e2 p q r
        + s^2 * jNpolar e0 e1 e2 p q r  d0 d1 d2 a b c
        + s^3 * jN e0 e1 e2 p q r
The three coefficients ARE: jN(A), the sharp trace-pairing ⟨A#,B⟩ = first polar, its mirror
⟨A,B#⟩, and jN(B). The Freudenthal quadratic sharp map emerges as the polar of the derived
cubic norm — no posited sharp, no octonion matrix square.

jNpolar (D0 D1 D2 : ℚ)(A B C : O ℚ)(E0 E1 E2 : ℚ)(P Q R : O ℚ) : ℚ :=
  E0*D1*D2 + D0*E1*D2 + D0*D1*E2
  − E0*gForm C C − 2*D0*gForm C R
  − E1*gForm B B − 2*D1*gForm B Q
  − E2*gForm A A − 2*D2*gForm A P
  + 2*(reQ ((A*C)*star Q) + reQ ((A*R)*star B) + reQ ((P*C)*star B))

(worked out by hand: s^1 coeff of jN(A+sB); s^2 coeff verified = jNpolar with args swapped,
all three octonion cross-terms match under a↔p,b↔q,c↔r — see notes.)

Companion light lemmas (genuinely tie the polar to the invariant tower):
 - jNpolar_one_dir : jNpolar d0 d1 d2 a b c 1 1 1 0 0 0 = jS d0 d1 d2 a b c
     (the polar in the IDENTITY direction B=1 recovers the middle invariant e2=jS — the
      uniform-shift specialization, consistent with jN_shift's t-linear coefficient). This is
      the structural bridge from the new sharp-pairing back to N216's completed tower.
 - jNpolar_diag : jNpolar on pure diagonal (a=b=c=0,p=q=r=0) = e0 d1 d2 + d0 e1 d2 + d0 d1 e2
     (the sharp of a diagonal is the cofactor diagonal, paired with B's diagonal).

## W8 anti-vacuity teeth (costume C249, DISTINCT pair, match `= 217`)
 - jNpolar_witness : a concrete jNpolar value ≠ its bogus reading; pick numbers giving a
   value V distinct from the banked battery. Costume forces V = 217.
 - jNpolar_one_dir gives jS in the identity direction — non-vacuous tie to N216.
Must confirm the polar GENUINELY depends on the octonion cross-terms (not diagonal-only):
witness with a nonzero off-diagonal so a cross reQ term contributes.

## GO / NO-GO
GO iff probe1 closes the polarization identity foundations-only via banked linearity + ring,
NO octonion coordinate ring, default (or ≤400000) heartbeats. If the reQ trilinear expansion
does NOT normalize into the 8 canonical reQ atoms cheaply → decompose (bank jNpolar + the
diagonal/identity-direction specializations first; child the full cross identity), OR if it
resists → reframe / W1 dissolution child. NO weakening, NO posited sharp.

## KILL
Any single obligation > 120s or > 400000 heartbeats ⇒ instrument wall (W9): stop, measure the
smallest sub-obligation, decompose. Do NOT inflate heartbeats and wait. Do NOT bulk-retry a
blown-up route. Bank-as-you-go: the instant jNpolar + any specialization compiles clean →
production + wire + commit BEFORE chasing the full cubic identity.

## Physics-words-removable
Delete sharp/adjoint/Freudenthal/cubic-norm/Jordan/cofactor/polar/invariant/Cartan/eigenvalue:
what remains is a pure ℚ-polynomial identity over the derived rung O ℚ = CD(H ℚ) — the cubic
form jN, shifted by s in all six parameters, expands as a monic-in-nothing cubic in s whose
coefficients are jN(A), jNpolar(A,B), jNpolar(B,A), jN(B). No theorem statement needs a
physics word.
