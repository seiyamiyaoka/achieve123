class Contact < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true
  validates :content, presence: true
  validates :email, presence: true, uniqueness: true

  validates :email, :format => { :with => %r{.+@.+\..+} ,message:"正しくメールアドレスを入力してください"},unless: 'email.empty?'
#   validates :addres, presence:{message:"住所を入力してください"}
#   validates :number, presence: {message:"電話番号が入力されていません"}
#   validates :number, :numericality => { :minimum => 10, message:"数字を入力してください" }
  def contact_nil?
    self.email == nil
  end
end
