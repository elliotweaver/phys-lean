/-
  SCRATCH — N8 part 3 (full): Z = Grothendieck group completion of Re, CommRing.
  Negation = the swap (the fold's reflection). Embedding Re ↪ Z. Negatives witnesses.
-/
import Phys.Foundation.Counting
import Mathlib.Algebra.Ring.Defs
import Mathlib.Tactic

namespace Phys.Foundation
namespace Re
def add : Re → Re → Re
  | a, void    => a
  | a, step b  => step (add a b)
instance : Add Re := ⟨add⟩
@[simp] theorem add_void (a : Re) : a + void = a := rfl
@[simp] theorem add_step (a b : Re) : a + step b = step (a + b) := rfl
@[simp] theorem void_add (a : Re) : void + a = a := by
  induction a with | void => rfl | step k ih => rw [add_step, ih]
theorem step_add (a b : Re) : step a + b = step (a + b) := by
  induction b with | void => rfl | step k ih => rw [add_step, add_step, ih]
protected theorem add_comm (a b : Re) : a + b = b + a := by
  induction b with
  | void => rw [add_void, void_add]
  | step k ih => rw [add_step, step_add, ih]
protected theorem add_assoc (a b c : Re) : a + b + c = a + (b + c) := by
  induction c with | void => rfl | step k ih => rw [add_step, add_step, add_step, ih]
def one : Re := step void
def mul : Re → Re → Re
  | _, void   => void
  | a, step b => mul a b + a
instance : Mul Re := ⟨mul⟩
instance : One Re := ⟨one⟩
instance : Zero Re := ⟨void⟩
@[simp] theorem mul_void (a : Re) : a * void = void := rfl
@[simp] theorem mul_step (a b : Re) : a * step b = a * b + a := rfl
@[simp] theorem void_mul (a : Re) : void * a = void := by
  induction a with | void => rfl | step k ih => rw [mul_step, ih, add_void]
theorem step_mul (a b : Re) : step a * b = a * b + b := by
  induction b with
  | void => rfl
  | step k ih => rw [mul_step, mul_step, ih, add_step, add_step, Re.add_assoc, Re.add_assoc, Re.add_comm a k]
protected theorem left_distrib (a b c : Re) : a * (b + c) = a * b + a * c := by
  induction c with
  | void => rw [add_void, mul_void, add_void]
  | step k ih => rw [add_step, mul_step, mul_step, ih, Re.add_assoc]
protected theorem mul_comm (a b : Re) : a * b = b * a := by
  induction b with | void => rw [mul_void, void_mul] | step k ih => rw [mul_step, step_mul, ih]
protected theorem right_distrib (a b c : Re) : (a + b) * c = a * c + b * c := by
  rw [Re.mul_comm, Re.left_distrib, Re.mul_comm c a, Re.mul_comm c b]
protected theorem mul_assoc (a b c : Re) : a * b * c = a * (b * c) := by
  induction c with
  | void => rw [mul_void, mul_void, mul_void]
  | step k ih => rw [mul_step, mul_step, Re.left_distrib, ih]
protected theorem one_mul (a : Re) : 1 * a = a := by
  show one * a = a; unfold one; rw [step_mul, void_mul, void_add]
protected theorem mul_one (a : Re) : a * 1 = a := by
  show a * one = a; unfold one; rw [mul_step, mul_void, void_add]
instance commSemiring : CommSemiring Re where
  add := add; add_assoc := Re.add_assoc; zero := void; zero_add := void_add
  add_zero := add_void; add_comm := Re.add_comm; mul := mul; mul_assoc := Re.mul_assoc
  one := one; one_mul := Re.one_mul; mul_one := Re.mul_one; left_distrib := Re.left_distrib
  right_distrib := Re.right_distrib; zero_mul := void_mul; mul_zero := mul_void
  mul_comm := Re.mul_comm; nsmul := nsmulRec
theorem add_right_cancel {a b c : Re} (h : a + c = b + c) : a = b := by
  induction c with
  | void => simpa using h
  | step k ih => exact ih (step_inj (by simpa using h))
end Re

def intRel (p q : Re × Re) : Prop := p.1 + q.2 = q.1 + p.2
theorem intRel_refl (p : Re × Re) : intRel p p := rfl
theorem intRel_symm {p q : Re × Re} (h : intRel p q) : intRel q p := h.symm
theorem intRel_trans {p q r : Re × Re} (h1 : intRel p q) (h2 : intRel q r) : intRel p r := by
  unfold intRel at *
  apply Re.add_right_cancel (c := q.1 + q.2)
  calc p.1 + r.2 + (q.1 + q.2)
      = (p.1 + q.2) + (q.1 + r.2) := by ring
    _ = (q.1 + p.2) + (r.1 + q.2) := by rw [h1, h2]
    _ = r.1 + p.2 + (q.1 + q.2) := by ring
instance intSetoid : Setoid (Re × Re) where
  r := intRel
  iseqv := ⟨intRel_refl, intRel_symm, intRel_trans⟩

def Z : Type := Quotient intSetoid
namespace Z
def mk (a b : Re) : Z := Quotient.mk intSetoid (a, b)
theorem sound {a b c d : Re} (h : a + d = c + b) : mk a b = mk c d :=
  Quotient.sound (show intRel _ _ by simpa [intRel] using h)
theorem exact' {a b c d : Re} (h : mk a b = mk c d) : a + d = c + b := Quotient.exact h
@[simp] theorem mk_eq {a b c d : Re} : mk a b = mk c d ↔ a + d = c + b :=
  ⟨exact', sound⟩
@[elab_as_elim] theorem ind {motive : Z → Prop} (h : ∀ a b, motive (mk a b)) : ∀ z, motive z :=
  fun z => Quotient.ind (fun p => h p.1 p.2) z

instance : Zero Z := ⟨mk 0 0⟩
instance : One Z := ⟨mk 1 0⟩
theorem zero_def : (0 : Z) = mk 0 0 := rfl
theorem one_def : (1 : Z) = mk 1 0 := rfl

def add : Z → Z → Z :=
  Quotient.lift₂ (fun p q => mk (p.1 + q.1) (p.2 + q.2))
    (by
      rintro ⟨a, b⟩ ⟨c, d⟩ ⟨a', b'⟩ ⟨c', d'⟩ (h1 : a + b' = a' + b) (h2 : c + d' = c' + d)
      show mk (a + c) (b + d) = mk (a' + c') (b' + d')
      apply sound
      calc a + c + (b' + d') = (a + b') + (c + d') := by ring
        _ = (a' + b) + (c' + d) := by rw [h1, h2]
        _ = a' + c' + (b + d) := by ring)
instance : Add Z := ⟨add⟩
@[simp] theorem mk_add_mk (a b c d : Re) : mk a b + mk c d = mk (a + c) (b + d) := rfl

/-- ★ NEGATION IS THE SWAP — the fold's reflection (N1 `look x = -x`) at counting level. -/
def neg : Z → Z :=
  Quotient.lift (fun p => mk p.2 p.1)
    (by
      rintro ⟨a, b⟩ ⟨c, d⟩ (h : a + d = c + b)
      show mk b a = mk d c
      apply sound
      calc b + c = c + b := by ring
        _ = a + d := h.symm
        _ = d + a := by ring)
instance : Neg Z := ⟨neg⟩
@[simp] theorem neg_mk (a b : Re) : -mk a b = mk b a := rfl

def mul : Z → Z → Z :=
  Quotient.lift₂ (fun p q => mk (p.1 * q.1 + p.2 * q.2) (p.1 * q.2 + p.2 * q.1))
    (by
      rintro ⟨a, b⟩ ⟨c, d⟩ ⟨a', b'⟩ ⟨c', d'⟩ (h1 : a + b' = a' + b) (h2 : c + d' = c' + d)
      show mk (a*c + b*d) (a*d + b*c) = mk (a'*c' + b'*d') (a'*d' + b'*c')
      -- step 1: vary first pair (second fixed at c,d)
      have step1 : mk (a*c + b*d) (a*d + b*c) = mk (a'*c + b'*d) (a'*d + b'*c) := by
        apply sound
        have hL : (a*c + b*d) + (a'*d + b'*c) = (a'+b)*c + (a'+b)*d := by
          rw [show a*c + b*d + (a'*d + b'*c) = (a+b')*c + (a'+b)*d from by ring, h1]
        have hR : (a'*c + b'*d) + (a*d + b*c) = (a'+b)*c + (a'+b)*d := by
          rw [show a'*c + b'*d + (a*d + b*c) = (a'+b)*c + (a+b')*d from by ring, h1]
        exact hL.trans hR.symm
      -- step 2: vary second pair (first fixed at a',b')
      have step2 : mk (a'*c + b'*d) (a'*d + b'*c) = mk (a'*c' + b'*d') (a'*d' + b'*c') := by
        apply sound
        have hL : (a'*c + b'*d) + (a'*d' + b'*c') = a'*(c'+d) + b'*(c'+d) := by
          rw [show a'*c + b'*d + (a'*d' + b'*c') = a'*(c+d') + b'*(c'+d) from by ring, h2]
        have hR : (a'*c' + b'*d') + (a'*d + b'*c) = a'*(c'+d) + b'*(c'+d) := by
          rw [show a'*c' + b'*d' + (a'*d + b'*c) = a'*(c'+d) + b'*(c+d') from by ring, h2]
        exact hL.trans hR.symm
      exact step1.trans step2)
