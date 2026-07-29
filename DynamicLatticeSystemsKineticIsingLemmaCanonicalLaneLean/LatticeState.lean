import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure LatticePoint where
  index : ℕ
  spin : ℤ

def spinFlip (s : ℤ) : ℤ := -s

structure LatticeConfiguration where
  points : List LatticePoint
  adjacencyPairs : List (ℕ × ℕ)
  allSpinsDefined : Prop

structure AdmittedLatticeObject where
  config : LatticeConfiguration
  kineticIsingRate : Prop
  transitionRatesWellDefined : Prop
  conclusion : transitionRatesWellDefined

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse
