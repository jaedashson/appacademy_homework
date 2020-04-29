require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        post :create, user: { email: "", password: "" } # unknown keyword: user
        expect(response).to render_template(:new)
      end

      it "validates that the password is at least 6 characters long" do
        post :create, user: { email: "abc@gmail.com", password: "hunt" } # unknown keyword: user
        expect(response).to render_template(:new)
      end
    end

    context "with valid params" do
      it "redirects user to bands index on success" do
        post :create, user: { email: "abc@gmail.com", password: "hunter12" } # unknown keyword: user
        expect(response).to redirect_to(user_url(User.find_by(email: "abc@gmail.com")))
      end
    end
  end
end

