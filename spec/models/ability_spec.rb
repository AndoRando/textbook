require 'spec_helper'
require 'cancan/matchers'

describe 'User' do
  subject(:ability) { Ability.new(user) }
  
  models = [:lesson, :section, :chapter]

  context 'who is not signed in' do
    let(:user) { User.new }

    models.each do |model|
      it { should be_able_to(:read, FactoryGirl.create(model)) }

      [:create, :update, :destroy].each do |action|
        it { should_not be_able_to(action, FactoryGirl.create(model)) }
      end
    end
  end

  context 'who is an author' do
    let(:user) { FactoryGirl.create :author }

    models.each do |model|
      it { should be_able_to :manage, model }
    end
  end
end
