import Phys.Algebra.DerivationStabilizerSplit

/-
  # THE GATHER-COHERENCE CENSUS — the octonion bracketing sign structure, per-triple THEOREMS
  ===========================================================================================
  MANAGER-AS-PROVER NODE (worker retired; owner-directed). PREREG: workbench/mirror-closure/PREREG.md.

  THE OBJECT. For the banked 7 imaginary octonion basis units (u1, e2O..e7O of the derived O ℚ),
  every ordered distinct triple (i,j,k) satisfies EXACTLY ONE of
      (e_i e_j) e_k =  e_i (e_j e_k)     (ASSOCIATING — 42 ordered triples), or
      (e_i e_j) e_k = −(e_i (e_j e_k))   (ANTIPODAL — 168 ordered triples),
  each PROVED from the banked Cayley–Dickson product (the DerivationUpperBound coordinate style).
  The signed census mean is (42 − 168)/210 = −3/5.

  THE LAYERS. (1) the table: 42 ordered products + 7 squares + 3 sign-transport lemmas, each a
  CD-coordinate theorem; (2) 210 coherence theorems by pure rewriting through the table (no deep
  kernel reduction); (3) the census layer: two explicit triple lists, FAITHFULNESS (List.Forall,
  each of the 210 conjuncts discharged by its layer-(2) theorem — the lists are proved, not
  posited), Nodup/distinctness/lengths by decide/rfl, and the mean −3/5 in ℚ by norm_num.

  PHYSICS-WORDS-REMOVABLE: delete gather/coherence/census — pure octonion algebra identities of
  the derived O ℚ plus ℚ arithmetic. NOT free-floating: the units are the banked u1/e2O..e7O;
  every identity is proved against the banked CD instances.

  HONEST GRADE: THEOREM, foundations-only expected. The physical READING (−3/5 × κ as the
  endpoint obstruction 1/(5π); the mirror fixed point) belongs to the directed successor
  MirrorFixedPoint; measured 1/α(0) ≈ 137.036 is REMOVABLE PROSE, in no proof here.
-/

set_option linter.unusedSimpArgs false
set_option maxRecDepth 8000

namespace Phys.Algebra
namespace GatherCoherence
open Phys.Cascade

