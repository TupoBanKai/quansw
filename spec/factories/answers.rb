FactoryBot.define do
  factory :answer, class: Answer do
    id { 1 }
    title { "title" }
    question_id { 1 }
  end
end
