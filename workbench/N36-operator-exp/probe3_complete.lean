import Phys.Foundation.ContinuumArchimedean
import Phys.Foundation.ContinuumTopology
import Mathlib.Topology.Algebra.IsUniformGroup.Defs
import Mathlib.Topology.Algebra.IsUniformGroup.Basic
import Mathlib.Topology.Sequences
import Mathlib.Topology.UniformSpace.Cauchy

open Phys.Foundation Filter
open scoped Topology

namespace Phys.Foundation.ContinuumQ

noncomputable section

-- Is the order topology on Cut FIRST COUNTABLE? (the seq-compact route's pivot)
#synth FirstCountableTopology Cut
#synth SecondCountableTopology Cut

-- The seq-compact route building blocks:
#check @IsCompact.tendsto_subseq
#check @IsCompact.isSeqCompact
#check @tendsto_nhds_of_cauchySeq_of_subseq
#check @complete_of_cauchySeq_tendsto

end

end Phys.Foundation.ContinuumQ
