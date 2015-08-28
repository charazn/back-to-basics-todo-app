require 'rails_helper'

RSpec.describe ListsController, type: :controller do

  let(:list) { create(:list) }

  describe "GET #index" do
    before { get :index }

    it { is_expected.to render_template(:index) }
  end

  describe "GET #show" do
    before { get :show, :id => list.id }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:list)).to eq(list) }
  end

  describe "GET #new" do
    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:list)).to be_a_new(List) }
  end

  describe "POST #create" do
    before { post :create, :list => params }

    context "with valid params" do
      let(:params) { attributes_for(:list) }

      it { expect(assigns(:list)).to be_persisted }
      it { expect(response).to redirect_to(List.last) }
    end

    context "with invalid params" do
      let(:params) { attributes_for(:list, :invalid) }

      it { expect(assigns(:list)).to be_a_new_record }
      it { expect(assigns(:list)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
    end
  end

  describe "GET #edit" do
    before { get :edit, :id => list.id }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:list)).to eq(list) }
  end

  describe "PATCH #update" do
    before { patch :update, :id => list.id, :list => params }

    context "with valid params" do
      let(:params) { { title: "Title updated" } }

      it { expect(assigns(:list).title).to eq(params[:title]) }
      it { expect(assigns(:list)).to be_valid }
      it { expect(response).to redirect_to(list) }
    end

    context "with invalid params" do
      let(:params) { attributes_for(:list, :invalid) }

      it { expect(assigns(:list)).not_to be_valid }
      it { expect(response).to render_template(:edit) }
    end
  end

  # describe "PUT #archive" do
  #   before { put :archive, :id => list.id }

  #   it { expect(assigns(:list).status).to eq('archived') }
  #   it { expect(response).to redirect_to(lists_path) }
  # end

end
