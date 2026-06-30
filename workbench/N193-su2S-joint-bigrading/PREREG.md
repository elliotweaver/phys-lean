# N193 PREREG — THE su(2)_S ACTION ON THE 7 + THE JOINT so(4) BIGRADING (7 = (3,1) ⊕ (2,2))

FROZEN before compute. GO/NO-GO + KILL.

## W4.5 MEASURE-FIRST VERDICT (of the ROADMAP §N192-superseded fronts)

- Front (iv) — the su(2)_S-only action on ImO (the difference family `secondSU2` restricted to
  the 7) — MEASURED LIGHT + GENUINELY NEW (chosen, merged with the joint front (i)).
  The su(2)_S action on ImO has NEVER been banked: N191 banked only its BRACKET structure
  (secondSU2_bracket, secondSU2_commutes_leftImDeriv) — never how secondSU2 ACTS on the 7.
- Front (i) — the JOINT (su(2)_S × su(2)_T) bigrading — falls out IMMEDIATELY once front (iv)
  is in hand: the same two subspaces ιO(ImH), κO(⊤) (N192) are invariant under BOTH factors,
  and carry DISTINCT (j_S,j_T) signatures. NOT a mechanical intersection: it is the COMMON
  REFINEMENT from which BOTH banked branchings descend (W8 — proved, not asserted).
- Fronts (ii) so(4)⊕complement (needs ℤ↔ℚ type bridge — heavier), (iii) right-slot family
  (secondSU2 already IS effectively the right action — see below), (v) hypercharge — DEFERRED.

## THE TRUNK COMPUTATION (reframe, NO coordinate blowup — reduces to banked intertwiners)

secondSU2 P := innerDeriv P − leftImDeriv P (N191).

- secondSU2 P (ιO a) = innerDeriv P (ιO a) − leftImDeriv P (ιO a)
                     = ιO(adHom P a) − 0                          [N190 innerDeriv_iotaO + N192 leftImDeriv_iotaO]
                     → su(2)_S acts on the OLD line by the ADJOINT (su(2)_T ANNIHILATES it).
- secondSU2 P (κO b) = innerDeriv P (κO b) − leftImDeriv P (κO b)
                     = κO(adHom P b) − κO(P·b)                    [N190 innerDeriv_kappaO_full + N192 leftImDeriv_kappaO]
                     = κO((P·b − b·P) − P·b) = κO(−(b·P))
                     → su(2)_S acts on the NEW plane by RIGHT-mult R_P (su(2)_T acts by LEFT-mult L_Q).

So under so(4) = su(2)_S × su(2)_T:
  7 = ιO(ImH) ⊕ κO(⊤) = (3,1) ⊕ (2,2)
   • ιO(ImH) (dim 3): su(2)_S-NONTRIVIAL (adjoint, j_S=1), su(2)_T-TRIVIAL (annihilated, j_T=0).
   • κO(⊤)   (dim 4): su(2)_T by L, su(2)_S by R — the (1/2,1/2) bimodule of H.
THE DIAGONAL SINGLET κO 1 ∈ κO(⊤): secondSU2 hI(κO 1) = −κO hI, leftImDeriv hI(κO 1) = +κO hI
  → the two factors act as EXACT NEGATIVES on it, which is WHY the diagonal (their sum,
  innerDeriv) FIXES it (N189). The descent of N190's singlet from the (2,2).

## GO (production decls, namespace Phys.Algebra, new file DerivationRep7SU2SBranching.lean)

A. secondSU2_iotaO        : secondSU2 P (iotaO a) = iotaO (adHom P a)            [ADJOINT on OLD line]
B. secondSU2_kappaO       : secondSU2 P (kappaO b) = kappaO (-(b * P))           [RIGHT-mult on NEW plane]
C. secondSU2_invariant_iotaImH : su(2)_S preserves ιO(ImH)  (via adHom_mem_ImH)
D. secondSU2_invariant_kappaTop: su(2)_S preserves κO(⊤)    (right-mult stays in slot)
E. THE JOINT INVARIANCE headline: ιO(ImH) ⊔ κO(⊤) = ImO (import N192 branchingT_sup_eq_ImO),
   and BOTH pieces invariant under su(2)_S (C,D) AND su(2)_T (N192) — so(4)-invariant.
F. THE PUNCHLINE (descent): secondSU2 hI (kappaO 1) = - leftImDeriv hI (kappaO 1)
   [the two so(4) factors act as exact negatives on the diagonal singlet → diagonal fixes it].
G1. secondSU2_moves_singlet : secondSU2 hI (kappaO 1) ≠ 0     (W8 — su(2)_S also moves it)
G2. secondSU2_singlet_coord : (secondSU2 hI (kappaO 1)).im.re.im = -1   (COSTUME witness, distinct from N192's +1)
G3. secondSU2_acts_on_iotaImH_ne_zero : secondSU2 hI (iotaO hJ) ≠ 0     (W8 — (3,1) nontrivial under su(2)_S)

## COSTUME C225
Counterexamples/DerivationRep7SU2SBranchingWrongValueCostume.lean — bites G2:
the deep coordinate of the moved singlet (secondSU2 hI (κO 1)).im.re.im GENUINELY = −1;
the WRONG claim it is 193 forces −1 = 193 in ℚ → exit 1. PASS_SIGNATURE: "-1 = 193".
DISTINCT pair from battery (… C223 2=191, C224 1=192).

## KILL (instrument-failure classifier, W9)
- If any single lemma's `lake env lean` probe does not close in < 60s OR needs maxHeartbeats
  raised above default → INSTRUMENT failure, NOT theory. STOP, decompose, do not grind.
- All lemmas reduce to banked intertwiners (innerDeriv_iotaO/kappaO_full, leftImDeriv_iotaO/kappaO,
  adHom_mem_ImH) + the N192 singlet-coordinate pattern (singlet_moved_coord). Expected: all LIGHT.
- Budget: bank-as-you-go; production + wire + commit BEFORE the full assembly; gate in background.

## NON-VACUITY / W8
- secondSU2's action on ιO is the ADJOINT (≠ leftImDeriv's 0); on κO is RIGHT-mult (≠ leftImDeriv's
  LEFT-mult) and ≠ innerDeriv's adjoint — a genuinely THIRD distinct intertwiner family.
- The joint bigrading (3,1)⊕(2,2) is the COMMON REFINEMENT both banked branchings descend from
  (NOT a mechanical intersection — the descent is PROVED: F + the role swaps).
- G1/G3 prove the action is nontrivial on each piece. F proves the genuine relational punchline.

## STANDARD
Physics-words-removable: delete su(2)/so(4)/colour/isospin/singlet/adjoint/branching/bigrading →
pure statement about CD(CD B): the difference family innerDeriv P − leftImDeriv P acts on the
first embedding a↦⟨a,0⟩ by the adjoint and on the second b↦⟨0,b⟩ by b↦−(b·P); both coordinate
subspaces are preserved; on the second-slot unit ⟨0,1⟩ it acts as the negative of the second-slot
family. NO posited Lie group as content, NO Mathlib ℝ/ℂ as content.
