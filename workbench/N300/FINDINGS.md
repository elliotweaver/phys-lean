N300 FINDINGS (measure-first) — the STRUCTURE of trace_H((Lmul C)|_H) and the LIGHT Lean route.

═══ MEASUREMENT (workbench/N300/probe1.py, EXIT 0) ═══
trace_H((Lmul C)|_H) = 18·rtr C EXACT (k=18, reconfirms N299), and the DECOMPOSITION is:
 · hermSub = D(3) ⊕ S₀₁(8) ⊕ S₀₂(8) ⊕ S₁₂(8), dim 27.
 · diagonal block: Lmul C sends E_ii ↦ 2c_i·E_ii + (off-block) ⟹ diag-block trace = 2·rtr C.
 · slot block S_ij: π_{S_ij}∘Lmul C∘ι_{S_ij} = SCALAR (c_i+c_j)·id₈ — MEASURED max|off-diag in-block|
   = 0.00e+00 EXACTLY (pure scalar, NO octonion table enters the trace). trace = 8(c_i+c_j).
 · total = 2Σc + 8[(c0+c1)+(c0+c2)+(c1+c2)] = 2Σc + 16Σc = 18Σc = 18·rtr C.
 · trace independent of C's OFF-diagonal (α,β,γ) — MEASURED identical. (C's off-diag maps slot→other,
   diag→slot, all OFF the trace diagonal.)
 · full arena V (dim 72): trace_V(Lmul C) = 48·rtr C (left+right-mult lever, for the record).

═══ THE LIGHT LEAN ROUTE (theory-native — NEVER compute the 27-dim trace) ═══
φ(C) := trace_H((Lmul C)|_H) is a ℚ-LINEAR functional on hermSub. Pin it by SYMMETRY, not by
basis computation:
 · φ(1) = 2·dim hermSub = 54 is BANKED (N299 dilation_hermTrace). rtr(1)=3 ⟹ if proportional, k=18≠0.
 · CONJUGATION INVARIANCE: for D Hermitian with D*D=1 (signature/permutation involutions of the
   arena), Ψ_D:X↦DXD is a ℚ-linear equiv of hermSub with Ψ_D⁻¹=Ψ_D, and
     (Lmul(DCD))|_H = Ψ_D.conj((Lmul C)|_H)  ⟹  φ(DCD)=φ(C) via LinearMap.trace_conj'.
   (algebra: DCD·X + X·DCD = D(C·DXD + DXD·C)D since D²=1; D signature ⟹ central real entries,
   associates cleanly.)
 · SIGN-FLIP kills the slots: D₁=diag(1,1,-1) ⟹ D₁ C₀₂ D₁ = -C₀₂, D₁ C₁₂ D₁ = -C₁₂;
   D₂=diag(1,-1,1) ⟹ D₂ C₀₁ D₂ = -C₀₁, D₂ C₁₂ D₂ = -C₁₂. For any slot part C_ij: φ(C_ij) =
   φ(D C_ij D) = φ(-C_ij) = -φ(C_ij) ⟹ φ(C_ij)=0. (rtr(C_ij)=0 too — consistent.)
 · PERMUTATION equates diagonals: P swap(i,j) Hermitian involution ⟹ φ(E_ii)=φ(E_jj);
   3φ(E_00)=φ(1)=54 ⟹ φ(E_ii)=18.
 · DECOMPOSE C = C_d + C₀₁ + C₀₂ + C₁₂ (FOUR pieces, matrix ext — NO 8-fold octonion-component
   expansion): φ(C) = Σc_i φ(E_ii) + Σ_slots φ(C_ij) = 18·Σc_i + 0 = 18·rtr C.  ∎
 Define ψ(C):=φ(C)-18·rtr C (linear, conj-invariant, ψ(1)=0); ψ vanishes on E_ii (perm+dilation)
 and on each slot (sign-flip); ψ(C)=Σ over the 4-piece decomposition = 0.

