class Location < ActiveRecord::Base
    belongs_to :world
    belongs_to :tag
    has_many :npcs
    has_many :parent_locations, :class_name => 'Connection'
    has_many :child_locations, :class_name => 'Connection'
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end