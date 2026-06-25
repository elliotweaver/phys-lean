import Phys.Algebra.DerivationOExpSummable
import Mathlib.Topology.Algebra.InfiniteSum.Module

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra Matrix
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- The product family in O Cut. Strategy: reduce componentwise via coordOCut, then each
-- component is a finite sum of products of summable scalar sequences.
-- First: is the O Cut product, viewed through coordOCut, expressible so that the product
-- family is summable from the entrywise abs-summability of f,g?

-- KEY structural fact: each coordinate e_i is CONTINUOUS and Cut-LINEAR (it's a component of
-- coordOCut). And the family f(k)·g(l) — its i-th coordinate e_i(f(k)·g(l)) is a polynomial
-- (degree-2, finite) in the coordinates of f(k) and g(l) by the CD product formula.
-- That's messy. ALTERNATIVE: use that O Cut product is continuous + the matrix transport.

-- Actually the cleanest: summability of the product family follows if we can show the
-- coordOCut-image of (f(k)·g(l)) is summable over ℕ×ℕ. coordOCut is a continuous AddEquiv,
-- so Summable (f·g) ↔ Summable (coordOCut ∘ (f·g)).
-- coordOCut (f(k)·g(l)) = bilinear form B(coordOCut f(k), coordOCut g(l)) — and bilinear
-- forms preserve summability of product families given component summability.

-- Let me first check whether the O Cut multiplication map is a continuous bilinear map and if
-- Mathlib has a product-summability lemma for it. Probably not without a norm. So go componentwise.

-- Probe: the i-th component of a product, e_i(a·b), via the CD mul formula, is a finite Cut-sum
-- of e_j(a)*e_k(b) terms (with signs/conjugations). Over Cut (commutative), conj = id on Cut?
example (c : Cut) : star c = c := by exact?

end
