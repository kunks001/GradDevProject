require 'spec_helper'

describe User do

	let(:user) { User.new(email: 'deniss@deniss.com') }

	subject{user}

	it { expect(user).to respond_to 'email' }

end