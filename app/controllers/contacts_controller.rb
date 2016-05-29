class ContactsController < ApplicationController
  def inquiry
    @contact = Contact.new
    @contact = Contact.new(params_contact) if params[:back]
  end

  def confirm
    @contact = Contact.new(params_contact)
    if @contact.valid?
    else
      
      render action: 'inquiry'
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
    params.require(:contact).permit(:name, :email, :content, :addres, :number)
  end
end
