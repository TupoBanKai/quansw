require 'rails_helper'

describe Answer do
  let!(:question) { create :question, title: "How to install rails 6?" }
  let!(:answer_without_title) { build :answer, title: nil, question_id: 1 }
  let!(:answer_without_question) { build :answer, title: "...", question_id: nil }
  let!(:true_answer) { build :answer, title: "Idk, just install 7", question_id: question.id }

  it "Answer should not valid without question_id" do
    expect(answer_without_question).to_not be_valid
  end

  it "Answer should not valid without title" do
    expect(answer_without_title).to_not be_valid
  end

  it "Answer should be valid" do
    expect(true_answer).to be_valid
  end
end
