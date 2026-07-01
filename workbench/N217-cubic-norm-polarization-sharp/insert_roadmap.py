import io

path = "docs/ROADMAP.md"
with open(path, "r", encoding="utf-8") as f:
    lines = f.readlines()

# Find the line index of the "§N216 LANDED" bullet
anchor = None
for i, ln in enumerate(lines):
    if "★ §N216 LANDED (THE COMPLETED INVARIANT TOWER" in ln:
        anchor = i
        break
assert anchor is not None, "anchor not found"

block = '''  - **★ §N217 LANDED (THE FIRST POLARIZATION OF THE CUBIC NORM on J₃(O) — the first polar `jNpolar`
    (the Freudenthal SHARP trace-pairing) + the cubic polarization identity from which the sharp/adjoint
    map descends WITHOUT any octonion matrix square, the named-ascent forward step 6 for the hypercharge
    front).** N216 childed N217 with the §N216-superseded frontier's front (a): the Freudenthal
    sharp/adjoint, now buildable from the completed tower. THE MEASURE-FIRST VERDICT (frozen in PREREG):
    front (a) chosen in its LIGHTEST genuinely-new NON-MECHANICAL form — the FIRST POLARIZATION of the
    cubic norm (the algebraic identity from which the sharp map + the whole Freudenthal cross-product
    structure descend, WITHOUT any octonion 3×3 matrix square or power-associativity machinery). Rejected
    sub-forms MEASURED and set aside: trace(A#)=jS standalone (MECHANICAL, W8); the full matrix sharp
    (A#)#=jN·A (needs octonion matrix squares — W9 crime-scene risk, DEFERRED to a genuine next node); the
    diagonal Cayley–Hamilton (mechanical from jN_shift). Front (b) forced-isospin still posit-risk (NAMED
    still-deferred, NOT silently deferred a 12th time). A W9-instructive de-risk: probe1 revealed a hidden
    `sorryAx` from a wrongly-attributed `qMod` smul instance (the banked gForm/reQ smul lemmas use
    `dblModuleQ cdModuleQ`); RESOLVED by matching instances + the single new fact
    `star_qsmul : star (c•w) = c•star w` — after which the polarization closes clean foundations-only
    ~8.4s (the trilinear reQ product distributes through add_mul/mul_add/qsmul_mul_left/right +
    reQ_add/reQ_smul, the gForm cross-pairs canonicalized by `gForm_symm`, then `ring`). NO octonion
    coordinate ring. Banked (7 decls, `Phys/Algebra/OctonionJordanSharpPolar.lean`, foundations-only,
    7/7 vs the built olean; gate D0–D6 GREEN target; costume C249 `= 217`): `star_qsmul` (the star–smul
    commutation); `jNpolar D0 D1 D2 A B C E0 E1 E2 P Q R` (the first polar — quadratic in the first
    Hermitian argument, linear in the second, whose value is the trace-pairing ⟨A#,B⟩ of the Freudenthal
    sharp); ⭐⭐⭐ `jN_polarize`: `jN (d0+s·e0)(d1+s·e1)(d2+s·e2) (a+s•p)(b+s•q)(c+s•r) = jN A
    + s·jNpolar A B + s²·jNpolar B A + s³·jN B` (the cubic polarization identity — the sharp map FORCED
    as the linear coefficient of the derived cubic norm's own polarization); `jNpolar_one_dir`
    (`jNpolar A 1 = jS A`, the polar in the identity direction is the middle invariant e₂ — the tie back
    to N216's completed tower); `jNpolar_diag` (the sharp of a diagonal is its cofactor diagonal); W8
    teeth `jNpolar_cross_witness` (`jNpolar 0 0 0 1 1 1 0 0 0 1 1 1 = 6`, the pure mixed trilinear
    cross-pairing — a cofactor-diagonal-only reading would give 0) + `jNpolar_cross_witness_ne` (≠ 0).
    THE MOAT: the division-algebra-physics field POSITS `J₃(O)`, POSITS its sharp/adjoint map, and reads
    the Freudenthal cross product off by hand; here the carrier was DERIVED (N5), the cubic norm from
    N215, and the first polar — the algebraic seed of the sharp — is DERIVED as the linear coefficient of
    the norm's own polarization. Production + Phys.lean/AxiomAudit wiring + costume C249 + manifest +
    PREREG/probe/w6-audit committed `92b2391` (bank-as-you-go, BEFORE the gate ceremony); gate D0–D6
    (running in background). [built→landing] Childed N218.

  - **★ §N217-superseded FORWARD FRONTIER (specify against what the chain ACTUALLY produced).**
    N217 banked the FIRST POLAR of the cubic norm `jNpolar` (the Freudenthal sharp trace-pairing) and the
    cubic polarization identity `jN (A + s·B) = jN A + s·jNpolar A B + s²·jNpolar B A + s³·jN B`. The
    sharp map's algebraic seed is banked (the quadratic map `A ↦ A#` whose trace-pairing against `B` is
    `jNpolar A B`), tied back to the completed tower by `jNpolar A 1 = jS = e₂`. ⚠ THE HONEST ASCENT
    VERDICT (RUNBOOK W1 repeated-deferral rule): the sharp trace-pairing is now banked, but NONE of
    N214–N217 yet posits a specific hypercharge `Y`. The FORCED isospin `T₃` direction inside the
    trace-zero plane (whose trace-form-orthogonal complement is `Y`) is STILL the deferred rung. THE
    MISSING STRUCTURAL FACT, named precisely: a banked fact that BREAKS the S₃ frame symmetry to
    distinguish which idempotent-difference `E0−E1`/`E1−E2`/`E0−E2` is `T₃` WITHOUT a convention — the
    ascent must build a structure that supplies such a distinguished sub-frame. NO 12th silent defer; the
    next node keeps building FORCED structure toward that named supplier. ⚠ Do NOT re-pin: the first
    polar / polarization identity just banked (N217); the completed invariant tower / char poly (N216);
    the cubic norm + its well-definedness (N215); the trace form / Cartan–Killing metric / charge plane =
    `(ℚ·1)^⊥` (N214); the full weight diagram / trace-zero collapse (N213); the single-slot forced weight
    (N212); the `J₃(O)` carrier / Jordan product / order-3 identity / n≥4 cap (N5); the cross-product
    Gram contraction / exchange identity (N211); the calibration pair φ/ψ (N209/N210); the cross product
    (N206–N208); the Jacobiator (N205); the colour centralizer (N201) / meet (N202) / non-normalization
    (N203); the weak-isospin Gram matrix (N204); any single gauge factor / rung / branching (N42/N184–
    N197); any face of the `(1,9)` determinant form (N43/N198/N199); the sedenion alternativity loss
    (N200). ⚠ front (i) THE FORCED GENERIC CASCADE-STOP iff is ALREADY CLOSED (`ForcedStop.lean`).
    ⚠ the gauge↔spacetime joint G₂⊂SO(8)⊂SO⁺(1,9) is ALREADY BANKED (N138). The next node MUST be a
    genuinely NEW structural step. MEASURE the smallest obligation of each BEFORE committing (W9; W4.5
    look WIDEST): candidate NEXT steps of the named ascent —
    **(a)** THE FULL MATRIX FREUDENTHAL SHARP `A#` and the ADJUGATE identity `(A#)# = jN·A` (or
    `A# × A = jN·1`) — the sharp as an honest `J₃(O)`-valued map (not just its trace-pairing), the
    genuine next node the polar is the seed of. ⚠ MEASURE the octonion 3×3 matrix square cost FIRST
    (W9 crime-scene risk); scope the smallest bankable piece (e.g. `A#` on the diagonal Cartan is the
    cofactor diagonal `diag(d1 d2, d0 d2, d0 d1)`, whose trace is `e₂` = jS — likely LIGHT through the
    banked tower) and child the off-diagonal / the full adjugate as a W3 remainder if the coordinate
    square measures heavy; REFRAME through the banked `jNpolar`/`Dg`/`Xz`/`jb` algebra, NOT a monolithic
    coordinate ring. **(b)** THE PEIRCE DECOMPOSITION of `J₃(O)` w.r.t. a frame idempotent `E0` (the
    eigenspace split `A = A₁ ⊕ A_{1/2} ⊕ A₀` of `A ↦ jb E0 A` with eigenvalues 1, ½, 0) — the candidate
    FRAME-SYMMETRY-BREAKING supplier for the forced isospin `T₃`; MEASURE the smallest bankable piece
    (the Peirce projector / an eigenspace membership lemma). **(c)** THE FORCED ISOSPIN `T₃` inside the
    charge plane — the deferred rung; a FORCED (not posited) split; ⚠ the DANGER remains a POSIT unless
    FORCED by a banked structural fact (a sub-frame idempotent from (b), the sharp from (a), a root
    vector); if it still needs a posit, NAME the missing fact and child a route-finding node — do NOT
    defer a 12th time silently. **(d)** a genuinely DIFFERENT physics joint entirely (generation/family
    count, a mixing face) if the `J₃(O)` ascent measures heavy. ⚠⚠ If a front measures as heavy /
    re-pin / vacuous / a juxtaposition / a mechanical consequence of banked facts (N5/N42/N184–N217) or
    trivial associativity / alternativity / Leibniz, look WIDER (W8). NO posited Jordan algebra / Peirce /
    Cartan / weight / root / trace-form / Killing / cubic-norm / Freudenthal / sharp / adjoint / `J₃(O)` /
    exceptional / `su(3)` / `su(2)` / `u(1)` / Lie-algebra / cross-product / calibration / `G₂` /
    normalization-convention as content, NO Mathlib ℝ/ℂ as content — DERIVE from the banked N5–N217 +
    the derived `ℚ`/`ℝ` `Cut` + the Cayley–Dickson tower `Dbl ℚ ⊂ H ℚ ⊂ O ℚ ⊂ S ℚ` + the `J₃(O)`
    carrier + the first polar / polarization identity (N217) + the completed invariant tower + char poly
    (N216) + the cubic norm + well-definedness (N215) + the forced Cartan–Killing metric / charge plane =
    `(ℚ·1)^⊥` (N214) + the full weight diagram / trace-zero charge hyperplane (N213) + the single-slot
    forced weight (N212) + the cross-product Gram contraction (N211) + the calibration pair φ/ψ
    (N209/N210) + the cross product (N206–N208) + the colour centralizer = su(3) (N201) + the
    colour∩isospin meet = u(1) (N202) + the weak-isospin Gram matrix (N204) + the gauge-rep arc
    (N184–N197) + the FORCED cascade-stop iff (`ForcedStop.lean`) + the inner-derivation engine (N6).

'''

lines.insert(anchor, block)
with open(path, "w", encoding="utf-8") as f:
    f.writelines(lines)
print("inserted N217 LANDED + frontier at line", anchor + 1)
