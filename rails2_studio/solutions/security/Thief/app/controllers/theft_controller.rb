class TheftController < ApplicationController
  def steal_cookie
    logger.info "Mmmm, I stole your cookie: #{params.inspect}"
    head :ok
  end
end