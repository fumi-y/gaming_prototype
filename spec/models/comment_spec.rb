require 'rails_helper'

    #ターミナルコピペ用 bundle exec rspec spec/models/comment_spec.rb

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do
    it 'フォームに入力すればコメントを保存できる' do
      expect(@comment).to be_valid
    end

    it 'コメントが空だと登録できない' do
      @comment.comment = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Comment can't be blank")
    end
  end

end
