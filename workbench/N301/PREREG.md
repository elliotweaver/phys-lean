# N301 PREREG — THE FAMILY-SO(3) ROTATION OF THE MASS-TEXTURE MODULE (mass-splitting ↔ mixing, isospectral)

## TARGET (theory-native, S4-passed, W9-free — routes through just-banked N296/N297/N300)
The derived FAMILY so(3) (gauge-neutral inner derivations famA/famB/famC ∈ f₄=derH3, N288/289)
acts on the derived mass-texture module L₀ = {Lmul A} (N295, the spectrum-movers) by the N296
equivariance `⁅T, Lmul A⁆ B = Lmul (T A) B`, and this action ROTATES the DIAGONAL mass-splitting
sector (Lmul(Dg t), N297) into the OFF-DIAGONAL generation-mixing sector (Lmul(slotC v)) as ONE
family orbit, fixing the f₄-central dilation (Lmul 1). The rotation is ISOSPECTRAL: the family
generator preserves the linear + quadratic spectral invariants (rtr, rtr∘(·²)) because famC ∈ derH3
kills the trace (N300) and the trace form is invariant (N298).

All measured EXACT (workbench/N301/probe{1..5}.py, exact-Fraction octonion + numpy, 0.00e+00):
 · famC(Dg t0 t1 t2) = slotC((t2−t1)•1)                      [N274 innerMul_slot_diag at a=b=1]
 · famC(slotC c)     = Dg 0 (2·reQ c) (−2·reQ c)             [traceless — back to the diagonal sector]
 · famC(slotA a)=−slotB a, famC(slotB b)=slotA b             [banked famC_slotA/famC_slotB]
 · ⁅famC, Lmul(Dg t0 t1 t2)⁆ B = Lmul(slotC((t2−t1)•1)) B    [N296 equivariance + above]
 · ⁅famC, Lmul(slotC c)⁆ B     = Lmul(Dg 0 (2reQ c)(−2reQ c)) B
 · ⁅famC, Lmul 1⁆ B = 0                                       [famC kills 1 — N297 dilation_fixed]
 · rtr(famC A)=0 (Hermitian A)          [N300 derH3_kills_jTr via reality bridge; famC∈derH3]
 · rtr(A·(famC A))=0 = ½ rtr(famC(A·A))  [Leibniz hT.2 + rtr cyclicity + N300 on A·A Hermitian]

## THE OBJECTS (production: Phys/Algebra/OctonionJordanFamilyMassMixingOrbit.lean, ns Phys.Algebra.HJ)
Let fC := innerMul (slotA (1:O ℚ)) (slotB 1) = famC.  Levers ALL banked:
  · famC_mem_derH3 (N288), famC_slotA/famC_slotB (N288), innerMul_slot_diag (N274),
    slotC_sub/one_smul, spectrum_sector_equivariance (N296), Lmul/Lmul_apply/Lmul_one (N274),
    slotA/slotB/slotC_one_herm, Dg-herm (need Dg_herm_gen for real diag), derH3_kills_jTr (N300),
    rtr/rtr_add/rtr_mul_comm/herm_jTr_eq_ocR_rtr (N298), jb_herm (N285).

