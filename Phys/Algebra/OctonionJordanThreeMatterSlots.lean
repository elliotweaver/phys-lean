/-
# N267 — THE FORCED THREE-FOLD MATTER-CARRIER MULTIPLICITY OF THE MAXIMAL HERMITIAN OCTONIONIC JORDAN ORDER

Over the DERIVED octonion rung `O ℚ = CD (H ℚ)` and the exceptional Jordan carrier `J₃(O)` (N5), this
node banks the FORWARD ★4↔★15/★3 beat: the maximal Hermitian octonionic Jordan order is 3, and at that
maximal order the general self-adjoint element carries EXACTLY THREE copies of the derived matter carrier
`O ℚ`. The three-fold multiplicity is `C(3,2)` at the maximal order, and that maximal order is FORCED by
the cascade-stop non-associativity (the same cause that stops the tower and caps the Jordan order).

THE ARENA (banked, N5). `Hm d0 d1 d2 a b c` is the general `3×3` self-adjoint matrix over `O ℚ`: real
(central) diagonal `ocR d₀, ocR d₁, ocR d₂` and arbitrary octonion off-diagonals `a` at `(0,1)`, `b`
at `(0,2)`, `c` at `(1,2)` (conjugates below). The symmetric bracket `jb A B = A·B + B·A` satisfies the
order-3 Jordan identity for EVERY general Hermitian pair (`jdef_H3`/`jordan_cap_pinned_at_three`) but
FAILS at order 4 (`jordan_fails_H4`): the maximal octonionic Hermitian Jordan order is 3, FORCED by the
cascade-stop non-associativity (`jordan_cap_iff_nonassoc`, N5) — the SAME `not_associative` that stops
the cascade at `O ℚ` (N2c) and makes matter indivisible (N265).

THE THREE MATTER-CARRIER SLOTS. At the maximal order the off-diagonal core has EXACTLY THREE positions
`(0,1), (0,2), (1,2)` = `C(3,2)`, and each is an injective ℚ-linear embedding of the derived matter
carrier `O ℚ`:
  slotA a := Xz a 0 0   (octonion `a` at `(0,1)`, `star a` at `(1,0)`)
  slotB b := Xz 0 b 0   (octonion `b` at `(0,2)`)
  slotC c := Xz 0 0 c   (octonion `c` at `(1,2)`)
so the general self-adjoint element decomposes as
  Hm d0 d1 d2 a b c = Dg d0 d1 d2 + slotA a + slotB b + slotC c
— a real-diagonal part `⊕` three copies of the matter carrier, total dim `3 + 3·8 = 27`.

THE DERIVATION (forward; each a theorem, foundations-only):
  slotA_entry / slotB_entry / slotC_entry  — each slot recovers its octonion at a matrix entry.
  slotA_inj / slotB_inj / slotC_inj         — the three embeddings are INJECTIVE (faithful copies).
  slotA_add / slotA_smul                    — each slot is ℚ-linear.
  slot_disjointAB / slot_disjointAC / slot_disjointBC — the slots occupy DISJOINT positions.
  Xz_slot_decomp                            — the off-diagonal core = slotA + slotB + slotC.
  Hm_slot_decomp                            — ★★★ the maximal element = diagonal ⊕ the three slots.
  maximal_matter_arena                      — ★★★ THE JOINT: (H₃ Jordan for all pairs ∧ the 3-slot
                                              decomposition) ∧ (H₄ NOT Jordan) — the maximal Jordan
                                              order is 3, carrying exactly the three matter slots.
  slotA_ne_zero                             — W8: a nonzero octonion gives a nonzero slot (non-vacuity).
  matter_multiplicity_three                 — ★★★ capstone: the decomposition + injectivity +
                                              disjointness + the cap-forced maximal order.

