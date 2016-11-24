require 'rails_helper'

RSpec.describe SlidersController, type: :controller do
  it { should route(:get, '/sliders/1').to(action: :show, id: 1) }

  it { should route(:get, '/sliders/new').to(action: :new) }

  it { should route(:get, '/sliders/1/edit').to(action: :edit, id: 1) }

  it { should route(:post, '/sliders').to(action: :create) }

  it { should route(:put, '/sliders/1').to(action: :update, id: 1) }

  it { should route(:delete, '/sliders/1').to(action: :destroy, id: 1) }

  describe '#show' do
    let(:slider) { double }

    before { expect(Slider).to receive(:find).with('1').and_return(slider) }

    before { get :show, id: 1 }

    it { should render_template :show }
  end

  describe '#new' do
    before { get :new }

    it { should render_template :new }
  end

  describe '#edit' do
    let(:slider) { double }

    before { expect(Slider).to receive(:find).with('1').and_return(slider) }

    before { get :edit, id: 1 }

    it { should render_template :edit }
  end

  describe '#create' do
    let(:slider) { stub_model Slider }

    let(:params) { { name: 'Name' } }

    before { expect(Slider).to receive(:new).with(params).and_return(slider) }

    context do
      before { expect(slider).to receive(:save).and_return(true) }

      before { post :create, slider: params }

      it { should redirect_to slider }
    end

    context do
      before { expect(slider).to receive(:save).and_return(false) }

      before { post :create, slider: params }

      it { should redirect_to :root }
    end
  end

  describe '#update' do
    let(:slider) { stub_model Slider }

    let(:params) { { name: 'Name' } }

    before { expect(Slider).to receive(:find).with('1').and_return(slider) }

    context do
      before { expect(slider).to receive(:update).with(params).and_return(true) }

      before { put :update, id: 1, slider: params }

      it { should redirect_to slider }
    end

    context do
      before { expect(slider).to receive(:update).and_return(false) }

      before { put :update, id: 1, slider: params }

      it { should redirect_to :root }
    end
  end

  describe '#destroy' do
    let(:slider) { double }

    before { expect(Slider).to receive(:find).with('1').and_return(slider) }

    before { expect(slider).to receive(:destroy) }

    before { delete :destroy, id: 1 }

    it { should redirect_to :root }
  end
end
