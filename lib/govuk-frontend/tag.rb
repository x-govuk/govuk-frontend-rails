require 'action_view'

module GovukFrontend
  def govukTag(params = {})
    params ||= {}
    attributes = params["attributes"] || {}
    attributes["class"] = "govuk-tag"
    attributes["class"] += " #{params["classes"]}" if params["classes"]
    tag.strong((params["html"] || params["text"]), **attributes.symbolize_keys)
  end
end
