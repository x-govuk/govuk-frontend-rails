require "govuk-frontend/version"
require "govuk-frontend/panel"
require "govuk-frontend/tag"
require "govuk-frontend/warning_text"

require 'action_view'

module GovukFrontend
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  class Error < StandardError; end
  # Your code goes here...
end
