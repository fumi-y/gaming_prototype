require 'rails_helper'

#ターミナルコピペ用 bundle exec rspec spec/models/prototype_spec.rb

RSpec.describe Prototype, type: :model do
  before do
    @prototype = FactoryBot.build(:prototype)
  end

  describe '新規投稿する' do
    context '新規投稿できるとき' do
      it '全てのフォームに入力すれば登録できる' do
        expect(@prototype).to be_valid
      end
    end

    context '新規投稿できないとき' do
      it 'nameが空だと登録できない' do
        @prototype.name = ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Name can't be blank")
      end

      it 'conceptが空だと登録できない' do
        @prototype.concept = ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Concept can't be blank")
      end

      it 'textが空だと登録できない' do
        @prototype.text = ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Text can't be blank")
      end

      it 'ジャンルを空だと登録できない' do
        @prototype.genre_id = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Genre can't be blank")
      end

      it 'ジャンルに「---(未選択)」を選ぶと登録できない' do
        @prototype.genre_id = '0'
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Genre must be other than 0")
      end

      it 'プラットフォームが空だと登録できない' do
        @prototype.platform_id = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Platform can't be blank")
      end

      it 'プラットフォームに「---(未選択)」を選ぶと登録できない' do
        @prototype.platform_id = '0'
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Platform must be other than 0")
      end

      it '公開・非公開が空だと登録できない' do
        @prototype.publish_id = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Publish can't be blank")
      end
    end
  end
end
