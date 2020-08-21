class FormalController < ApplicationController
  def index
    @form = Formal.where(token:current_user.authentication_token)
  end

  def new
    @form = Formal.new
  end

  def edit
    @form = Formal.find(params[:id])
  end
  def create
    @user = current_user
    @form = Formal.new(params.require(:form).permit(:date,:company,:content,:note))
    @form.token = current_user.authentication_token
    @form.name = current_user.name
    if @form.save
      redirect_to formal_index_path
    else
      render 'new'
    end
  end
  def destroy
    @form = Formal.find(params[:id])
    @form.destroy
    if current_user.try(:admin?)
      redirect_to admin_form_path
    else
      redirect_to formal_index_path
    end
  end
  def update
    @form = Formal.find(params[:id])
    if @form.update(params.require(:formal).permit(:date,:company,:content,:note))
      if current_user.try(:admin?)
        redirect_to admin_form_path
      else
        redirect_to formal_index_path
      end
    else
      render 'edit'
    end
  end
end
