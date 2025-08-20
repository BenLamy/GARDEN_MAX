class SettingsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update_profile
    if params[:user]&.dig(:photo)&.present?
      current_user.photo.attach(params[:user][:photo])
      redirect_to settings_path, notice: 'Profile picture updated successfully.'
    else
      redirect_to settings_path, alert: 'Please select a photo to upload.'
    end
  end

  def remove_photo
    current_user.photo.purge if current_user.photo.attached?
    redirect_to settings_path, notice: 'Profile picture removed successfully.'
  end

  def update_password
    if current_user.update_with_password(password_params)
      bypass_sign_in(current_user)
      redirect_to settings_path, notice: 'Password updated successfully.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  def update_email
    if current_user.update_with_password(email_params)
      redirect_to settings_path, notice: 'Email updated successfully. Please check your new email for confirmation.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  def update_theme
    theme = params[:dark_mode] == 'dark' ? 'dark' : 'light'
    if current_user.update(theme: theme)
      render json: { status: 'success', theme: theme }
    else
      render json: { status: 'error', message: 'Failed to update theme' }
    end
  end

  private

  def profile_params
    params.require(:user).permit(:photo)
  end

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def email_params
    params.require(:user).permit(:current_password, :email)
  end
end