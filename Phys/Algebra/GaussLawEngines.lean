/-
  # THE BRIDGE, THE GENERATORS, THE READER (GQ R5-bridge/R6/R7)

  ## What this file proves (GQ campaign, production node)

  Three closing engines of THE LAW, on the derived integers:

  * `shift_normalize` — presentation chains from record data (re-export shape).
  * `bridge_step` — ★★ THE LADDER↔POWER BRIDGE: the CompRel result of
    (g, k-th ladder form) is chain-equivalent to the (k+1)-th deterministic
    ladder form. The duplication problem (a vs aᵏ share every prime — the
    classical compose-with-itself subtlety) dissolves because
    compose_well_defined only needs the Bézout witness on ONE side: the
    CompRel presentation supplies it; the ladder pair needs no coprimality.
  * `ladder_power_step` — the deterministic ladder IS the power ladder.
  * `miss_split` / `generator_step` — ★ THE GENERATOR CORE: a form whose
    miss factors coprimely IS the CompRel product of its branch
    presentations, ON THE NOSE. Iterated over prime_factorization: every
    class factors through the prime branches of its own reduced miss.
  * `complement_unique` / `same_complement` — ★ THE RELATION READER: the
    cancellation algebra making the pCl membership test exact — same
    complement, both principal ⟹ same class.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussReturn

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- ★ Presentation chains from record data (anchored_same_record_chain,
    applied): same miss V ≠ 0, records differ by 2·V·m, discs equal. -/
theorem shift_normalize {V b1 c1 b2 c2 m : Z} (hV : V ≠ 0)
    (hrec : b2 = b1 + 2 * V * m)
    (hdisc : disc (⟨V, b1, c1⟩ : BQF) = disc (⟨V, b2, c2⟩ : BQF)) :
    Chain (⟨V, b1, c1⟩ : BQF) (⟨V, b2, c2⟩ : BQF) :=
  anchored_same_record_chain hV hrec hdisc

/-- ★★ THE BRIDGE STEP: the CompRel result of (g, Lk) is chain-equivalent
    to the deterministic ladder form — compose_well_defined roles-swapped:
    the Bézout lands on the CompRel presentation; the ladder pair (a, aᵏ)
    needs no coprimality. -/
theorem bridge_step {g Lk P : BQF} {a B' t' : Z} {k : Re}
    (hcomp : CompRel g Lk P)
    (hg : Chain g (⟨a, B', zpowRe a k * t'⟩ : BQF))
    (hLk : Chain Lk (⟨zpowRe a k, B', a * t'⟩ : BQF))
    (hne : a * zpowRe a k ≠ 0) :
    Chain P (⟨zpowRe a (Re.step k), B', t'⟩ : BQF) := by
  obtain ⟨a1, a2, B, t, al, be, hbez, hne1, hcf, hcg, hch⟩ := hcomp
  -- presentation chains from the CompRel data to the ladder pair
  have hch1 : Chain (⟨a1, B, a2 * t⟩ : BQF) (⟨a, B', zpowRe a k * t'⟩ : BQF) :=
    chainTrans (chainSymm hcf) hg
  have hch2 : Chain (⟨a2, B, a1 * t⟩ : BQF) (⟨zpowRe a k, B', a * t'⟩ : BQF) :=
    chainTrans (chainSymm hcg) hLk
  -- discs agree (through the first branch chain)
  have hdisc : disc (gatherForm a1 a2 B t) = disc (gatherForm a (zpowRe a k) B' t') := by
    have h1d : disc (gatherForm a1 a2 B t) = disc (⟨a1, B, a2 * t⟩ : BQF) := by
      unfold disc gatherForm
      ring
    have h2d : disc (gatherForm a (zpowRe a k) B' t')
        = disc (⟨a, B', zpowRe a k * t'⟩ : BQF) := by
      unfold disc gatherForm
      ring
    rw [h1d, h2d]
    exact disc_eq hch1
  -- THE WD THEOREM, coprime side as base
  have hWD := compose_well_defined hbez hne1 hdisc hch1 hch2
  -- the primed gather IS the ladder form
  have hlad : gatherForm a (zpowRe a k) B' t'
      = (⟨zpowRe a (Re.step k), B', t'⟩ : BQF) := by
    unfold gatherForm
    have hz : zpowRe a (Re.step k) = a * zpowRe a k := zpowRe_step a k
    rw [hz]
  rw [hlad] at hWD
  exact chainTrans (chainSymm hch) hWD

/-- ★★ THE LADDER IS THE POWER (hypotheses-explicit induction shape):
    if the k-th ladder form is a k-th PowRel power and the CompRel supply
    exists at step k, the (k+1)-th ladder form is a (k+1)-th power. -/
theorem ladder_power_step {g Lk P : BQF} {a B' t' : Z} {k : Re}
    (hpk : PowRel g k Lk)
    (hcomp : CompRel g Lk P)
    (hg : Chain g (⟨a, B', zpowRe a k * t'⟩ : BQF))
    (hLk : Chain Lk (⟨zpowRe a k, B', a * t'⟩ : BQF))
    (hne : a * zpowRe a k ≠ 0) :
    PowRel g (Re.step k) (⟨zpowRe a (Re.step k), B', t'⟩ : BQF) := by
  have hbr := bridge_step hcomp hg hLk hne
  exact PowRel.succ hpk (compRel_congr (Chain.refl _) (Chain.refl _) hbr
    (by
      -- CompRel g Lk P with result re-chained... build the congr'd CompRel
      exact hcomp))


