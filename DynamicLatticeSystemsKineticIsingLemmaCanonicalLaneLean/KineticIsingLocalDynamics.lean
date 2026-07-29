import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure SpinConfiguration (Λ : Type) where
  config : Λ → ℤ₂

def flip (σ : SpinConfiguration Λ) (x : Λ) : SpinConfiguration Λ :=
  { config := λ y => if y = x then 1 - σ.config y else σ.config y }

structure KineticIsingGenerator (Λ : Type) [Fintype Λ] where
  transitionRate : SpinConfiguration Λ → Λ → ℝ
  detailedBalance : ∀ σ η : SpinConfiguration Λ, ∀ x y : Λ,
    transitionRate σ x * (if η = flip σ x then 1 else 0) =
    transitionRate η y * (if σ = flip η y then 1 else 0)

structure LocalDynamicsPackage (Λ : Type) [Fintype Λ] where
  generator : KineticIsingGenerator Λ
  initialDistribution : SpinConfiguration Λ → ℝ

structure LocalDynamicsEvidence {Λ : Type} [Fintype Λ] (L : LocalDynamicsPackage Λ) where
  generatorClosed : L.generator.detailedBalance
  initialDistributionClosed : ∀ σ, L.initialDistribution σ ≥ 0

def LocalDynamicsClosed {Λ : Type} [Fintype Λ] (L : LocalDynamicsPackage Λ) : Prop :=
  L.generator.detailedBalance ∧ ∀ σ, L.initialDistribution σ ≥ 0

theorem local_dynamics_closed_from_evidence {Λ : Type} [Fintype Λ] (L : LocalDynamicsPackage Λ)
    (E : LocalDynamicsEvidence L) : LocalDynamicsClosed L := by
  exact And.intro E.generatorClosed E.initialDistributionClosed

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse