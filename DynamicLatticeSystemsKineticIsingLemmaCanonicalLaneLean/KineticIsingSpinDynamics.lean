import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure SpinConfiguration where
  lattice : Type u
  spin : lattice → ℤ₂
  finiteIndex : Finset lattice

structure SpinDynamicsPackage where
  config : SpinConfiguration
  flipRate : Type v
  detailedBalance : Prop
  markovProcess : Prop
  ergodicity : Prop

structure SpinDynamicsEvidence (S : SpinDynamicsPackage) where
  detailedBalanceClosed : S.detailedBalance
  markovProcessClosed : S.markovProcess
  ergodicityClosed : S.ergodicity

def SpinDynamicsClosed (S : SpinDynamicsPackage) : Prop :=
  S.detailedBalance ∧ S.markovProcess ∧ S.ergodicity

theorem spin_dynamics_closed_from_evidence (S : SpinDynamicsPackage) (E : SpinDynamicsEvidence S) :
    SpinDynamicsClosed S := by
  exact And.intro E.detailedBalanceClosed (And.intro E.markovProcessClosed E.ergodicityClosed)

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse