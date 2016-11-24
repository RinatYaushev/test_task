require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it { should route(:get, '/sliders/1/posts/new').to(action: :new, slider_id: 1) }

  it { should route(:post, '/sliders/1/posts').to(action: :create, slider_id: 1) }

  describe '#new' do
    let(:slider) { double }

    before { expect(Slider).to receive(:find).with('1').and_return(slider) }

    before { get :new, slider_id: 1 }

    it { should render_template :new }
  end

  describe '#create' do
    let(:slider) { stub_model Slider }

    let(:some_post) { double }

    let(:params) do
      {
        name: 'Name',
        author: 'Author',
        content: 'Content',
        slider: slider
      }
    end

    before { expect(Slider).to receive(:find).with('1').and_return(slider) }

    before { expect(Post).to receive(:new).with(params).and_return(some_post) }

    context do
      before { expect(some_post).to receive(:save).and_return(true) }

      before { post :create, slider_id: 1, post: params }

      it { should redirect_to slider }
    end

    context do
      before { expect(some_post).to receive(:save).and_return(false) }

      before { post :create, slider_id: 1, post: params }

      it { should redirect_to :root }
    end
  end
end
