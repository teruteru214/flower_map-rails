require 'rails_helper'

RSpec.describe "Flowers", type: :system do
  let(:user) { create(:user) }
  let(:flower) { create(:flower, user:) }
  before do
    login_as(user)
  end
  describe '花情報のCRUD' do
    describe '投稿画面' do
      context '投稿ページに遷移されている' do
        it '見つけた花を投稿と書いてある' do
          visit new_flower_path
          expect(page).to have_content '見つけた花を投稿'
        end
      end

      context '何も入力しない場合' do
        it '投稿に失敗しましたと表記される' do
          visit new_flower_path
          click_button '見つけた花を記録する'
          expect(page).to have_content '投稿が失敗しました。不足している項目があります'
        end
      end

      context '住所を入力しない場合' do
        it '投稿に失敗しましたと表記される' do
          visit new_flower_path
          fill_in '住所', with: ''
          fill_in '日付', with: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
          fill_in '花の名前', with: 'ヒマワリ'
          attach_file '花の写真', "#{Rails.root}/spec/factories/sun_flower.jpg"
          find('#preview', visible: false).set('secret!!')
          click_button '見つけた花を記録する'
          expect(page).to have_content '投稿が失敗しました。不足している項目があります'
        end
      end

      context '日付を入力しない場合' do
        it '投稿に失敗しましたと表記される' do
          visit new_flower_path
          fill_in '住所', with: '〒131-0045 東京都墨田区押上１丁目１−２'
          fill_in '日付', with: ''
          fill_in '花の名前', with: 'ヒマワリ'
          attach_file '花の写真', "#{Rails.root}/spec/factories/sun_flower.jpg"
          find('#preview', visible: false).set('secret!!')
          click_button '見つけた花を記録する'
          expect(page).to have_content '投稿が失敗しました。不足している項目があります'
        end
      end

      context '全ての情報を入力した場合' do
        it '投稿しましたと表記される' do
          visit new_flower_path
          fill_in '住所', with: '〒131-0045 東京都墨田区押上１丁目１−２'
          fill_in '日付', with: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
          fill_in '花の名前', with: 'ヒマワリ'
          attach_file '花の写真', "#{Rails.root}/spec/factories/sun_flower.jpg"
          find('#preview', visible: false).set('secret!!')
          click_button '見つけた花を記録する'
          expect(page).to have_content '投稿が完了しました！'
        end
      end
    end
  end
  describe '一覧画面' do
    let!(:flower) { create(:flower, user:) }
    context '一覧画面に遷移されること' do
      it '一覧画面が表示されている' do
        visit flowers_path
        expect(page).to have_content '各地の花々'
      end
    end

    context '一覧画面に遷移されること' do
      it '投稿情報が掲載されている' do
        visit flowers_path
        expect(page).to have_content '見つけた場所'
        expect(page).to have_content '見つけた時間'
        expect(page).to have_content '状態'
        expect(page).to have_content '場所を地図で確認'
      end
    end
  end
end
