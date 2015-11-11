class Contact < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  validates :name, presence: {message:"名前を入力してください"}
  validates :email, presence:{inclusion:'@',message:"メールアドレスを入力してください"}
  validates :email, :format => { :with => %r{.+@.+\..+} ,message:"正しくメールアドレスを入力してください"}
#   validates :addres, presence:{message:"住所を入力してください"}
#   validates :number, presence: {message:"電話番号が入力されていません"}
#   validates :number, :numericality => { :minimum => 10, message:"数字を入力してください" }
  validates :content, presence:{message:"内容を入力してください"}
  
end