═══ ENDGAME (closes the childed full predicate + split) ═══
proportionality trace_H((Lmul C)|_H)=18·rtr C at C=TA (Hermitian, TA_herm) + N299
derH3_kills_hermTrace (=0) ⟹ 18·rtr(TA)=0 ⟹ rtr(TA)=0 ⟹ jTr(TA)=ocR(rtr(TA))=0 (reality bridge
herm_jTr_eq_ocR_rtr). Full ∀T∈derH3 jTr(TA)=0. Then f₄-module split L=ℚ·1⊕L₀ via the linear-trace
functional (ℚ·1 = dilation line jTr≠0; L₀ = ker(jTr on hermSub), dim 26; N297 split_iff_traceless).

═══ W9 RISK + KILL ═══
Riskiest Lean step: trace_conj' on the restricted operator (Ψ_D.conj). PROBE this FIRST (bounded).
Non-assoc caveat: Matrix (Fin 3)(Fin 3)(O ℚ) `*` is NON-associative (O ℚ non-assoc) — but D is a
signature/permutation matrix with CENTRAL real ±1·(oct 1) entries, so DXD associates; prove concrete
DCD identities entrywise (entrysimp/cdsimp, cf. Building*.lean), NOT via general cyclicity.
KILL: if the trace-conj mechanism doesn't fire cleanly in ≤2 probes, or any lemma compile >90s/OOM,
DECOMPOSE (W3): bank the conj-invariance lever + whatever is clean, child the remainder.
Budget gate: if ~60min in without the full proportionality banked, decompose and child.

═══ DE-RISK COMPLETE (ProbeN300g.lean, EXIT 0, foundations-only, 25s) ═══
The W9 crux DISSOLVED. csign s X := of(fun i j => (s_i s_j) • X_ij) — entrywise sign reweighting,
NO octonion coordinate expansion (the naive D*X*D ext TIMED OUT at 200k heartbeats; csign uses only
the banked central-scalar lemmas qsmul_mul_left/right). Banked-clean levers:
 · csign_jb: csign(jb C X)=jb(csign C)(csign X) — Jordan automorphism (s_k²=1 collapse). [FAST]
 · csign_herm, csign_invol, csignL (End), csign_mapsTo, csignR_invol, csignE (≃ₗ via ofInvolutive),
   csignE_apply, csignE_symm_apply.
 · ★ trace_csign_eq: trace_H(Lmul(csign s C)) = trace_H(Lmul C) — via LinearMap.trace_conj'.
   (the operator (Lmul(csign C))|_H = csignE.conj((Lmul C)|_H); trace conj-invariant.) 25s, [propext,
   Classical.choice, Quot.sound].
CONSEQUENCE: for a SLOT matrix C supported off-diag at (i,j), pick s flipping exactly one of i,j
⟹ csign s C = -C ⟹ trace_H(Lmul C)=trace_H(Lmul(-C))=-trace_H(Lmul C) ⟹ =0.
For DIAGONAL matrices C: csign s C = C (s_i s_i=1 on diag) — no constraint from sign; use a
PERMUTATION conj (submatrix reindex, submatrix_mul_equiv, no assoc needed) to equate φ(E_ii)=φ(E_jj),
OR compute the diagonal trace directly (it's the light 3-dim real part).

ENDGAME REMAINING: (a) decompose C = C_diag + Σ slots (matrix ext, 4 pieces); (b) φ linear;
(c) φ(slot)=0 (sign-flip); (d) φ(C_diag)=2·rtr C via perm-symmetry + φ(1)=54 banked (dilation_hermTrace),
giving φ(C)=? Actually simplest: φ(C) - 18 rtr C =: ψ(C) linear, conj-invariant; ψ=0 on slots (sign)
and on diagonal via perm+dilation. Then ψ(C)=0 by 4-piece decomposition. k=18≠0 FREE from banked
dilation_hermTrace_ne. THEN rtr(TA)=0 (18·rtr(TA)=φ(TA)=0 via derH3_kills_hermTrace) ⟹ jTr(TA)=0.
