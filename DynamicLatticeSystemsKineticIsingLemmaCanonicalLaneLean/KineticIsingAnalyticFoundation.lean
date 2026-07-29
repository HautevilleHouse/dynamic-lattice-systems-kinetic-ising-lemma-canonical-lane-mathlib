import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean.KineticIsingLemma
import HautevilleHouse.DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean.MixingTimeBounds

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure KineticIsingAnalyticFoundation where
  localDynamics : ∀ (Λ : Type) [Fintype Λ], LocalDynamicsPackage Λ
  glauberDynamics : ∀ (Λ : Type) [Fintype Λ], GlauberDynamicsPackage (localDynamics Λ)
  spectralGap : ∀ (Λ : Type) [Fintype Λ], SpectralGapPackage (glauberDynamics Λ)
  kineticIsingLemma : ∀ (Λ : Type) [Fintype Λ], KineticIsingLemmaPackage (spectralGap Λ)
  mixingTimeBound : ∀ (Λ : Type) [Fintype Λ], MixingTimeBoundPackage (kineticIsingLemma Λ)

structure KineticIsingAnalyticFoundationEvidence (F : KineticIsingAnalyticFoundation) where
  localDynamicsClosed : ∀ (Λ : Type) [Fintype Λ], LocalDynamicsClosed (F.localDynamics Λ)
  glauberDynamicsClosed : ∀ (Λ : Type) [Fintype Λ], True
  spectralGapClosed : ∀ (Λ : Type) [Fintype Λ], SpectralGapClosed (F.spectralGap Λ)
  kineticIsingLemmaClosed : ∀ (Λ : Type) [Fintype Λ], KineticIsingLemmaClosed (F.kineticIsingLemma Λ)
  mixingTimeBoundClosed : ∀ (Λ : Type) [Fintype Λ], MixingTimeBoundClosed (F.mixingTimeBound Λ)

def KineticIsingAnalyticFoundationClosed (F : KineticIsingAnalyticFoundation) : Prop :=
  (∀ (Λ : Type) [Fintype Λ], LocalDynamicsClosed (F.localDynamics Λ)) ∧
  (∀ (Λ : Type) [Fintype Λ], SpectralGapClosed (F.spectralGap Λ)) ∧
  (∀ (Λ : Type) [Fintype Λ], KineticIsingLemmaClosed (F.kineticIsingLemma Λ)) ∧
  (∀ (Λ : Type) [Fintype Λ], MixingTimeBoundClosed (F.mixingTimeBound Λ))

theorem kinetic_ising_analytic_foundation_closed_from_evidence
    (F : KineticIsingAnalyticFoundation) (E : KineticIsingAnalyticFoundationEvidence F) :
    KineticIsingAnalyticFoundationClosed F := by
  exact And.intro E.localDynamicsClosed
    (And.intro E.spectralGapClosed
      (And.intro E.kineticIsingLemmaClosed E.mixingTimeBoundClosed))

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse