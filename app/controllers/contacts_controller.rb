class ContactsController < ApplicationController
  def inquiry
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(params_contact)
  end

  def thankyou
    @contact = Contact.create(params_contact)
    
  end
  
  private
  
  def params_contact
    params.require(:contact).permit(:name,:email,:content)
  end
end
