require 'spec_helper'

describe Reply do
  it { should belong_to :product }

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :content }

    it { should allow_value("mail@google.com").for(:email) }
    it { should_not allow_value("draft").for(:email) }
    it { should_not allow_value("wrong@mail").for(:email) }
    it { should_not allow_value("a@b.c").for(:email) }

    it { should allow_value("PeterI").for(:name) }
    it { should_not allow_value("Peter 1").for(:name) }
    it { should_not allow_value("#!{}.234").for(:name) }
  end
end
