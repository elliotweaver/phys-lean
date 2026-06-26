#!/usr/bin/env python3
# Replace the old "N77 FORWARD FRONTIER" block (the bullet starting at line 3211,
# "★ (FORWARD FRONTIER — the immediate next node, N77) THE FULL n-DIM SPECTRAL EXISTENCE")
# and ending just before the "- then the remaining gauge/flavour/spacetime nodes" line,
# with an N77 LANDED retrospective + an N78 forward frontier.
import io

path = "docs/ROADMAP.md"
with io.open(path, "r", encoding="utf-8") as f:
    lines = f.readlines()

# Find the start: the bullet line for the N77 forward frontier.
start = None
for i, ln in enumerate(lines):
    if "FORWARD FRONTIER \u2014 the immediate next node, N77" in ln:
        start = i
        break
assert start is not None, "could not find N77 forward-frontier bullet"

# Find the end: the "- then the remaining gauge/flavour/spacetime nodes" line.
end = None
for i in range(start, len(lines)):
    if lines[i].lstrip().startswith("- then the remaining gauge/flavour/spacetime nodes"):
        end = i
        break
assert end is not None, "could not find the 'then the remaining ...' tail line"

retro_and_frontier = (
    "  - **\u2605 N77 LANDED RETROSPECTIVE \u2014 THE DERIVED \u211d `Cut` IS A REAL CLOSED FIELD: the GENERAL\n"
    "    odd-degree root engine + `IsRealClosed Cut` + the general ODD-dimensional eigen-seed, over the\n"
    "    DERIVED \u211d `Cut` and the terminal algebra `O Cut` (`Phys/Algebra/LorentzContinuumRealClosed.lean`,\n"
    "    8 decls foundations-only [propext, Classical.choice, Quot.sound], independently axiom-audited\n"
    "    against the built olean; gate D0\u2013D6 GREEN, costume C108 `7 = 12`; W6 verify-then-finalize of a\n"
    "    prior run that committed the production + costume + wiring + PREREG but timed out mid-D6).** THE\n"
    "    GAP this node closed: N75 banked the root engine ONLY at degree 3 (`cut_cubic_has_root`, the monic\n"
    "    CUBIC); N76 banked the eigen-seed ONLY at dimension 3 (`dim3_has_eigenvector`). The genuine\n"
    "    obstruction to the FULL `STVC` existence is that `STVC` is 10-dim (EVEN), so an endomorphism's\n"
    "    characteristic polynomial has EVEN degree 10 \u2014 neither N75's cubic engine nor N76's dim-3 seed\n"
    "    can root/seed it; under deflation the effective dimension descends `10 \u2192 9 \u2192 8 \u2192 \u2026` and the\n"
    "    ODD rungs each need a guaranteed eigenpair from a GENERAL odd-degree root engine. THE REFRAME (THE\n"
    "    ONE LAW): the general odd-degree root is NOT a Cardano/Sturm grind and NOT a new posit \u2014 it\n"
    "    DISSOLVES through the SAME `intermediate_value_Icc` engine that built N57 `cutSqrt` (degree 2) and\n"
    "    N75 `cut_cubic_has_root` (degree 3), escalated to ARBITRARY odd degree: the Cauchy bound\n"
    "    `s = (\u2211_{i<n} |coeff i|)+1` makes `f(s) \u2265 0` (dominance, `cutPoly_eval_upper_nonneg`), the odd\n"
    "    reflection `(\u2212s)^n = \u2212(s^n)` (`Odd.neg_pow`) makes `f(\u2212s) \u2264 0` (`cutPoly_eval_lower_nonpos`),\n"
    "    and IVT crosses the bracketed sign change at `0` (`cut_odd_degree_has_root`). BANKED: the two\n"
    "    Cauchy-dominance halves; \u2605\u2605 `cut_odd_degree_has_root` (EVERY monic ODD-`natDegree` polynomial\n"
    "    over `Cut` has a root); `cut_isSquare_of_nonneg` (every nonneg is a square, from N57 `cutSqrt`);\n"
    "    `cut_exists_root_of_odd` (every odd-degree polynomial has a root, normalizing by the leading\n"
    "    coefficient); \u2605\u2605\u2605 the HEADLINE `cut_isRealClosed` (`IsRealClosed Cut` \u2014 the DERIVED \u211d `Cut`\n"
    "    IS A REAL CLOSED FIELD, via Mathlib's `IsRealClosed.of_linearOrderedField` from squares-of-\n"
    "    nonnegatives + odd-degree roots \u2014 the algebraic characterization of the real continuum, DERIVED);\n"
    "    `cut_odd_real_root` (NON-VACUITY: the quintic `x\u2075\u2212x` has a root over `Cut`); and \u2605\n"
    "    `dim_odd_has_eigenvector` (every endomorphism of an ODD-`finrank` `Cut`-vector space has a NONZERO\n"
    "    eigenvector \u2014 generalizing N76 `dim3_has_eigenvector` from dimension 3 to EVERY odd dimension, the\n"
    "    re-seeding lever for the odd rungs of the deflation cascade). DERIVED entirely from the order-\n"
    "    completeness the continuum was BUILT with (N33\u2013N37) + N57 `cutSqrt`, via the SAME\n"
    "    `intermediate_value_Icc` engine. `IsRealClosed`, `of_linearOrderedField`, `intermediate_value_Icc`,\n"
    "    the eigenspace machinery are standard MACHINERY on the DERIVED objects (STANDARD \u00a73). NO Cardano\n"
    "    radicals, NO Sturm chains, NO `import Mathlib.Data.Real`/`Complex` as content (the field IS the\n"
    "    DERIVED `Cut`), NO posited field, NO posited Lorentz group. Costume C108\n"
    "    (`LorentzContinuumRealClosedWrongRootCostume`) bites a WRONG eigenvalue read off a genuine\n"
    "    eigen-equation on the ODD-dimensional space `Fin 5 \u2192 Cut` \u2014 `(7 \u2022 id) e0` has `0`-th coordinate\n"
    "    `7`; a bogus claim it were `12` forces `7 = 12` (distinct from C84 `8=4`, \u2026, C106 `8=27`, C107\n"
    "    `6=13`). Words-removable: delete \"Lorentz/spectral/eigen*/seed/re-seed/dimension/rank/Spin/SO(9)/\n"
    "    KAK/polar/Cartan/isometry/real-closed-as-physics\" \u2192 over the derived complete ordered field `Cut`,\n"
    "    every nonneg is a square, every odd-degree polynomial has a root, `Cut` is a real closed field, and\n"
    "    every endomorphism of an odd-finite-dim `Cut`-space has a nonzero `v` with `T v = \u03bb \u2022 v`; pure\n"
    "    math. W3 DECOMPOSE: the full existence + the deflation re-seeding + the GLOBAL polar/KAK assembly +\n"
    "    connectedness + the GLOBAL reverse KAK surjectivity + the full `Spin(9)\u2192SO(9)` exhaustion is\n"
    "    childed N78.\n"
    "\n"
    "  - **\u2605 (FORWARD FRONTIER \u2014 the immediate next node, N78) THE FULL n-DIM SPECTRAL EXISTENCE \u2014\n"
    "    assembling the COMPLETED seed eigenpair (N75 eigenvalue \u00d7 N76 eigenvector) + the now-GENERAL\n"
    "    odd-dimensional re-seeding lever (N77 `dim_odd_has_eigenvector`) + the N74 GENERAL ITERATED DESCENT\n"
    "    into `\u2200 g, \u2203 c u, g = specOpN c u` (every EvC-self-adjoint operator IS a sum of scaled\n"
    "    EvC-orthogonal eigenprojections) + THE GLOBAL POLAR/KAK ASSEMBLY FOR AN ARBITRARY ISOMETRY +\n"
    "    CONNECTEDNESS + THE GLOBAL REVERSE KAK SURJECTIVITY (`qvIsomMonoidC` on the connected component\n"
    "    `\u2264 genIsomMonoidC2`) + the full `Spin(9)\u2192SO(9)` exhaustion, childed from N77.** N49\u2013N77 banked,\n"
    "    over the derived \u211d `Cut`: BOTH one-parameter generator families (`boostOPS`, `rotGenSetC`), the\n"
    "    TWO-SIDED Moufang/`Spin(9)` generator `biMulFun u u'`, the EXTENDED generated group `genIsomMonoidC2`\n"
    "    with FORWARD soundness (N55), the BORN POSITIVITY / (1,9) signature (N56), the SCALAR square root\n"
    "    `cutSqrt` (N57), the INFINITESIMAL CARTAN split `EvC` (N58), the OPERATOR form-adjoint (N59), the\n"
    "    operator square roots (N60\u2013N65), the concrete polar factorization (N66), the rank-`n` spectral\n"
    "    operator `specOpN` (N67\u2013N68), the witness `txMix` (N69), the DEFLATION engine `deflateC` (N70), the\n"
    "    SEED EIGENPAIR EXTRACTION `specOpN_eigen` (N71), the CONSTRUCTED octonion-coupling seed (N72), the\n"
    "    FIRST CLOSED descent (N73), the GENERAL ITERATED DEFLATION DESCENT `deflateList`/`specOpN_full_descent`\n"
    "    (N74), the ODD-DEGREE ROOT ENGINE `cutCbrt`/`cut_cubic_has_root` (N75), the EIGENVECTOR half\n"
    "    `dim3_has_eigenvector`/`stvc_eigenvector_of_charpoly_root` (N76), AND NOW (N77) the GENERAL\n"
    "    odd-degree root `cut_odd_degree_has_root`, the real-closed-field identification `cut_isRealClosed`,\n"
    "    and the GENERAL odd-dimensional re-seeding lever `dim_odd_has_eigenvector`. THE HEAVY CORE that\n"
    "    remains \u2014 the genuine group-manifold work \u2014 is: (i) the DEFLATION RE-SEEDING ASSEMBLED INTO THE\n"
    "    FULL existence `\u2200 g, \u2203 c u, g = specOpN c u` \u2014 the seed produces ONE eigenpair `(\u03bb, v)`; N70\n"
    "    `deflateC` peels it, leaving an EvC-self-adjoint operator on the EvC-orthogonal complement; recursion\n"
    "    on dimension \u2014 each ODD rung re-seeded by N77 `dim_odd_has_eigenvector`, the EVEN rungs reached by\n"
    "    one more peel \u2014 drives the N74 iterated descent to the zero operator, so `g` IS `\u2211\u1d62 \u03bb\u1d62 \u2022 projC u\u1d62`\n"
    "    (the deep remaining joint: turning N77's per-odd-dimension re-seed + N74's iterated descent into the\n"
    "    closed induction on the full `STVC`, threading the EvC-orthogonal-complement finrank bookkeeping);\n"
    "    (ii) the GLOBAL polar/KAK assembly: every `g \u2208 qvIsomMonoidC` factors as `k\u00b7exp(p)` via the operator\n"
    "    square root of `g*g`, then `k = g\u00b7exp(p)\u207b\u00b9` with `k*\u2218k = id`; (iii) the compact part `k` via\n"
    "    CONNECTEDNESS of the isometry group over `Cut`; (iv) the GLOBAL reverse KAK surjectivity; (v) the\n"
    "    full `Spin(9)\u2192SO(9)` exhaustion. Mathlib has NO `SO\u207a(1,9)`, no octonionic spinor cover, no\n"
    "    Lie-group integration over `Cut`. MEASURE FIRST + reframe through the trunk \u2014 the\n"
    "    immediately-bankable sub-pieces to MEASURE FIRST: (i) the DEFLATION RE-SEEDING INDUCTION on the\n"
    "    deflated operator's invariant EvC-orthogonal complement (the finrank of the complement drops by one\n"
    "    at each peel; the re-seed lever is N77 `dim_odd_has_eigenvector` at the odd rungs / one extra peel at\n"
    "    the even rungs), (ii) the full existence assembled once the re-seeding closes, (iii) a CONCRETE\n"
    "    `biMulFun` 2-plane `SO(9)` reachability, (iv) the GLOBAL polar assembly once the n-dim existence is\n"
    "    in hand. If the full existence / re-seeding induction / global polar assembly / reverse surjectivity\n"
    "    / connectedness genuinely RESISTS after measure + reframe it is an HONEST W1 dissolution ticket +\n"
    "    block, decompose into the immediately-bankable structural piece + child the global remainder. The\n"
    "    costume must bite a WRONG existence / re-seeding / reachability / surjectivity / exhaustion claim. NO\n"
    "    posited Lorentz group, NO Mathlib \u211d/\u2102 as content \u2014 DERIVE from the banked N49\u2013N77 + the derived\n"
    "    \u211d `Cut` + the terminal algebra `O Cut`.\n"
)

new_lines = lines[:start] + [retro_and_frontier] + lines[end:]
with io.open(path, "w", encoding="utf-8") as f:
    f.writelines(new_lines)

print("Replaced N77 forward-frontier block [lines %d..%d] with N77 retrospective + N78 frontier." % (start + 1, end))
print("New total lines:", len(new_lines))
