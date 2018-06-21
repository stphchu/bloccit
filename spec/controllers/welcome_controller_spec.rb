require 'rails_helper'

# #1
RSpec.describe WelcomeController, type: :controller do
   describe "GET index" do
     it "renders the index template" do
# #2
       get :index
# #3
       expect(response).to render_template("index")
     end
   end

   describe "GET about" do
     it "renders the about template" do
       get :about
       expect(response).to render_template("about")
     end
   end
end
