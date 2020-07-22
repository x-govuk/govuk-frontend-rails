require 'action_view'

module GovukFrontend
  def govukTag(params = {})
    params ||= {}
    attributes = params["attributes"] || {}
    attributes["class"] = "govuk-tag"
    attributes["class"] += " #{params["classes"]}" if params["classes"]

    # Order attributes alphabetically
    attributes = attributes.sort_by { |key| key }.to_h

    tag.strong(
      safe_join([
        "\n  ".html_safe,
        (params["html"] ? params["html"].html_safe : params["text"]),
        "\n".html_safe
      ]),
      **attributes.symbolize_keys
    )
  end
end
