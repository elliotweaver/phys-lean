import io

path = "/Users/elliotweaver/phys-lean/docs/ROADMAP.md"
with open(path, encoding="utf-8") as f:
    lines = f.readlines()

# Find the line index of the N206 LANDED header
anchor = "  - **\u2605 \u00a7N206 LANDED (THE 7-DIMENSIONAL CROSS PRODUCT ON Im(O \u211a)"
idx = None
for i, ln in enumerate(lines):
    if ln.startswith(anchor):
        idx = i
        break
assert idx is not None, "anchor not found"

block = """  - **\u2605 \u00a7N207 LANDED (DERIVATION-INVARIANCE OF THE 7-DIMENSIONAL CROSS PRODUCT \u2014 the two faces
    of the exceptional structure share ONE symmetry algebra g\u2082).** N206 childed N207 to a genuinely
    DIFFERENT physics joint (W4.5 look WIDEST). THE MEASURE-FIRST VERDICT (frozen in PREREG): front
    (a) HYPERCHARGE NORMALIZATION rejected AGAIN (no convention-free `Y` anchor inside rank-2 `g\u2082`;
    risks a posited convention, THE ONE LAW). Front (b) \u2014 CHOSEN: the AUTOMORPHISM relation between
    the cross product (N206) and the derivation algebra `g\u2082 = Der(O \u211a)` (N16\u2013N21). \u2605 MEASURED as
    GENUINELY NEW (not a mechanical Leibniz restatement): every Leibniz derivation `D` of the octonion
    product is SIMULTANEOUSLY a derivation of the banked cross product `octCross` \u2014
    `D (octCross x y) = octCross (D x) y + octCross x (D y)` (`octCross_deriv_leibniz`). The
    non-mechanical content: `octCross x y = x\u00b7y + (gForm x y)\u20221` carries a metric CORRECTION term,
    and reassembling `octCross (D x) y + octCross x (D y)` produces the extra correction
    `(gForm (D x) y + gForm x (D y))\u20221` which vanishes ONLY because every derivation is SKEW-ADJOINT
    for the Born form (`gFormQ_skew`, N24/N26). So the invariance is the JUNCTION of TWO distinct
    banked invariances \u2014 the MULTIPLICATIVE Leibniz law (N16) AND the METRIC skew-adjointness (N24)
    \u2014 combined into one; were `D` not skew-adjoint the identity would be FALSE. THE CONNECTION:
    `derivationLieQ_octCross_leibniz` lifts this to every element of the banked Lie algebra
    `derivationLieQ = g\u2082` \u2014 the two faces of the exceptional structure (the bilinear product N205 and
    the antisymmetric vector product N206) share the SAME infinitesimal symmetry algebra `g\u2082`, the
    very `g\u2082` the gauge arc (colour SU(3) N42, isospin SU(2) N187) is built inside. W8 NON-VACUITY:
    `octCross_deriv_witness_coord` (`(D0E (octCross u1 u2)).im.re.re = \u22121`, the banked nullbasis
    derivation `D0E` genuinely MOVES the cross product) \u27f9 `octCross_deriv_witness_ne_zero`
    (`D0E (octCross u1 u2) \u2260 0`). 5 decls in `Phys/Algebra/OctonionCrossProductDerivation.lean`,
    foundations-only `[propext, Classical.choice, Quot.sound]` (axiom-audited 5/5 vs the built olean).
    Costume C239 (`1 = 207`): the witness coordinate GENUINELY equals `\u22121`; the wrong claim that the
    derivation fixes the cross product forces `\u22121 = 207`, exit 1 (bites). Gate D0\u2013D6 (running bg).
    STANDARD applied (unbroken / complete / words-removable). [built\u2192landing] Childed N208.

  - **\u2605 \u00a7N207-superseded FORWARD FRONTIER (specify against what the chain ACTUALLY produced).**
    N207 banked DERIVATION-INVARIANCE OF THE 7-DIM CROSS PRODUCT \u2014 every `D \u2208 derivationLieQ = g\u2082`
    is a derivation of `octCross`, so the product (N205), the vector product (N206) and the
    derivation Lie algebra (N16\u2013N21) share ONE symmetry algebra `g\u2082`, forced through the Born
    skew-adjointness `gFormQ_skew` (N24). \u26a0 Do NOT re-pin: the cross-product derivation-invariance
    just banked (N207); the cross product / Lagrange identity (N206); the Jacobiator / non-Lie
    commutator (N205); the trace-form Gram matrix (N204); the colour centralizer (N201); the
    colour\u2229isospin meet (N202); the colour-non-normalization (N203); any single gauge factor / rung /
    branching (N42/N184\u2013N197); any face of the `(1,9)` determinant form (N43/N198/N199 SUFFICIENT);
    the sedenion alternativity loss (N200); the alternating associator (N5b); the trace form /
    semisimplicity on the whole algebra (N23/N24); the quadratic minimal polynomial `octo_quadratic`.
    \u26a0 front (i) THE FORCED GENERIC CASCADE-STOP iff is ALREADY CLOSED (`Phys/Cascade/ForcedStop.lean`)
    \u2014 do NOT re-attack. \u26a0 the gauge\u2194spacetime joint G\u2082\u2282SO(8)\u2282SO\u207a(1,9) is ALREADY BANKED (N138) \u2014
    do NOT re-pin. The next node MUST be a genuinely DIFFERENT physics joint (W4.5 look WIDEST).
    MEASURE the smallest obligation of each BEFORE committing (W9): candidate fronts \u2014 **(a)**
    HYPERCHARGE NORMALIZATION (`Q=T\u2083+Y/2`) REMAINS the named-but-repeatedly-deferred front
    (N201\u2013N207); needs a DERIVED convention-free `Y` anchor inside the rank-2 `g\u2082`, NOT yet banked;
    if attempted, be RUTHLESS about rejecting a posited normalization (W8/THE ONE LAW). **(b)** the
    CONTRACTION / VECTOR-TRIPLE-PRODUCT identity for `octCross` (`x \u00d7 (x \u00d7 y) = ...`, connecting the
    cross product N206 to alternativity N5b) \u2014 MEASURE whether it is a genuine new norm/contraction
    relation or a mechanical consequence of `octo_quadratic` + the Lagrange identity. **(c)** the
    JACOBI-type / Malcev identity FOR THE CROSS PRODUCT itself (`octCross` satisfies a Malcev-like
    identity, distinct from the N205 full-algebra commutator) \u2014 MEASURE non-vacuity. **(d)** a
    genuinely DIFFERENT unbanked physics joint entirely (W4.5: look WIDEST). \u26a0\u26a0 If a front measures
    as heavy / re-pin / vacuous / a juxtaposition / a mechanical consequence of banked facts
    (N42/N184\u2013N207) or trivial associativity, look WIDER (W8). NO posited light-cone / causal / Witt /
    Lorentz / Pin / Spin / gauge group / alternative-algebra / composition-algebra / `su(3)` / `su(2)` /
    `u(1)` / Clifford / Killing-form / Lie-algebra / Malcev / cross-product / vector-product / `G\u2082` /
    normalization-convention as content, NO Mathlib \u211d/\u2102 as content \u2014 DERIVE from the banked N49\u2013N207 +
    the derived `\u211a`/`\u211d` `Cut` + the Cayley\u2013Dickson tower `Dbl \u211a \u2282 H \u211a \u2282 O \u211a \u2282 S \u211a` + the cross
    product / Lagrange identity (N206) + its derivation-invariance (N207) + the `(1,9)` determinant
    form (N43/N198/N199) + the sedenion alternativity loss (N200) + the colour centralizer = su(3)
    (N201) + the colour\u2229isospin meet = u(1) (N202) + the colour-non-normalization (N203) + the
    weak-isospin Gram matrix `\u221216\u2022I\u2083` (N204) + the non-Lie commutator / Jacobiator = 6\u00b7assoc (N205) +
    the invariant trace form / semisimplicity (N23/N24) + the FORCED cascade-stop iff
    (`ForcedStop.lean`, BANKED) + the chirality block (N44) + the Jordan cap (N5) + the alternative
    laws / associator (`Alternative.lean`) + the \"one cause\" web + the gauge-rep arc (N184\u2013N197) +
    the colour branching (N42a/b/c) + the inner-derivation engine (N6).

"""

lines[idx:idx] = [block]
with open(path, "w", encoding="utf-8") as f:
    f.writelines(lines)
print("inserted N207 block before N206 LANDED at line", idx + 1)
