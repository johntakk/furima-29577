require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字混合でなければ登録できない' do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password need to be include both letters and numbers')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'family_name_jp_kanjiが空では登録できない' do
      @user.family_name_jp_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name jp kanji can't be blank")
    end

    it 'family_name_jp_kanjiが全角でないと登録できない' do
      @user.family_name_jp_kanji = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name jp kanji Full-width characters")
    end

    it 'first_name_jp_kanjiが空では登録できない' do
      @user.first_name_jp_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name jp kanji can't be blank")
    end

    it 'first_name_jp_kanjiが全角でないと登録できない' do
      @user.first_name_jp_kanji = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name jp kanji Full-width characters")
    end
  end
end
