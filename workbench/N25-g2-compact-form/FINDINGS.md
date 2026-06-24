# N25 FINDINGS — bounded measurements (W9), frozen route

## Base state (W6 crime-scene N/A)
git clean at N24 (f059974). No inherited WIP. `lake build Phys` green 6.5s.

## PROBE results (workbench/N25-g2-compact-form/scratch/probe1.lean, all elaborated, exit 0, ~8s)
1. `LieModule.traceForm_lieInvariant ℚ derivationLieQ (O ℚ)` : the lieInvariant input — FREE. ✓
2. `(LieModule.traceForm_isSymm …).isRefl` : the IsRefl input — FREE. ✓
3. `Module.Finite ℚ derivationLieQ` : `infer_instance` works (from instFiniteDerivationQ). ✓
4. `LieModule.traceForm_apply_lie_apply` : B ⁅a,y⁆ z = B a ⁅y,z⁆ — the invariance lemma. ✓
5. `LieModule.traceForm_apply_eq_zero_of_mem_lcs_of_mem_center` : B x y = 0 for x∈lcs 1, y∈center. ✓
6. bundled neg-definiteness: `obtain ⟨Dv,hDv⟩ := D; Subtype.ext (traceForm_self_eq_zero hDv h)`
   gives `D = 0` for `D : derivationLieQ` with `B D D = 0`. ✓  (membership ⟹ IsDerivQ defeq.)

## FROZEN ROUTE (theory-native, NO false Killing/radical argument)
Entry: `LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate` on Φ = module traceForm.
Inputs: nondegenerate (BANKED N24), lieInvariant (FREE), IsRefl (FREE), Module.Finite (instance),
and the ONLY hard one — hL : ∀ I, IsAtom I → ¬IsLieAbelian I.

Levers banked this node (bank-as-you-go):
  L0  traceForm_self_eq_zero' (D : derivationLieQ) : B D D = 0 → D = 0  (bundled neg-def)
  L1  derivationLieQ_center_eq_bot : center = ⊥.
      z ∈ center ⟹ z ∈ lcs 1 = ⁅⊤,lcs 0⁆ = ⁅⊤,⊤⁆ = ⊤ (PERFECTNESS N23) ⟹
      B(z,z)=0 by lcs-center lemma ⟹ z=0 (L0).
  L2  derivationLieQ_no_abelian_atom = hL. I abelian atom ⟹ ⁅I,I⁆=⊥. ⁅⊤,I⁆ ≤ I, atom dichotomy:
      • ⁅⊤,I⁆=⊥ ⟹ I ≤ center = ⊥ (L1) — contradiction (atom ≠ ⊥).
      • ⁅⊤,I⁆=I ⟹ ↑I = span{⁅x,n⁆}; span_induction + B ⁅x,n⁆ w = B x ⁅n,w⁆ = B x 0 = 0
        (⁅n,w⁆∈⁅I,I⁆=⊥) ⟹ B|I = 0 ⟹ B(z,z)=0 ⟹ z=0 (L0) ⟹ I=⊥ — contradiction.
  L3  derivationLieQ_semisimple : LieAlgebra.IsSemisimple ℚ derivationLieQ (assemble inputs).

Childed N26: (A) irreducibility of faithful 7-rep (LieSubmodule setup on ImO, multi-run),
(D) simplicity, then the automorphism Lie GROUP.

## KILL budget honored: per-obligation 90s; all probes ≤8s. No maxHeartbeats inflation.
