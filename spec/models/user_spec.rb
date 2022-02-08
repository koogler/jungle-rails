require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  
    it "should save successfully when all five fields are set" do
      newUser = User.new(
        first_name: 'Bob',
        last_name: 'Dole',
        email: 'bob@testing.com',
        password: 'test',
        password_confirmation: 'test'
      )
      expect(newUser).to be_valid
    end 

    it "should be invalid if password are not a match" do
      newUser = User.new(
        first_name: 'Bob',
        last_name: 'Dole',
        email: 'bob@testing.com',
        password: 'test',
        password_confirmation: "tset3213"
      )
      expect(newUser).to_not be_valid
    end

    it "should be invalid if email is missing" do
      newUser = User.new(
        first_name: 'Bob',
        last_name: 'Dole',
        email: nil,
        password: 'test',
        password_confirmation: "tset3213"
      )
      expect(newUser).to_not be_valid
    end

    it "should be invalid if first name is missing" do
      newUser = User.new(
        first_name: nil,
        last_name: 'Dole',
        email: 'bob@testing.com',
        password: 'test',
        password_confirmation: "tset3213"
      )
      expect(newUser).to_not be_valid
    end

    it "should be invalid if last name is missing" do
      newUser = User.new(
        first_name: 'Bob',
        last_name: nil,
        email: 'bob@testing.com',
        password: 'test',
        password_confirmation: "tset3213"
      )
      expect(newUser).to_not be_valid
    end

    it "should fail if an email is not unique" do
      newUser = User.new(
        first_name: 'Bob',
        last_name: 'Dole',
        email: 'bob@testing.com',
        password: 'test',
        password_confirmation: "tset3213"
      )
      newUserTwo = User.new(
        first_name: 'Bob',
        last_name: 'Dole',
        email: 'bob@testing.com',
        password: 'test',
        password_confirmation: "tset3213"
      )
      expect(newUserTwo).to_not be_valid
    end

    it "should check for a password minimal length" do
      newUser = User.new(
        first_name: 'Bob',
        last_name: 'Dole',
        email: 'bob@testing.com',
        password: 'te',
        password_confirmation: 'te'
      )
      expect(newUser).to_not be_valid
    end 

  end

  describe '.authenticate_with_credentials' do

    it "should authenticate and save successfully when all five fields are set" do
      newUser = User.new(
        first_name: 'Bob',
        last_name: 'Dole',
        email: 'bob@testing.com',
        password: 'test',
        password_confirmation: 'test'
      )
      newUser.save

      newUser = User.authenticate_with_credentials('bob@testing.com','test')      
      expect(newUser).to_not be(nil)
    end

    it "should fail to authenticate and save successfully with the wrong password" do
      newUser = User.new(
        first_name: 'Bob',
        last_name: 'Dole',
        email: 'bob@testing.com',
        password: 'test',
        password_confirmation: 'test'
      )
      newUser.save

      newUser = User.authenticate_with_credentials('bob@testing.com','testing123')      
      expect(newUser).to be(nil)
    end
    
    it "should authenticate and save successfully with spaces in the email" do
      newUser = User.new(
        first_name: 'Bob',
        last_name: 'Dole',
        email: 'bob@testing.com',
        password: 'test',
        password_confirmation: 'test'
      )
      newUser.save

      newUser = User.authenticate_with_credentials('   bob@testing.com   ','test')      
      expect(newUser).to_not be(nil)
    end 

    it "should authenticate and save successfully with the wrong case for their email" do
      newUser = User.new(
        first_name: 'Bob',
        last_name: 'Dole',
        email: 'bob@testing.com',
        password: 'test',
        password_confirmation: 'test'
      )
      newUser.save

      newUser = User.authenticate_with_credentials('BoB@tEstIng.com','test')      
      expect(newUser).to_not be(nil)
    end 

  end

end