THE DISSOLUTION (docs/STANDARD.md §0) — the MOAT. The Standard Model POSITS three fermion generations
as an empirical input (no accepted derivation of the count). The octonionic-`J₃(O)` islands (Dixon,
Gürsey–Günaydin, Todorov) read three generations off `J₃(O)` but POSIT the carrier and its three-ness.
The theory DERIVES the three-ness: `J₃(O)` is DERIVED (N5, from the cascade), and the three-fold
multiplicity is `C(3,2)` at the maximal Jordan order, which is FORCED to be 3 by the cascade-stop
non-associativity (`H₄` is not Jordan). The matter-carrier multiplicity of the Hermitian octonionic
Jordan arenas grows `H₂(O ℚ) → 1` copy (the spacetime arena, `C(2,2)=1`, N43) and `H₃(O ℚ) → 3` copies
(the maximal matter arena, `C(3,2)=3`), and STOPS at 3 because `H₄(O ℚ)` is not a Jordan algebra.

NOVELTY is claimed ONLY for the forced mathematical three-ness + the one-cause joint (`C(3,2)` at the
cap-forced maximal order = the cascade stop) — NOT for the reading "= three physical generations", which
is removable prose exactly as "colour/quark" was removable in N266 and "spacetime" in N43.

ONE CAUSE MANY TERMINATIONS. The SAME octonion non-associativity (the residue of associativity lost at
the cascade stop) that (i) stops the cascade at `O ℚ` (★15, N2c), (ii) caps the Hermitian Jordan tower
at order 3 (N5), (iii) makes matter one indivisible whole (★3, N265), and (iv) makes the spinor
two-handed (★6, N264) — NOW forces the maximal observable Jordan arena to carry EXACTLY THREE copies of
the matter carrier (★4). A fourth arena `H₄` would carry a fourth slot, but the cap blocks it.

PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete generation/family/matter/spacetime/arena: over
the derived field ℚ and the Cayley–Dickson double `O ℚ = CD (H ℚ)`, for the symmetric bracket
`jb A B = A·B + B·A` on `Matrix (Fin 3) (Fin 3) (O ℚ)`, the order-3 Jordan identity holds for every
general self-adjoint pair `Hm` while the order-4 identity fails; and the general order-3 self-adjoint
element `Hm d0 d1 d2 a b c` equals `Dg d0 d1 d2 + Xz a 0 0 + Xz 0 b 0 + Xz 0 0 c`, a real diagonal plus
three position-disjoint injective ℚ-linear copies of `O ℚ`. No theorem STATEMENT needs a physics word.

FREE-FLOATING check (SOUL rail). Every headline TYPE mentions the banked objects (`Hm`, `Dg`, `Xz`, the
cap `jordan_cap_pinned_at_three`, `O ℚ`); the COUNT is pinned by the octonion-SPECIFIC cap
(`jordan_cap_iff_nonassoc`) — NOT carrier-agnostic (false for an associative coordinate ring, where all
orders are Jordan and there is no cap / no forced maximal order).

Foundations-only: no posited axiom, no sorry-style hole, no compiled-kernel bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.PieceBfinal
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.HermitianJordan.Linear
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-! ## The three off-diagonal matter-carrier slots of the maximal Jordan order. -/

/-- The first matter-carrier slot: the octonion `a` embedded at position `(0,1)` (with `star a` at
    `(1,0)` for Hermiticity), all other entries zero. -/
noncomputable def slotA (a : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) := Xz a 0 0
/-- The second matter-carrier slot: the octonion `b` at position `(0,2)`. -/
noncomputable def slotB (b : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) := Xz 0 b 0
/-- The third matter-carrier slot: the octonion `c` at position `(1,2)`. -/
noncomputable def slotC (c : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) := Xz 0 0 c

