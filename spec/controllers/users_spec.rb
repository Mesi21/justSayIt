require './spec/rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Get all users' do
    subject { User.new(name: 'Mesi', photo: 'https://i.picsum.photos/id/1011/5472/3648.jpg?hmac=Koo9845x2akkVzVFX3xxAc9BCkeGYA9VRVfLE4f0Zzk', bio: 'Web developer from Romania.') }
    before { subject.save }

    it 'renders the index page with all the users' do
      get '/users'
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end

    it 'renders the show page with user details' do
      get '/users/1'
      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end
  end
end
