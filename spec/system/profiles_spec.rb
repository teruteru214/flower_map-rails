require 'rails_helper'

RSpec.describe "Profiles", type: :system do
  let(:user) { create(:user) }
  describe 'プロフィール画面' do
    before do
      login_as(user)
    end
    it 'プロフィール画面が表示されている' do
      visit profile_path
      expect(page).to have_content user.name
      expect(page).to have_content user.email
      expect(page).to have_content '編集'
    end
    context 'プロフィール編集画面' do
      it 'ユーザー名が空白' do
        visit edit_profile_path
        fill_in 'ユーザー名', with: ''
        fill_in 'メールアドレス', with: 'test@example.com'
        click_button '更新する'
        expect(page).to have_content 'ユーザーを更新できませんでした'
      end
      it 'メールアドレスが空白' do
        visit edit_profile_path
        fill_in 'ユーザー名', with: 'tarou'
        fill_in 'メールアドレス', with: ''
        click_button '更新する'
        expect(page).to have_content 'ユーザーを更新できませんでした'
      end
      it '全て入力した場合' do
        visit edit_profile_path
        fill_in 'ユーザー名', with: 'tarou'
        fill_in 'メールアドレス', with: 'test@example.com'
        click_button '更新する'
        expect(page).to have_content 'ユーザーを更新しました'
      end
    end
  end
end
