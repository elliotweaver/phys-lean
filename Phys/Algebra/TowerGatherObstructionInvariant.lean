/-
  Phys.Algebra.TowerGatherObstructionInvariant — N221: THE GLUING-OBSTRUCTION COCYCLE
  IS g₂-EQUIVARIANT; ITS CALIBRATION FORMS ARE g₂-INVARIANT.
  ===========================================================================
  A STILL-DEEPER CUT of the N219/N220 gather frontier (under the OVERNIGHT LOCK).
  N218T determined WHICH inter-world pairs glue across the derived Cayley–Dickson tower;
  N219 made the obstruction EXPLICIT as `gluingDefect a b : x ↦ (a·b)·x − a·(b·x)` and
  IDENTIFIED it, on the octonion rung `O ℚ = CD (H ℚ)`, with the banked associator `[a,b,·]`
  (`o_gluingDefect_eq_assoc`); N220 determined its Hochschild-cohomological structure
  (3-cocycle / exact / End-2-cochain-nonclosed / cyclic-antisymmetrization = 6·Jacobiator).

  THIS node determines the obstruction cocycle's SYMMETRY. Over the banked octonion rung
  `O ℚ`, the gluing obstruction (= the associator) is EQUIVARIANT under the banked derivation
  Lie algebra `Der(O ℚ) = g₂` (N16–N207, the carrier of the whole gauge arc), and CONSEQUENTLY
  the two banked CALIBRATION FORMS built on it — the associative 3-form `φ = assoc3 = ⟨x, y×z⟩`
  (N209) and the coassociative 4-form `ψ = coassoc4 = ⟨[x,y,z], w⟩` (N210) — are g₂-INVARIANT
  (their total infinitesimal variation vanishes).

  WHAT THE RUNG ANSWERS (each clause a proved theorem, each a citation of a banked
  derivation / metric / cross-product fact — NO coordinate ring):

    (1) THE OBSTRUCTION COCYCLE IS g₂-EQUIVARIANT.  For every Leibniz derivation `D`
        (`IsDerivQ D`, i.e. every element of `Der(O ℚ) = g₂`, N16–N21), the associator
        (= the N219 gluing obstruction) transforms as a derivation of the trilinear map:
          `D [x,y,z] = [Dx,y,z] + [x,Dy,z] + [x,y,Dz]`
        (`assoc_derivQ_equivariant_O`, and on the obstruction map itself
        `gluingDefect_derivQ_equivariant_O`). Pure Leibniz applied twice — NO skew-adjointness,
        NO associativity of `O ℚ`.

    (2) THE COASSOCIATIVE 4-FORM `ψ` IS g₂-INVARIANT.  The N210 calibration 4-form
        `ψ(x,y,z,w) = ⟨[x,y,z], w⟩` has vanishing total infinitesimal `g₂`-variation:
          `ψ(Dx,y,z,w) + ψ(x,Dy,z,w) + ψ(x,y,Dz,w) + ψ(x,y,z,Dw) = 0`
        (`coassoc4_derivQ_invariant`). The equivariance (1) handles the first three slots; the
        fourth is killed by the banked skew-adjointness `gFormQ_skew` (N24/N26).

    (3) THE ASSOCIATIVE 3-FORM `φ` IS g₂-INVARIANT.  Likewise for the N209 calibration 3-form
        `φ(x,y,z) = ⟨x, y×z⟩`:
          `φ(Dx,y,z) + φ(x,Dy,z) + φ(x,y,Dz) = 0`
        (`assoc3_derivQ_invariant`), via the banked cross-product equivariance
        `octCross_deriv_leibniz` (N207) + `gFormQ_skew`.

    (4) NON-VACUITY (W8).  The obstruction cocycle is a genuinely NONZERO trilinear map on
        `O ℚ` (`obstruction_invariance_nonvacuous`, banked `assoc_nonvanishing`), and the
        equivariance holds at the concrete banked nullbasis derivation `D0E` (N16)
        (`assoc_equivariant_at_D0E`) — none of the above is the trivial `0 = 0`.

  THE DISCOVERED CONTENT (withheld — read off the banked derivation algebra + metric, NOT
  posited). N219 said the obstruction IS the associator; N220 said WHAT KIND of cocycle; N221
  says the obstruction cocycle carries EXACTLY the exceptional symmetry `g₂ = Der(O)` — the SAME
  `g₂` the gauge arc (colour SU(3) N42, isospin SU(2) N187, the branchings N189–N192) is built
  inside is the infinitesimal automorphism algebra of the gather obstruction. The gather
  obstruction (N218T–N220) and the gauge carrier (N16–N207) are ONE `g₂`-object: the local→global
  gluing obstruction is a `g₂`-equivariant cocycle, and the calibration forms whose `GL(7)`
  stabilizer is `g₂` are invariant under it. One cause — the octonion non-associativity — is both
  the gluing obstruction (N219) AND the calibration structure recognizing `g₂` (N209/N210); here
  they are proved the SAME `g₂`-representation-theoretic object.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "world / gather / glue / obstruction /
  cocycle / calibration / gauge / g₂ / symmetry": over the derived field `ℚ` and the
  Cayley–Dickson double of a double `O ℚ = CD (H ℚ)`, for the associator
  `assoc x y z = (x·y)·z − x·(y·z)` and every ℚ-linear Leibniz endomorphism `D`
  (`D (x·y) = D x · y + x · D y`): `D (assoc x y z) = assoc (D x) y z + assoc x (D y) z +
  assoc x y (D z)`, and the scalar forms `gForm x (octCross y z)` and `gForm (assoc x y z) w`
  have vanishing total `D`-variation. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no posited symmetry structure as content, no Mathlib ℝ/ℂ
  as content (ℚ is the coefficient field; the OBJECT is the derived octonion rung `O ℚ = CD (H ℚ)`,
  the banked associator (Alternative.lean N5b), the banked N219 `gluingDefect`, the banked
  calibration forms `assoc3` (N209) / `coassoc4` (N210), the banked derivation predicate `IsDerivQ`
  + witness `D0E` (N16), and the banked `gFormQ_skew` / `octCross_deriv_leibniz`), no sorry, no
  kernel-trust bypass, no bridge.
