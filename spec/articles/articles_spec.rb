require 'rails-helper'

Rspec.describe 'Login' do 
  describe '#create' do 
    context 'when user passes valid username and password' do
      let!(:logins_count) { Login.count == 0 } 
      let(:username) { 'Ashish' }
      let(:password) { 'qweqweqwe' }
      let(:login) { Login.new(username: username, password: password) }

      before do
        login.save
      end

      it 'should create a user record' do
        # Login.create(username: 'Ashish', password: 'qweqweqwe')
        expect(Login.count).to eq( logins_count + 1)
      end
    end

    context 'when user enterns invalid input' do
      let(:invalid_input) { {username: 'abc', password: '123'} }

      it 'should raise error' do
        expect { Login.create!(invalid_input) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
end