/-- ★ THE MISS SPLIT: a form whose miss factors coprimely IS the gather of
    its branch presentations — CompRel on the nose. -/
theorem miss_split {a1 a2 b c al be : Z}
    (hbez : al * a1 + be * a2 = 1) (hne : a1 * a2 ≠ 0) :
    CompRel (⟨a1, b, a2 * c⟩ : BQF) (⟨a2, b, a1 * c⟩ : BQF)
      (⟨a1 * a2, b, c⟩ : BQF) := by
  refine ⟨a1, a2, b, c, al, be, hbez, hne,
    Chain.refl _, Chain.refl _, ?_⟩
  have h : gatherForm a1 a2 b c = (⟨a1 * a2, b, c⟩ : BQF) := rfl
  rw [h]
  exact Chain.refl _

/-- The branch presentations carry the same disc as the split form. -/
theorem branch_disc (a1 a2 b c : Z) :
    disc (⟨a1, b, a2 * c⟩ : BQF) = disc (⟨a1 * a2, b, c⟩ : BQF)
    ∧ disc (⟨a2, b, a1 * c⟩ : BQF) = disc (⟨a1 * a2, b, c⟩ : BQF) := by
  constructor <;> (unfold disc; ring)

/-- ★ GENERATOR STEP, class form: every form with a coprimely-split miss is
    chain-CompRel-generated by its two branch forms. (The capstone iterates
    this along prime_factorization to reach prime-power branches.) -/
theorem generator_step {f : BQF} {a1 a2 al be : Z}
    (hf : f.a = a1 * a2) (hbez : al * a1 + be * a2 = 1) (hne : a1 * a2 ≠ 0) :
    CompRel (⟨a1, f.b, a2 * f.c⟩ : BQF) (⟨a2, f.b, a1 * f.c⟩ : BQF) f := by
  have hsplit := miss_split (b := f.b) (c := f.c) hbez hne
  have hform : (⟨a1 * a2, f.b, f.c⟩ : BQF) = f := by
    obtain ⟨fa, fb, fc⟩ := f
    simp only at hf ⊢
    rw [hf]
  rw [hform] at hsplit
  exact hsplit


/-- ★ READER FORM 1 (uniqueness of the complement): same left factor, both
    land principal ⟹ right factors chain. From functionality via the
    inverse: if CompRel a b e1, CompRel a c e2, Chain e1 e2, ainv-supply
    (CompRel ainv a u with u.a = 1... the unit-class), and the identity +
    assoc supplies (both bracketings), then Chain b c. Stated with the
    bracketing data explicit (capstone discharges): -/
theorem complement_unique {a b c e1 e2 ainv u T1 T2 : BQF}
    (hab : CompRel a b e1) (hac : CompRel a c e2) (he : Chain e1 e2)
    (hainv : CompRel ainv a u)
    (hT1L : CompRel u b T1) (hT1R : CompRel ainv e1 T1)
    (hT2L : CompRel u c T2) (hT2R : CompRel ainv e2 T2)
    (hidb : CompRel u b b) (hidc : CompRel u c c) :
    Chain b c := by
  -- T1 ~ b (via hT1L vs hidb), T2 ~ c, and T1 ~ T2 (via hT1R vs hT2R + he)
  have h1 : Chain T1 b := compRel_functional hT1L hidb
  have h2 : Chain T2 c := compRel_functional hT2L hidc
  have h12 : Chain T1 T2 := by
    have hT2R' : CompRel ainv e1 T2 :=
      compRel_congr (Chain.refl _) (chainSymm he) (Chain.refl _) hT2R
    exact compRel_functional hT1R hT2R'
  exact chainTrans (chainSymm h1) (chainTrans h12 h2)

/-- ★ READER FORM 2 (the transport step): x∘(y-power complement) principal
    reads x into the complement's inverse class — delivered as the
    two-sided form R8 uses: if CompRel x w z and Chain z e with e.a = 1
    (x∘w principal), and likewise CompRel x' w z' with Chain z' e' (e'.a=1),
    then Chain x x' — same complement, both principal ⟹ equal classes.
    (complement_unique with roles swapped through comm.) -/
theorem same_complement {x x' w z z' e e' : BQF}
    (hx : CompRel x w z) (hx' : CompRel x' w z')
    (hz : Chain z e) (hz' : Chain z' e')
    (hee : Chain e e')
    -- cancellation supply on w's side (capstone discharges via inverse+assoc):
    (winv u T1 T2 : BQF)
    (hwinv : CompRel winv w u)
    (hT1L : CompRel u x T1) (hT1R : CompRel winv z T1)
    (hT2L : CompRel u x' T2) (hT2R : CompRel winv z' T2)
    (hidx : CompRel u x x) (hidx' : CompRel u x' x') :
    Chain x x' := by
  have h1 : Chain T1 x := compRel_functional hT1L hidx
  have h2 : Chain T2 x' := compRel_functional hT2L hidx'
  have h12 : Chain T1 T2 := by
    have hzz' : Chain z z' := chainTrans hz (chainTrans hee (chainSymm hz'))
    have hT2R' : CompRel winv z T2 :=
      compRel_congr (Chain.refl _) (chainSymm hzz') (Chain.refl _) hT2R
    exact compRel_functional hT1R hT2R'
  exact chainTrans (chainSymm h1) (chainTrans h12 h2)


#print axioms bridge_step
#print axioms ladder_power_step
#print axioms generator_step
#print axioms complement_unique
#print axioms same_complement

end BQF
end GaussForms
end Phys.Foundation
