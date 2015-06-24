require 'rails_helper'

RSpec.describe GigsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all gigs as @gigs" do
      gig = Gig.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:gigs)).to eq([gig])
    end
  end

  describe "GET #show" do
    it "assigns the requested gig as @gig" do
      gig = Gig.create! valid_attributes
      get :show, {:id => gig.to_param}, valid_session
      expect(assigns(:gig)).to eq(gig)
    end
  end

  describe "GET #edit" do
    it "assigns the requested gig as @gig" do
      gig = Gig.create! valid_attributes
      get :edit, {:id => gig.to_param}, valid_session
      expect(assigns(:gig)).to eq(gig)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Gig" do
        expect {
          post :create, {:gig => valid_attributes}, valid_session
        }.to change(Gig, :count).by(1)
      end

      it "assigns a newly created gig as @gig" do
        post :create, {:gig => valid_attributes}, valid_session
        expect(assigns(:gig)).to be_a(Gig)
        expect(assigns(:gig)).to be_persisted
      end

      it "redirects to the created gig" do
        post :create, {:gig => valid_attributes}, valid_session
        expect(response).to redirect_to(Gig.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved gig as @gig" do
        post :create, {:gig => invalid_attributes}, valid_session
        expect(assigns(:gig)).to be_a_new(Gig)
      end

      it "re-renders the 'new' template" do
        post :create, {:gig => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested gig" do
        gig = Gig.create! valid_attributes
        put :update, {:id => gig.to_param, :gig => new_attributes}, valid_session
        gig.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested gig as @gig" do
        gig = Gig.create! valid_attributes
        put :update, {:id => gig.to_param, :gig => valid_attributes}, valid_session
        expect(assigns(:gig)).to eq(gig)
      end

      it "redirects to the gig" do
        gig = Gig.create! valid_attributes
        put :update, {:id => gig.to_param, :gig => valid_attributes}, valid_session
        expect(response).to redirect_to(gig)
      end
    end

    context "with invalid params" do
      it "assigns the gig as @gig" do
        gig = Gig.create! valid_attributes
        put :update, {:id => gig.to_param, :gig => invalid_attributes}, valid_session
        expect(assigns(:gig)).to eq(gig)
      end

      it "re-renders the 'edit' template" do
        gig = Gig.create! valid_attributes
        put :update, {:id => gig.to_param, :gig => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested gig" do
      gig = Gig.create! valid_attributes
      expect {
        delete :destroy, {:id => gig.to_param}, valid_session
      }.to change(Gig, :count).by(-1)
    end

    it "redirects to the gigs list" do
      gig = Gig.create! valid_attributes
      delete :destroy, {:id => gig.to_param}, valid_session
      expect(response).to redirect_to(gigs_url)
    end
  end

end
