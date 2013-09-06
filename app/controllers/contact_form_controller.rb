class ContactFormController < ApplicationController
  before_action :load_resource, only: [:new, :create]

  def create
    begin
      @contact_form.request = request
      if @contact_form.deliver then
        flash.now[:notice] = 'Thank you for your message!'
      else
        render :new
      end
    rescue ScriptError
      flash.now[:error] = 'Sorry, this message appears to be spam and was not delivered.'
    end
  end

  private
  def load_resource
    @contact_form = ContactForm.new(contact_form_params)
  end

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message, :nickname) if params[:contact_form]
  end
end
