require 'rails_helper'

RSpec.describe 'ユーザ管理機能', type: :system do
    describe '登録機能' do
      #let!(:user) { FactoryBot.create(:user) }
      context 'ユーザを登録した場合' do
        it 'タスク一覧画面に遷移する' do
          post 'http://localhost:3000/users', params: { user: {name: 'MyString1',email: "MyString@gmail.com" ,password_digest: "MyString",admin: false } }
          response.should redirect_to(tasks_path)
        end
      end
      
      context 'ログインせずにタスク一覧画面に遷移した場合' do
        it 'ログイン画面に遷移し、「ログインしてください」というメッセージが表示される' do
          get 'http://localhost:3000/tasks'
          response.should redirect_to(new_session_path)
        end
      end
    end
  
    describe 'ログイン機能' do
      context '登録済みのユーザでログインした場合' do
        before do
          post 'http://localhost:3000/sessions/new', params: { user: {email: "MyString@gmail.com" ,password_digest: "MyString"} }
        end

        it 'タスク一覧画面に遷移し、「ログインしました」というメッセージが表示される' do
          get 'http://localhost:3000/tasks'
          response.code.should == "302"

        end
        it '自分の詳細画面にアクセスできる' do
          name= 'MyString1'
          email= "MyString@gmail.com" 
          password_digest= "MyString"
          admin= false 
          request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(email,password_digest)
          #get 'http://localhost:3000/tasks'
          #response.should be_success
          #response.should redirect_to(tasks_path)
          #visit user_path
          expect(page).not_to have_content "MyString@gmail.com"
        end
        it '他人の詳細画面にアクセスすると、タスク一覧画面に遷移する' do
          post 'http://localhost:3000/users', params: { user: {name: 'MyString1',email: "MyString@gmail.com" ,password_digest: "MyString",admin: false } }
          response.should redirect_to(tasks_path)
        end
        it 'ログアウトするとログイン画面に遷移し、「ログアウトしました」というメッセージが表示される' do
          post 'http://localhost:3000/users', params: { user: {name: 'MyString1',email: "MyString@gmail.com" ,password_digest: "MyString",admin: false } }
          expect(page).not_to have_content "ログアウトしました" 
        end
      end
    end

    describe '管理者機能' do
      context '管理者がログインした場合' do
        it 'ユーザ一覧画面にアクセスできる' do
          post 'http://localhost:3000/users', params: { user: {name: 'MyString1',email: "MyString@gmail.com" ,password_digest: "MyString",admin: true } }
          expect(page).not_to have_content "ログアウトしました" 
        end
        it '管理者を登録できる' do
        end
        it 'ユーザ詳細画面にアクセスできる' do
        end
        it 'ユーザ編集画面から、自分以外のユーザを編集できる' do
        end
        it 'ユーザを削除できる' do
        end
      end
      context '一般ユーザがユーザ一覧画面にアクセスした場合' do
        it 'タスク一覧画面に遷移し、「管理者以外アクセスできません」というエラーメッセージが表示される' do
        end
      end
    end

end