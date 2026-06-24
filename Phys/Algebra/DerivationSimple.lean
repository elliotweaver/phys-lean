/-
  Phys.Algebra.DerivationSimple — N29: the SIMPLICITY-REDUCTION levers toward
  `LieAlgebra.IsSimple ℚ derivationLieQ`.
  ===========================================================================
  N26 banked the simplicity skeleton `isSimple_of_isSimpleOrder`
  (`IsSimpleOrder (LieIdeal ℚ derivationLieQ) → LieAlgebra.IsSimple ℚ derivationLieQ`).
  N28 banked FULL IRREDUCIBILITY of the faithful 7-rep
  (`ImLie_isIrreducible : LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie`).
  N25 banked SEMISIMPLICITY (`derivationLieQ_semisimple`), which (via Mathlib's
  `LieAlgebra.IsSemisimple.instBooleanAlgebra`) makes the lattice of Lie ideals a
  Boolean algebra, atomistic, with `sSup{atoms} = ⊤`; so `IsSimpleOrder` is
  equivalent to "exactly one atom".

  ★ THE REMAINING GAP (childed N30, the W1 structure-theorem BUILD). The decisive
  finding (N28, do NOT relitigate): `IsSimple` is NOT near-free given irreducibility
  + faithfulness — the implication is genuinely FALSE in general (`so(4)` on its
  4-rep is faithful + irreducible but NOT simple). The honest route is the
  irreducible-faithful-module ⟹ simple structure theorem: if `derivationLieQ` were a
  product of two nonzero commuting ideals `I ⊕ J`, the faithful irreducible 7-rep `V`
  would be `I`-isotypic, forcing `dim V = (dim factor) · (multiplicity)`; but
  `dim V = 7` is PRIME, so one factor acts as a 1-dim character (perfect ⟹ acts `0` ⟹
  faithfulness ⟹ that factor is `⊥`) or `V` is factor-irreducible and Schur gives a
  division ℚ-algebra `Δ` with `dim_ℚ Δ ∈ {1,7}`, each branch collapsing by the
  skew-trace / centre / dimension count. Mathlib LACKS the Lie-module isotypic
  decomposition / outer-tensor / Lie-Schur, so it is a substantial W1 BUILD (N30).

  ★ WHAT THIS FILE BANKS (FORWARD, route-independent, foundations-only, NO posited G₂):
    lieIdeal_nontrivial      — `Nontrivial (LieIdeal ℚ derivationLieQ)` (`⊥ ≠ ⊤`), from
                               the banked non-abelianness. The `Nontrivial` half of
                               `IsSimpleOrder`, established once and for all.
    eq_bot_of_lie_ImLie_bot  — a Lie ideal that BRACKETS to `⊥` against the 7-rep is `⊥`:
                               its elements act as `0` on `ImO`, so faithfulness
                               (`imRep_injective`) forces them to `0`. The faithfulness
                               lever the structure theorem turns on.
    lie_ImLie_ne_bot_of_ne_bot — every NONZERO Lie ideal acts NONTRIVIALLY on the 7-rep:
                               `K ≠ ⊥ → ⁅K, ImLie⁆ ≠ ⊥`. The contrapositive of the
                               faithfulness lever — the statement N30 consumes when it
                               rules out a factor acting trivially.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). NO `LieAlgebra.g₂`/`G₂` imported to
  assert anything. These are STRUCTURAL FACTS about the banked `derivationLieQ`/`ImLie`,
  proved from its own banked structure; `LieIdeal`/`LieSubmodule`/`Nontrivial` are
  MACHINERY on the DERIVED object (docs/STANDARD.md §3).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "g₂ / gauge / compact / simple":
  what remains is the pure statement that, for the 14-dim Lie algebra of
  Leibniz-derivations of the Cayley–Dickson double of a double of a double of ℚ, the
  ideal lattice is nontrivial and every nonzero ideal acts nontrivially on the invariant
  7-dim subspace `ker(star + id)`.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationIrreducibleFull

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The simplicity-reduction levers (FORWARD, NO posited G₂). -/

/-- ★ THE IDEAL LATTICE IS NONTRIVIAL: `⊥ ≠ ⊤` as Lie ideals of `derivationLieQ`. This
    is the `Nontrivial` half of `IsSimpleOrder (LieIdeal ℚ derivationLieQ)`. It holds
    because `derivationLieQ` is NOT Lie-abelian (banked `derivationLieQ_not_lieAbelian`,
    N23): a subsingleton Lie algebra is abelian, so non-abelianness forbids `⊥ = ⊤`. -/
theorem lieIdeal_nontrivial : Nontrivial (LieIdeal ℚ derivationLieQ) := by
  rw [LieSubmodule.nontrivial_iff, ← not_subsingleton_iff_nontrivial]
  intro hsub
  exact derivationLieQ_not_lieAbelian inferInstance

/-- ★ THE FAITHFULNESS LEVER: a Lie ideal `K` that brackets to `⊥` against the invariant
    7-rep `ImLie` is itself `⊥`. Indeed every `x ∈ K` then acts as `0` on `ImO`
    (`⁅x, m⁆ ∈ ⁅K, ImLie⁆ = ⊥` for `m ∈ ImO`), so `imRep x = 0`, and faithfulness of the
    7-rep (`imRep_injective`, N22) forces `x = 0`. This is the lever the structure
    theorem (N30) turns on: a factor acting trivially on the faithful rep must vanish. -/
theorem eq_bot_of_lie_ImLie_bot (K : LieIdeal ℚ derivationLieQ)
    (h : (⁅K, ImLie⁆ : LieSubmodule ℚ derivationLieQ (O ℚ)) = ⊥) : K = ⊥ := by
  rw [eq_bot_iff]
  intro x hx
  rw [LieSubmodule.mem_bot]
  have hact : ∀ m : O ℚ, m ∈ ImO → (x : Module.End ℚ (O ℚ)) m = 0 := by
    intro m hm
    have hmem : ⁅(x : derivationLieQ), m⁆ ∈ (⁅K, ImLie⁆ : LieSubmodule ℚ derivationLieQ (O ℚ)) :=
      LieSubmodule.lie_mem_lie hx hm
    rw [h, LieSubmodule.mem_bot] at hmem
    rw [← hmem]; rfl
  have hzero : imRep x = 0 := by
    apply LinearMap.ext; intro y; apply Subtype.ext
    rw [imRep_coe]; exact hact y.1 y.2
  exact (injective_iff_map_eq_zero imRep).mp imRep_injective x hzero

/-- ★ EVERY NONZERO IDEAL ACTS NONTRIVIALLY on the faithful 7-rep:
    `K ≠ ⊥ → ⁅K, ImLie⁆ ≠ ⊥`. The contrapositive of `eq_bot_of_lie_ImLie_bot`. The
    structure theorem (N30) consumes this to rule out a direct-summand ideal acting
    trivially on the irreducible faithful representation. -/
theorem lie_ImLie_ne_bot_of_ne_bot (K : LieIdeal ℚ derivationLieQ) (hK : K ≠ ⊥) :
    (⁅K, ImLie⁆ : LieSubmodule ℚ derivationLieQ (O ℚ)) ≠ ⊥ :=
  fun h => hK (eq_bot_of_lie_ImLie_bot K h)

end

end Phys.Algebra
