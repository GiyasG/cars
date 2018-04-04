class CreateAdminService
  def call
        user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password

        user.confirmation_token = Rails.application.secrets.admin_confirmation_token
        user.confirmed_at = Rails.application.secrets.admin_confirmed_at
        user.confirmation_sent_at = Rails.application.secrets.admin_confirmation_sent_at

        user.admin!

      end
  end
end
