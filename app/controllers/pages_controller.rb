class PagesController < ApplicationController
  skip_before_action :authenticate_user! #all page under p.controller does not need to login

  def homepage
    @message = 'Pinterest Page'
  end

end
