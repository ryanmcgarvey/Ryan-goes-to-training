module EventsHelper
  def price(event)
    event.free? ? "Free!" : number_to_currency(event.price)
  end
end
