require 'action_view'

module GovukFrontend
  def govukBackLink(params = {})
    attributes = {}

    attributes["class"] = "govuk-back-link"
    attributes["class"] += " #{params["classes"]}" if params["classes"]

    attributes.merge!(params["attributes"]) if params["attributes"]

    tag.a(
      (params["html"]&.html_safe || params["text"] || "Back"),
      href: params["href"],
      **attributes.symbolize_keys
    )
  end
end
