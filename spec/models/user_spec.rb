require 'rails_helper'

RSpec.describe User, :type => :model do
	context 'new user' do 
		let(:user) {User.new}

		its(:name) {should be_nil?}		

	end  
end
