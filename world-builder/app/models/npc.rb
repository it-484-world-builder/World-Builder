class Npc < ActiveRecord::Base
    belongs_to :location
    has_attached_file :image, :default_url => "/system/npcs/image/no-image.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end