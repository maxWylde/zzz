require 'spec_helper'

describe User do
  before { @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")}
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password)}
  it { should respond_to(:password_confirmation)}
  it { should respond_to(:authenticate) }

  it {should be_valid}

  describe "when name is not present" do
  	before {@user.name = " "}
  	it { should_not be_valid}
  end

  describe "return value of authenticate method" do
    before {@user.save}
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
    	it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
    	let(:user_for_invalid_password) { found_user.authenticate("invalid")}
    	it { should_not eq user_for_invalid_password }
    	specify { expect(user_for_invalid_password).to be_false }
    end
  end

  describe "with a passwrd that's too short" do
  	before {@user.password = @user.password_confirmation = "a"*5}
  	it { should be_invalid }
  end

  describe "when password is not present" do 
  	before do
  		@user = User.new(name: "ex usr", email: "usr@example.com", password: " ", password_confirmation: " ")
  	end
  	it { should_not be_valid }
  end

  describe "when passwords don't match" do
  	before { @user.password_confirmation = "mismatch" }
  	it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @user.email = " "}
  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @user.name = "a" * 51}
  	it { should_not be_valid }
  end

  describe "when email format is invalid" do
  	it "should be invalid" do
  		addresses = %w[user@foot,com usr_at_foo.org wx@foo. foo@bar_baz.com foo@bar+baz.con]
  		addresses.each do |inv_adr|
  			@user.email = inv_adr
  			expect(@user).not_to be_valid
  		end
  	end
  end

  describe "when email is valid" do
  	it "should be valid" do
  		addresses = %w[user@foo.com b@x.com ax@gmail.com]
  		addresses.each do |adr|
  			@user.email = adr 
  			expect(@user).to be_valid
  		end
  	end
  end

  describe "when email address is already taken" do
    before do
    	user_with_same_email = @user.dup
    	user_with_same_email.email = @user.email.upcase
    	user_with_same_email.save
    end
    it { should_not be_valid }
  end
end