instance : Mul Z := ⟨mul⟩
@[simp] theorem mk_mul_mk (a b c d : Re) :
    mk a b * mk c d = mk (a*c + b*d) (a*d + b*c) := rfl

/-- ★ THE DERIVED INTEGERS CARRY A COMMUTATIVE RING — the additive group closure of
    counting. Negation = the fold's reflection (swap); every re-entry is undoable. -/
instance commRing : CommRing Z where
  add := add
  add_assoc := by
    refine ind fun a b => ind fun c d => ind fun e f => ?_
    show mk a b + mk c d + mk e f = mk a b + (mk c d + mk e f)
    simp only [mk_add_mk]; apply sound; ring
  zero := mk 0 0
  zero_add := by
    refine ind fun a b => ?_
    show mk 0 0 + mk a b = mk a b
    simp only [mk_add_mk]; apply sound; ring
  add_zero := by
    refine ind fun a b => ?_
    show mk a b + mk 0 0 = mk a b
    simp only [mk_add_mk]; apply sound; ring
  add_comm := by
    refine ind fun a b => ind fun c d => ?_
    show mk a b + mk c d = mk c d + mk a b
    simp only [mk_add_mk]; apply sound; ring
  neg := neg
  mul := mul
  left_distrib := by
    refine ind fun a b => ind fun c d => ind fun e f => ?_
    show mk a b * (mk c d + mk e f) = mk a b * mk c d + mk a b * mk e f
    simp only [mk_add_mk, mk_mul_mk]; apply sound; ring
  right_distrib := by
    refine ind fun a b => ind fun c d => ind fun e f => ?_
    show (mk a b + mk c d) * mk e f = mk a b * mk e f + mk c d * mk e f
    simp only [mk_add_mk, mk_mul_mk]; apply sound; ring
  zero_mul := by
    refine ind fun a b => ?_
    show mk 0 0 * mk a b = mk 0 0
    simp only [mk_mul_mk]; apply sound; ring
  mul_zero := by
    refine ind fun a b => ?_
    show mk a b * mk 0 0 = mk 0 0
    simp only [mk_mul_mk]; apply sound; ring
  mul_assoc := by
    refine ind fun a b => ind fun c d => ind fun e f => ?_
    show mk a b * mk c d * mk e f = mk a b * (mk c d * mk e f)
    simp only [mk_mul_mk]; apply sound; ring
  one := mk 1 0
  one_mul := by
    refine ind fun a b => ?_
    show mk 1 0 * mk a b = mk a b
    simp only [mk_mul_mk]; apply sound; ring
  mul_one := by
    refine ind fun a b => ?_
    show mk a b * mk 1 0 = mk a b
    simp only [mk_mul_mk]; apply sound; ring
  neg_add_cancel := by
    refine ind fun a b => ?_
    show -mk a b + mk a b = mk 0 0
    simp only [neg_mk, mk_add_mk]; apply sound; ring
  mul_comm := by
    refine ind fun a b => ind fun c d => ?_
    show mk a b * mk c d = mk c d * mk a b
    simp only [mk_mul_mk]; apply sound; ring
  nsmul := nsmulRec
  zsmul := zsmulRec

