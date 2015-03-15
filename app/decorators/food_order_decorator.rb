class FoodOrderDecorator < Draper::Decorator
  delegate_all

  def label_class
    case object.status.to_sym
      when :active then "label-info"
      when :finalized then "label-primary"
      when :delivered then "label-success"
    end
  end

  def status
    h.content_tag :span, class: "label #{label_class}" do
      object.status
    end
  end

  def finalized_at
    object.finalized_at.try(:strftime, "%d-%m-%Y %H:%M")
  end

  def delivered_at
    object.delivered_at.try(:strftime, "%d-%m-%Y %H:%M")
  end
end
