# N292 PREREG — THE FAMILY-BREAKING COSET CLOSES INTO THE FAMILY SYMMETRY (the su(3)/so(3) symmetric pair)

## TARGET (theory-native, SELECTed via docs/NODE_SELECTION.md S1–S4, anti-bullshit gate passed IN FULL)
The derived colour-centralizer inside the derived f₄ — `Z_{f4}(colour)` — is a SIMPLE su(3) whose
maximal compact is the banked family so(3) (N288/N289) and whose fold-root-DRESSED complement (the
coset) closes BACK into the family: the family-symmetry-BREAKING coset members (u1-dressings of the
family generators, N291's Mc among them) satisfy the su(3)/so(3) symmetric-pair relation

    ⁅kAB, kBC⁆ = famB,   ⁅kBC, kCA⁆ = famC,   ⁅kCA, kAB⁆ = −famA   (cyclic, closing into family so(3))

where kAB := innerMul (slotA u1)(slotB 1) [= N291's Mc], kBC := innerMul (slotB u1)(slotC 1),
kCA := innerMul (slotC u1)(slotA 1), and famA/famB/famC are the banked family generators
innerMul(slotB 1)(slotC 1) / innerMul(slotC 1)(slotA 1) / innerMul(slotA 1)(slotB 1) (N288/N289).

This PLACES N291's Mc in its forced algebraic home and UNIFIES N287 (the measured-but-unbanked
"second su(3)" = Z_{f4}(colour)), N288/289 (family so(3)), N290 (its blindness), N291 (Mc).

## WHY THIS NODE (S2/S3/S4 recorded in the comment thread, comments 210–214)
- GOAL LENS: after building the family symmetry + its breaking object (N291), the fold's beat is
  HOW breaking relates to symmetry — the measured answer: the breaking coset CLOSES back into the
  family. The family-breaking is the "square-root" of the family generators (su(3)/so(3) symmetric pair).
- REFRAMING LENS: the field POSITS F₄ ⊃ SU(3)_c × SU(3)_F + CHOOSES the SU(3)_F → SO(3) breaking; the
  theory DERIVES SU(3)_F = Z_{f4}(colour) and its breaking-to-so(3) = the FOLD-ROOT u1 dressing.
- Repeated-deferral rail: NOT reaching for the ★2 mixing VALUE. BUILDS richer derived structure.

## MEASURED (workbench/N292-select/, exact-Fraction octonion + numpy, all EXIT 0)
- Z_{f4}(colour) = dim 8, bracket-closed (res 5.6e-16), Killing all-negative ⇒ compact simple su(3).
- = family-so(3)[3] ⊕ fold-root-dressed coset[5] (rank union 8; family ⊂ Z_c).
- coset members = u1-dressed family gens: kAB ∈ derH3 (probe_route.lean EXIT 0), colour-neutral (N291).
- CLOSURE (full-operator identity, residual 0.0 over 72-dim, NOT just Hermitian): ⁅kAB,kBC⁆=famB cyclic.
- ROUTE (banked-lever/slot-lemma, NO coordinate bash), the Jacobi-derivation chain:
    ⁅kAB,kBC⁆ = ⁅kAB, ⁅Lmul(slotB u1), Lmul(slotC 1)⁆⁆
              = ⁅⁅kAB,Lmul(slotB u1)⁆, Lmul(slotC 1)⁆ + ⁅Lmul(slotB u1), ⁅kAB,Lmul(slotC 1)⁆⁆  (Jacobi)
    with ⁅kAB, Lmul(slotB u1)⁆ = Lmul(kAB·(slotB u1)) = Lmul(−slotA 1)  (specific mixed Leibniz, res 0.0),
         ⁅kAB, Lmul(slotC 1)⁆ = Lmul(kAB·(slotC 1)) = Lmul(0) = 0,
    ⇒ ⁅kAB,kBC⁆ = innerMul(−slotA 1)(slotC 1) = −innerMul(slotA 1)(slotC 1) = innerMul(slotC 1)(slotA 1) = famB.
  And kAB·(slotB u1) = −slotA 1 is a fixed chain of banked jb-slot lemmas:
    jb(slotB 1)(slotB u1) = 0  [same-slot],
    jb(slotA u1)(slotB u1) = slotC(star u1 * u1) = slotC(u1²·(−1)... ) = slotC 1  [jb_slotA_slotB, star u1=−u1, (−u1)*u1=−u1²=1],
    jb(slotB 1)(jb(slotA u1)(slotB u1)) = jb(slotB 1)(slotC 1) = slotA(1*star 1) = slotA 1  [jb_slotB_slotC].
  ⚠ NOTE: kAB is NOT a general full-op jb-derivation (1392/5184 Leibniz failures on non-Herm args);
  the specific mixed Leibniz holds only for the SPECIFIC slot inputs — proven directly, not via a
  general derivation lemma. So the route computes ⁅kAB, Lmul(slotX)⁆ = Lmul(kAB·slotX) case-by-case
  by LinearMap.ext + the innerMul_apply/jb-slot reductions.

## DELIVERABLES (Phys/Algebra/OctonionJordanColourCentralizerSu3.lean, ns Phys.Algebra.HJ)
- coupling members kBC, kCA ∈ derH3 (innerMul_mem_derH3 + Xz_herm) — the three coset generators.
- kAB_slotB_u1 : kAB·(slotB u1) = −slotA 1 (the slot-chain reduction); + kAB_slotC_one : kAB·(slotC 1)=0.
- ★★ coset_mixed_leibniz_B : ⁅kAB, Lmul (slotB u1)⁆ = Lmul (−slotA 1)  (LinearMap.ext + reductions).
- ★★ coset_mixed_leibniz_C : ⁅kAB, Lmul (slotC 1)⁆ = 0.
- ★★★ cosetAB_BC_closure : ⁅kAB, kBC⁆ = famB (via Jacobi + the two mixed Leibniz + innerMul_antisymm).
- (if tractable) the other two cyclic closures cosetBC_CA, cosetCA_AB.
- colour-neutrality of each coset member (reuse N291 coupling_colour_neutral pattern).
- W8: famB ≠ 0 (banked) / the closure genuinely lands on a nonzero family generator; coset ⊄ family.
- capstone: the three coset members ∈ derH3 ∧ colour-neutral ∧ the cyclic closure into family ∧
  jordan_fails_H4 in TYPE.

## SCOPE (honest)
Bank: the su(3)/so(3) symmetric-pair closure (coset brackets → banked family generators) + coset
membership + colour-neutrality + non-vacuity. NOT the full 8-dim su(3) as a bundled LieSubalgebra
(the diagonal-coset directions dAA/dBB close too but add heavier brackets — optional hardening /
childed follow-up); NOT the (7,5) module character; NOT the ★2 mixing VALUE (route-not-yet-found,
FORCED build target); NOT "= physical SU(3)_flavour" (removable prose).

## COST BUDGET / KILL (W9)
Whole olean target < ~30s. Each closure bracket is a LinearMap.ext + fixed banked rewrites; if ANY
single mixed-Leibniz operator lemma exceeds a bounded probe (measure first in scratch), DECOMPOSE
(prove kAB·slotX reductions as separate banked lemmas) or reduce scope to ONE cyclic closure +
child the rest. NO octonion coordinate ring, NO native_decide, NO maxHeartbeats proof-kernel raise
beyond the banked precedent (synthInstance only if needed). If the closure fights → it is the wrong
framing (THE ONE LAW); the measured route is residual-0, so grind is not expected.

## COSTUME
C321 — a WRONG reading (the coset is abelian / does NOT close into family / Z_c is not su(3) /
the family-breaking is orthogonal to the symmetry) reduces through the banked closure to a false
numeric 1 = 321.
