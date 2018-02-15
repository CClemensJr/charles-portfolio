class Portfolio < ApplicationRecord
  has_many :technologies
  #accepts attributes for the Technology model in the Portfolio form, unless its blank
  accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }

  include Placeholder

  validates_presence_of :title, :body, :main_image, :thumb_image

  # custom scopes
  #traditional method
  def self.angular
    where(subtitle: "Angular")
  end

  def self.by_position
    Portfolio.order("position ASC")
  end

  #lambda
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  # Set the default values for portfolio items
  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
