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

    "<details #{tag_options_with_booleans_having_no_value(attributes)}> ".html_safe +
    tag.summary(class: "govuk-details__summary") do
      " ".html_safe +
      tag.span(class: "govuk-details__summary-text") do
        " ".html_safe +
        (params["summaryHtml"] ? params["summaryHtml"].html_safe : params["summaryText"]) +
        " ".html_safe
      end +
      " ".html_safe
    end +
    " ".html_safe +
    tag.div(class: "govuk-details__text") do
      " ".html_safe +
      (params["html"] ? params["html"].html_safe : params["text"]) +
      " ".html_safe
    end +
    " </details>".html_safe
  end

  private

  # Simplified fork of method from ActionView::Helpers::TagHelper
  #
  # The main difference is that the "open" attribute is outputted with no
  # value, eg <details open> rather than with the same value as the attribute
  # name, eg <details open="open"> - this is to match the output from the
  # govuk-frontend component.
  def tag_options_with_booleans_having_no_value(options, escape = true)
    return if options.blank?
    output = +""
    sep    = " "
    options.each_pair do |key, value|
      if key == "open"
        output << sep
        output << key
      else
        output << sep
        output << tag_option(key, value, escape)
      end
    end
    output unless output.empty?
  end

  # Copied from ActionView::Helpers::TagHelper
  def tag_option(key, value, escape)
    case value
    when Array, Hash
      value = TagHelper.build_tag_values(value) if key.to_s == "class"
      value = escape ? safe_join(value, " ") : value.join(" ")
    else
      value = escape ? ERB::Util.unwrapped_html_escape(value) : value.to_s
    end
    value = value.gsub('"', "&quot;") if value.include?('"')
    %(#{key}="#{value}")
  end

end
