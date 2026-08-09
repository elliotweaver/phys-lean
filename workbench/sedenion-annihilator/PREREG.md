# PREREG — SEDENION ANNIHILATOR GEOMETRY (blind campaign; auditor+manager verified recon) — FROZEN
Date: 2026-08-08. Head: 1f82efa7. NO physics words in the Lean lane: no alpha, no gauge,
no channel, no particle, no coupling. NO imports from InteractionChannelTower or
ChannelOrientationCharacterized (independence from the N704 lane is deliberate — a
separate weld node compares the two AFTER both are banked).

## VERIFIED RECON (manager, exact rationals, repo CD.mul convention Double.lean L90-93)
- zdX = e1+e10 (banked, Sedenion.lean L88): rank L_zdX = rank R_zdX = 12; ker dim 4 both.
- Two-sided annihilator basis: {e7+e12, −e6+e13, e5+e14, −e4+e15} (all four verified
  two-sided; zdY = e5+e14 is one direction of the four).
- Sparse family z(i,k,s) = e_i + s·e_{8+k}, i,k ∈ 1..7, s ∈ ±1: zero divisor ⟺ i ≠ k.
  Count: 84 rays = 42 unsigned directed pairs × 2 signs. NO diagonal cases.
- Annihilation graph on the 84 (edge iff product = 0): symmetric, 4-regular,
  EXACTLY 7 components × 12 vertices, component invariant = i XOR k (the 7 nonzero
  labels of the octonion incidence).
Recon scripts: workbench/sedenion-annihilator/recon_verify.py (committed).

## TARGETS (the auditor's 11, Lean-shaped; N711 reserved; bank incrementally — a subset
banked clean beats a timeout)
T1 def annL (x : S ℚ) : Submodule ℚ (S ℚ) := LinearMap.ker (left-mul x as linear map)
   (build the linear map: mulLeftLin x — bilinearity of CD mul over ℚ; grep what's
   banked about S ℚ module structure in Sedenion.lean/ForcedStop.lean).
T2 def annR similarly (right mul).
T3 theorem annL_zdX_rank : finrank ℚ (annL zdX) = 4 (route: exhibit the 4 basis vectors,
   prove they're in the kernel (4 mul computations, ext+simp like zero_divisor_prod),
   linear independence (coordinate projections), and spanning — spanning is the heavy
   half: EITHER prove rank L = 12 via a 12-element independent image family, OR prove
   any kernel element is a combination of the four via coordinate elimination (16 linear
   equations — decide/linear_combination on ℚ coordinates; feasible but fiddly; if it
   resists, bank membership + independence + dim ≥ 4 and mark dim ≤ 4 BLOCKED honestly).
T4 theorem annBasis_two_sided : each of the four also right-annihilates (4 more muls).
T5 theorem annL_eq_annR at zdX (if T3's spanning lands both sides; else the 4-basis
   two-sided statement is the honest form).
T6 def zRay (i k : Fin 7) (s : Bool) : S ℚ := e(i+1) + (±1)·e(9+k) — the sparse family
   (mind the index shift: imaginary octonion slots 1..7, upper slots 9..15 = 8+(1..7)).
T7 theorem zRay_zeroDivisor_iff : (∃ y ≠ 0, zRay i k s * y = 0) ↔ i ≠ k — the
   classification. Route: for i ≠ k exhibit the partner explicitly (from the recon: the
   annihilator of e_i + s·e_{8+k} contains e_j + t·e_{8+m} patterns — COMPUTE the
   explicit partner formula from the recon script's adjacency before writing Lean; for
   i = k prove the norm law survives on that 2-plane (the diagonal rays are NOT zero
   divisors — they live in a quaternionic associative slice; a direct rank/norm
   computation).
T8 the count: def sparseZDCount and theorem = 84, with the unsigned skeleton theorem
   (the (i,k) set = offDiag of Fin 7 — WAIT: state WITHOUT importing the channel module:
   card { (i,k) : Fin 7 × Fin 7 | i ≠ k } = 42 is plain Finset arithmetic).
T9 the graph: def annEdge (a b) : Prop := product = 0; theorems: symmetry on the family;
   degree 4 at a witness vertex (full 4-regularity if budget allows — 84 vertices × 4 =
   heavy; a witness + the component structure may be the honest first bank).
T10 the invariant: theorem components labeled by i XOR k — formalize as: annEdge only
    connects rays with equal (i.val+1) ^^^ (k.val+1) label (the EDGE-preservation of the
    label is the checkable local statement — full connectivity of each 12-set is a
    second step; bank edge-preservation first).
T11 the symmetry lift: liftEnd_isDeriv (grep Double.lean/Octonion derivation modules for
    the banked doubling-derivation theorem) + theorem: xy = 0 → (D̂x)y + x(D̂y) = 0
    (Leibniz at zero — one line given the lift) — the zero-product locus is
    infinitesimally Der(O)-invariant.

## HARD RULES
Blind: no physics interpretation in ANY docstring — pure algebra language (annihilator,
kernel, ray, graph, component). No alpha/42-significance commentary. Costume C711.
Bank incrementally: commit-worthy subsets in preference to all-or-nothing.
