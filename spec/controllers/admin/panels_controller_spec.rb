require 'rails_helper'

RSpec.describe Admin::PanelsController, type: :controller do

  let(:admin) { FactoryGirl.build(:admin) }

  let(:user) { FactoryGirl.build(:user) }

  #admin_user = User.new(email: Faker::Internet.email,encrypted_password: Faker::Internet.password, admin:true )

  it "allowed only to admin" do
    expect(admin).to be_admin
  end



end
