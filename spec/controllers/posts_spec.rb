require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    subject { User.new(name: 'Mesi', photo: 'https://i.picsum.photos/id/1011/5472/3648.jpg?hmac=Koo9845x2akkVzVFX3xxAc9BCkeGYA9VRVfLE4f0Zzk', bio: 'Web developer from Romania.') }
    before { subject.save }

    it 'gets all posts from the user' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('List of all posts')
    end
  end

  describe 'GET /show' do
    subject { User.new(name: 'Mesi', photo: 'https://i.picsum.photos/id/1011/5472/3648.jpg?hmac=Koo9845x2akkVzVFX3xxAc9BCkeGYA9VRVfLE4f0Zzk', bio: 'Web developer from Romania.') }
    post = Post.new(title: 'Sunshine blessing', text: 'The sun slowly rises on the horizon', comments_counter: 5,
                    likes_counter: 3, author_id: 1)
    subject { post }
    before { subject.save }
    before { post.save }

    it 'renders the template for show action' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
      expect(response.body).to include('First post')
    end
  end
end
