require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let!(:question) { create :question }
  context "when question id is valid" do
    it "returns chenged to +1" do
      expect { post :create, params: { question_id: question.id, answer: { title: "g" } } }.to change(Answer, :count).by(1)
    end

    it "returns status ok" do
      expect(response).to have_http_status(200)
    end
  end

  context "when question id is not valid" do
    before { post :create, params: { question_id: 2, answer: { title: "g" } } }
    it "returns 404" do
      expect(response).to have_http_status(404)
    end
  end

  context "when assigned a new Answer to @answer" do
    it "returns assigned answer" do
      get :new, params: { question_id: question.id}
      expect(assigns(:answer)).to be_a_new(Answer)
    end
  end
end
