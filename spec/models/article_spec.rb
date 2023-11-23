require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'New Travel Article' do
    before do
      @article = FactoryBot.build(:article)
    end

    context '投稿できる場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@article).to be_valid
      end
    end
    context '登録できない場合' do
      it 'imageが空では登録できない' do
        @article.image = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Image can't be blank")
      end

      it 'prefectureが空では登録できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title タイトルは入力必須です")
      end


      it 'titleが空では登録できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title タイトルは入力必須です")
      end

      it 'check_inが空では登録できない' do
        @article.check_in = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Check in チェックイン日は入力必須です")
      end

      it 'check_outが空では登録できない' do
        @article.check_out = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Check out チェックアウト日は入力必須です")
      end

      it 'partnerのidが0では登録できない' do
        @article.partner = 0
        @article.valid?
        expect(@article.errors.full_messages).to include("Partnerを選択してください")
      end

      it 'priceが空では登録できない' do
        @article.price = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Price 価格は入力必須です")
      end

      it 'priceが数字以外だと登録できないこと' do
        @article.price = 'あああ'
        @article.valid?
        expect(@article.errors.full_messages).to include("Price 価格は入力必須です")
      end

      it 'travel_siteのidが0では登録できない' do
        @article.trabel_site = 0
        @article.valid?
        expect(@article.errors.full_messages).to include("Travel siteを選択してください")
      end

      it 'contentが空では登録できない' do
        @article.content = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Content 内容は入力必須です")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('User must exist')
      end

      it '都道府県が紐付いていなければ投稿できない' do
        @article.prefecture = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('Prefecture must exist')
      end

    end
  end
end