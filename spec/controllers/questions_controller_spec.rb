require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:my_question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: 0) }

#INDEX
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_question] to @questions" do
      get :index
      expect(assigns(:questions)).to eq([my_question])
    end
  end

#SHOW
    describe "GET show" do
    it "returns http success" do
      get :show, params: { id: my_question.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: my_question.id }
      expect(response).to render_template :show
    end

    it "assigns my_question to @question" do
      get :show, params: { id: my_question.id }
      expect(assigns(:question)).to eq(my_question)
    end
  end

#NEW
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

     it "renders the #new view" do
       get :new
       expect(response).to render_template :new
     end

     it "instantiates @question" do
       get :new
       expect(assigns(:question)).not_to be_nil
     end
  end


#CREATE
  describe "POST create" do
     it "increases the number of Question by 1" do
	expect{ post :create, params: { question: { title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: 0 } } }.to change(Question,:count).by(1)
     end

     it "assigns the new question to @question" do
       post :create, params: { question: { title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: 0 } }
       expect(assigns(:question)).to eq Question.last
     end

     it "redirects to the new question" do
       post :create, params: { question: { title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: 0 } }
       expect(response).to redirect_to Question.last
     end
  end	



#EDIT
  describe "GET edit" do
     it "returns http success" do
       get :edit, params: { id: my_question.id }
       expect(response).to have_http_status(:success)
     end

     it "renders the #edit view" do
       get :edit, params: { id: my_question.id }
       expect(response).to render_template :edit
     end

     it "assigns question to be updated to @question" do
       get :edit, params: { id: my_question.id }
       question_instance = assigns(:question)

       expect(question_instance.id).to eq my_question.id
       expect(question_instance.title).to eq my_question.title
       expect(question_instance.body).to eq my_question.body
       expect(question_instance.resolved).to eq my_question.resolved
     end
  end

#DESTROY
 describe "DELETE destroy" do
     it "deletes the question" do
       delete :destroy, params: { id: my_question.id }
       count = Question.where({id: my_question.id}).size
       expect(count).to eq 0
     end

     it "redirects to questions index" do
       delete :destroy, params: { id: my_question.id }
       expect(response).to redirect_to questions_path
     end
 end

end
