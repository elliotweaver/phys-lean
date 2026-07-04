# N294 — PREREG (SELECT + execute)

## DECISION (fresh-context SELECT, anti-bullshit gate passed)
**N294 — THE DERIVED COLOUR GAUGE AND FAMILY-FLAVOUR su(3) ARE A COMMUTING PAIR IN f₄
(one fold-root, two orthogonal roles; the ★1↔★4 joint / f₄-arc capstone).**

The derived gauge-colour su(3) (= Der(O)-stab(u1), N201) and the derived family-flavour su(3)
(= Z_{f4}(colour) = family-so(3) ⊕ fold-root-dressed coset, N287–293) COMMUTE inside the single
derived f₄ = Der(H₃(O)), forced by ONE fact: colour kills the fold's own colour-neutral ℂ-core
span{1,u1} (N266), and the ENTIRE flavour su(3) is slot-dressed by exactly that core (real-unit
slots for family, u1-dressed slots for the coset). So colour is blind to everything flavour is
built from → colour centralizes the whole flavour su(3). The two are GENUINELY DISTINCT (a family
generator moves the diagonal colour fixes) → a non-trivial commuting pair, the derived
F₄ ⊃ SU(3)_c × SU(3)_fl (maximal rank 4), DERIVED not chosen.

## MEASUREMENTS (workbench/N294/probe_measure.py, probe2..probe11; exact-Fraction octonion + numpy, all EXIT 0)
- dim g₂=14, colour=stab_g2(u1)=8, f₄=52, family so(3)=3, flavour = Z_{f4}(colour)=8 (family ⊂ flavour).
- **Z_{f4}(flavour su(3)) = colour EXACTLY** (dim 8, rank(union)=8, each colour ∈ it to 2e-15) — the
  MUTUAL CENTRALIZER / rigidity (childed; needs f₄-coordinate handle).
- colour ⊕ flavour disjoint dim 16; rank(gauge ∪ flavour)=22 (flavour ⊓ jActL(g2)=0); rank 4 = rank F₄.
- colour centralizes ALL 6 flavour generators {famA,B,C, kAB,BC,CA} (max|[colour,·]|=1.1e-15) — via
  colour killing span{1,u1} (D1=0 AND Du1=0, N201/N266).
- colour is BLOCK-DIAGONAL in the generation index (preserves each slot); flavour MIXES slots.
- flavour ⊄ colour: famC moves Dg(0,1,0) (≠0) while colour fixes ALL diagonals (jAct_Dg=0, ~1e-52). W8.
- Cartan reading: family = ANTISYMMETRIC generation rotations (θ-even), coset = SYMMETRIC couplings (θ-odd).

## SCOPE (banked-lever, W9-free, forward, non-vacuous)
BANK:
1. `colour_centralizes_famA/B/C` — for D ∈ colourCentralizer, ⁅jActL D, famX⁆ = 0
   (fam_gauge_central + isDerivQ_of_mem; colour ⊆ gauge, family is gauge-CENTRAL).
2. `colour_centralizes_kAB/kBC/kCA` — re-exposed from coupling_colour_neutral /
   cosetBC/CA_colour_neutral (the coset is colour-neutral, N291/292).
3. THE ONE-CAUSE lever `colour_kills_foldcomplex_core` — colour kills span{1,u1} (D1=0 via
   derivQ_one + Du1=0 via commutes_JO_iff/mem_colourCentralizer), so the colour-neutrality of the
   WHOLE flavour su(3) is ONE fact = N266's colour-neutral core.
4. W8 DISTINCTNESS `flavour_not_subset_colour` — famC moves Dg(0,1,0)≠0, colour fixes it (jAct_Dg).
5. capstone `colour_flavour_commuting_pair` — colour centralizes the 6 flavour generators ∧
   flavour ⊄ colour ∧ cap-forced (jordan_fails_H4). ONE fold-root u1, two orthogonal roles
   (colour = stab(u1) block-diagonal fibre; flavour = u1-dressing generation-mixing).

CHILD (the ONE successor, a directed W1 route-finder):
  the MUTUAL-CENTRALIZER RIGIDITY `Z_{f4}(flavour) = colour` (measured 2e-15) + the bundled
  flavourLie LieSubalgebra (dim 8) + colour⊕flavour direct-sum dim count — all need an f₄
  coordinate/basis handle not yet banked (the 52-dim exhaustion / generation-module decomposition).

NOT banked: the mutual-centralizer exhaustion (childed); the mixing-angle VALUE (★2, route-not-yet-found);
the ★5 mass texture VALUE (needs spectrum-BREAKING beyond f₄ — N269 all of f₄ preserves the spectrum);
"= physical SU(3)_c × SU(3)_flavour GUT" (removable prose).

## COSTUME
C322... check next id. Bites at the distinctness / commuting: e.g.
`((famC (Dg 0 1 0)) ...)` nonzero while colour fixes — a WRONG reading (colour and flavour are the
same / flavour ⊆ colour / they don't commute) reduces to a false numeric.

## FILE
Phys/Algebra/OctonionJordanColourFlavourCommutingPair.lean (ns Phys.Algebra.HJ)
