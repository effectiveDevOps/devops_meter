class UsersController < ApplicationController
  def new
    @user = Form::User.new
    @questions = Question.all
  end

  def create
    @user = Form::User.new(user_params)
    if @user.save
      redirect_to "/results?en=#{params[:en]}&token=#{token(@user.id)}"
    end
  end

  private

  def user_params
    params
      .require(:form_user)
      .permit(
        Form::User::REGISTRABLE_ATTRIBUTES +
        [answers_attributes: Form::Answer::REGISTRABLE_ATTRIBUTES]
      )
  end
end
