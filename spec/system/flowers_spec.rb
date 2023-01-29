require 'rails_helper'

RSpec.describe "Flowers", type: :system do
  let(:user) { create(:user) }
  let(:flower) { create(:flower, user:) }

  describe '花情報のCRUD' do
    before do
      login_as(user)
    end
    describe '花情報の投稿' do
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
end