local macro "cd_prod" : tactic =>
  `(tactic| (ext <;> simp [u1, e2O, e3O, e4O, e5O, e6O, e7O,
    CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]))

/-! ## (1) THE TABLE + sign transport — from the banked CD product. -/

/-- Double negation on the derived octonions (no ring instance needed — coordinates). -/
lemma negnegO (x : O ℚ) : - -x = x := by
  ext <;> simp [CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

/-- Sign transport: negation exits a product on the left. -/
lemma negmulO (x y : O ℚ) : (-x) * y = -(x * y) := by
  ext <;> simp [CD.mul_re, CD.mul_im, CD.neg_re, CD.neg_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im'] <;> ring

/-- Sign transport: negation exits a product on the right. -/
lemma mulnegO (x y : O ℚ) : x * (-y) = -(x * y) := by
  ext <;> simp [CD.mul_re, CD.mul_im, CD.neg_re, CD.neg_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im'] <;> ring

lemma sq0 : u1 * u1 = -1 := by cd_prod
lemma sq1 : e2O * e2O = -1 := by cd_prod
lemma sq2 : e3O * e3O = -1 := by cd_prod
lemma sq3 : e4O * e4O = -1 := by cd_prod
lemma sq4 : e5O * e5O = -1 := by cd_prod
lemma sq5 : e6O * e6O = -1 := by cd_prod
lemma sq6 : e7O * e7O = -1 := by cd_prod

lemma m01 : u1 * e2O = e3O := by cd_prod
lemma m02 : u1 * e3O = -e2O := by cd_prod
lemma m03 : u1 * e4O = e5O := by cd_prod
lemma m04 : u1 * e5O = -e4O := by cd_prod
lemma m05 : u1 * e6O = -e7O := by cd_prod
lemma m06 : u1 * e7O = e6O := by cd_prod
lemma m10 : e2O * u1 = -e3O := by cd_prod
lemma m12 : e2O * e3O = u1 := by cd_prod
lemma m13 : e2O * e4O = e6O := by cd_prod
lemma m14 : e2O * e5O = e7O := by cd_prod
lemma m15 : e2O * e6O = -e4O := by cd_prod
lemma m16 : e2O * e7O = -e5O := by cd_prod
lemma m20 : e3O * u1 = e2O := by cd_prod
lemma m21 : e3O * e2O = -u1 := by cd_prod
lemma m23 : e3O * e4O = e7O := by cd_prod
lemma m24 : e3O * e5O = -e6O := by cd_prod
lemma m25 : e3O * e6O = e5O := by cd_prod
lemma m26 : e3O * e7O = -e4O := by cd_prod
lemma m30 : e4O * u1 = -e5O := by cd_prod
lemma m31 : e4O * e2O = -e6O := by cd_prod
lemma m32 : e4O * e3O = -e7O := by cd_prod
lemma m34 : e4O * e5O = u1 := by cd_prod
lemma m35 : e4O * e6O = e2O := by cd_prod
lemma m36 : e4O * e7O = e3O := by cd_prod
lemma m40 : e5O * u1 = e4O := by cd_prod
lemma m41 : e5O * e2O = -e7O := by cd_prod
lemma m42 : e5O * e3O = e6O := by cd_prod
lemma m43 : e5O * e4O = -u1 := by cd_prod
lemma m45 : e5O * e6O = -e3O := by cd_prod
lemma m46 : e5O * e7O = e2O := by cd_prod
lemma m50 : e6O * u1 = e7O := by cd_prod
lemma m51 : e6O * e2O = e4O := by cd_prod
lemma m52 : e6O * e3O = -e5O := by cd_prod
lemma m53 : e6O * e4O = -e2O := by cd_prod
lemma m54 : e6O * e5O = e3O := by cd_prod
lemma m56 : e6O * e7O = -u1 := by cd_prod
lemma m60 : e7O * u1 = -e6O := by cd_prod
lemma m61 : e7O * e2O = e5O := by cd_prod
lemma m62 : e7O * e3O = e4O := by cd_prod
lemma m63 : e7O * e4O = -e3O := by cd_prod
lemma m64 : e7O * e5O = -e2O := by cd_prod
lemma m65 : e7O * e6O = u1 := by cd_prod

/-! ## (2) THE 210 COHERENCE THEOREMS — pure rewriting through the table. -/

lemma c012 : (u1 * e2O) * e3O = u1 * (e2O * e3O) := by simp only [m01, m12, sq2, sq0, negmulO, mulnegO, negnegO]
lemma c013 : (u1 * e2O) * e4O = -(u1 * (e2O * e4O)) := by simp only [m01, m13, m23, m05, negmulO, mulnegO, negnegO]
lemma c014 : (u1 * e2O) * e5O = -(u1 * (e2O * e5O)) := by simp only [m01, m14, m24, m06, negmulO, mulnegO, negnegO]
lemma c015 : (u1 * e2O) * e6O = -(u1 * (e2O * e6O)) := by simp only [m01, m15, m25, m03, negmulO, mulnegO, negnegO]
lemma c016 : (u1 * e2O) * e7O = -(u1 * (e2O * e7O)) := by simp only [m01, m16, m26, m04, negmulO, mulnegO, negnegO]
lemma c021 : (u1 * e3O) * e2O = u1 * (e3O * e2O) := by simp only [m02, m21, sq1, sq0, negmulO, mulnegO, negnegO]
lemma c023 : (u1 * e3O) * e4O = -(u1 * (e3O * e4O)) := by simp only [m02, m23, m13, m06, negmulO, mulnegO, negnegO]
lemma c024 : (u1 * e3O) * e5O = -(u1 * (e3O * e5O)) := by simp only [m02, m24, m14, m05, negmulO, mulnegO, negnegO]
lemma c025 : (u1 * e3O) * e6O = -(u1 * (e3O * e6O)) := by simp only [m02, m25, m15, m04, negmulO, mulnegO, negnegO]
lemma c026 : (u1 * e3O) * e7O = -(u1 * (e3O * e7O)) := by simp only [m02, m26, m16, m03, negmulO, mulnegO, negnegO]
lemma c031 : (u1 * e4O) * e2O = -(u1 * (e4O * e2O)) := by simp only [m03, m31, m41, m05, negmulO, mulnegO, negnegO]
lemma c032 : (u1 * e4O) * e3O = -(u1 * (e4O * e3O)) := by simp only [m03, m32, m42, m06, negmulO, mulnegO, negnegO]
lemma c034 : (u1 * e4O) * e5O = u1 * (e4O * e5O) := by simp only [m03, m34, sq4, sq0, negmulO, mulnegO, negnegO]
lemma c035 : (u1 * e4O) * e6O = -(u1 * (e4O * e6O)) := by simp only [m03, m35, m45, m01, negmulO, mulnegO, negnegO]
lemma c036 : (u1 * e4O) * e7O = -(u1 * (e4O * e7O)) := by simp only [m03, m36, m46, m02, negmulO, mulnegO, negnegO]
lemma c041 : (u1 * e5O) * e2O = -(u1 * (e5O * e2O)) := by simp only [m04, m41, m31, m06, negmulO, mulnegO, negnegO]
lemma c042 : (u1 * e5O) * e3O = -(u1 * (e5O * e3O)) := by simp only [m04, m42, m32, m05, negmulO, mulnegO, negnegO]
lemma c043 : (u1 * e5O) * e4O = u1 * (e5O * e4O) := by simp only [m04, m43, sq3, sq0, negmulO, mulnegO, negnegO]
lemma c045 : (u1 * e5O) * e6O = -(u1 * (e5O * e6O)) := by simp only [m04, m45, m35, m02, negmulO, mulnegO, negnegO]
lemma c046 : (u1 * e5O) * e7O = -(u1 * (e5O * e7O)) := by simp only [m04, m46, m36, m01, negmulO, mulnegO, negnegO]
lemma c051 : (u1 * e6O) * e2O = -(u1 * (e6O * e2O)) := by simp only [m05, m51, m61, m03, negmulO, mulnegO, negnegO]
lemma c052 : (u1 * e6O) * e3O = -(u1 * (e6O * e3O)) := by simp only [m05, m52, m62, m04, negmulO, mulnegO, negnegO]
lemma c053 : (u1 * e6O) * e4O = -(u1 * (e6O * e4O)) := by simp only [m05, m53, m63, m01, negmulO, mulnegO, negnegO]
lemma c054 : (u1 * e6O) * e5O = -(u1 * (e6O * e5O)) := by simp only [m05, m54, m64, m02, negmulO, mulnegO, negnegO]
lemma c056 : (u1 * e6O) * e7O = u1 * (e6O * e7O) := by simp only [m05, m56, sq6, sq0, negmulO, mulnegO, negnegO]
lemma c061 : (u1 * e7O) * e2O = -(u1 * (e7O * e2O)) := by simp only [m06, m61, m51, m04, negmulO, mulnegO, negnegO]
lemma c062 : (u1 * e7O) * e3O = -(u1 * (e7O * e3O)) := by simp only [m06, m62, m52, m03, negmulO, mulnegO, negnegO]
lemma c063 : (u1 * e7O) * e4O = -(u1 * (e7O * e4O)) := by simp only [m06, m63, m53, m02, negmulO, mulnegO, negnegO]
lemma c064 : (u1 * e7O) * e5O = -(u1 * (e7O * e5O)) := by simp only [m06, m64, m54, m01, negmulO, mulnegO, negnegO]
lemma c065 : (u1 * e7O) * e6O = u1 * (e7O * e6O) := by simp only [m06, m65, sq5, sq0, negmulO, mulnegO, negnegO]
lemma c102 : (e2O * u1) * e3O = e2O * (u1 * e3O) := by simp only [m10, m02, sq2, sq1, negmulO, mulnegO, negnegO]
lemma c103 : (e2O * u1) * e4O = -(e2O * (u1 * e4O)) := by simp only [m10, m03, m23, m14, negmulO, mulnegO, negnegO]
lemma c104 : (e2O * u1) * e5O = -(e2O * (u1 * e5O)) := by simp only [m10, m04, m24, m13, negmulO, mulnegO, negnegO]
lemma c105 : (e2O * u1) * e6O = -(e2O * (u1 * e6O)) := by simp only [m10, m05, m25, m16, negmulO, mulnegO, negnegO]
lemma c106 : (e2O * u1) * e7O = -(e2O * (u1 * e7O)) := by simp only [m10, m06, m26, m15, negmulO, mulnegO, negnegO]
lemma c120 : (e2O * e3O) * u1 = e2O * (e3O * u1) := by simp only [m12, m20, sq0, sq1, negmulO, mulnegO, negnegO]
lemma c123 : (e2O * e3O) * e4O = -(e2O * (e3O * e4O)) := by simp only [m12, m23, m03, m16, negmulO, mulnegO, negnegO]
lemma c124 : (e2O * e3O) * e5O = -(e2O * (e3O * e5O)) := by simp only [m12, m24, m04, m15, negmulO, mulnegO, negnegO]
lemma c125 : (e2O * e3O) * e6O = -(e2O * (e3O * e6O)) := by simp only [m12, m25, m05, m14, negmulO, mulnegO, negnegO]
lemma c126 : (e2O * e3O) * e7O = -(e2O * (e3O * e7O)) := by simp only [m12, m26, m06, m13, negmulO, mulnegO, negnegO]
lemma c130 : (e2O * e4O) * u1 = -(e2O * (e4O * u1)) := by simp only [m13, m30, m50, m14, negmulO, mulnegO, negnegO]
lemma c132 : (e2O * e4O) * e3O = -(e2O * (e4O * e3O)) := by simp only [m13, m32, m52, m16, negmulO, mulnegO, negnegO]
lemma c134 : (e2O * e4O) * e5O = -(e2O * (e4O * e5O)) := by simp only [m13, m34, m54, m10, negmulO, mulnegO, negnegO]
lemma c135 : (e2O * e4O) * e6O = e2O * (e4O * e6O) := by simp only [m13, m35, sq5, sq1, negmulO, mulnegO, negnegO]
lemma c136 : (e2O * e4O) * e7O = -(e2O * (e4O * e7O)) := by simp only [m13, m36, m56, m12, negmulO, mulnegO, negnegO]
lemma c140 : (e2O * e5O) * u1 = -(e2O * (e5O * u1)) := by simp only [m14, m40, m60, m13, negmulO, mulnegO, negnegO]
lemma c142 : (e2O * e5O) * e3O = -(e2O * (e5O * e3O)) := by simp only [m14, m42, m62, m15, negmulO, mulnegO, negnegO]
lemma c143 : (e2O * e5O) * e4O = -(e2O * (e5O * e4O)) := by simp only [m14, m43, m63, m10, negmulO, mulnegO, negnegO]
lemma c145 : (e2O * e5O) * e6O = -(e2O * (e5O * e6O)) := by simp only [m14, m45, m65, m12, negmulO, mulnegO, negnegO]
lemma c146 : (e2O * e5O) * e7O = e2O * (e5O * e7O) := by simp only [m14, m46, sq6, sq1, negmulO, mulnegO, negnegO]
lemma c150 : (e2O * e6O) * u1 = -(e2O * (e6O * u1)) := by simp only [m15, m50, m30, m16, negmulO, mulnegO, negnegO]
lemma c152 : (e2O * e6O) * e3O = -(e2O * (e6O * e3O)) := by simp only [m15, m52, m32, m14, negmulO, mulnegO, negnegO]
lemma c153 : (e2O * e6O) * e4O = e2O * (e6O * e4O) := by simp only [m15, m53, sq3, sq1, negmulO, mulnegO, negnegO]
lemma c154 : (e2O * e6O) * e5O = -(e2O * (e6O * e5O)) := by simp only [m15, m54, m34, m12, negmulO, mulnegO, negnegO]
lemma c156 : (e2O * e6O) * e7O = -(e2O * (e6O * e7O)) := by simp only [m15, m56, m36, m10, negmulO, mulnegO, negnegO]
lemma c160 : (e2O * e7O) * u1 = -(e2O * (e7O * u1)) := by simp only [m16, m60, m40, m15, negmulO, mulnegO, negnegO]
lemma c162 : (e2O * e7O) * e3O = -(e2O * (e7O * e3O)) := by simp only [m16, m62, m42, m13, negmulO, mulnegO, negnegO]
lemma c163 : (e2O * e7O) * e4O = -(e2O * (e7O * e4O)) := by simp only [m16, m63, m43, m12, negmulO, mulnegO, negnegO]
lemma c164 : (e2O * e7O) * e5O = e2O * (e7O * e5O) := by simp only [m16, m64, sq4, sq1, negmulO, mulnegO, negnegO]
lemma c165 : (e2O * e7O) * e6O = -(e2O * (e7O * e6O)) := by simp only [m16, m65, m45, m10, negmulO, mulnegO, negnegO]
lemma c201 : (e3O * u1) * e2O = e3O * (u1 * e2O) := by simp only [m20, m01, sq1, sq2, negmulO, mulnegO, negnegO]
lemma c203 : (e3O * u1) * e4O = -(e3O * (u1 * e4O)) := by simp only [m20, m03, m13, m24, negmulO, mulnegO, negnegO]
lemma c204 : (e3O * u1) * e5O = -(e3O * (u1 * e5O)) := by simp only [m20, m04, m14, m23, negmulO, mulnegO, negnegO]
lemma c205 : (e3O * u1) * e6O = -(e3O * (u1 * e6O)) := by simp only [m20, m05, m15, m26, negmulO, mulnegO, negnegO]
lemma c206 : (e3O * u1) * e7O = -(e3O * (u1 * e7O)) := by simp only [m20, m06, m16, m25, negmulO, mulnegO, negnegO]
lemma c210 : (e3O * e2O) * u1 = e3O * (e2O * u1) := by simp only [m21, m10, sq0, sq2, negmulO, mulnegO, negnegO]
lemma c213 : (e3O * e2O) * e4O = -(e3O * (e2O * e4O)) := by simp only [m21, m13, m03, m25, negmulO, mulnegO, negnegO]
lemma c214 : (e3O * e2O) * e5O = -(e3O * (e2O * e5O)) := by simp only [m21, m14, m04, m26, negmulO, mulnegO, negnegO]
lemma c215 : (e3O * e2O) * e6O = -(e3O * (e2O * e6O)) := by simp only [m21, m15, m05, m23, negmulO, mulnegO, negnegO]
lemma c216 : (e3O * e2O) * e7O = -(e3O * (e2O * e7O)) := by simp only [m21, m16, m06, m24, negmulO, mulnegO, negnegO]
lemma c230 : (e3O * e4O) * u1 = -(e3O * (e4O * u1)) := by simp only [m23, m30, m60, m24, negmulO, mulnegO, negnegO]
lemma c231 : (e3O * e4O) * e2O = -(e3O * (e4O * e2O)) := by simp only [m23, m31, m61, m25, negmulO, mulnegO, negnegO]
lemma c234 : (e3O * e4O) * e5O = -(e3O * (e4O * e5O)) := by simp only [m23, m34, m64, m20, negmulO, mulnegO, negnegO]
lemma c235 : (e3O * e4O) * e6O = -(e3O * (e4O * e6O)) := by simp only [m23, m35, m65, m21, negmulO, mulnegO, negnegO]
lemma c236 : (e3O * e4O) * e7O = e3O * (e4O * e7O) := by simp only [m23, m36, sq6, sq2, negmulO, mulnegO, negnegO]
lemma c240 : (e3O * e5O) * u1 = -(e3O * (e5O * u1)) := by simp only [m24, m40, m50, m23, negmulO, mulnegO, negnegO]
lemma c241 : (e3O * e5O) * e2O = -(e3O * (e5O * e2O)) := by simp only [m24, m41, m51, m26, negmulO, mulnegO, negnegO]
lemma c243 : (e3O * e5O) * e4O = -(e3O * (e5O * e4O)) := by simp only [m24, m43, m53, m20, negmulO, mulnegO, negnegO]
lemma c245 : (e3O * e5O) * e6O = e3O * (e5O * e6O) := by simp only [m24, m45, sq5, sq2, negmulO, mulnegO, negnegO]
lemma c246 : (e3O * e5O) * e7O = -(e3O * (e5O * e7O)) := by simp only [m24, m46, m56, m21, negmulO, mulnegO, negnegO]
lemma c250 : (e3O * e6O) * u1 = -(e3O * (e6O * u1)) := by simp only [m25, m50, m40, m26, negmulO, mulnegO, negnegO]
lemma c251 : (e3O * e6O) * e2O = -(e3O * (e6O * e2O)) := by simp only [m25, m51, m41, m23, negmulO, mulnegO, negnegO]
lemma c253 : (e3O * e6O) * e4O = -(e3O * (e6O * e4O)) := by simp only [m25, m53, m43, m21, negmulO, mulnegO, negnegO]
lemma c254 : (e3O * e6O) * e5O = e3O * (e6O * e5O) := by simp only [m25, m54, sq4, sq2, negmulO, mulnegO, negnegO]
lemma c256 : (e3O * e6O) * e7O = -(e3O * (e6O * e7O)) := by simp only [m25, m56, m46, m20, negmulO, mulnegO, negnegO]
lemma c260 : (e3O * e7O) * u1 = -(e3O * (e7O * u1)) := by simp only [m26, m60, m30, m25, negmulO, mulnegO, negnegO]
lemma c261 : (e3O * e7O) * e2O = -(e3O * (e7O * e2O)) := by simp only [m26, m61, m31, m24, negmulO, mulnegO, negnegO]
lemma c263 : (e3O * e7O) * e4O = e3O * (e7O * e4O) := by simp only [m26, m63, sq3, sq2, negmulO, mulnegO, negnegO]
lemma c264 : (e3O * e7O) * e5O = -(e3O * (e7O * e5O)) := by simp only [m26, m64, m34, m21, negmulO, mulnegO, negnegO]
lemma c265 : (e3O * e7O) * e6O = -(e3O * (e7O * e6O)) := by simp only [m26, m65, m35, m20, negmulO, mulnegO, negnegO]
lemma c301 : (e4O * u1) * e2O = -(e4O * (u1 * e2O)) := by simp only [m30, m01, m41, m32, negmulO, mulnegO, negnegO]
lemma c302 : (e4O * u1) * e3O = -(e4O * (u1 * e3O)) := by simp only [m30, m02, m42, m31, negmulO, mulnegO, negnegO]
lemma c304 : (e4O * u1) * e5O = e4O * (u1 * e5O) := by simp only [m30, m04, sq4, sq3, negmulO, mulnegO, negnegO]
lemma c305 : (e4O * u1) * e6O = -(e4O * (u1 * e6O)) := by simp only [m30, m05, m45, m36, negmulO, mulnegO, negnegO]
lemma c306 : (e4O * u1) * e7O = -(e4O * (u1 * e7O)) := by simp only [m30, m06, m46, m35, negmulO, mulnegO, negnegO]
lemma c310 : (e4O * e2O) * u1 = -(e4O * (e2O * u1)) := by simp only [m31, m10, m50, m32, negmulO, mulnegO, negnegO]
lemma c312 : (e4O * e2O) * e3O = -(e4O * (e2O * e3O)) := by simp only [m31, m12, m52, m30, negmulO, mulnegO, negnegO]
lemma c314 : (e4O * e2O) * e5O = -(e4O * (e2O * e5O)) := by simp only [m31, m14, m54, m36, negmulO, mulnegO, negnegO]
lemma c315 : (e4O * e2O) * e6O = e4O * (e2O * e6O) := by simp only [m31, m15, sq5, sq3, negmulO, mulnegO, negnegO]
lemma c316 : (e4O * e2O) * e7O = -(e4O * (e2O * e7O)) := by simp only [m31, m16, m56, m34, negmulO, mulnegO, negnegO]
lemma c320 : (e4O * e3O) * u1 = -(e4O * (e3O * u1)) := by simp only [m32, m20, m60, m31, negmulO, mulnegO, negnegO]
lemma c321 : (e4O * e3O) * e2O = -(e4O * (e3O * e2O)) := by simp only [m32, m21, m61, m30, negmulO, mulnegO, negnegO]
lemma c324 : (e4O * e3O) * e5O = -(e4O * (e3O * e5O)) := by simp only [m32, m24, m64, m35, negmulO, mulnegO, negnegO]
lemma c325 : (e4O * e3O) * e6O = -(e4O * (e3O * e6O)) := by simp only [m32, m25, m65, m34, negmulO, mulnegO, negnegO]
lemma c326 : (e4O * e3O) * e7O = e4O * (e3O * e7O) := by simp only [m32, m26, sq6, sq3, negmulO, mulnegO, negnegO]
lemma c340 : (e4O * e5O) * u1 = e4O * (e5O * u1) := by simp only [m34, m40, sq0, sq3, negmulO, mulnegO, negnegO]
lemma c341 : (e4O * e5O) * e2O = -(e4O * (e5O * e2O)) := by simp only [m34, m41, m01, m36, negmulO, mulnegO, negnegO]
lemma c342 : (e4O * e5O) * e3O = -(e4O * (e5O * e3O)) := by simp only [m34, m42, m02, m35, negmulO, mulnegO, negnegO]
lemma c345 : (e4O * e5O) * e6O = -(e4O * (e5O * e6O)) := by simp only [m34, m45, m05, m32, negmulO, mulnegO, negnegO]
lemma c346 : (e4O * e5O) * e7O = -(e4O * (e5O * e7O)) := by simp only [m34, m46, m06, m31, negmulO, mulnegO, negnegO]
lemma c350 : (e4O * e6O) * u1 = -(e4O * (e6O * u1)) := by simp only [m35, m50, m10, m36, negmulO, mulnegO, negnegO]
lemma c351 : (e4O * e6O) * e2O = e4O * (e6O * e2O) := by simp only [m35, m51, sq1, sq3, negmulO, mulnegO, negnegO]
lemma c352 : (e4O * e6O) * e3O = -(e4O * (e6O * e3O)) := by simp only [m35, m52, m12, m34, negmulO, mulnegO, negnegO]
lemma c354 : (e4O * e6O) * e5O = -(e4O * (e6O * e5O)) := by simp only [m35, m54, m14, m32, negmulO, mulnegO, negnegO]
lemma c356 : (e4O * e6O) * e7O = -(e4O * (e6O * e7O)) := by simp only [m35, m56, m16, m30, negmulO, mulnegO, negnegO]
lemma c360 : (e4O * e7O) * u1 = -(e4O * (e7O * u1)) := by simp only [m36, m60, m20, m35, negmulO, mulnegO, negnegO]
lemma c361 : (e4O * e7O) * e2O = -(e4O * (e7O * e2O)) := by simp only [m36, m61, m21, m34, negmulO, mulnegO, negnegO]
lemma c362 : (e4O * e7O) * e3O = e4O * (e7O * e3O) := by simp only [m36, m62, sq2, sq3, negmulO, mulnegO, negnegO]
lemma c364 : (e4O * e7O) * e5O = -(e4O * (e7O * e5O)) := by simp only [m36, m64, m24, m31, negmulO, mulnegO, negnegO]
lemma c365 : (e4O * e7O) * e6O = -(e4O * (e7O * e6O)) := by simp only [m36, m65, m25, m30, negmulO, mulnegO, negnegO]
lemma c401 : (e5O * u1) * e2O = -(e5O * (u1 * e2O)) := by simp only [m40, m01, m31, m42, negmulO, mulnegO, negnegO]
lemma c402 : (e5O * u1) * e3O = -(e5O * (u1 * e3O)) := by simp only [m40, m02, m32, m41, negmulO, mulnegO, negnegO]
lemma c403 : (e5O * u1) * e4O = e5O * (u1 * e4O) := by simp only [m40, m03, sq3, sq4, negmulO, mulnegO, negnegO]
lemma c405 : (e5O * u1) * e6O = -(e5O * (u1 * e6O)) := by simp only [m40, m05, m35, m46, negmulO, mulnegO, negnegO]
lemma c406 : (e5O * u1) * e7O = -(e5O * (u1 * e7O)) := by simp only [m40, m06, m36, m45, negmulO, mulnegO, negnegO]
lemma c410 : (e5O * e2O) * u1 = -(e5O * (e2O * u1)) := by simp only [m41, m10, m60, m42, negmulO, mulnegO, negnegO]
lemma c412 : (e5O * e2O) * e3O = -(e5O * (e2O * e3O)) := by simp only [m41, m12, m62, m40, negmulO, mulnegO, negnegO]
lemma c413 : (e5O * e2O) * e4O = -(e5O * (e2O * e4O)) := by simp only [m41, m13, m63, m45, negmulO, mulnegO, negnegO]
lemma c415 : (e5O * e2O) * e6O = -(e5O * (e2O * e6O)) := by simp only [m41, m15, m65, m43, negmulO, mulnegO, negnegO]
lemma c416 : (e5O * e2O) * e7O = e5O * (e2O * e7O) := by simp only [m41, m16, sq6, sq4, negmulO, mulnegO, negnegO]
lemma c420 : (e5O * e3O) * u1 = -(e5O * (e3O * u1)) := by simp only [m42, m20, m50, m41, negmulO, mulnegO, negnegO]
lemma c421 : (e5O * e3O) * e2O = -(e5O * (e3O * e2O)) := by simp only [m42, m21, m51, m40, negmulO, mulnegO, negnegO]
lemma c423 : (e5O * e3O) * e4O = -(e5O * (e3O * e4O)) := by simp only [m42, m23, m53, m46, negmulO, mulnegO, negnegO]
lemma c425 : (e5O * e3O) * e6O = e5O * (e3O * e6O) := by simp only [m42, m25, sq5, sq4, negmulO, mulnegO, negnegO]
lemma c426 : (e5O * e3O) * e7O = -(e5O * (e3O * e7O)) := by simp only [m42, m26, m56, m43, negmulO, mulnegO, negnegO]
lemma c430 : (e5O * e4O) * u1 = e5O * (e4O * u1) := by simp only [m43, m30, sq0, sq4, negmulO, mulnegO, negnegO]
lemma c431 : (e5O * e4O) * e2O = -(e5O * (e4O * e2O)) := by simp only [m43, m31, m01, m45, negmulO, mulnegO, negnegO]
lemma c432 : (e5O * e4O) * e3O = -(e5O * (e4O * e3O)) := by simp only [m43, m32, m02, m46, negmulO, mulnegO, negnegO]
lemma c435 : (e5O * e4O) * e6O = -(e5O * (e4O * e6O)) := by simp only [m43, m35, m05, m41, negmulO, mulnegO, negnegO]
lemma c436 : (e5O * e4O) * e7O = -(e5O * (e4O * e7O)) := by simp only [m43, m36, m06, m42, negmulO, mulnegO, negnegO]
lemma c450 : (e5O * e6O) * u1 = -(e5O * (e6O * u1)) := by simp only [m45, m50, m20, m46, negmulO, mulnegO, negnegO]
lemma c451 : (e5O * e6O) * e2O = -(e5O * (e6O * e2O)) := by simp only [m45, m51, m21, m43, negmulO, mulnegO, negnegO]
lemma c452 : (e5O * e6O) * e3O = e5O * (e6O * e3O) := by simp only [m45, m52, sq2, sq4, negmulO, mulnegO, negnegO]
lemma c453 : (e5O * e6O) * e4O = -(e5O * (e6O * e4O)) := by simp only [m45, m53, m23, m41, negmulO, mulnegO, negnegO]
lemma c456 : (e5O * e6O) * e7O = -(e5O * (e6O * e7O)) := by simp only [m45, m56, m26, m40, negmulO, mulnegO, negnegO]
lemma c460 : (e5O * e7O) * u1 = -(e5O * (e7O * u1)) := by simp only [m46, m60, m10, m45, negmulO, mulnegO, negnegO]
lemma c461 : (e5O * e7O) * e2O = e5O * (e7O * e2O) := by simp only [m46, m61, sq1, sq4, negmulO, mulnegO, negnegO]
lemma c462 : (e5O * e7O) * e3O = -(e5O * (e7O * e3O)) := by simp only [m46, m62, m12, m43, negmulO, mulnegO, negnegO]
lemma c463 : (e5O * e7O) * e4O = -(e5O * (e7O * e4O)) := by simp only [m46, m63, m13, m42, negmulO, mulnegO, negnegO]
lemma c465 : (e5O * e7O) * e6O = -(e5O * (e7O * e6O)) := by simp only [m46, m65, m15, m40, negmulO, mulnegO, negnegO]
lemma c501 : (e6O * u1) * e2O = -(e6O * (u1 * e2O)) := by simp only [m50, m01, m61, m52, negmulO, mulnegO, negnegO]
lemma c502 : (e6O * u1) * e3O = -(e6O * (u1 * e3O)) := by simp only [m50, m02, m62, m51, negmulO, mulnegO, negnegO]
lemma c503 : (e6O * u1) * e4O = -(e6O * (u1 * e4O)) := by simp only [m50, m03, m63, m54, negmulO, mulnegO, negnegO]
lemma c504 : (e6O * u1) * e5O = -(e6O * (u1 * e5O)) := by simp only [m50, m04, m64, m53, negmulO, mulnegO, negnegO]
lemma c506 : (e6O * u1) * e7O = e6O * (u1 * e7O) := by simp only [m50, m06, sq6, sq5, negmulO, mulnegO, negnegO]
lemma c510 : (e6O * e2O) * u1 = -(e6O * (e2O * u1)) := by simp only [m51, m10, m30, m52, negmulO, mulnegO, negnegO]
lemma c512 : (e6O * e2O) * e3O = -(e6O * (e2O * e3O)) := by simp only [m51, m12, m32, m50, negmulO, mulnegO, negnegO]
lemma c513 : (e6O * e2O) * e4O = e6O * (e2O * e4O) := by simp only [m51, m13, sq3, sq5, negmulO, mulnegO, negnegO]
lemma c514 : (e6O * e2O) * e5O = -(e6O * (e2O * e5O)) := by simp only [m51, m14, m34, m56, negmulO, mulnegO, negnegO]
lemma c516 : (e6O * e2O) * e7O = -(e6O * (e2O * e7O)) := by simp only [m51, m16, m36, m54, negmulO, mulnegO, negnegO]
lemma c520 : (e6O * e3O) * u1 = -(e6O * (e3O * u1)) := by simp only [m52, m20, m40, m51, negmulO, mulnegO, negnegO]
lemma c521 : (e6O * e3O) * e2O = -(e6O * (e3O * e2O)) := by simp only [m52, m21, m41, m50, negmulO, mulnegO, negnegO]
lemma c523 : (e6O * e3O) * e4O = -(e6O * (e3O * e4O)) := by simp only [m52, m23, m43, m56, negmulO, mulnegO, negnegO]
lemma c524 : (e6O * e3O) * e5O = e6O * (e3O * e5O) := by simp only [m52, m24, sq4, sq5, negmulO, mulnegO, negnegO]
lemma c526 : (e6O * e3O) * e7O = -(e6O * (e3O * e7O)) := by simp only [m52, m26, m46, m53, negmulO, mulnegO, negnegO]
lemma c530 : (e6O * e4O) * u1 = -(e6O * (e4O * u1)) := by simp only [m53, m30, m10, m54, negmulO, mulnegO, negnegO]
lemma c531 : (e6O * e4O) * e2O = e6O * (e4O * e2O) := by simp only [m53, m31, sq1, sq5, negmulO, mulnegO, negnegO]
lemma c532 : (e6O * e4O) * e3O = -(e6O * (e4O * e3O)) := by simp only [m53, m32, m12, m56, negmulO, mulnegO, negnegO]
lemma c534 : (e6O * e4O) * e5O = -(e6O * (e4O * e5O)) := by simp only [m53, m34, m14, m50, negmulO, mulnegO, negnegO]
lemma c536 : (e6O * e4O) * e7O = -(e6O * (e4O * e7O)) := by simp only [m53, m36, m16, m52, negmulO, mulnegO, negnegO]
lemma c540 : (e6O * e5O) * u1 = -(e6O * (e5O * u1)) := by simp only [m54, m40, m20, m53, negmulO, mulnegO, negnegO]
lemma c541 : (e6O * e5O) * e2O = -(e6O * (e5O * e2O)) := by simp only [m54, m41, m21, m56, negmulO, mulnegO, negnegO]
lemma c542 : (e6O * e5O) * e3O = e6O * (e5O * e3O) := by simp only [m54, m42, sq2, sq5, negmulO, mulnegO, negnegO]
lemma c543 : (e6O * e5O) * e4O = -(e6O * (e5O * e4O)) := by simp only [m54, m43, m23, m50, negmulO, mulnegO, negnegO]
lemma c546 : (e6O * e5O) * e7O = -(e6O * (e5O * e7O)) := by simp only [m54, m46, m26, m51, negmulO, mulnegO, negnegO]
lemma c560 : (e6O * e7O) * u1 = e6O * (e7O * u1) := by simp only [m56, m60, sq0, sq5, negmulO, mulnegO, negnegO]
lemma c561 : (e6O * e7O) * e2O = -(e6O * (e7O * e2O)) := by simp only [m56, m61, m01, m54, negmulO, mulnegO, negnegO]
lemma c562 : (e6O * e7O) * e3O = -(e6O * (e7O * e3O)) := by simp only [m56, m62, m02, m53, negmulO, mulnegO, negnegO]
lemma c563 : (e6O * e7O) * e4O = -(e6O * (e7O * e4O)) := by simp only [m56, m63, m03, m52, negmulO, mulnegO, negnegO]
lemma c564 : (e6O * e7O) * e5O = -(e6O * (e7O * e5O)) := by simp only [m56, m64, m04, m51, negmulO, mulnegO, negnegO]
lemma c601 : (e7O * u1) * e2O = -(e7O * (u1 * e2O)) := by simp only [m60, m01, m51, m62, negmulO, mulnegO, negnegO]
lemma c602 : (e7O * u1) * e3O = -(e7O * (u1 * e3O)) := by simp only [m60, m02, m52, m61, negmulO, mulnegO, negnegO]
lemma c603 : (e7O * u1) * e4O = -(e7O * (u1 * e4O)) := by simp only [m60, m03, m53, m64, negmulO, mulnegO, negnegO]
lemma c604 : (e7O * u1) * e5O = -(e7O * (u1 * e5O)) := by simp only [m60, m04, m54, m63, negmulO, mulnegO, negnegO]
lemma c605 : (e7O * u1) * e6O = e7O * (u1 * e6O) := by simp only [m60, m05, sq5, sq6, negmulO, mulnegO, negnegO]
lemma c610 : (e7O * e2O) * u1 = -(e7O * (e2O * u1)) := by simp only [m61, m10, m40, m62, negmulO, mulnegO, negnegO]
lemma c612 : (e7O * e2O) * e3O = -(e7O * (e2O * e3O)) := by simp only [m61, m12, m42, m60, negmulO, mulnegO, negnegO]
lemma c613 : (e7O * e2O) * e4O = -(e7O * (e2O * e4O)) := by simp only [m61, m13, m43, m65, negmulO, mulnegO, negnegO]
lemma c614 : (e7O * e2O) * e5O = e7O * (e2O * e5O) := by simp only [m61, m14, sq4, sq6, negmulO, mulnegO, negnegO]
lemma c615 : (e7O * e2O) * e6O = -(e7O * (e2O * e6O)) := by simp only [m61, m15, m45, m63, negmulO, mulnegO, negnegO]
lemma c620 : (e7O * e3O) * u1 = -(e7O * (e3O * u1)) := by simp only [m62, m20, m30, m61, negmulO, mulnegO, negnegO]
lemma c621 : (e7O * e3O) * e2O = -(e7O * (e3O * e2O)) := by simp only [m62, m21, m31, m60, negmulO, mulnegO, negnegO]
lemma c623 : (e7O * e3O) * e4O = e7O * (e3O * e4O) := by simp only [m62, m23, sq3, sq6, negmulO, mulnegO, negnegO]
lemma c624 : (e7O * e3O) * e5O = -(e7O * (e3O * e5O)) := by simp only [m62, m24, m34, m65, negmulO, mulnegO, negnegO]
lemma c625 : (e7O * e3O) * e6O = -(e7O * (e3O * e6O)) := by simp only [m62, m25, m35, m64, negmulO, mulnegO, negnegO]
lemma c630 : (e7O * e4O) * u1 = -(e7O * (e4O * u1)) := by simp only [m63, m30, m20, m64, negmulO, mulnegO, negnegO]
lemma c631 : (e7O * e4O) * e2O = -(e7O * (e4O * e2O)) := by simp only [m63, m31, m21, m65, negmulO, mulnegO, negnegO]
lemma c632 : (e7O * e4O) * e3O = e7O * (e4O * e3O) := by simp only [m63, m32, sq2, sq6, negmulO, mulnegO, negnegO]
lemma c634 : (e7O * e4O) * e5O = -(e7O * (e4O * e5O)) := by simp only [m63, m34, m24, m60, negmulO, mulnegO, negnegO]
lemma c635 : (e7O * e4O) * e6O = -(e7O * (e4O * e6O)) := by simp only [m63, m35, m25, m61, negmulO, mulnegO, negnegO]
lemma c640 : (e7O * e5O) * u1 = -(e7O * (e5O * u1)) := by simp only [m64, m40, m10, m63, negmulO, mulnegO, negnegO]
lemma c641 : (e7O * e5O) * e2O = e7O * (e5O * e2O) := by simp only [m64, m41, sq1, sq6, negmulO, mulnegO, negnegO]
lemma c642 : (e7O * e5O) * e3O = -(e7O * (e5O * e3O)) := by simp only [m64, m42, m12, m65, negmulO, mulnegO, negnegO]
lemma c643 : (e7O * e5O) * e4O = -(e7O * (e5O * e4O)) := by simp only [m64, m43, m13, m60, negmulO, mulnegO, negnegO]
lemma c645 : (e7O * e5O) * e6O = -(e7O * (e5O * e6O)) := by simp only [m64, m45, m15, m62, negmulO, mulnegO, negnegO]
lemma c650 : (e7O * e6O) * u1 = e7O * (e6O * u1) := by simp only [m65, m50, sq0, sq6, negmulO, mulnegO, negnegO]
lemma c651 : (e7O * e6O) * e2O = -(e7O * (e6O * e2O)) := by simp only [m65, m51, m01, m63, negmulO, mulnegO, negnegO]
lemma c652 : (e7O * e6O) * e3O = -(e7O * (e6O * e3O)) := by simp only [m65, m52, m02, m64, negmulO, mulnegO, negnegO]
lemma c653 : (e7O * e6O) * e4O = -(e7O * (e6O * e4O)) := by simp only [m65, m53, m03, m61, negmulO, mulnegO, negnegO]
lemma c654 : (e7O * e6O) * e5O = -(e7O * (e6O * e5O)) := by simp only [m65, m54, m04, m62, negmulO, mulnegO, negnegO]

/-! ## (3) THE CENSUS LAYER. -/

/-- The 7 banked units, indexed. -/
@[reducible] def E : Fin 7 → O ℚ
  | 0 => u1  | 1 => e2O | 2 => e3O | 3 => e4O
  | 4 => e5O | 5 => e6O | 6 => e7O

/-- The 42 ASSOCIATING ordered triples. -/
def assocTriples : List (Fin 7 × Fin 7 × Fin 7) :=
  [
    (0,1,2), (0,2,1), (0,3,4), (0,4,3), (0,5,6), (0,6,5), (1,0,2), (1,2,0),
    (1,3,5), (1,4,6), (1,5,3), (1,6,4), (2,0,1), (2,1,0), (2,3,6), (2,4,5),
    (2,5,4), (2,6,3), (3,0,4), (3,1,5), (3,2,6), (3,4,0), (3,5,1), (3,6,2),
    (4,0,3), (4,1,6), (4,2,5), (4,3,0), (4,5,2), (4,6,1), (5,0,6), (5,1,3),
    (5,2,4), (5,3,1), (5,4,2), (5,6,0), (6,0,5), (6,1,4), (6,2,3), (6,3,2),
    (6,4,1), (6,5,0)
  ]

/-- The 168 ANTIPODAL ordered triples. -/
def antiTriples : List (Fin 7 × Fin 7 × Fin 7) :=
  [
    (0,1,3), (0,1,4), (0,1,5), (0,1,6), (0,2,3), (0,2,4), (0,2,5), (0,2,6),
    (0,3,1), (0,3,2), (0,3,5), (0,3,6), (0,4,1), (0,4,2), (0,4,5), (0,4,6),
    (0,5,1), (0,5,2), (0,5,3), (0,5,4), (0,6,1), (0,6,2), (0,6,3), (0,6,4),
    (1,0,3), (1,0,4), (1,0,5), (1,0,6), (1,2,3), (1,2,4), (1,2,5), (1,2,6),
    (1,3,0), (1,3,2), (1,3,4), (1,3,6), (1,4,0), (1,4,2), (1,4,3), (1,4,5),
    (1,5,0), (1,5,2), (1,5,4), (1,5,6), (1,6,0), (1,6,2), (1,6,3), (1,6,5),
    (2,0,3), (2,0,4), (2,0,5), (2,0,6), (2,1,3), (2,1,4), (2,1,5), (2,1,6),
    (2,3,0), (2,3,1), (2,3,4), (2,3,5), (2,4,0), (2,4,1), (2,4,3), (2,4,6),
    (2,5,0), (2,5,1), (2,5,3), (2,5,6), (2,6,0), (2,6,1), (2,6,4), (2,6,5),
    (3,0,1), (3,0,2), (3,0,5), (3,0,6), (3,1,0), (3,1,2), (3,1,4), (3,1,6),
    (3,2,0), (3,2,1), (3,2,4), (3,2,5), (3,4,1), (3,4,2), (3,4,5), (3,4,6),
    (3,5,0), (3,5,2), (3,5,4), (3,5,6), (3,6,0), (3,6,1), (3,6,4), (3,6,5),
    (4,0,1), (4,0,2), (4,0,5), (4,0,6), (4,1,0), (4,1,2), (4,1,3), (4,1,5),
    (4,2,0), (4,2,1), (4,2,3), (4,2,6), (4,3,1), (4,3,2), (4,3,5), (4,3,6),
    (4,5,0), (4,5,1), (4,5,3), (4,5,6), (4,6,0), (4,6,2), (4,6,3), (4,6,5),
    (5,0,1), (5,0,2), (5,0,3), (5,0,4), (5,1,0), (5,1,2), (5,1,4), (5,1,6),
    (5,2,0), (5,2,1), (5,2,3), (5,2,6), (5,3,0), (5,3,2), (5,3,4), (5,3,6),
    (5,4,0), (5,4,1), (5,4,3), (5,4,6), (5,6,1), (5,6,2), (5,6,3), (5,6,4),
    (6,0,1), (6,0,2), (6,0,3), (6,0,4), (6,1,0), (6,1,2), (6,1,3), (6,1,5),
    (6,2,0), (6,2,1), (6,2,4), (6,2,5), (6,3,0), (6,3,1), (6,3,4), (6,3,5),
    (6,4,0), (6,4,2), (6,4,3), (6,4,5), (6,5,1), (6,5,2), (6,5,3), (6,5,4)
  ]

set_option maxHeartbeats 2000000 in
/-- ★★★ FAITHFULNESS (associating): every listed triple's bracketings AGREE — each conjunct
    is its layer-(2) theorem. The list is proved, not posited. -/
theorem assocTriples_faithful :
    assocTriples.Forall (fun t => (E t.1 * E t.2.1) * E t.2.2 = E t.1 * (E t.2.1 * E t.2.2)) := by
  exact ⟨
    c012, c021, c034, c043, c056, c065, c102, c120, c135, c146, c153, c164, c201, c210, c236, c245, c254, c263, c304, c315, c326, c340, c351, c362, c403, c416, c425, c430, c452, c461, c506, c513, c524, c531, c542, c560, c605, c614, c623, c632, c641, c650⟩

set_option maxHeartbeats 4000000 in
/-- ★★★ FAITHFULNESS (antipodal): every listed triple's bracketings are OPPOSITE. -/
theorem antiTriples_faithful :
    antiTriples.Forall (fun t => (E t.1 * E t.2.1) * E t.2.2 = -(E t.1 * (E t.2.1 * E t.2.2))) := by
  exact ⟨
    c013, c014, c015, c016, c023, c024, c025, c026, c031, c032, c035, c036, c041, c042, c045, c046, c051, c052, c053, c054, c061, c062, c063, c064, c103, c104, c105, c106, c123, c124, c125, c126, c130, c132, c134, c136, c140, c142, c143, c145, c150, c152, c154, c156, c160, c162, c163, c165, c203, c204, c205, c206, c213, c214, c215, c216, c230, c231, c234, c235, c240, c241, c243, c246, c250, c251, c253, c256, c260, c261, c264, c265, c301, c302, c305, c306, c310, c312, c314, c316, c320, c321, c324, c325, c341, c342, c345, c346, c350, c352, c354, c356, c360, c361, c364, c365, c401, c402, c405, c406, c410, c412, c413, c415, c420, c421, c423, c426, c431, c432, c435, c436, c450, c451, c453, c456, c460, c462, c463, c465, c501, c502, c503, c504, c510, c512, c514, c516, c520, c521, c523, c526, c530, c532, c534, c536, c540, c541, c543, c546, c561, c562, c563, c564, c601, c602, c603, c604, c610, c612, c613, c615, c620, c621, c624, c625, c630, c631, c634, c635, c640, c642, c643, c645, c651, c652, c653, c654⟩

/-- The census counts. -/
theorem assoc_card : assocTriples.length = 42 := rfl
theorem anti_card : antiTriples.length = 168 := rfl

/-- Duplicate-free: the union covers 210 DISTINCT triples. -/
theorem census_nodup : (assocTriples ++ antiTriples).Nodup := by decide

/-- Every listed triple has pairwise-distinct components. -/
theorem census_distinct :
    (assocTriples ++ antiTriples).all
      (fun t => t.1 ≠ t.2.1 && t.2.1 ≠ t.2.2 && t.1 ≠ t.2.2) := by decide

/-- COMPLETENESS by cardinality: 210 nodup distinct triples of 7·6·5 = 210 possible. -/
theorem census_length : (assocTriples ++ antiTriples).length = 210 := rfl

/-- ★★ THE CENSUS MEAN — the bracketing-coherence deficit is EXACTLY −3/5. -/
theorem census_mean :
    ((assocTriples.length : ℚ) - antiTriples.length) /
      ((assocTriples.length : ℚ) + antiTriples.length) = -(3/5) := by
  rw [assoc_card, anti_card]; norm_num

/-- W8 TEETH: both classes inhabited; the deficit strictly between −1 and 0. -/
theorem census_not_vacuous :
    ((0:ℚ) < 42 ∧ (0:ℚ) < 168) ∧ (-(1:ℚ) < -(3/5) ∧ -(3/5:ℚ) < 0) := by norm_num

end GatherCoherence
end Phys.Algebra