-/
import Phys.Algebra.OctonionCoassociative4Form
import Phys.Algebra.OctonionCrossProductDerivation
import Phys.Algebra.TowerGatherObstruction

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD

/-! ## THE FORMAL BACKBONE — the associator is a derivation of the trilinear map, on the
    octonion shape `CD (CD B)`, for any Leibniz derivation of the product. -/

section Alt
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- THE g₂-EQUIVARIANCE BACKBONE (formal): for any additive Leibniz derivation `D` of the
    (non-associative) product `CD (CD B)`, the associator `[x,y,z] = (x·y)·z − x·(y·z)`
    transforms as a derivation of the trilinear map:
      `D [x,y,z] = [Dx,y,z] + [x,Dy,z] + [x,y,Dz]`.
    Pure Leibniz applied twice + biadditivity + distributivity — NO associativity, NO metric. -/
theorem assoc_deriv_equivariant (D : Module.End ℤ (CD (CD B))) (hD : IsDeriv D) (x y z : CD (CD B)) :
    D (assoc x y z) = assoc (D x) y z + assoc x (D y) z + assoc x y (D z) := by
  unfold assoc
  rw [map_sub, hD (x * y) z, hD x y, hD x (y * z), hD y z]
  simp only [add_mul, mul_add]
  abel

end Alt

/-! ## THE HEADLINES ON THE BANKED OCTONION RUNG `O ℚ = CD (H ℚ)`, for `Der(O ℚ) = g₂`. -/

section OQ
attribute [local instance] CD.narCD CD.srCD

/-- ★ (1) THE GLUING OBSTRUCTION COCYCLE IS `Der(O ℚ) = g₂`-EQUIVARIANT. For every ℚ-linear
    Leibniz derivation `D` (`IsDerivQ D`, i.e. every element of the banked `Der(O ℚ) = g₂`,
    N16–N21), the associator (= the N219 gluing obstruction, `o_gluingDefect_eq_assoc`) transforms
    as a derivation of the trilinear map:
      `D [x,y,z] = [Dx,y,z] + [x,Dy,z] + [x,y,Dz]`.
    Pure Leibniz twice — no associativity of `O ℚ`, no metric. -/
