import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure DetailedBalanceCondition where
  equilibriumMeasure : LatticeSpinConfig → ℝ
  transitionRate : LatticeSpinConfig → LatticeSpinConfig → ℝ
  detailedBalanceEquation : Prop

structure DetailedBalanceEvidence (D : DetailedBalanceCondition) where
  detailedBalanceEquationClosed : D.detailedBalanceEquation

def DetailedBalanceClosed (D : DetailedBalanceCondition) : Prop :=
  D.detailedBalanceEquation

theorem detailed_balance_closed_from_evidence (D : DetailedBalanceCondition)
    (E : DetailedBalanceEvidence D) : DetailedBalanceClosed D := by
  exact E.detailedBalanceEquationClosed

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse
