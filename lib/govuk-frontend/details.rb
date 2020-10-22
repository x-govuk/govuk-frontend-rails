require 'action_view'

module GovukFrontend
  def govukDetails(params = {})

    params ||= {}
    attributes = {}

    attributes["id"] = params["id"] if params["id"]
    attributes["class"] = "govuk-details"
    attributes["class"] += " #{params["classes"]}" if params["classes"]

    attributes["data-module"] = "govuk-details"
    attributes["open"] = "open" if params["open"]

    attributes.merge!(params["attributes"]) if params["attributes"]

    tag.details(attributes.symbolize_keys) do
      "\n  ".html_safe +
      tag.summary(class: "govuk-details__summary") do
        "\n    ".html_safe +
        tag.span(class: "govuk-details__summary-text") do
          "\n      ".html_safe +
          (params["summaryHtml"] ? params["summaryHtml"].html_safe : params["summaryText"]) +
          "\n    ".html_safe
        end +
        "\n  ".html_safe
      end +
      "\n  ".html_safe +
      tag.div(class: "govuk-details__text") do
        "\n    ".html_safe +
        (params["html"] ? params["html"].html_safe : params["text"]) +
        "\n  ".html_safe
      end +
      "\n".html_safe
    end
  end
end
