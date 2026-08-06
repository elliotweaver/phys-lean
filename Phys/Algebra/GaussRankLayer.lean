/-
  # THE RANK LAYER — exchange core, span predicate, distribution tower (GQ R8)

  ## What this file proves (GQ campaign, production node)

  The F_p rank machinery of THE LAW, entirely relational, no vector spaces:

  * `gp` / `gp_add` / `gp_mulexp` — powers on any CommGroup indexed by the
    fold's own ℕ, with exponent addition and multiplication.
  * `exchange_core` — ★★ THE EXCHANGE CORE: an F_p-invertible exponent
    captures the base — c·u = 1 + p·v ⟹ g = (g^c)^u · ((g^v)^p)⁻¹. The
    single identity behind rank well-definedness. Axioms: [propext] ALONE.
  * `powRel_base_congr` — powers of chain-equivalent bases coincide.
  * `PSpanned1` / `pSpanned1_congr` — ★ the span predicate in inverse-free
    product form (x∘P₁ ~ g^c∘P₂, P's p-th powers): a CLASS predicate,
    exactly the relational shape of the verified numerics membership test.
  * `DistTower` / `dist_tower_eq` — ★★ THE DISTRIBUTION TOWER: the supply
    structure carrying each rung's re-bracket composites, and the theorem
    that given the tower, (A∘G)^k is chain-equivalent to ANY composite of
    A^k and G^k. The exchange lemma's engine.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussLawEngines

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- Powers on a CommGroup indexed by the fold's ℕ (self-contained scratch
    restatement; production identifies with gpowC). -/
def gp {G : Type} [CommGroup G] (g : G) : Re → G
  | .void => 1
  | .step n => g * gp g n

theorem gp_void {G : Type} [CommGroup G] (g : G) : gp g Re.void = 1 := rfl

theorem gp_step {G : Type} [CommGroup G] (g : G) (n : Re) :
    gp g (Re.step n) = g * gp g n := rfl

/-- ★ Exponent addition. -/
theorem gp_add {G : Type} [CommGroup G] (g : G) (m n : Re) :
    gp g (m + n) = gp g m * gp g n := by
  induction n with
  | void =>
      show gp g (m + 0) = gp g m * gp g Re.void
      rw [add_zero, gp_void, mul_one]
  | step n ih =>
      have hms : m + Re.step n = Re.step (m + n) := by
        calc m + Re.step n = Re.step n + m := add_comm _ _
          _ = Re.step (n + m) := Re.step_add n m
          _ = Re.step (m + n) := by rw [add_comm n m]
      rw [hms, gp_step, gp_step, ih]
      -- g * (gp g m * gp g n) = gp g m * (g * gp g n)
      rw [← mul_assoc, mul_comm g (gp g m), mul_assoc]

/-- ★ Exponent multiplication. -/
theorem gp_mulexp {G : Type} [CommGroup G] (g : G) (m n : Re) :
    gp g (m * n) = gp (gp g m) n := by
  induction n with
  | void =>
      show gp g (m * 0) = gp (gp g m) Re.void
      rw [mul_zero, gp_void]
      rfl
  | step n ih =>
      -- m * step n = m * n + m  (Re.mul_step definitional)
      have hms : m * Re.step n = m * n + m := Re.mul_step m n
      rw [hms, gp_add, ih, gp_step]
      -- gp (gp g m) n * gp g m = gp g m * gp (gp g m) n
      rw [mul_comm]

/-- ★★ THE EXCHANGE CORE: an F_p-invertible exponent captures the base.
    c·u = 1 + p·v (natural Bézout) ⟹ g = (g^c)^u · ((g^v)^p)⁻¹. -/
theorem exchange_core {G : Type} [CommGroup G] (g : G) {c u p v : Re}
    (hcu : c * u = Re.step Re.void + p * v) :
    g = gp (gp g c) u * (gp (gp g v) p)⁻¹ := by
  have h1 : gp (gp g c) u = gp g (c * u) := (gp_mulexp g c u).symm
  have h2 : gp g (c * u) = gp g (Re.step Re.void + p * v) := by rw [hcu]
  have h3 : gp g (Re.step Re.void + p * v)
      = gp g (Re.step Re.void) * gp g (p * v) := gp_add g _ _
  have h4 : gp g (Re.step Re.void) = g := by
    rw [gp_step, gp_void, mul_one]
  have h5 : gp g (p * v) = gp (gp g v) p := by
    rw [show p * v = v * p from mul_comm p v]
    exact gp_mulexp g v p
  rw [h1, h2, h3, h4, h5]
  -- g * X * X⁻¹ = g
  rw [mul_assoc, mul_inv_cancel, mul_one]

/-- W8 TOOTH: the exchange core FIRES concretely — c = 1, u = 1, p·v = 0:
    g = (g¹)¹ · ((g⁰)^p)⁻¹, and the two sides are DEFINITIONALLY distinct
    expressions equal only through the theorem. -/
theorem exchange_core_fires {G : Type} [CommGroup G] (g : G) (p : Re) :
    g = gp (gp g (Re.step Re.void)) (Re.step Re.void)
        * (gp (gp g Re.void) p)⁻¹ :=
  exchange_core g (by
    show Re.step Re.void * Re.step Re.void = Re.step Re.void + p * Re.void
    have h1 : Re.step Re.void * Re.step Re.void = Re.step Re.void := by
      show (1 : Re) * 1 = 1
      rw [mul_one]
    have h2 : p * Re.void = 0 := by
      show p * 0 = 0
      rw [mul_zero]
    rw [h1, h2, add_zero])


