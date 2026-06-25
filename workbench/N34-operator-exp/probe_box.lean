import Phys.Foundation.ContinuumCCLO
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Constructions

open Phys.Foundation ContinuumQ

noncomputable instance instTopCut : TopologicalSpace Cut := Preorder.topology Cut
instance instOrdTopCut : OrderTopology Cut := ⟨rfl⟩

-- (1) Heine-Borel: closed interval compact
example (a b : Cut) : IsCompact (Set.Icc a b) := isCompact_Icc

-- (2) finite product box compactness: Fin n → Cut, the [-1,1]^n box
#check @isCompact_univ_pi
#check @IsCompact.pi
example (n : ℕ) : IsCompact (Set.univ.pi (fun _ : Fin n => Set.Icc (-1 : Cut) 1)) :=
  isCompact_univ_pi (fun _ => isCompact_Icc)

-- (3) matrix box: Matrix (Fin 8) (Fin 8) Cut as a product
#check @isCompact_pi_infinite
