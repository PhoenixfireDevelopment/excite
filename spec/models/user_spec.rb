require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'concerning validations and factories' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    it 'requires the first_name' do
      expect(build(:user, first_name: nil)).not_to be_valid
    end

    it 'requires the last_name' do
      expect(build(:user, last_name: nil)).not_to be_valid
    end

    it 'requires the email' do
      expect(build(:user, email: nil)).not_to be_valid
    end

    it 'accepts accept properly formatted email addresses' do
      %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp].each do |valid_email_address|
        expect(build(:user, email: valid_email_address)).to be_valid
      end
    end

    it 'rejects invalid email addresses without @ sign' do
      expect(build(:user, email: 'foo')).not_to be_valid
    end

    it 'rejects invalid email addresses in other fashions' do
      %w[user@foo,com user_at_foo.org example.user@foo.].each do |email|
        expect(build(:user, email: email)).not_to be_valid
      end
    end
  end

  describe 'concerning instance methods' do
    it 'has a full_name method' do
      expect(build(:user, first_name: 'Mark', last_name: 'Holmberg').full_name).to eql('Mark Holmberg')
    end

    it 'has a legal_name method' do
      expect(build(:user, first_name: 'Mark', last_name: 'Holmberg').legal_name).to eql('Holmberg, Mark')
    end

    it 'overrides the to_s method' do
      expect(build(:user, first_name: 'Mark', last_name: 'Holmberg').to_s).to eql('Mark Holmberg')
    end
  end
end
