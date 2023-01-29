require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功する' do
          visit new_user_path
          fill_in 'ユーザー名', with: 'tarou'
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録完了'
          expect(page).to have_content 'ユーザー登録が完了しました'
          expect(current_path).to eq login_path
        end
      end

      context 'ユーザ名が未入力' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in 'ユーザー名', with: ''
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録完了'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(current_path).to eq users_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in 'ユーザー名', with: 'tarou'
          fill_in 'メールアドレス', with: ''
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録完了'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(current_path).to eq users_path
        end
      end

      context '登録済のメールアドレスを使用' do
        it 'ユーザーの新規作成が失敗する' do
          existed_user = create(:user)
          visit new_user_path
          fill_in 'ユーザー名', with: 'tarou'
          fill_in 'メールアドレス', with: existed_user.email
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録完了'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(current_path).to eq users_path
        end
      end

      context 'パスワードの未入力' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in 'ユーザー名', with: 'tarou'
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'パスワード', with: ''
          fill_in 'パスワード確認', with: 'password'
          click_button '登録完了'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(current_path).to eq users_path
        end
      end

      context 'パスワード確認の未入力' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in 'ユーザー名', with: 'tarou'
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: ''
          click_button '登録完了'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(current_path).to eq users_path
        end
      end

      context 'パスワード確認の未入力' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in 'ユーザー名', with: 'tarou'
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: ''
          click_button '登録完了'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(current_path).to eq users_path
        end
      end
      context 'パスワード確認の未入力' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in 'ユーザー名', with: 'tarou'
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: ''
          click_button '登録完了'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(current_path).to eq users_path
        end
      end
    end
  end
  describe 'ログイン後' do
    context 'ログアウトボタンをクリック' do
      it 'ログアウト処理に成功する' do
        login_as(user)
        find(".logout").click
        expect(page).to have_content 'ログアウトしました'
        expect(page).to have_current_path root_path
      end
    end
  end
end
