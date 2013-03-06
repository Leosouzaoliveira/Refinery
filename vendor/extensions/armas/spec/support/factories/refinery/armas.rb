
FactoryGirl.define do
  factory :arma, :class => Refinery::Armas::Arma do
    sequence(:nome) { |n| "refinery#{n}" }
  end
end

