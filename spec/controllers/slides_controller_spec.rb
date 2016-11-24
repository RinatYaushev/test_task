require 'rails_helper'

RSpec.describe SlidesController, type: :controller do
  it { should route(:get, '/sliders/1/slides/2').to(action: :show, slider_id: 1, id: 2) }

  it { should route(:get, '/sliders/1/slides/new').to(action: :new, slider_id: 1) }

  it { should route(:get, '/sliders/1/slides/2/edit').to(action: :edit, slider_id: 1, id: 2) }

  it { should route(:post, '/sliders/1/slides').to(action: :create, slider_id: 1) }

  it { should route(:put, '/sliders/1/slides/2').to(action: :update, slider_id: 1, id: 2) }

  it { should route(:delete, '/sliders/1/slides/2').to(action: :destroy, slider_id: 1, id: 2) }

  describe '#show' do
    let(:slider) { double }

    let(:slide) { double }

    before { expect(Slider).to receive(:find).with('1').and_return(slider) }

    before { expect(Slide).to receive(:find).with('2').and_return(slide) }

    before { get :show, slider_id: 1, id: 2 }

    it { should render_template :show }
  end

  describe '#new' do
    let(:slider) { double }

    before { expect(Slider).to receive(:find).with('1').and_return(slider) }

    before { get :new, slider_id: 1 }

    it { should render_template :new }
  end

  describe '#edit' do
    let(:slider) { double }

    let(:slide) { double }

    before { expect(Slider).to receive(:find).with('1').and_return(slider) }

    before { expect(Slide).to receive(:find).with('2').and_return(slide) }

    before { get :edit, slider_id: 1, id: 2 }

    it { should render_template :edit }
  end

  describe '#create' do
    let(:slider) { stub_model Slider }

    let(:slide) { stub_model Slide }

    let(:params) { { image: 'image.jpg', slider: slider } }

    before { expect(Slider).to receive(:find).with('1').and_return(slider) }

    before { expect(Slide).to receive(:new).with(params).and_return(slide) }

    context do
      before { expect(slide).to receive(:save).and_return(true) }

      before { post :create, slider_id: 1, slide: params }

      it { should redirect_to [slider, slide] }
    end

    context do
      before { expect(slide).to receive(:save).and_return(false) }

      before { post :create, slider_id: 1, slide: params }

      it { should redirect_to :root }
    end
  end

  describe '#update' do
    let(:slider) { stub_model Slider }

    let(:slide) { stub_model Slide }

    let(:params) { { image: 'image.jpg', slider: slider } }

    before { expect(Slider).to receive(:find).with('1').and_return(slider) }

    before { expect(Slide).to receive(:find).with('2').and_return(slide) }

    context do
      before { expect(slide).to receive(:update).with(params).and_return(true) }

      before { put :update, slider_id: 1, id: 2, slide: params }

      it { should redirect_to [slider, slide] }
    end

    context do
      before { expect(slide).to receive(:update).with(params).and_return(false) }

      before { put :update, slider_id: 1, id: 2, slide: params }

      it { should redirect_to :root }
    end
  end

  describe '#destroy' do
    let(:slider) { double }

    let(:slide) { double }

    before { expect(Slider).to receive(:find).with('1').and_return(slider) }

    before { expect(Slide).to receive(:find).with('2').and_return(slide) }

    before { expect(slide).to receive(:destroy) }

    before { delete :destroy, slider_id: 1, id: 2 }

    it { should redirect_to :root }
  end
end
