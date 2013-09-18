describe User do
  let(:user) { User.create( username: "Ddayd" ) }
  
  it "can be created." do
    expect(user).to be_an_instance_of User
  end
end