/- The relational power with Chain closure (PowRel re-export shape from
   GaussReturn: PowRel g k h). For the rank layer the working object is
   the ONE-GENERATOR span. -/

/-- x is p-spanned by g: some c < p, c ≠ 0, powers W with
    x ∘ (g^c)⁻¹-shape ~ p-th power — delivered in the PRODUCT form that
    avoids inverses: x·(p-th power) ~ g^c·(p-th power)... the CLEANEST
    relational form (matching the verified numerics test exactly):
    ∃ c < p, c ≠ 0, and forms P1 P2 (p-th powers of some bases) with
    CompRel-products x∘P1 ~ g^c∘P2. -/
def PSpanned1 (p : Re) (g x : BQF) : Prop :=
  ∃ c : Re, c ≠ 0 ∧ c < p ∧
  ∃ (w1 w2 P1 P2 gc L R : BQF),
    PowRel w1 p P1 ∧ PowRel w2 p P2 ∧ PowRel g c gc ∧
    CompRel x P1 L ∧ CompRel gc P2 R ∧ Chain L R

/-- ★ BASE CONGRUENCE for the ladder: powers of chain-equivalent bases are
    PowRel-related with chain-equivalent results — precisely: PowRel g k h
    ⟹ PowRel g' k h when Chain g g'. (The ladder only reads g through
    Chain g_ and CompRel g_ — both Chain-congruent.) -/
theorem powRel_base_congr {g g' : BQF} {k : Re} {h : BQF}
    (hg : Chain g g') (hp : PowRel g k h) : PowRel g' k h := by
  induction hp with
  | one hb => exact PowRel.one (chainTrans (chainSymm hg) hb)
  | succ hp' hc ih =>
      exact PowRel.succ ih (compRel_congr hg (Chain.refl _) (Chain.refl _) hc)

/-- ★ SYMMETRY SEED of the exchange: PSpanned1 relates to itself under
    base change by chain-equivalence (congruence in g and x). -/
theorem pSpanned1_congr {p : Re} {g g' x x' : BQF}
    (hg : Chain g g') (hx : Chain x x')
    (h : PSpanned1 p g x) : PSpanned1 p g' x' := by
  obtain ⟨c, hc0, hcp, w1, w2, P1, P2, gc, L, R, hP1, hP2, hgc, hL, hR, hLR⟩ := h
  refine ⟨c, hc0, hcp, w1, w2, P1, P2, gc, L, R, hP1, hP2, ?_, ?_, hR, hLR⟩
  · -- PowRel g' c gc from PowRel g c gc via base transport
    -- PowRel is defined on a FIXED base g... base-congruence needs an
    -- induction: powers of chain-equivalent bases are chain-equivalent.
    -- Banked as powRel_base_congr below; use it here.
    exact powRel_base_congr hg hgc
  · exact compRel_congr hx (Chain.refl _) (Chain.refl _) hL


/-- THE SUPPLY TOWER for distributing the k-th power of the product AG:
    rung accumulators (Ak = A^k, Gk = G^k, Pk ~ (AG)^k) plus each rung's
    composites: Ak∘A, Gk∘G, Pk∘AG, and the CROSS-BRACKET witness T with
    BOTH readings (the direct product and the re-bracketed product both
    landing at T — the capstone discharges via assoc/comm + concordance). -/
inductive DistTower (A G AG : BQF) : Re → BQF → BQF → BQF → Prop
  | base : DistTower A G AG (Re.step Re.void) A G AG
  | step {k : Re} {Ak Gk Pk Ak' Gk' Pk' T : BQF}
      (prev : DistTower A G AG k Ak Gk Pk)
      (hA : CompRel Ak A Ak')
      (hG : CompRel Gk G Gk')
      (hP : CompRel Pk AG Pk')
      (hT1 : CompRel Pk AG T)
      (hT2 : CompRel Ak' Gk' T)
      : DistTower A G AG (Re.step k) Ak' Gk' Pk'

/-- ★★ THE DISTRIBUTION THEOREM: given the tower and the product's own
    defining composite, at EVERY rung any composite of the power
    accumulators is chain-equivalent to the product-power accumulator. -/
theorem dist_tower_eq {A G AG : BQF} {k : Re} {Ak Gk Pk : BQF}
    (tower : DistTower A G AG k Ak Gk Pk)
    (hbase : CompRel A G AG) :
    ∀ {W : BQF}, CompRel Ak Gk W → Chain Pk W := by
  induction tower with
  | base =>
      intro W hW
      exact compRel_functional hbase hW
  | @step k Ak Gk Pk Ak' Gk' Pk' T prev hA hG hP hT1 hT2 ih =>
      intro W hW
      have h1 : Chain Pk' T := compRel_functional hP hT1
      have h2 : Chain T W := compRel_functional hT2 hW
      exact chainTrans h1 h2


#print axioms gp_add
#print axioms gp_mulexp
#print axioms exchange_core
#print axioms powRel_base_congr
#print axioms pSpanned1_congr
#print axioms dist_tower_eq

end BQF
end GaussForms
end Phys.Foundation