theorem assoc_derivQ_equivariant_O (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (x y z : O ℚ) :
    D (assoc x y z) = assoc (D x) y z + assoc x (D y) z + assoc x y (D z) := by
  unfold assoc
  rw [map_sub, hD (x * y) z, hD x y, hD x (y * z), hD y z]
  simp only [add_mul, mul_add]
  abel

/-- ★ (1′) THE SAME EQUIVARIANCE on the N219 obstruction map `gluingDefect` (definitional tie
    on `O ℚ`, `gluingDefect a b x = assoc a b x`). The explicit gluing obstruction is
    `g₂`-equivariant. -/
theorem gluingDefect_derivQ_equivariant_O (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (a b x : O ℚ) :
    D (gluingDefect a b x)
      = gluingDefect (D a) b x + gluingDefect a (D b) x + gluingDefect a b (D x) := by
  have h : ∀ p q r : O ℚ, gluingDefect p q r = assoc p q r := fun _ _ _ => rfl
  rw [h, h, h, h]
  exact assoc_derivQ_equivariant_O D hD a b x

/-- ★★★ (2) THE COASSOCIATIVE CALIBRATION 4-FORM `ψ = ⟨[x,y,z], w⟩` (N210) IS `g₂`-INVARIANT.
    Its total infinitesimal `Der(O ℚ)`-variation vanishes:
      `ψ(Dx,y,z,w) + ψ(x,Dy,z,w) + ψ(x,y,Dz,w) + ψ(x,y,z,Dw) = 0`.
    The equivariance (1) collapses the first three slots into `gForm (D [x,y,z]) w`; the fourth
    slot `gForm [x,y,z] (D w)` cancels it by the banked skew-adjointness `gFormQ_skew` (N24/N26). -/
theorem coassoc4_derivQ_invariant (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (x y z w : O ℚ) :
    coassoc4 (D x) y z w + coassoc4 x (D y) z w + coassoc4 x y (D z) w
      + coassoc4 x y z (D w) = 0 := by
  unfold coassoc4
  rw [← gForm_add_left, ← gForm_add_left]
  rw [← assoc_derivQ_equivariant_O D hD x y z]
  exact gFormQ_skew D hD (assoc x y z) w

/-- ★★ (3) THE ASSOCIATIVE CALIBRATION 3-FORM `φ = ⟨x, y×z⟩` (N209) IS `g₂`-INVARIANT.
    Its total infinitesimal `Der(O ℚ)`-variation vanishes:
      `φ(Dx,y,z) + φ(x,Dy,z) + φ(x,y,Dz) = 0`.
    Via the banked cross-product `g₂`-equivariance `octCross_deriv_leibniz` (N207) on the last
    two slots + the banked skew-adjointness `gFormQ_skew` on the first. -/
theorem assoc3_derivQ_invariant (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (x y z : O ℚ) :
    assoc3 (D x) y z + assoc3 x (D y) z + assoc3 x y (D z) = 0 := by
  unfold assoc3
  have hL : octCross (D y) z + octCross y (D z) = D (octCross y z) :=
    (octCross_deriv_leibniz D hD y z).symm
  rw [show gForm (D x) (octCross y z) + gForm x (octCross (D y) z) + gForm x (octCross y (D z))
       = gForm (D x) (octCross y z) + gForm x (octCross (D y) z + octCross y (D z)) from by
        rw [gForm_add_right]; ring]
  rw [hL]
  exact gFormQ_skew D hD x (octCross y z)

/-! ## W8 NON-VACUITY — the invariance is genuine, on a nonzero cocycle at a concrete derivation. -/

/-- The g₂-equivariance instantiated at the concrete banked nullbasis derivation `D0E` (N16),
    a genuine element of `Der(O ℚ) = g₂`. -/
theorem assoc_equivariant_at_D0E (x y z : O ℚ) :
    D0E (assoc x y z) = assoc (D0E x) y z + assoc x (D0E y) z + assoc x y (D0E z) :=
  assoc_derivQ_equivariant_O D0E D0E_isDerivQ x y z

/-- ★ W8 NON-VACUITY: the gluing-obstruction cocycle is a genuinely NONZERO trilinear map on
    `O ℚ` (banked `assoc_nonvanishing`, the cascade's non-associating triple). So the
    equivariance / calibration-invariance statements are all non-vacuous. -/
theorem obstruction_invariance_nonvacuous : ∃ x y z : O ℚ, assoc x y z ≠ 0 :=
  ⟨_, _, _, assoc_nonvanishing⟩

/-! ## THE CAPSTONE — the gluing obstruction and its calibration forms carry the g₂ symmetry. -/

/-- ★★★ THE g₂-INVARIANCE STRUCTURE OF THE GLUING OBSTRUCTION on `O ℚ`. For every Leibniz
    derivation `D ∈ Der(O ℚ) = g₂`:
      • the gluing obstruction cocycle (= the associator) is EQUIVARIANT
        (`D [x,y,z] = [Dx,y,z] + [x,Dy,z] + [x,y,Dz]`);
      • the coassociative calibration 4-form `ψ = ⟨[x,y,z],w⟩` (N210) is INVARIANT
        (total `D`-variation `= 0`);
      • the associative calibration 3-form `φ = ⟨x, y×z⟩` (N209) is INVARIANT
        (total `D`-variation `= 0`);
      • the obstruction cocycle is a genuinely NONZERO trilinear map.
    The gather obstruction (N218T–N220) and the gauge carrier `g₂ = Der(O)` (N16–N207) are ONE
    `g₂`-object. Physics-words-removable: pure Leibniz + Born-form skew-adjointness on
    `CD (CD B) = O ℚ`. -/
theorem obstruction_g2_invariance_structure :
    -- (1) the obstruction cocycle (= associator) is Der(O ℚ)-equivariant
    (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ x y z : O ℚ,
      D (assoc x y z) = assoc (D x) y z + assoc x (D y) z + assoc x y (D z)) ∧
    -- (2) the coassociative 4-form ψ is g₂-invariant
    (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ x y z w : O ℚ,
      coassoc4 (D x) y z w + coassoc4 x (D y) z w + coassoc4 x y (D z) w
        + coassoc4 x y z (D w) = 0) ∧
    -- (3) the associative 3-form φ is g₂-invariant
    (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ x y z : O ℚ,
      assoc3 (D x) y z + assoc3 x (D y) z + assoc3 x y (D z) = 0) ∧
    -- (4) non-vacuity: the obstruction cocycle is a genuinely nonzero trilinear map
    (∃ x y z : O ℚ, assoc x y z ≠ 0) :=
  ⟨assoc_derivQ_equivariant_O, coassoc4_derivQ_invariant, assoc3_derivQ_invariant,
    obstruction_invariance_nonvacuous⟩

end OQ

end Phys.Algebra
