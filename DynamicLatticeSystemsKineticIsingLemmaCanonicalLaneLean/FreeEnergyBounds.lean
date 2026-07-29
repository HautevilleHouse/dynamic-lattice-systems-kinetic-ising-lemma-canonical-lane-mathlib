import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure FreeEnergyBoundPackage where
  freeEnergyFunctional : (LatticeConfiguration → ℝ) → ℝ
  lowerBound : ℝ
  upperBound : ℝ
  boundValidity : Prop

structure FreeEnergyBoundEvidence (f : FreeEnergyBoundPackage) where
  boundValidityClosed : f.boundValidity

def FreeEnergyBoundClosed (f : FreeEnergyBoundPackage) : Prop :=
  f.boundValidity

theorem free_energy_bound_closed_from_evidence (f : FreeEnergyBoundPackage) 
  (e : FreeEnergyBoundEvidence f) : FreeEnergyBoundClosed f :=
  e.boundValidityClosed

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse
