require 'rails_helper'
describe Contact do
  it '有効なファクトリをもつこと' do
    expect(FactoryGirl.build(:contact)).to be_valid
  end
  it '苗字と名前が有効であること' do
  contact = Contact.new(
  name: 'seiya',
  email:'seiyamiyaoka@gmail.com',
  content: 'fff'
  )
  expect(contact).to be_valid
end
it '名前がなければ無効' do
  contact = Contact.new(name: nil)
  contact.valid?
  expect(contact.errors[:name]).not_to include("can't be blank")
end
it 'メールアドレスが重複する場合は無効' do
  Contact.create(
  name: 'seiya',
  email: 'seiyamiyaoka@gmail.com',
  content: 'ttt'
  )
  contact = Contact.new(
  name: 'tart',
  email: 'seiyamffiyaoka@gmail.com'
  )

  expect(contact.errors[:email]).to include('has already been taken')
end
it 'ユーザごとに重複したemailを許可しない' do
  contact = Contact.create(
  name: 'siya',
  content: 'hhh',
  email: ''
  )
end
end
