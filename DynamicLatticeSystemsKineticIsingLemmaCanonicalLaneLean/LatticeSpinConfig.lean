import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure LatticeSpinConfig where
  siteType : Type u
  spinValue : siteType → ℤ
  finiteSupport : Set siteType
  configuration : ∀ s : siteType, spinValue s = 1 ∨ spinValue s = -1

structure LatticeSpinEvidence (L : LatticeSpinConfig) where
  spinValueClosed : ∀ s : L.siteType, L.spinValue s = 1 ∨ L.spinValue s = -1

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse
