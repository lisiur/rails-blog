module ManageHelper
  def is_current(args)
    if args[params[:controller]] && args[params[:controller]].include?(params[:action])
      return "active"
    end
    return "inactive"
  end
end
