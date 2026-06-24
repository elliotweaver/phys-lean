# N20 — FINDINGS (the trunk reframe of the 21→14 cut + anti-circling record)

## W6 RE-VERIFICATION (this run, workbench/N20-g2-exact/recon.py)
EXACT-RATIONAL faithful model: Leibniz ℚ-system rank 50 / nullity 14 ⟹
dim_ℚ Der(O ℚ) = 14. Generation: e3=e1·e2, e5=e1·e4, e6=e2·e4, e7=(e1·e2)·e4=e3·e4.
Associator (e1,e2,e4) = (e1e2)e4 − e1(e2e4) = 2·e7 ≠ 0 (the non-associativity).

## ★ THE TRUNK REFRAME OF THE 21→14 CUT (the key structural insight)
The determination map ρ: D ↦ (D e1, D e2, D e4) is INJECTIVE on Der (measured: nullity 0
when those three are killed) ⟹ Der ↪ Im³ (= 21-dim). The image is cut to 14 by EXACTLY
7 constraints (recon2.py — cokernel of the 14×21 image matrix). The reframe:

  6 of the 7 are SKEW-SYMMETRY of the Born form = so(7), ALREADY BANKED (N17):
    C0: (De1).c1 = 0           ⟵ deriv_norm_preserve at e1 (diag, e1²=−1)
    C2: (De2).c2 = 0           ⟵ deriv_norm_preserve at e2
    C6: (De4).c4 = 0           ⟵ deriv_norm_preserve at e4
    C1: (De1).c2 + (De2).c1=0  ⟵ deriv_skew_polar at (e1,e2), real part
    C3: (De1).c4 + (De4).c1=0  ⟵ deriv_skew_polar at (e1,e4), real part
    C4: (De2).c4 + (De4).c2=0  ⟵ deriv_skew_polar at (e2,e4), real part

  1 is GENUINELY OCTONIONIC — the actual g₂ content, the cut so(7)≠Der:
    C5: (De1).c6 − (De2).c5 + (De4).c3 = 0
        = ⟨De1, e2e4⟩ − ⟨De2, e1e4⟩ + ⟨De4, e1e2⟩ = 0
        (invariance of the associative 3-form φ(x,y,z)=⟨x,yz⟩ under D).
        SOURCE: the double-bracketing consistency of e7 = e3·e4 = −e1·e6, i.e. the
        associator (e1,e2,e4)=2e7 ≠ 0. This is the ONE place skew (so(7), 21) is not
        enough — skew alone gives 21, Leibniz gives 14, the gap is C5.

THE UPPER-BOUND ARCHITECTURE (pivot read-off → injective → finrank ≤ 14):
  14 PIVOT (free) coords that determine D: De1.{c2,c3,c4,c5,c6,c7}, De2.{c3,c4,c5,c6,c7},
  De4.{c5,c6,c7}. Map ρ14: derivationQ →ₗ (Fin 14 → ℚ) reading these. INJECTIVE:
  ρ14 D = 0 ⟹ (14 pivots = 0) + C0..C6 ⟹ De1=De2=De4=0 (all coords) ⟹ (determination)
  D = 0. Then finrank derivationQ ≤ finrank (Fin 14 → ℚ) = 14, ∧ banked ≥14 ⟹ = 14.

  De1: c0=0 (trace-free), c1=0 (C0), c2..c7=0 (pivots) ⟹ De1=0.
  De2: c0=0, c1=0 (C1+De1.c2=0), c2=0 (C2), c3..c7=0 (pivots) ⟹ De2=0.
  De4: c0=0, c1=0 (C3+De1.c4=0), c2=0 (C4+De2.c4=0), c3=0 (C5+pivots=0), c4=0 (C6),
       c5..c7=0 (pivots) ⟹ De4=0.

## DETERMINATION LEMMA (the injectivity backbone)
IsDerivQ D → D e1 = 0 → D e2 = 0 → D e4 = 0 → D = 0. PURE LEIBNIZ:
  D e0 = D 1 = 0 (deriv_one ℚ); D e3 = De1·e2+e1·De2 = 0; D e5 = De1·e4+e1·De4 = 0;
  D e6 = De2·e4+e2·De4 = 0; D e7 = De3·e4+e3·De4 = 0; then x = Σ cᵢ(x)•eᵢ ⟹ Dx=0.

## W9 ANTI-CIRCLING (carried from N16–N19, still binding)
- Do NOT `decide`/`ring` a 512×64 ℚ-rank; do NOT inflate maxHeartbeats. Brute kernel
  MEASURED DEAD (N16). The cut is STRUCTURAL: 6 banked skew + 1 octonionic C5.
- s5 measurement (N19): a single octonion-product coordinate Leibniz `ext<;>simp<;>ring`
  elaborates ~8s default heartbeats. Per-coordinate extraction is bounded & cheap.

## VALIDATED LEAN PATTERNS (scratch s1–s4, all ≤7s default heartbeats)
1. determination (s2): clean ~7s. D 1=0 via `add_left_cancel`; generated De3,De5,De6,De7
   via Leibniz+rw; basis_decomp via ext<;>simp; final map_add/map_smul collapse.
2. trace-free bridge (s4): `IsDerivQ D → IsDeriv (D.restrictScalars ℤ)` (defeq fun a b=>hD a b),
   then banked `deriv_reQ_zero` ⟹ `(D x).re.re.re = 0`. KEY: bridges IsDerivQ to ALL banked
   N16/N17/N18 lemmas.
3. constraint extraction (s3 C0, s4 C1): apply hD at basis pair, rw the multiplication
   value + known-zero generators + trace-free, `congrArg coord`, `simp only [unfold + CD/Dbl
   re/im/star/neg/zero]`, then `ring_nf at hc; linarith [hc]`. Do NOT use `show` (folding
   mismatch); ring_nf normalizes *0/*1; linarith closes. ~6s each.

## ★★ THE FINAL CLEAN CASCADE (recon6.py) — no standalone octonionic lemma needed
Injectivity of ρ14 (14 pivots=0) cascades via c0-coords (trace-free) of Leibniz instances:
  De1: De1.c1=0 ←(e1,e1)c0: De0.c0−2De1.c1=0 (De0=0); +pivots De1.c2..c7 ⟹ De1=0.
  De2: De2.c2=0 ←(e2,e2)c0; De2.c1=0 ←(e1,e2)c0: −De1.c2−De2.c1−De3.c0=0 (pivot+tracefree);
       +pivots ⟹ De2=0.
  De4: needs De3=0 first (De3=D(e1e2), De1=De2=0 ⟹ De3=0). Then
       De4.c4=0 ←(e4,e4)c0; De4.c1=0 ←(e1,e4)c0; De4.c2=0 ←(e2,e4)c0;
       De4.c3=0 ←(e3,e4)c0: −De3.c4−De4.c3−De7.c0=0 (De3=0 ⟹ De3.c4=0, tracefree De7.c0=0);
       +pivots De4.c5,c6,c7 ⟹ De4=0.
  Then `determined` ⟹ D=0.  The octonionic content = the e3·e4=e7 relation, FULLY STRUCTURAL.
