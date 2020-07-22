require 'action_view'

module GovukFrontend
  def govukWarningText(params = {})

    classes = params["classes"]
    iconFallbackText = params["iconFallbackText"]
    attributes = params["attributes"] || {}
    html = params["html"]
    text = params["text"]

    attributes["class"] = "govuk-warning-text"
    attributes["class"] += " #{classes}" if classes

    tag.div(class: attributes["class"], **attributes.symbolize_keys) do
      "\n  ".html_safe +
      tag.span('!', class: 'govuk-warning-text__icon', :"aria-hidden" => 'true') +
      "\n  ".html_safe +
      content_tag('strong', class: 'govuk-warning-text__text') do
        "\n    ".html_safe +
        content_tag('span', iconFallbackText, class: 'govuk-warning-text__assistive') +
          "\n    ".html_safe +
          (params["html"] ? params["html"].html_safe : params["text"]) +
          "\n  ".html_safe
      end +
      "\n".html_safe
    end

  end
end
