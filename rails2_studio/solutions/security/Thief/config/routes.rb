Thief::Application.routes.draw do
  match 'steal-cookie' => "theft#steal_cookie"
end