/-! ## The embedding Re ↪ Z (ℕ sits inside ℤ) and non-vacuity. -/

/-- THE EMBEDDING: a count `a` is the signed pair `(a, 0)`. -/
def ofRe (a : Re) : Z := mk a 0

@[simp] theorem ofRe_def (a : Re) : ofRe a = mk a 0 := rfl

theorem ofRe_zero : ofRe 0 = 0 := rfl
theorem ofRe_one : ofRe 1 = 1 := rfl

theorem ofRe_add (a b : Re) : ofRe (a + b) = ofRe a + ofRe b := by
  simp only [ofRe, mk_add_mk]; apply sound; ring

theorem ofRe_mul (a b : Re) : ofRe (a * b) = ofRe a * ofRe b := by
  simp only [ofRe, mk_mul_mk]; apply sound; ring

/-- ★ THE EMBEDDING IS INJECTIVE: distinct counts give distinct integers (ℕ ↪ ℤ). -/
theorem ofRe_injective : Function.Injective ofRe := by
  intro a b h
  have : a + 0 = b + 0 := by simpa [ofRe] using exact' h
  simpa using this

/-- ★ Z HAS NEGATIVES Re LACKS: every count has an additive inverse in Z. -/
theorem exists_neg (a : Re) : ∃ z : Z, z + ofRe a = 0 := by
  refine ⟨mk 0 a, ?_⟩
  simp only [ofRe, mk_add_mk]; apply sound; ring

/-- ★ ANTI-VACUITY: `-1` is a genuine NEW element with NO count preimage — Z strictly
    extends Re. (`mk 0 1` is not `ofRe a` for any `a`, since that needs `0 = a + 1`,
    impossible: `step` is never the void.) -/
theorem neg_one_not_ofRe : ¬ ∃ a : Re, ofRe a = mk 0 1 := by
  rintro ⟨a, h⟩
  have hh : a + 1 = 0 + 0 := exact' h
  rw [show ((0 : Re) + 0) = Re.void from rfl,
      show (1 : Re) = Re.step 0 from rfl, Re.add_step] at hh
  exact Re.step_ne_void (a + 0) hh

/-- The new element is exactly the negation (the fold's reflection) of `1`. -/
theorem neg_one_eq : (mk 0 1 : Z) = -1 := by
  show mk 0 1 = -mk 1 0
  rw [neg_mk]

end Z
end Phys.Foundation
