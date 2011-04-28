class ContactController < ApplicationController

  def show
  end

  def create
    @contact = Contact.new(
      params[:contact][:email],
      params[:contact][:subject],
      params[:contact][:body]
    )
    if @contact.valid?
      ContactMailer.notification(@contact).deliver
      flash[:notice] = 'Message has been received, someone will be getting back to you shortly'
      redirect_to root_path
    else
      flash.now[:error] = 'Oops, something went wrong.  Please correct the data you entered, as described below'
      render :action => 'show'
    end
  end

end
