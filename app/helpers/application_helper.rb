module ApplicationHelper
  def routes_options()
    Route.all.collect {|a| [a.title, a.id]}
  end
end
