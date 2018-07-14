class EditorController < ApplicationController

  before_action :authenticate_user!

  def show
    @html_code = Code.first.text.html_safe
    @css_code = Code.second.text.html_safe
    @javascript_code = Code.third.text.html_safe
    @messages = Message.where(updated_at: (Time.now - 4.hours)..Time.now)
  end

end
