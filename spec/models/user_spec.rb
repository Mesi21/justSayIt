require './spec/rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Mesi', photo: 'https://i.picsum.photos/id/1011/5472/3648.jpg?hmac=Koo9845x2akkVzVFX3xxAc9BCkeGYA9VRVfLE4f0Zzk', bio: 'Web developer from Romania.') }

  before { subject.save }

  it 'name should exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should return the name' do
    expect(subject.name).eql?('Mesi')
  end

  it 'posts_counter should be greater or equal to 0' do
    subject.posts_counter = 1
    expect(subject).to be_valid
  end

  it 'posts_counter should be greater or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
