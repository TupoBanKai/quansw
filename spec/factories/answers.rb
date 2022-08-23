FactoryBot.define do
  factory :answer, class: Answer do
    id {  }
    title { "title" }
    association :question, factory: :question
  end
end
