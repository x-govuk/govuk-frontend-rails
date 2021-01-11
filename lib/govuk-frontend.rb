require "govuk-frontend/version"
require "govuk-frontend/back_link"
require "govuk-frontend/panel"
require "govuk-frontend/tag"
require "govuk-frontend/warning_text"
require "govuk-frontend/details"

require 'action_view'

module GovukFrontend
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  class Error < StandardError; end
  # Your code goes here...
end
