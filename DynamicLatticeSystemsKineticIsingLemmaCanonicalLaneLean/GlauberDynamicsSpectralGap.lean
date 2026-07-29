import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean.KineticIsingLocalDynamics

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure GlauberDynamicsPackage {Λ : Type} [Fintype Λ] (L : LocalDynamicsPackage Λ) where
  heatBathRate : ℝ
  detailedBalanceCondition : Prop
  detailedBalanceConditionClosed : detailedBalanceCondition

structure SpectralGapPackage {Λ : Type} [Fintype Λ] {L : LocalDynamicsPackage Λ}
    (G : GlauberDynamicsPackage L) where
  gapValue : ℝ
  positivity : gapValue > 0
  relaxationTimeBound : Prop

structure SpectralGapEvidence {Λ : Type} [Fintype Λ] {L : LocalDynamicsPackage Λ}
    {G : GlauberDynamicsPackage L} (S : SpectralGapPackage G) where
  positivityClosed : S.positivity
  relaxationTimeBoundClosed : S.relaxationTimeBound

def SpectralGapClosed {Λ : Type} [Fintype Λ] {L : LocalDynamicsPackage Λ}
    {G : GlauberDynamicsPackage L} (S : SpectralGapPackage G) : Prop :=
  S.positivity ∧ S.relaxationTimeBound

theorem spectral_gap_closed_from_evidence {Λ : Type} [Fintype Λ] {L : LocalDynamicsPackage Λ}
    {G : GlauberDynamicsPackage L} (S : SpectralGapPackage G)
    (E : SpectralGapEvidence S) : SpectralGapClosed S := by
  exact And.intro E.positivityClosed E.relaxationTimeBoundClosed

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse