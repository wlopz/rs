# == Schema Information
#
# Table name: blogs
#
#  id                 :integer          not null, primary key
#  title              :string
#  body               :text
#  description        :text
#  slug               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  author_id          :integer
#  published          :boolean          default(FALSE)
#  published_at       :datetime
#

class Blog < ApplicationRecord
  acts_as_taggable # Alias for acts_as_taggable_on :tags

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author, optional: true

  scope :most_recent, -> {order(published_at: :desc)}
  scope :published, -> {where(published: true)}
  scope :recent_paginated, -> (page) { most_recent.paginate(:page => page, per_page: 3) }

  scope :list_for, -> (page,tag) do
    if tag.present?
      recent_paginated(page).tagged_with(tag)
    else
      recent_paginated(page).paginate(:page => page, per_page: 3)
    end
  end

  # def self.list_for(page,tag)
  #   if params[:tag].present?
  #     most_recent.tagged_with(tag).paginate(:page => page, per_page: 3)
  #   else
  #     most_recent.paginate(:page => page, per_page: 3)
  #   end
  # end

  has_attached_file :image, styles: { med: "1920x800" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def should_generate_new_friendly_id?
    title_changed?
  end

  def display_day_published
    if published_at.present?
      "#{published_at.strftime('%-b %-d')}"
    else
      "Not published yet"
    end
  end

  def publish
    update(published: true, published_at: Time.now)
  end

  def unpublish
    update(published: false, published_at: nil)
  end

end
