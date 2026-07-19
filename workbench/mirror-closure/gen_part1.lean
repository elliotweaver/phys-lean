import Phys.Algebra.DerivationStabilizerSplit
import Phys.Algebra.D7NarrowingRung4

/-
  # THE GATHER-COHERENCE OBSTRUCTION — the octonion bracketing sign census (scratch->production)
  =============================================================================================
  MANAGER-AS-PROVER NODE (worker retired; owner-directed). PREREG: workbench/mirror-closure/.

  THE OBJECT. For the banked 7 imaginary octonion basis units (imBasis, the derived O ℚ), each
  ordered distinct triple (i,j,k) satisfies EXACTLY ONE of
      (e_i e_j) e_k =  e_i (e_j e_k)     (the ASSOCIATING class — 42 ordered triples), or
      (e_i e_j) e_k = −e_i (e_j e_k)     (the ANTIPODAL class — 168 ordered triples),
  PROVED per-triple against the banked Cayley–Dickson multiplication (no free-floating table).
  The signed census mean is (42 − 168)/210 = −3/5: the gather's bracketing-coherence deficit.

  PHYSICS-WORDS-REMOVABLE: delete gather/coherence/obstruction — the statements are pure
  octonion algebra: 252 product/associator identities of O ℚ + one ℚ arithmetic identity.

  HONEST GRADE: THEOREM (foundations-only). The physical READING (this −3/5 times the banked
  κ = 1/(3π) is the endpoint's obstruction term 1/(5π)) is carried by the successor node
  MirrorFixedPoint; measured 1/α(0) ≈ 137.036 is REMOVABLE ORIENTATION PROSE, in no proof.
-/

namespace Phys.Algebra
open Phys.Cascade

namespace GatherCoherence

/-- The banked 7 imaginary units, re-exported for the census. -/
private abbrev E : Fin 7 → O ℚ := imBasis

/-- CD-coordinate extensionality + one product unfold (the banked DerivationUpperBound style). -/
private macro "cd_prod" : tactic =>
  `(tactic| (ext <;> simp [u1, e2O, e3O, e4O, e5O, e6O, e7O,
    CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]))

/-! ## (1) THE 42 PRODUCT LEMMAS — the multiplication table, proved from the banked CD product. -/

private lemma m01 : u1 * e2O = e3O := by cd_prod
private lemma m02 : u1 * e3O = -e2O := by cd_prod
private lemma m03 : u1 * e4O = e5O := by cd_prod
private lemma m04 : u1 * e5O = -e4O := by cd_prod
private lemma m05 : u1 * e6O = -e7O := by cd_prod
private lemma m06 : u1 * e7O = e6O := by cd_prod
private lemma m10 : e2O * u1 = -e3O := by cd_prod
private lemma m12 : e2O * e3O = u1 := by cd_prod
private lemma m13 : e2O * e4O = e6O := by cd_prod
private lemma m14 : e2O * e5O = e7O := by cd_prod
private lemma m15 : e2O * e6O = -e4O := by cd_prod
private lemma m16 : e2O * e7O = -e5O := by cd_prod
private lemma m20 : e3O * u1 = e2O := by cd_prod
private lemma m21 : e3O * e2O = -u1 := by cd_prod
private lemma m23 : e3O * e4O = e7O := by cd_prod
private lemma m24 : e3O * e5O = -e6O := by cd_prod
private lemma m25 : e3O * e6O = e5O := by cd_prod
private lemma m26 : e3O * e7O = -e4O := by cd_prod
private lemma m30 : e4O * u1 = -e5O := by cd_prod
private lemma m31 : e4O * e2O = -e6O := by cd_prod
private lemma m32 : e4O * e3O = -e7O := by cd_prod
private lemma m34 : e4O * e5O = u1 := by cd_prod
private lemma m35 : e4O * e6O = e2O := by cd_prod
private lemma m36 : e4O * e7O = e3O := by cd_prod
private lemma m40 : e5O * u1 = e4O := by cd_prod
private lemma m41 : e5O * e2O = -e7O := by cd_prod
private lemma m42 : e5O * e3O = e6O := by cd_prod
private lemma m43 : e5O * e4O = -u1 := by cd_prod
private lemma m45 : e5O * e6O = -e3O := by cd_prod
private lemma m46 : e5O * e7O = e2O := by cd_prod
private lemma m50 : e6O * u1 = e7O := by cd_prod
private lemma m51 : e6O * e2O = e4O := by cd_prod
private lemma m52 : e6O * e3O = -e5O := by cd_prod
private lemma m53 : e6O * e4O = -e2O := by cd_prod
private lemma m54 : e6O * e5O = e3O := by cd_prod
private lemma m56 : e6O * e7O = -u1 := by cd_prod
private lemma m60 : e7O * u1 = -e6O := by cd_prod
private lemma m61 : e7O * e2O = e5O := by cd_prod
private lemma m62 : e7O * e3O = e4O := by cd_prod
private lemma m63 : e7O * e4O = -e3O := by cd_prod
private lemma m64 : e7O * e5O = -e2O := by cd_prod
private lemma m65 : e7O * e6O = u1 := by cd_prod

/-! ## (2) THE 210 COHERENCE LEMMAS — each ordered distinct triple is associating (+) or
    antipodal (−), by REWRITING through the table (no deep kernel reduction). -/

private lemma c012 : ((u1 * e2O) * e3O) = (u1 * (e2O * e3O)) := by simp only [m01, m12, neg_mul, mul_neg, neg_neg]
private lemma c013 : ((u1 * e2O) * e4O) = -(u1 * (e2O * e4O)) := by simp only [m01, m13, m23, m05, neg_mul, mul_neg, neg_neg]
private lemma c014 : ((u1 * e2O) * e5O) = -(u1 * (e2O * e5O)) := by simp only [m01, m14, m24, m06, neg_mul, mul_neg, neg_neg]
private lemma c015 : ((u1 * e2O) * e6O) = -(u1 * (e2O * e6O)) := by simp only [m01, m15, m25, m03, neg_mul, mul_neg, neg_neg]
private lemma c016 : ((u1 * e2O) * e7O) = -(u1 * (e2O * e7O)) := by simp only [m01, m16, m26, m04, neg_mul, mul_neg, neg_neg]
private lemma c021 : ((u1 * e3O) * e2O) = (u1 * (e3O * e2O)) := by simp only [m02, m21, neg_mul, mul_neg, neg_neg]
private lemma c023 : ((u1 * e3O) * e4O) = -(u1 * (e3O * e4O)) := by simp only [m02, m23, m13, m06, neg_mul, mul_neg, neg_neg]
private lemma c024 : ((u1 * e3O) * e5O) = -(u1 * (e3O * e5O)) := by simp only [m02, m24, m14, m05, neg_mul, mul_neg, neg_neg]
private lemma c025 : ((u1 * e3O) * e6O) = -(u1 * (e3O * e6O)) := by simp only [m02, m25, m15, m04, neg_mul, mul_neg, neg_neg]
private lemma c026 : ((u1 * e3O) * e7O) = -(u1 * (e3O * e7O)) := by simp only [m02, m26, m16, m03, neg_mul, mul_neg, neg_neg]
private lemma c031 : ((u1 * e4O) * e2O) = -(u1 * (e4O * e2O)) := by simp only [m03, m31, m41, m05, neg_mul, mul_neg, neg_neg]
private lemma c032 : ((u1 * e4O) * e3O) = -(u1 * (e4O * e3O)) := by simp only [m03, m32, m42, m06, neg_mul, mul_neg, neg_neg]
private lemma c034 : ((u1 * e4O) * e5O) = (u1 * (e4O * e5O)) := by simp only [m03, m34, neg_mul, mul_neg, neg_neg]
private lemma c035 : ((u1 * e4O) * e6O) = -(u1 * (e4O * e6O)) := by simp only [m03, m35, m45, m01, neg_mul, mul_neg, neg_neg]
private lemma c036 : ((u1 * e4O) * e7O) = -(u1 * (e4O * e7O)) := by simp only [m03, m36, m46, m02, neg_mul, mul_neg, neg_neg]
private lemma c041 : ((u1 * e5O) * e2O) = -(u1 * (e5O * e2O)) := by simp only [m04, m41, m31, m06, neg_mul, mul_neg, neg_neg]
private lemma c042 : ((u1 * e5O) * e3O) = -(u1 * (e5O * e3O)) := by simp only [m04, m42, m32, m05, neg_mul, mul_neg, neg_neg]
private lemma c043 : ((u1 * e5O) * e4O) = (u1 * (e5O * e4O)) := by simp only [m04, m43, neg_mul, mul_neg, neg_neg]
private lemma c045 : ((u1 * e5O) * e6O) = -(u1 * (e5O * e6O)) := by simp only [m04, m45, m35, m02, neg_mul, mul_neg, neg_neg]
private lemma c046 : ((u1 * e5O) * e7O) = -(u1 * (e5O * e7O)) := by simp only [m04, m46, m36, m01, neg_mul, mul_neg, neg_neg]
private lemma c051 : ((u1 * e6O) * e2O) = -(u1 * (e6O * e2O)) := by simp only [m05, m51, m61, m03, neg_mul, mul_neg, neg_neg]
private lemma c052 : ((u1 * e6O) * e3O) = -(u1 * (e6O * e3O)) := by simp only [m05, m52, m62, m04, neg_mul, mul_neg, neg_neg]
private lemma c053 : ((u1 * e6O) * e4O) = -(u1 * (e6O * e4O)) := by simp only [m05, m53, m63, m01, neg_mul, mul_neg, neg_neg]
private lemma c054 : ((u1 * e6O) * e5O) = -(u1 * (e6O * e5O)) := by simp only [m05, m54, m64, m02, neg_mul, mul_neg, neg_neg]
private lemma c056 : ((u1 * e6O) * e7O) = (u1 * (e6O * e7O)) := by simp only [m05, m56, neg_mul, mul_neg, neg_neg]
private lemma c061 : ((u1 * e7O) * e2O) = -(u1 * (e7O * e2O)) := by simp only [m06, m61, m51, m04, neg_mul, mul_neg, neg_neg]
private lemma c062 : ((u1 * e7O) * e3O) = -(u1 * (e7O * e3O)) := by simp only [m06, m62, m52, m03, neg_mul, mul_neg, neg_neg]
private lemma c063 : ((u1 * e7O) * e4O) = -(u1 * (e7O * e4O)) := by simp only [m06, m63, m53, m02, neg_mul, mul_neg, neg_neg]
private lemma c064 : ((u1 * e7O) * e5O) = -(u1 * (e7O * e5O)) := by simp only [m06, m64, m54, m01, neg_mul, mul_neg, neg_neg]
private lemma c065 : ((u1 * e7O) * e6O) = (u1 * (e7O * e6O)) := by simp only [m06, m65, neg_mul, mul_neg, neg_neg]
private lemma c102 : ((e2O * u1) * e3O) = (e2O * (u1 * e3O)) := by simp only [m10, m02, neg_mul, mul_neg, neg_neg]
private lemma c103 : ((e2O * u1) * e4O) = -(e2O * (u1 * e4O)) := by simp only [m10, m03, m23, m14, neg_mul, mul_neg, neg_neg]
private lemma c104 : ((e2O * u1) * e5O) = -(e2O * (u1 * e5O)) := by simp only [m10, m04, m24, m13, neg_mul, mul_neg, neg_neg]
private lemma c105 : ((e2O * u1) * e6O) = -(e2O * (u1 * e6O)) := by simp only [m10, m05, m25, m16, neg_mul, mul_neg, neg_neg]
private lemma c106 : ((e2O * u1) * e7O) = -(e2O * (u1 * e7O)) := by simp only [m10, m06, m26, m15, neg_mul, mul_neg, neg_neg]
private lemma c120 : ((e2O * e3O) * u1) = (e2O * (e3O * u1)) := by simp only [m12, m20, neg_mul, mul_neg, neg_neg]
private lemma c123 : ((e2O * e3O) * e4O) = -(e2O * (e3O * e4O)) := by simp only [m12, m23, m03, m16, neg_mul, mul_neg, neg_neg]
private lemma c124 : ((e2O * e3O) * e5O) = -(e2O * (e3O * e5O)) := by simp only [m12, m24, m04, m15, neg_mul, mul_neg, neg_neg]
private lemma c125 : ((e2O * e3O) * e6O) = -(e2O * (e3O * e6O)) := by simp only [m12, m25, m05, m14, neg_mul, mul_neg, neg_neg]
private lemma c126 : ((e2O * e3O) * e7O) = -(e2O * (e3O * e7O)) := by simp only [m12, m26, m06, m13, neg_mul, mul_neg, neg_neg]
private lemma c130 : ((e2O * e4O) * u1) = -(e2O * (e4O * u1)) := by simp only [m13, m30, m50, m14, neg_mul, mul_neg, neg_neg]
private lemma c132 : ((e2O * e4O) * e3O) = -(e2O * (e4O * e3O)) := by simp only [m13, m32, m52, m16, neg_mul, mul_neg, neg_neg]
private lemma c134 : ((e2O * e4O) * e5O) = -(e2O * (e4O * e5O)) := by simp only [m13, m34, m54, m10, neg_mul, mul_neg, neg_neg]
private lemma c135 : ((e2O * e4O) * e6O) = (e2O * (e4O * e6O)) := by simp only [m13, m35, neg_mul, mul_neg, neg_neg]
private lemma c136 : ((e2O * e4O) * e7O) = -(e2O * (e4O * e7O)) := by simp only [m13, m36, m56, m12, neg_mul, mul_neg, neg_neg]
private lemma c140 : ((e2O * e5O) * u1) = -(e2O * (e5O * u1)) := by simp only [m14, m40, m60, m13, neg_mul, mul_neg, neg_neg]
private lemma c142 : ((e2O * e5O) * e3O) = -(e2O * (e5O * e3O)) := by simp only [m14, m42, m62, m15, neg_mul, mul_neg, neg_neg]
private lemma c143 : ((e2O * e5O) * e4O) = -(e2O * (e5O * e4O)) := by simp only [m14, m43, m63, m10, neg_mul, mul_neg, neg_neg]
private lemma c145 : ((e2O * e5O) * e6O) = -(e2O * (e5O * e6O)) := by simp only [m14, m45, m65, m12, neg_mul, mul_neg, neg_neg]
private lemma c146 : ((e2O * e5O) * e7O) = (e2O * (e5O * e7O)) := by simp only [m14, m46, neg_mul, mul_neg, neg_neg]
private lemma c150 : ((e2O * e6O) * u1) = -(e2O * (e6O * u1)) := by simp only [m15, m50, m30, m16, neg_mul, mul_neg, neg_neg]
private lemma c152 : ((e2O * e6O) * e3O) = -(e2O * (e6O * e3O)) := by simp only [m15, m52, m32, m14, neg_mul, mul_neg, neg_neg]
private lemma c153 : ((e2O * e6O) * e4O) = (e2O * (e6O * e4O)) := by simp only [m15, m53, neg_mul, mul_neg, neg_neg]
private lemma c154 : ((e2O * e6O) * e5O) = -(e2O * (e6O * e5O)) := by simp only [m15, m54, m34, m12, neg_mul, mul_neg, neg_neg]
private lemma c156 : ((e2O * e6O) * e7O) = -(e2O * (e6O * e7O)) := by simp only [m15, m56, m36, m10, neg_mul, mul_neg, neg_neg]
private lemma c160 : ((e2O * e7O) * u1) = -(e2O * (e7O * u1)) := by simp only [m16, m60, m40, m15, neg_mul, mul_neg, neg_neg]
private lemma c162 : ((e2O * e7O) * e3O) = -(e2O * (e7O * e3O)) := by simp only [m16, m62, m42, m13, neg_mul, mul_neg, neg_neg]
private lemma c163 : ((e2O * e7O) * e4O) = -(e2O * (e7O * e4O)) := by simp only [m16, m63, m43, m12, neg_mul, mul_neg, neg_neg]
private lemma c164 : ((e2O * e7O) * e5O) = (e2O * (e7O * e5O)) := by simp only [m16, m64, neg_mul, mul_neg, neg_neg]
private lemma c165 : ((e2O * e7O) * e6O) = -(e2O * (e7O * e6O)) := by simp only [m16, m65, m45, m10, neg_mul, mul_neg, neg_neg]
private lemma c201 : ((e3O * u1) * e2O) = (e3O * (u1 * e2O)) := by simp only [m20, m01, neg_mul, mul_neg, neg_neg]
private lemma c203 : ((e3O * u1) * e4O) = -(e3O * (u1 * e4O)) := by simp only [m20, m03, m13, m24, neg_mul, mul_neg, neg_neg]
private lemma c204 : ((e3O * u1) * e5O) = -(e3O * (u1 * e5O)) := by simp only [m20, m04, m14, m23, neg_mul, mul_neg, neg_neg]
private lemma c205 : ((e3O * u1) * e6O) = -(e3O * (u1 * e6O)) := by simp only [m20, m05, m15, m26, neg_mul, mul_neg, neg_neg]
private lemma c206 : ((e3O * u1) * e7O) = -(e3O * (u1 * e7O)) := by simp only [m20, m06, m16, m25, neg_mul, mul_neg, neg_neg]
private lemma c210 : ((e3O * e2O) * u1) = (e3O * (e2O * u1)) := by simp only [m21, m10, neg_mul, mul_neg, neg_neg]
private lemma c213 : ((e3O * e2O) * e4O) = -(e3O * (e2O * e4O)) := by simp only [m21, m13, m03, m25, neg_mul, mul_neg, neg_neg]
private lemma c214 : ((e3O * e2O) * e5O) = -(e3O * (e2O * e5O)) := by simp only [m21, m14, m04, m26, neg_mul, mul_neg, neg_neg]
private lemma c215 : ((e3O * e2O) * e6O) = -(e3O * (e2O * e6O)) := by simp only [m21, m15, m05, m23, neg_mul, mul_neg, neg_neg]
private lemma c216 : ((e3O * e2O) * e7O) = -(e3O * (e2O * e7O)) := by simp only [m21, m16, m06, m24, neg_mul, mul_neg, neg_neg]
private lemma c230 : ((e3O * e4O) * u1) = -(e3O * (e4O * u1)) := by simp only [m23, m30, m60, m24, neg_mul, mul_neg, neg_neg]
private lemma c231 : ((e3O * e4O) * e2O) = -(e3O * (e4O * e2O)) := by simp only [m23, m31, m61, m25, neg_mul, mul_neg, neg_neg]
private lemma c234 : ((e3O * e4O) * e5O) = -(e3O * (e4O * e5O)) := by simp only [m23, m34, m64, m20, neg_mul, mul_neg, neg_neg]
private lemma c235 : ((e3O * e4O) * e6O) = -(e3O * (e4O * e6O)) := by simp only [m23, m35, m65, m21, neg_mul, mul_neg, neg_neg]
private lemma c236 : ((e3O * e4O) * e7O) = (e3O * (e4O * e7O)) := by simp only [m23, m36, neg_mul, mul_neg, neg_neg]
private lemma c240 : ((e3O * e5O) * u1) = -(e3O * (e5O * u1)) := by simp only [m24, m40, m50, m23, neg_mul, mul_neg, neg_neg]
private lemma c241 : ((e3O * e5O) * e2O) = -(e3O * (e5O * e2O)) := by simp only [m24, m41, m51, m26, neg_mul, mul_neg, neg_neg]
private lemma c243 : ((e3O * e5O) * e4O) = -(e3O * (e5O * e4O)) := by simp only [m24, m43, m53, m20, neg_mul, mul_neg, neg_neg]
private lemma c245 : ((e3O * e5O) * e6O) = (e3O * (e5O * e6O)) := by simp only [m24, m45, neg_mul, mul_neg, neg_neg]
private lemma c246 : ((e3O * e5O) * e7O) = -(e3O * (e5O * e7O)) := by simp only [m24, m46, m56, m21, neg_mul, mul_neg, neg_neg]
private lemma c250 : ((e3O * e6O) * u1) = -(e3O * (e6O * u1)) := by simp only [m25, m50, m40, m26, neg_mul, mul_neg, neg_neg]
private lemma c251 : ((e3O * e6O) * e2O) = -(e3O * (e6O * e2O)) := by simp only [m25, m51, m41, m23, neg_mul, mul_neg, neg_neg]
private lemma c253 : ((e3O * e6O) * e4O) = -(e3O * (e6O * e4O)) := by simp only [m25, m53, m43, m21, neg_mul, mul_neg, neg_neg]
private lemma c254 : ((e3O * e6O) * e5O) = (e3O * (e6O * e5O)) := by simp only [m25, m54, neg_mul, mul_neg, neg_neg]
private lemma c256 : ((e3O * e6O) * e7O) = -(e3O * (e6O * e7O)) := by simp only [m25, m56, m46, m20, neg_mul, mul_neg, neg_neg]
private lemma c260 : ((e3O * e7O) * u1) = -(e3O * (e7O * u1)) := by simp only [m26, m60, m30, m25, neg_mul, mul_neg, neg_neg]
private lemma c261 : ((e3O * e7O) * e2O) = -(e3O * (e7O * e2O)) := by simp only [m26, m61, m31, m24, neg_mul, mul_neg, neg_neg]
private lemma c263 : ((e3O * e7O) * e4O) = (e3O * (e7O * e4O)) := by simp only [m26, m63, neg_mul, mul_neg, neg_neg]
private lemma c264 : ((e3O * e7O) * e5O) = -(e3O * (e7O * e5O)) := by simp only [m26, m64, m34, m21, neg_mul, mul_neg, neg_neg]
private lemma c265 : ((e3O * e7O) * e6O) = -(e3O * (e7O * e6O)) := by simp only [m26, m65, m35, m20, neg_mul, mul_neg, neg_neg]
private lemma c301 : ((e4O * u1) * e2O) = -(e4O * (u1 * e2O)) := by simp only [m30, m01, m41, m32, neg_mul, mul_neg, neg_neg]
private lemma c302 : ((e4O * u1) * e3O) = -(e4O * (u1 * e3O)) := by simp only [m30, m02, m42, m31, neg_mul, mul_neg, neg_neg]
private lemma c304 : ((e4O * u1) * e5O) = (e4O * (u1 * e5O)) := by simp only [m30, m04, neg_mul, mul_neg, neg_neg]
private lemma c305 : ((e4O * u1) * e6O) = -(e4O * (u1 * e6O)) := by simp only [m30, m05, m45, m36, neg_mul, mul_neg, neg_neg]
private lemma c306 : ((e4O * u1) * e7O) = -(e4O * (u1 * e7O)) := by simp only [m30, m06, m46, m35, neg_mul, mul_neg, neg_neg]
private lemma c310 : ((e4O * e2O) * u1) = -(e4O * (e2O * u1)) := by simp only [m31, m10, m50, m32, neg_mul, mul_neg, neg_neg]
private lemma c312 : ((e4O * e2O) * e3O) = -(e4O * (e2O * e3O)) := by simp only [m31, m12, m52, m30, neg_mul, mul_neg, neg_neg]
private lemma c314 : ((e4O * e2O) * e5O) = -(e4O * (e2O * e5O)) := by simp only [m31, m14, m54, m36, neg_mul, mul_neg, neg_neg]
private lemma c315 : ((e4O * e2O) * e6O) = (e4O * (e2O * e6O)) := by simp only [m31, m15, neg_mul, mul_neg, neg_neg]
private lemma c316 : ((e4O * e2O) * e7O) = -(e4O * (e2O * e7O)) := by simp only [m31, m16, m56, m34, neg_mul, mul_neg, neg_neg]
private lemma c320 : ((e4O * e3O) * u1) = -(e4O * (e3O * u1)) := by simp only [m32, m20, m60, m31, neg_mul, mul_neg, neg_neg]
private lemma c321 : ((e4O * e3O) * e2O) = -(e4O * (e3O * e2O)) := by simp only [m32, m21, m61, m30, neg_mul, mul_neg, neg_neg]
private lemma c324 : ((e4O * e3O) * e5O) = -(e4O * (e3O * e5O)) := by simp only [m32, m24, m64, m35, neg_mul, mul_neg, neg_neg]
private lemma c325 : ((e4O * e3O) * e6O) = -(e4O * (e3O * e6O)) := by simp only [m32, m25, m65, m34, neg_mul, mul_neg, neg_neg]
private lemma c326 : ((e4O * e3O) * e7O) = (e4O * (e3O * e7O)) := by simp only [m32, m26, neg_mul, mul_neg, neg_neg]
private lemma c340 : ((e4O * e5O) * u1) = (e4O * (e5O * u1)) := by simp only [m34, m40, neg_mul, mul_neg, neg_neg]
private lemma c341 : ((e4O * e5O) * e2O) = -(e4O * (e5O * e2O)) := by simp only [m34, m41, m01, m36, neg_mul, mul_neg, neg_neg]
private lemma c342 : ((e4O * e5O) * e3O) = -(e4O * (e5O * e3O)) := by simp only [m34, m42, m02, m35, neg_mul, mul_neg, neg_neg]
private lemma c345 : ((e4O * e5O) * e6O) = -(e4O * (e5O * e6O)) := by simp only [m34, m45, m05, m32, neg_mul, mul_neg, neg_neg]
private lemma c346 : ((e4O * e5O) * e7O) = -(e4O * (e5O * e7O)) := by simp only [m34, m46, m06, m31, neg_mul, mul_neg, neg_neg]
private lemma c350 : ((e4O * e6O) * u1) = -(e4O * (e6O * u1)) := by simp only [m35, m50, m10, m36, neg_mul, mul_neg, neg_neg]
private lemma c351 : ((e4O * e6O) * e2O) = (e4O * (e6O * e2O)) := by simp only [m35, m51, neg_mul, mul_neg, neg_neg]
private lemma c352 : ((e4O * e6O) * e3O) = -(e4O * (e6O * e3O)) := by simp only [m35, m52, m12, m34, neg_mul, mul_neg, neg_neg]
private lemma c354 : ((e4O * e6O) * e5O) = -(e4O * (e6O * e5O)) := by simp only [m35, m54, m14, m32, neg_mul, mul_neg, neg_neg]
private lemma c356 : ((e4O * e6O) * e7O) = -(e4O * (e6O * e7O)) := by simp only [m35, m56, m16, m30, neg_mul, mul_neg, neg_neg]
private lemma c360 : ((e4O * e7O) * u1) = -(e4O * (e7O * u1)) := by simp only [m36, m60, m20, m35, neg_mul, mul_neg, neg_neg]
private lemma c361 : ((e4O * e7O) * e2O) = -(e4O * (e7O * e2O)) := by simp only [m36, m61, m21, m34, neg_mul, mul_neg, neg_neg]
private lemma c362 : ((e4O * e7O) * e3O) = (e4O * (e7O * e3O)) := by simp only [m36, m62, neg_mul, mul_neg, neg_neg]
private lemma c364 : ((e4O * e7O) * e5O) = -(e4O * (e7O * e5O)) := by simp only [m36, m64, m24, m31, neg_mul, mul_neg, neg_neg]
private lemma c365 : ((e4O * e7O) * e6O) = -(e4O * (e7O * e6O)) := by simp only [m36, m65, m25, m30, neg_mul, mul_neg, neg_neg]
private lemma c401 : ((e5O * u1) * e2O) = -(e5O * (u1 * e2O)) := by simp only [m40, m01, m31, m42, neg_mul, mul_neg, neg_neg]
private lemma c402 : ((e5O * u1) * e3O) = -(e5O * (u1 * e3O)) := by simp only [m40, m02, m32, m41, neg_mul, mul_neg, neg_neg]
private lemma c403 : ((e5O * u1) * e4O) = (e5O * (u1 * e4O)) := by simp only [m40, m03, neg_mul, mul_neg, neg_neg]
private lemma c405 : ((e5O * u1) * e6O) = -(e5O * (u1 * e6O)) := by simp only [m40, m05, m35, m46, neg_mul, mul_neg, neg_neg]
private lemma c406 : ((e5O * u1) * e7O) = -(e5O * (u1 * e7O)) := by simp only [m40, m06, m36, m45, neg_mul, mul_neg, neg_neg]
private lemma c410 : ((e5O * e2O) * u1) = -(e5O * (e2O * u1)) := by simp only [m41, m10, m60, m42, neg_mul, mul_neg, neg_neg]
private lemma c412 : ((e5O * e2O) * e3O) = -(e5O * (e2O * e3O)) := by simp only [m41, m12, m62, m40, neg_mul, mul_neg, neg_neg]
private lemma c413 : ((e5O * e2O) * e4O) = -(e5O * (e2O * e4O)) := by simp only [m41, m13, m63, m45, neg_mul, mul_neg, neg_neg]
private lemma c415 : ((e5O * e2O) * e6O) = -(e5O * (e2O * e6O)) := by simp only [m41, m15, m65, m43, neg_mul, mul_neg, neg_neg]
private lemma c416 : ((e5O * e2O) * e7O) = (e5O * (e2O * e7O)) := by simp only [m41, m16, neg_mul, mul_neg, neg_neg]
private lemma c420 : ((e5O * e3O) * u1) = -(e5O * (e3O * u1)) := by simp only [m42, m20, m50, m41, neg_mul, mul_neg, neg_neg]
private lemma c421 : ((e5O * e3O) * e2O) = -(e5O * (e3O * e2O)) := by simp only [m42, m21, m51, m40, neg_mul, mul_neg, neg_neg]
private lemma c423 : ((e5O * e3O) * e4O) = -(e5O * (e3O * e4O)) := by simp only [m42, m23, m53, m46, neg_mul, mul_neg, neg_neg]
private lemma c425 : ((e5O * e3O) * e6O) = (e5O * (e3O * e6O)) := by simp only [m42, m25, neg_mul, mul_neg, neg_neg]
private lemma c426 : ((e5O * e3O) * e7O) = -(e5O * (e3O * e7O)) := by simp only [m42, m26, m56, m43, neg_mul, mul_neg, neg_neg]
private lemma c430 : ((e5O * e4O) * u1) = (e5O * (e4O * u1)) := by simp only [m43, m30, neg_mul, mul_neg, neg_neg]
private lemma c431 : ((e5O * e4O) * e2O) = -(e5O * (e4O * e2O)) := by simp only [m43, m31, m01, m45, neg_mul, mul_neg, neg_neg]
private lemma c432 : ((e5O * e4O) * e3O) = -(e5O * (e4O * e3O)) := by simp only [m43, m32, m02, m46, neg_mul, mul_neg, neg_neg]
private lemma c435 : ((e5O * e4O) * e6O) = -(e5O * (e4O * e6O)) := by simp only [m43, m35, m05, m41, neg_mul, mul_neg, neg_neg]
private lemma c436 : ((e5O * e4O) * e7O) = -(e5O * (e4O * e7O)) := by simp only [m43, m36, m06, m42, neg_mul, mul_neg, neg_neg]
private lemma c450 : ((e5O * e6O) * u1) = -(e5O * (e6O * u1)) := by simp only [m45, m50, m20, m46, neg_mul, mul_neg, neg_neg]
private lemma c451 : ((e5O * e6O) * e2O) = -(e5O * (e6O * e2O)) := by simp only [m45, m51, m21, m43, neg_mul, mul_neg, neg_neg]
private lemma c452 : ((e5O * e6O) * e3O) = (e5O * (e6O * e3O)) := by simp only [m45, m52, neg_mul, mul_neg, neg_neg]
private lemma c453 : ((e5O * e6O) * e4O) = -(e5O * (e6O * e4O)) := by simp only [m45, m53, m23, m41, neg_mul, mul_neg, neg_neg]
private lemma c456 : ((e5O * e6O) * e7O) = -(e5O * (e6O * e7O)) := by simp only [m45, m56, m26, m40, neg_mul, mul_neg, neg_neg]
private lemma c460 : ((e5O * e7O) * u1) = -(e5O * (e7O * u1)) := by simp only [m46, m60, m10, m45, neg_mul, mul_neg, neg_neg]
private lemma c461 : ((e5O * e7O) * e2O) = (e5O * (e7O * e2O)) := by simp only [m46, m61, neg_mul, mul_neg, neg_neg]
private lemma c462 : ((e5O * e7O) * e3O) = -(e5O * (e7O * e3O)) := by simp only [m46, m62, m12, m43, neg_mul, mul_neg, neg_neg]
private lemma c463 : ((e5O * e7O) * e4O) = -(e5O * (e7O * e4O)) := by simp only [m46, m63, m13, m42, neg_mul, mul_neg, neg_neg]
private lemma c465 : ((e5O * e7O) * e6O) = -(e5O * (e7O * e6O)) := by simp only [m46, m65, m15, m40, neg_mul, mul_neg, neg_neg]
private lemma c501 : ((e6O * u1) * e2O) = -(e6O * (u1 * e2O)) := by simp only [m50, m01, m61, m52, neg_mul, mul_neg, neg_neg]
private lemma c502 : ((e6O * u1) * e3O) = -(e6O * (u1 * e3O)) := by simp only [m50, m02, m62, m51, neg_mul, mul_neg, neg_neg]
private lemma c503 : ((e6O * u1) * e4O) = -(e6O * (u1 * e4O)) := by simp only [m50, m03, m63, m54, neg_mul, mul_neg, neg_neg]
private lemma c504 : ((e6O * u1) * e5O) = -(e6O * (u1 * e5O)) := by simp only [m50, m04, m64, m53, neg_mul, mul_neg, neg_neg]
private lemma c506 : ((e6O * u1) * e7O) = (e6O * (u1 * e7O)) := by simp only [m50, m06, neg_mul, mul_neg, neg_neg]
private lemma c510 : ((e6O * e2O) * u1) = -(e6O * (e2O * u1)) := by simp only [m51, m10, m30, m52, neg_mul, mul_neg, neg_neg]
private lemma c512 : ((e6O * e2O) * e3O) = -(e6O * (e2O * e3O)) := by simp only [m51, m12, m32, m50, neg_mul, mul_neg, neg_neg]
private lemma c513 : ((e6O * e2O) * e4O) = (e6O * (e2O * e4O)) := by simp only [m51, m13, neg_mul, mul_neg, neg_neg]
private lemma c514 : ((e6O * e2O) * e5O) = -(e6O * (e2O * e5O)) := by simp only [m51, m14, m34, m56, neg_mul, mul_neg, neg_neg]
private lemma c516 : ((e6O * e2O) * e7O) = -(e6O * (e2O * e7O)) := by simp only [m51, m16, m36, m54, neg_mul, mul_neg, neg_neg]
private lemma c520 : ((e6O * e3O) * u1) = -(e6O * (e3O * u1)) := by simp only [m52, m20, m40, m51, neg_mul, mul_neg, neg_neg]
private lemma c521 : ((e6O * e3O) * e2O) = -(e6O * (e3O * e2O)) := by simp only [m52, m21, m41, m50, neg_mul, mul_neg, neg_neg]
private lemma c523 : ((e6O * e3O) * e4O) = -(e6O * (e3O * e4O)) := by simp only [m52, m23, m43, m56, neg_mul, mul_neg, neg_neg]
private lemma c524 : ((e6O * e3O) * e5O) = (e6O * (e3O * e5O)) := by simp only [m52, m24, neg_mul, mul_neg, neg_neg]
private lemma c526 : ((e6O * e3O) * e7O) = -(e6O * (e3O * e7O)) := by simp only [m52, m26, m46, m53, neg_mul, mul_neg, neg_neg]
private lemma c530 : ((e6O * e4O) * u1) = -(e6O * (e4O * u1)) := by simp only [m53, m30, m10, m54, neg_mul, mul_neg, neg_neg]
private lemma c531 : ((e6O * e4O) * e2O) = (e6O * (e4O * e2O)) := by simp only [m53, m31, neg_mul, mul_neg, neg_neg]
private lemma c532 : ((e6O * e4O) * e3O) = -(e6O * (e4O * e3O)) := by simp only [m53, m32, m12, m56, neg_mul, mul_neg, neg_neg]
private lemma c534 : ((e6O * e4O) * e5O) = -(e6O * (e4O * e5O)) := by simp only [m53, m34, m14, m50, neg_mul, mul_neg, neg_neg]
private lemma c536 : ((e6O * e4O) * e7O) = -(e6O * (e4O * e7O)) := by simp only [m53, m36, m16, m52, neg_mul, mul_neg, neg_neg]
private lemma c540 : ((e6O * e5O) * u1) = -(e6O * (e5O * u1)) := by simp only [m54, m40, m20, m53, neg_mul, mul_neg, neg_neg]
private lemma c541 : ((e6O * e5O) * e2O) = -(e6O * (e5O * e2O)) := by simp only [m54, m41, m21, m56, neg_mul, mul_neg, neg_neg]
private lemma c542 : ((e6O * e5O) * e3O) = (e6O * (e5O * e3O)) := by simp only [m54, m42, neg_mul, mul_neg, neg_neg]
private lemma c543 : ((e6O * e5O) * e4O) = -(e6O * (e5O * e4O)) := by simp only [m54, m43, m23, m50, neg_mul, mul_neg, neg_neg]
private lemma c546 : ((e6O * e5O) * e7O) = -(e6O * (e5O * e7O)) := by simp only [m54, m46, m26, m51, neg_mul, mul_neg, neg_neg]
private lemma c560 : ((e6O * e7O) * u1) = (e6O * (e7O * u1)) := by simp only [m56, m60, neg_mul, mul_neg, neg_neg]
private lemma c561 : ((e6O * e7O) * e2O) = -(e6O * (e7O * e2O)) := by simp only [m56, m61, m01, m54, neg_mul, mul_neg, neg_neg]
private lemma c562 : ((e6O * e7O) * e3O) = -(e6O * (e7O * e3O)) := by simp only [m56, m62, m02, m53, neg_mul, mul_neg, neg_neg]
private lemma c563 : ((e6O * e7O) * e4O) = -(e6O * (e7O * e4O)) := by simp only [m56, m63, m03, m52, neg_mul, mul_neg, neg_neg]
private lemma c564 : ((e6O * e7O) * e5O) = -(e6O * (e7O * e5O)) := by simp only [m56, m64, m04, m51, neg_mul, mul_neg, neg_neg]
private lemma c601 : ((e7O * u1) * e2O) = -(e7O * (u1 * e2O)) := by simp only [m60, m01, m51, m62, neg_mul, mul_neg, neg_neg]
private lemma c602 : ((e7O * u1) * e3O) = -(e7O * (u1 * e3O)) := by simp only [m60, m02, m52, m61, neg_mul, mul_neg, neg_neg]
private lemma c603 : ((e7O * u1) * e4O) = -(e7O * (u1 * e4O)) := by simp only [m60, m03, m53, m64, neg_mul, mul_neg, neg_neg]
private lemma c604 : ((e7O * u1) * e5O) = -(e7O * (u1 * e5O)) := by simp only [m60, m04, m54, m63, neg_mul, mul_neg, neg_neg]
private lemma c605 : ((e7O * u1) * e6O) = (e7O * (u1 * e6O)) := by simp only [m60, m05, neg_mul, mul_neg, neg_neg]
private lemma c610 : ((e7O * e2O) * u1) = -(e7O * (e2O * u1)) := by simp only [m61, m10, m40, m62, neg_mul, mul_neg, neg_neg]
private lemma c612 : ((e7O * e2O) * e3O) = -(e7O * (e2O * e3O)) := by simp only [m61, m12, m42, m60, neg_mul, mul_neg, neg_neg]
private lemma c613 : ((e7O * e2O) * e4O) = -(e7O * (e2O * e4O)) := by simp only [m61, m13, m43, m65, neg_mul, mul_neg, neg_neg]
private lemma c614 : ((e7O * e2O) * e5O) = (e7O * (e2O * e5O)) := by simp only [m61, m14, neg_mul, mul_neg, neg_neg]
private lemma c615 : ((e7O * e2O) * e6O) = -(e7O * (e2O * e6O)) := by simp only [m61, m15, m45, m63, neg_mul, mul_neg, neg_neg]
private lemma c620 : ((e7O * e3O) * u1) = -(e7O * (e3O * u1)) := by simp only [m62, m20, m30, m61, neg_mul, mul_neg, neg_neg]
private lemma c621 : ((e7O * e3O) * e2O) = -(e7O * (e3O * e2O)) := by simp only [m62, m21, m31, m60, neg_mul, mul_neg, neg_neg]
private lemma c623 : ((e7O * e3O) * e4O) = (e7O * (e3O * e4O)) := by simp only [m62, m23, neg_mul, mul_neg, neg_neg]
private lemma c624 : ((e7O * e3O) * e5O) = -(e7O * (e3O * e5O)) := by simp only [m62, m24, m34, m65, neg_mul, mul_neg, neg_neg]
private lemma c625 : ((e7O * e3O) * e6O) = -(e7O * (e3O * e6O)) := by simp only [m62, m25, m35, m64, neg_mul, mul_neg, neg_neg]
private lemma c630 : ((e7O * e4O) * u1) = -(e7O * (e4O * u1)) := by simp only [m63, m30, m20, m64, neg_mul, mul_neg, neg_neg]
private lemma c631 : ((e7O * e4O) * e2O) = -(e7O * (e4O * e2O)) := by simp only [m63, m31, m21, m65, neg_mul, mul_neg, neg_neg]
private lemma c632 : ((e7O * e4O) * e3O) = (e7O * (e4O * e3O)) := by simp only [m63, m32, neg_mul, mul_neg, neg_neg]
private lemma c634 : ((e7O * e4O) * e5O) = -(e7O * (e4O * e5O)) := by simp only [m63, m34, m24, m60, neg_mul, mul_neg, neg_neg]
private lemma c635 : ((e7O * e4O) * e6O) = -(e7O * (e4O * e6O)) := by simp only [m63, m35, m25, m61, neg_mul, mul_neg, neg_neg]
private lemma c640 : ((e7O * e5O) * u1) = -(e7O * (e5O * u1)) := by simp only [m64, m40, m10, m63, neg_mul, mul_neg, neg_neg]
private lemma c641 : ((e7O * e5O) * e2O) = (e7O * (e5O * e2O)) := by simp only [m64, m41, neg_mul, mul_neg, neg_neg]
private lemma c642 : ((e7O * e5O) * e3O) = -(e7O * (e5O * e3O)) := by simp only [m64, m42, m12, m65, neg_mul, mul_neg, neg_neg]
private lemma c643 : ((e7O * e5O) * e4O) = -(e7O * (e5O * e4O)) := by simp only [m64, m43, m13, m60, neg_mul, mul_neg, neg_neg]
private lemma c645 : ((e7O * e5O) * e6O) = -(e7O * (e5O * e6O)) := by simp only [m64, m45, m15, m62, neg_mul, mul_neg, neg_neg]
private lemma c650 : ((e7O * e6O) * u1) = (e7O * (e6O * u1)) := by simp only [m65, m50, neg_mul, mul_neg, neg_neg]
private lemma c651 : ((e7O * e6O) * e2O) = -(e7O * (e6O * e2O)) := by simp only [m65, m51, m01, m63, neg_mul, mul_neg, neg_neg]
private lemma c652 : ((e7O * e6O) * e3O) = -(e7O * (e6O * e3O)) := by simp only [m65, m52, m02, m64, neg_mul, mul_neg, neg_neg]
private lemma c653 : ((e7O * e6O) * e4O) = -(e7O * (e6O * e4O)) := by simp only [m65, m53, m03, m61, neg_mul, mul_neg, neg_neg]
private lemma c654 : ((e7O * e6O) * e5O) = -(e7O * (e6O * e5O)) := by simp only [m65, m54, m04, m62, neg_mul, mul_neg, neg_neg]