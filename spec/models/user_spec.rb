# require 'spec_helper'

# describe User do
#   let(:user) { User.new(email: 'deniss@deniss.com') }

#   subject{user}

#   it { expect(user).to respond_to 'email' }
#   it { expect(user).to be_valid }

#   describe "email" do

#     it "should not be empty" do
#       user.email = ''
#       user.should_not be_valid
#     end

#     context "when formatted incorrectly" do

#       it "should not be valid" do
#         emails = %w[userdeniss.com deniss@.com deniss@makers deniss@makers.]
#         emails.each do |invalid_email|
#           user.email = invalid_email
#           expect(user).not_to be_valid
#         end
#       end
#     end
#   end

#   context "when formatted correctly" do
#     it 'should be valid' do

#       emails = %w[user@outlook.com UsEr@deniss.com users@denISs.co.uk deniss@gmail.com]
#       emails.each do |valid_email|
#         user.email = valid_email
#         expect(user).to be_valid
#       end

#     end
#   end
# end