PLANNED THEOREMS (each a short rewrite over banked lemmas — no octonion coordinate expansion):
 A. `Dg_herm_gen (t0 t1 t2) : (Dg t0 t1 t2)ᴴ = Dg t0 t1 t2`      [generalize Dg_herm; central real diag]
 B. `famC_Dg (t0 t1 t2) : fC (Dg t0 t1 t2) = slotC ((t2−t1) • 1)` [innerMul_slot_diag, a=b=1, star_one,mul_one]
 C. `famC_slotC (c) : fC (slotC c) = Dg 0 (2·reQ c) (−2·reQ c)`   [measured; via jb-slot products — may need probe]
 D. ★ `family_rotates_split_to_mix B (hB) : ⁅fC, Lmul (Dg t0 t1 t2)⁆ B = Lmul (slotC ((t2−t1)•1)) B`
        [spectrum_sector_equivariance fC famC_mem_derH3 (Dg_herm_gen) hB ▸ famC_Dg]
 E. ★ `family_rotates_mix_to_split B (hB) : ⁅fC, Lmul (slotC c)⁆ B = Lmul (Dg 0 (2reQc)(−2reQc)) B`
        [equivariance + famC_slotC + slotC_one_herm]
 F. `family_fixes_dilation B (hB) : ⁅fC, Lmul 1⁆ B = 0`          [dilation_fixed fC famC_mem_derH3 hB (N297)]
 G. ★ `family_kills_linear_spectral (hA : Aᴴ=A) : rtr (fC A) = 0`  [derH3_kills_jTr famC_mem_derH3 hA + reQ; = rtr]
 H. ★ `family_kills_quadratic_spectral (hA : Aᴴ=A) : rtr (A * fC A) = 0`
        [fC(A*A) hermitian: rtr(fC(A*A))=0 (G-style on A*A herm); Leibniz-for-* : fC(A*A)=fC A*A+A*fC A?
         NB: fC is a Jordan derivation of jb, NOT of matrix `*`. Use the JORDAN route:
         rtr(A*fC A) route — MEASURE which identity closes: probe4 used A∘TA = ½ jb(A,TA) and
         2 rtr(A∘TA)=rtr(fC(A∘A)). So state via jb: `rtr (jb A (fC A)) = 0` using the derH3 Leibniz
         hT.2 (fC(jb A A)=jb (fC A) A + jb A (fC A) = 2 jb A (fC A) by jb_comm) + rtr(fC(jb A A))=0
         (G on jb A A hermitian). CLEANER — use jb not `*`.]
        REVISED H: `family_kills_quadratic_spectral (hA:Aᴴ=A) : rtr (jb A (fC A)) = 0`
 I. W8 non-vacuity: `family_rotates_split_to_mix_ne : ⁅fC, Lmul (Dg 0 1 (-1))⁆ 1 ≠ 0`  [entry (1,2)=... ≠0]
    and `famC_Dg_ne` / `split_to_mix` genuinely nonzero.
 J. capstone `family_mass_mixing_orbit_structure` bundling D,E,F,G,H,I + jordan_fails_H4 (N5) in TYPE.

## COST BUDGET / KILL (W9 discipline)
- Every theorem is a SHORT rewrite over banked lemmas; NO octonion coordinate `decide`, NO
  `native_decide`, NO `maxHeartbeats` raise. Expected olean LIGHT (~10-20s, like N296/N297/N299).
- KILL: if ANY single theorem needs >200k heartbeats or a coordinate `ext` over the 8-dim octonion
  table, STOP — that is the W9 signature; re-route through the banked slot-product lemmas (jb_slotX_slotY)
  or child a W9 sub-node. (famC_slotC (C) is the only measured-but-not-yet-banked identity — de-risk it
  FIRST in a bounded probe; if it fights, drop C/E from scope and keep the split→mix direction D + G/H.)
- Isospectrality SCOPE: bank the LINEAR (G) + QUADRATIC (H) spectral-invariant preservation ONLY (both
  route cleanly through N300 + Leibniz). The CUBIC (jN preserved ⟹ full isospectrality) needs the
  cubic power-Leibniz — NOT claimed; childed if wanted. Never overclaim "eigenvalues=masses".

## COSTUME C330 (must BITE: a wrong value fails to compile)
Anchor on the rotation coefficient: e.g. `((⁅fC, Lmul (Dg 0 0 1)⁆ 1) 1 2).re.re.re = 2` (TRUE) vs a
BOGUS `= 330`. Confirm the TRUE anchor compiles and only the BOGUS bites at `⊢ 2 = 330`. Manifest row.

## STANDARD CHECK (pre-commit)
UNBROKEN (all levers banked N274/285/288/296/297/298/300, Mathlib as machinery) · COMPLETE
(foundations-only, no sorry/axiom/native_decide/maxHeartbeats; audit vs built olean) · WORDS-REMOVABLE
(pure operator/matrix algebra survives deleting mass/mixing/family/generation) · NOT free-floating
(every TYPE cites banked fC/Lmul/derH3/Dg/slotC/rtr on Matrix (Fin 3)(Fin 3)(O ℚ); capstone carries
jordan_fails_H4) · ANTI-VACUITY (C330 bites; W8 nonzero rotation).

## Advances ★5 (mass texture — the mass-splitting↔mixing family orbit + isospectrality) ↔ ★2 (mixing).
