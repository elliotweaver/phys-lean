# N286 FINDINGS — the route is DE-RISKED, W9 DISSOLVED

## THE MEASURED IDENTITY (probe_route.py, exact Fraction octonion arithmetic, 0/200 general)
  d(A,B,X,Y) := innerMul A B (jb X Y) − jb (innerMul A B X) Y − jb X (innerMul A B Y)
              = ½·PolJ(B,X,Y;A) − ½·PolJ(A,X,Y;B)
  PolJ(u,v,w;t) = jdef(u+v+w,t) − jdef(u+v,t) − jdef(u+w,t) − jdef(v+w,t)
                  + jdef(u,t) + jdef(v,t) + jdef(w,t)

## FREENESS (the W9 dissolver)
- probe_freealg.py: d and combo are EQUAL as formal elements of the FREE non-assoc non-comm
  ℚ-algebra on {A,B,X,Y}. LHS 48 monomials, RHS 48, diff 0. Integer form `d + d = combo` also
  formal (diff 0).
- probe_free.py: identity holds over NON-ALTERNATIVE sedenions CD(O) (0/12). ⟹ FREE NonAssocRing
  identity ⟹ Lean-provable by `simp only [jb,jdef,mul_add,add_mul,mul_sub,sub_mul]; abel`, ZERO
  octonion coordinate expansion. The 16min/9GB brute wall NEVER enters.

## LEAN PROBES — BOTH GREEN
- probe_abel.lean: the abstract integer identity `2•d = PolJ(B,X,Y;A) − PolJ(A,X,Y;B)` (spelled
  via jb/jdef) closes by `simp only [jb,jdef,distrib]; abel` in ~22s (import baseline ~25s so abel
  itself is light). EXIT 0.
- probe_recon3.lean: `self_adjoint_ocR : star z = z → z = ocR (reQ z)` over O ℚ, by destructuring
  into 8 rational coords via `star … = rfl`-flipped structure + `CD.mk.injEq/Dbl.mk.injEq` +
  linarith + subst. EXIT 0.
- probe_recon4.lean: `herm_eq_Hm : Aᴴ=A → A = Hm (reQ A00)(reQ A11)(reQ A22)(A01)(A02)(A12)` by
  Matrix.ext + fin_cases, diagonal via self_adjoint_ocR, off-diag below via hentry. EXIT 0 (only
  unused-simp-arg warnings to trim).

## PRODUCTION PLAN (Phys/Algebra/OctonionJordanInnerDerivationLeibniz.lean, ns Phys.Algebra.HJ)
1. self_adjoint_ocR (scalar reconstruction) — probe_recon3 body.
2. herm_eq_Hm (matrix reconstruction) — probe_recon4 body (trim simp args).
3. jdef_herm : Aᴴ=A → Bᴴ=B → jdef A B = 0 — rw [herm_eq_Hm A, herm_eq_Hm B]; exact jdef_H3 …
4. PolJ helper (abstract def) + inner_leibniz_two (abstract 2•d = combo via abel).
5. innerMul_leibniz_herm : Herm A B X Y → d = 0. From (4): args of every jdef in the two PolJ are
   sums of Hermitian (jb_herm/add closure ⟹ Hermitian), each jdef=0 by (3) ⟹ 2•d=0 ⟹ d=0
   (ℚ two-torsion-free: nsmul_eq_zero / smul_right_injective ℚ). Then rearrange to the Leibniz form.
6. innerMul_mem_derH3 : Herm A B → innerMul A B ∈ derH3 (⟨innerMul_herm-based preservation, (5)⟩).
7. capstone inner_derivation_in_f4 : innerMul (slotA 1)(slotB 1) ∈ derH3 ∧ moves diag ∧ jordan_fails_H4.

## COSTUME C315
reQ ((innerMul (slotA 1)(slotB 1)(Dg 0 0 1)) 1 2) = 1 (N285 escape witness) packaged min 315 (…)=…
Wrong reading (innerMul trivial / not a member) fails. Decide exact at write.
