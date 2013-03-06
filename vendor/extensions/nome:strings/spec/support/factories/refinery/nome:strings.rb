
FactoryGirl.define do
  factory :nome:string, :class => Refinery::Nome:strings::Nome:string do
    sequence(:modelo) { |n| "refinery#{n}" }
  end
end

