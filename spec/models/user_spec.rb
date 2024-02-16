require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    subject { User.new(name: 'example', email: 'example@gmail.com', password: '123456') }

    before { subject.save }

    it 'should validate name' do
      subject.name = 'example'
      expect(subject).to be_valid
    end

    it 'should validate email' do
      subject.email = 'example@gmail.com'
      expect(subject).to be_valid
    end
  end
end
