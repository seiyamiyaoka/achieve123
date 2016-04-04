module ApplicationHelper
  include DeviseHelper
  def devise_error_messages2!
      return "" if resource.errors.empty?

      messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
      sentence = I18n.t("errors.messages.not_saved",
                        count: resource.errors.count,
                        resource: resource.class.model_name.human.downcase)

      html = <<-HTML
      <div id="error_explanation">
        <h2>ねこ</h2>
        <ul>いぬ</ul>
      </div>
      HTML

      html.html_safe
    end

end
