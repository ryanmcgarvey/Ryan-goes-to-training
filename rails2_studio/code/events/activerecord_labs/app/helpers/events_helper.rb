module EventsHelper
  def price(event)
    event.free? ? "<strong>Free!</strong>".html_safe : number_to_currency(event.price)
  end
end
