class BlogPost
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    validates :title, presence: true
    validates :body, presence: true
end
