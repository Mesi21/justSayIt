require './spec/rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    user = User.new(name: 'Mesi', posts_counter: 0)
    user.save
  end
  post = Post.new(title: 'Sunset in the Alps', text: 'test', comments_counter: 5, likes_counter: 3, author_id: 1)
  subject { post }

  before { subject.save }
  before { post.save }

  context 'validations' do
    it 'comments_counter should be integer' do
      expect(subject).to be_valid
    end
    it 'title should not be missing' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'comments counter should not be missing' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'Increase the counter' do
      count = User.find(1).posts_counter
      subject.send(:change_post_counter)
      expect(User.find(1).posts_counter).to eq(count + 1)
    end
  end
end