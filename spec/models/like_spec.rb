require './spec/rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(title: 'Title', text: 'Body', author_id: user.id, comments_counter: 1)
  subject { Like.new(post_id: post.id, author_id: user.id) }
  before { subject.save }

  it 'invalid without post_id' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'invalid without author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end
end
