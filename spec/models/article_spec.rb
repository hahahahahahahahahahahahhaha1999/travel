require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '新規投稿する' do
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
        @article.prefecture = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Prefecture must exist")
      end

      it 'titleが空では登録できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end

      it 'check_inが空では登録できない' do
        @article.check_in = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Check in can't be blank")
      end

      it 'check_outが空では登録できない' do
        @article.check_out = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Check out can't be blank")
      end

      it 'partner_idのidが1では登録できない' do
        @article.partner_id = '1'
        @article.valid?
        expect(@article.errors.full_messages).to include("Partner must be other than 1")
      end

      it 'priceが空では登録できない' do
        @article.price = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが数字以外だと登録できないこと' do
        @article.price = 'あああ'
        @article.valid?
        expect(@article.errors.full_messages).to include("Price is not a number")
      end

      it 'contentが空では登録できない' do
        @article.content = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Content can't be blank")
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