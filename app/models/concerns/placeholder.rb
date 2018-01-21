module Placeholder
  # Allows method to access a bunch of Rails support libraries
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
    "http://via.placeholder.com/#{ height }x#{ width }"
  end
end
