import canonicalLaneMathlib.AdmissibleClass

/-!
# Kinetic Ising Lattice Dynamics Package
-/

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure LatticeNetwork where
  vertexSet : Type u
  edgeSet : Type v
  adjacency : Prop
  finiteLattice : Prop
  nearestNeighbor : Prop

structure SpinConfiguration (L : LatticeNetwork) where
  spinValue : L.vertexSet → ℤ₂
  configurationSpace : Prop

structure KineticIsingDynamicsPackage (L : LatticeNetwork) where
  hamiltonian : (SpinConfiguration L) → ℝ
  glauberRate : (SpinConfiguration L) → (L.vertexSet) → ℝ
  detailedBalance : Prop
  invariantMeasure : Prop
  spectralGap : Prop

structure KineticIsingDynamicsEvidence {L : LatticeNetwork}
    (D : KineticIsingDynamicsPackage L) where
  detailedBalanceClosed : D.detailedBalance
  invariantMeasureClosed : D.invariantMeasure
  spectralGapClosed : D.spectralGap

def KineticIsingDynamicsClosed {L : LatticeNetwork}
    (D : KineticIsingDynamicsPackage L) : Prop :=
  D.detailedBalance ∧ D.invariantMeasure ∧ D.spectralGap

theorem kinetic_ising_dynamics_closed_from_evidence
    {L : LatticeNetwork} (D : KineticIsingDynamicsPackage L)
    (E : KineticIsingDynamicsEvidence D) : KineticIsingDynamicsClosed D := by
  exact And.intro E.detailedBalanceClosed
    (And.intro E.invariantMeasureClosed E.spectralGapClosed)

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse