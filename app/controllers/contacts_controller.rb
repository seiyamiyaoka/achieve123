class ContactsController < ApplicationController
  def inquiry
      @contact = Contact.new
    if params[:back]
      @contact = Contact.new(params_contact)
     end
  end
  
  def confirm
    @contact = Contact.new(params_contact)
    if @contact.valid?
      render action: 'confirm'

      return
    else
      render action: 'inquiry'
      return
 
    
    end
  end
  
  def thankyou
   @contact = Contact.new(params_contact)
    if params[:back]
       render :inquiry
    elsif @contact.save
      
    end
  end
  
  private
#   追加
  def params_contact
    params.require(:contact).permit(:name,:email,:content,:addres,:number)
  end
end
