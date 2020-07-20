require "govuk-frontend/version"
require "govuk-frontend/tag"

require 'action_view'

module GovukFrontend
  include ActionView::Helpers::TagHelper

  class Error < StandardError; end
  # Your code goes here...
end
