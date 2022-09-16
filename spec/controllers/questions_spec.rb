require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  context "when question id is valid" do
    it "returns chenged to +1" do
      expect { post :create, params: { question: { title: "t", body: "b" } } }.to change(Question, :count).by(1)
    end

    it "returns status ok" do
      expect(response).to have_http_status(200)
    end
  end

  context "when assigned a new Question to @question" do
    it 'returns assigned question' do
      get :new
      expect(assigns(:question)).to be_a_new(Question)
    end
  end
end