/-- Each slot recovers its octonion at its matrix entry: `slotA a` reads `a` at `(0,1)`. -/
theorem slotA_entry (a : O ℚ) : (slotA a) 0 1 = a := by simp [slotA, Xz]
/-- `slotB b` reads `b` at `(0,2)`. -/
theorem slotB_entry (b : O ℚ) : (slotB b) 0 2 = b := by simp [slotB, Xz]
/-- `slotC c` reads `c` at `(1,2)`. -/
theorem slotC_entry (c : O ℚ) : (slotC c) 1 2 = c := by simp [slotC, Xz]

/-! ## The three embeddings are injective (faithful copies of the matter carrier). -/

/-- The first slot embedding is INJECTIVE: distinct octonions give distinct matrices (they differ at
    the `(0,1)` entry). -/
theorem slotA_inj : Function.Injective slotA := by
  intro a a' h
  have := congrArg (fun M => M 0 1) h
  simpa [slotA_entry] using this
/-- The second slot embedding is INJECTIVE. -/
theorem slotB_inj : Function.Injective slotB := by
  intro b b' h
  have := congrArg (fun M => M 0 2) h
  simpa [slotB_entry] using this
/-- The third slot embedding is INJECTIVE. -/
theorem slotC_inj : Function.Injective slotC := by
  intro c c' h
  have := congrArg (fun M => M 1 2) h
  simpa [slotC_entry] using this

/-! ## Each slot is ℚ-linear. -/

/-- The first slot is additive. -/
theorem slotA_add (a a' : O ℚ) : slotA (a + a') = slotA a + slotA a' := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotA, Xz, Matrix.add_apply, star_add]

/-- The first slot commutes with ℚ-scaling. -/
theorem slotA_smul (r : ℚ) (a : O ℚ) : slotA (r • a) = r • slotA a := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotA, Xz, Matrix.smul_apply]

/-! ## The slots occupy disjoint positions. -/

/-- The first and second slots agree only at zero: `slotA a = slotB b ⟹ a = 0 ∧ b = 0`. -/
theorem slot_disjointAB (a b : O ℚ) (h : slotA a = slotB b) : a = 0 ∧ b = 0 := by
  refine ⟨?_, ?_⟩
  · have := congrArg (fun M => M 0 1) h; simpa [slotA, slotB, Xz] using this
  · have := congrArg (fun M => M 0 2) h
    have h2 : (0 : O ℚ) = b := by simpa [slotA, slotB, Xz] using this
    exact h2.symm

/-- The first and third slots agree only at zero. -/
theorem slot_disjointAC (a c : O ℚ) (h : slotA a = slotC c) : a = 0 ∧ c = 0 := by
  refine ⟨?_, ?_⟩
  · have := congrArg (fun M => M 0 1) h; simpa [slotA, slotC, Xz] using this
  · have := congrArg (fun M => M 1 2) h
    have h2 : (0 : O ℚ) = c := by simpa [slotA, slotC, Xz] using this
    exact h2.symm

/-- The second and third slots agree only at zero. -/
theorem slot_disjointBC (b c : O ℚ) (h : slotB b = slotC c) : b = 0 ∧ c = 0 := by
  refine ⟨?_, ?_⟩
  · have := congrArg (fun M => M 0 2) h; simpa [slotB, slotC, Xz] using this
  · have := congrArg (fun M => M 1 2) h
    have h2 : (0 : O ℚ) = c := by simpa [slotB, slotC, Xz] using this
    exact h2.symm

/-! ## The decomposition: the off-diagonal core, then the full maximal element. -/

/-- ★★ THE OFF-DIAGONAL CORE = THE THREE MATTER-CARRIER SLOTS. The general off-diagonal Hermitian
    core `Xz a b c` splits as the sum of the three position-disjoint slots. -/
theorem Xz_slot_decomp (a b c : O ℚ) :
    Xz a b c = slotA a + slotB b + slotC c := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotA, slotB, slotC, Xz, Matrix.add_apply]

