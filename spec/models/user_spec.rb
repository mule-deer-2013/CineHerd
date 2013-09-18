
describe User do
  let(:user) { User.create( username: "Ddoyd", password: "dog") }
  
  it "can be created." do
    expect(user).to be_an_instance_of User
  end

  it "should have a username" do
    expect(user.username).not_to eq(nil)
  end

  it "should have a password_hash" do
    expect(user.password_hash).not_to eq(nil)
  end

  it "should store a Bcrypt object as a password_hash" do
    expect(user.password_hash).to be_an_instance_of (BCrypt::Password)
  end

  it "should authenticate with the correct password" do
    expect(user.authenticate?('dog')).to eq(true)
  end

  it "should not authenticate with an incorrect password" do
    expect(user.authenticate?('zanzibar')).to eq(false)
  end
end
