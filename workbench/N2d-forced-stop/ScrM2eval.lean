import Phys.Cascade.ForcedStop
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Algebra.Star.Basic
import Mathlib.Tactic
open Phys.Cascade
abbrev M2 := Matrix (Fin 2) (Fin 2) ℚ
attribute [local instance] CD.narCD CD.srCD
def ma : M2 := !![0,1;0,0]
def mb : M2 := !![0,0;1,0]
def mc : M2 := !![1,0;0,0]
def uu : CD M2 := ⟨ma, 0⟩
def vv : CD M2 := ⟨mb, 0⟩
def ww : CD M2 := ⟨mc, 0⟩
def L := CD.bilin (uu*vv) ww
def Radj := CD.bilin vv (star uu * ww)
#eval [L 0 0, L 0 1, L 1 0, L 1 1]
#eval [Radj 0 0, Radj 0 1, Radj 1 0, Radj 1 1]