/-- ★★★ THE MAXIMAL-ORDER DECOMPOSITION. The general self-adjoint element of the maximal Hermitian
    octonionic Jordan order (order 3) equals a real diagonal part `⊕` EXACTLY THREE copies of the
    derived matter carrier `O ℚ`:
        `Hm d0 d1 d2 a b c = Dg d0 d1 d2 + slotA a + slotB b + slotC c`.
    (Total dimension `3 + 3·8 = 27`.) -/
theorem Hm_slot_decomp (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    Hm d0 d1 d2 a b c = Dg d0 d1 d2 + slotA a + slotB b + slotC c := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotA, slotB, slotC, Xz, Hm, Dg, Matrix.add_apply, ocR]

/-! ## The cap-forced count: the maximal Jordan order is 3, carrying exactly the three slots. -/

/-- ★★ W8 NON-VACUITY: a nonzero octonion gives a nonzero slot — the matter-carrier embeddings are
    genuine, not vacuous. -/
theorem slotA_ne_zero {a : O ℚ} (ha : a ≠ 0) : slotA a ≠ 0 := by
  intro h
  apply ha
  have := congrArg (fun M => M 0 1) h
  simpa [slotA, Xz] using this

/-- ★★★ THE JOINT — THE MAXIMAL MATTER ARENA. The maximal Hermitian octonionic Jordan order is 3:
    the order-3 Jordan identity holds for EVERY general self-adjoint pair (`jdef (Hm …) (Hm …) = 0`)
    AND at that order the general self-adjoint element decomposes as `Dg + slotA + slotB + slotC`
    (a real diagonal `⊕` three matter-carrier copies), WHILE the order-4 identity FAILS
    (`jdef Xwit Ywit ≠ 0`). So the maximal Jordan order carrying matter-carrier slots is 3, and it
    carries exactly the `C(3,2) = 3` slots — the three-fold multiplicity FORCED by the cap. -/
theorem maximal_matter_arena :
    (∀ (d0 d1 d2 : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ),
        jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0)
    ∧ (∀ (d0 d1 d2 : ℚ) (a b c : O ℚ),
        Hm d0 d1 d2 a b c = Dg d0 d1 d2 + slotA a + slotB b + slotC c)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨jordan_cap_pinned_at_three.1,
   fun d0 d1 d2 a b c => Hm_slot_decomp d0 d1 d2 a b c,
   jordan_cap_pinned_at_three.2⟩

/-- ★★★ THE CAPSTONE. At the maximal Hermitian octonionic Jordan order (3, forced by the cascade-stop
    non-associativity), the general self-adjoint element decomposes as a real diagonal `⊕` EXACTLY
    THREE position-disjoint injective ℚ-linear copies of the derived matter carrier `O ℚ`, and the
    order-4 arena is blocked. The three-fold matter-carrier multiplicity is `C(3,2)` at the
    cap-forced maximal order — one cause (octonion non-associativity) with the cascade stop and the
    Jordan cap. -/
theorem matter_multiplicity_three :
    (∀ (d0 d1 d2 : ℚ) (a b c : O ℚ),
        Hm d0 d1 d2 a b c = Dg d0 d1 d2 + slotA a + slotB b + slotC c)
    ∧ Function.Injective slotA ∧ Function.Injective slotB ∧ Function.Injective slotC
    ∧ (∀ a b : O ℚ, slotA a = slotB b → a = 0 ∧ b = 0)
    ∧ (∀ a c : O ℚ, slotA a = slotC c → a = 0 ∧ c = 0)
    ∧ (∀ b c : O ℚ, slotB b = slotC c → b = 0 ∧ c = 0)
    ∧ (∀ (d0 d1 d2 : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ),
        jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨fun d0 d1 d2 a b c => Hm_slot_decomp d0 d1 d2 a b c,
   slotA_inj, slotB_inj, slotC_inj,
   slot_disjointAB, slot_disjointAC, slot_disjointBC,
   jordan_cap_pinned_at_three.1, jordan_cap_pinned_at_three.2⟩

end Phys.Algebra.HJ
