require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'バリデーションのテスト' do

    context 'タスクのタイトルが空文字の場合' do
      it 'バリデーションに失敗する' do
        task =  Task.create(title: "task#{1}", content:"content#{1}", deadline_on: Date.new, priority: 2, status: 1, user_id: 1)

        expect(task).not_to be_valid
      end
    end

    context 'タスクの説明が空文字の場合' do
      it 'バリデーションに失敗する' do
        task =     Task.create(title: "task#{1}", content:"content#{1}", deadline_on: Date.new, priority: 2, status: 1, user_id: 1)

        expect(task).not_to be_valid
      end
    end

    context 'タスクのタイトルと説明に値が入っている場合' do
      it 'タスクを登録できる' do
        u =User.create(id:1,name: :hype, email: "hype@gmail.com", password_digest: 123456, admin: true)
        consider_all_requests_local = false
        task = Task.new(id: 1, title: "task#{1}", content:"content#{1}", deadline_on: Date.new, priority: 2, status: 1, user_id: 1)
        expect(task.errors.messages).to eq ({})
      end
    end
  end
end
