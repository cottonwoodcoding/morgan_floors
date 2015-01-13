module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then
        'info'
      when :error then
        'error'
      when :alert then
        'warning'
    end
  end

  def model_info(model, property)
    begin
      model.send(property.to_sym)
    rescue
      nil
    end
  end
end
