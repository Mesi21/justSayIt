require './spec/rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(title: 'Title', text: 'Body', author_id: user.id)
  subject { Comment.new(text: 'Comment', author_id: user.id, post_id: post.id) }
  before { subject.save }

  it 'invalid without text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
  it 'invalid without a author id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end
  it 'invalid without a post id' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end
end
