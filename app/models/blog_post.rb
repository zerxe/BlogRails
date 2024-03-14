class BlogPost
  include Mongoid::Document
  # include Mongoid::Attributes::Dynamic
  field :title, :type => String
  field :body, :type => String
  field :published_at, :type => DateTime


  validates :title, presence: true
  validates :body, presence: true

  scope :sorted, -> { order_by(published_at: :desc, updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where(:published_at.lte => Time.current) }
  scope :scheduled, -> { where(:published_at.gt => Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end
