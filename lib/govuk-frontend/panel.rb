require 'action_view'

module GovukFrontend
  def govukPanel(params = {})
    params ||= {}
    attributes = params["attributes"] || {}
    attributes["class"] = "govuk-panel govuk-panel--confirmation"
    attributes["class"] += " #{params["classes"]}" if params["classes"]

    heading_level = params["headingLevel"] || "1"

    tag.div(class: attributes["class"], **attributes.symbolize_keys) do
      if (params["html"] || params["text"])
        body = capture do
          tag.div(class: "govuk-panel__body") do
            safe_join([
              " ",
              (params["html"] ? params["html"].html_safe : params["text"]),
              " "
            ])
          end
        end
      end

      safe_join([
        " ",
        content_tag("h#{heading_level}", class: "govuk-panel__title") do
          safe_join([
            " ",
            (params["titleHtml"] ? params["titleHtml"].html_safe : params["titleText"]),
            " "
          ])
        end,
        " ",
        body,
        " "
      ])
    end
  end
end
