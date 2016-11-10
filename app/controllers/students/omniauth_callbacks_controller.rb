class Students::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @student = Student.from_omniauth(request.env['omniauth.auth'])

    if @student.persisted?
      sign_in @student
      redirect_to resume_path
    else
      render 'mmu_email_error'
    end
  end
end