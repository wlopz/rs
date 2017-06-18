class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author

  scope :most_recent, -> {order(id: :desc)}

  has_attached_file :image, styles: { med: "1920x800" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def should_generate_new_friendly_id?
    title_changed?
  end
  def display_day_published
    "#{created_at.strftime('%-b %-d')}"
  end

end
