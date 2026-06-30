# N189 PREREG — THE ISOSPIN BRANCHING OF THE 7 (the singlet drops out)

## Front chosen (W4.5 measure-first across the 4 fronts)
Front (ii): the rep-theoretic branching of the `7` of `g₂` (banked `ImO`, N22) under the
embedded weak-isospin `su(2) = ⟨innerDeriv hI/J/K⟩` (N187). MEASURED LIGHT + GENUINE.

## What the measurement found (probe1, probe2 — both foundations-only)
The inner derivations act COMPONENTWISE on `O ℚ = ⟨H,H⟩` (banked `innerDeriv_apply`:
`innerDeriv q ⟨a,b⟩ = ⟨ad_q a, ad_q b⟩`). So:
- the doubling unit `e₄ := κO 1 = ⟨0,1⟩` is a NONZERO vector of the 7 (`kappaO_one_mem_ImO`,
  `kappaO_one_ne_zero`, `kappaO_one_coord` = 1) that is ANNIHILATED by EVERY inner derivation
  `innerDeriv q` (`innerDeriv_kappaO_one`) — in particular by the whole embedded su(2). It is
  the SINGLET of the branching.
- yet the FULL g₂ has NO 1-dim invariant subspace inside `ImO` (banked N25
  `no_one_dim_invariant_ImO`), so SOME g₂-derivation MOVES the singlet line
  (`g2_moves_singletLine`).
Joint reading: `7` is g₂-IRREDUCIBLE but su(2)-REDUCIBLE — the singlet drops out of the 7
when the algebra is restricted from g₂ to the embedded su(2). This is the
representation-theoretic branching the field reads off by hand; here it is DERIVED, joining
N187 (the embedding) to N25 (the irreducibility). NOT a re-pin of any dimension, NOT a
re-statement of either rung of the tower, NOT a juxtaposition.

## GO / NO-GO
GO: bank (a) the singlet `κO 1` ∈ ImO, nonzero, fixed by every inner derivation; (b) the
contrast `g2_moves_singletLine` (g₂ moves the singlet line — su(2)-invariant but not
g₂-invariant); (c) W8 nonzero witness. All measured clean + foundations-only.

NO-GO / KILL: if any production lemma needs `maxHeartbeats` raised above default, or a single
tactic burns > 90s, STOP — that is a W9 instrument wall; decompose. (Measured: full set 9.7s,
well under.) If the branching collapses to a re-pin of a banked fact (it does not — the
g₂-moves-singlet contrast is NEW content joining N187+N25), REJECT and look wider.

## Costume (C221) — anti-vacuity
The singlet's witnessing coordinate `(κO 1).im.re.re` GENUINELY equals `1`
(`kappaO_one_coord`). A wrong reading (the singlet is the zero vector / not fixed / has a
trivial coordinate) forces the false numeric `1 = 189` over ℚ. DISTINCT from the battery
(C218 1=186, C219 4=187, C220 2=188): value `1 = 189`.

## Physics-words-removable
Delete colour/isospin/7/g₂/su(2)/singlet/branching/rep: what remains is pure algebra — for
the Cayley–Dickson double `O ℚ = CD (H ℚ)`, the second-coordinate unit `⟨0,1⟩` lies in the
imaginary subspace `ker(star+1)`, is nonzero, and is annihilated by every inner derivation
`innerDeriv q ⟨a,b⟩ = ⟨ad_q a, ad_q b⟩` (because `ad_q 1 = 0`); yet the span of `⟨0,1⟩` is
not invariant under all Leibniz-derivations of `O ℚ` (banked `no_one_dim_invariant_ImO`).
No theorem statement needs a physics word.
