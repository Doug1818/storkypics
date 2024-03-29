class Picture < ActiveRecord::Base
  attr_accessible :pic, :user_id
  belongs_to :order
  has_attached_file :pic, 
  			styles: { 
				thumb:  { geometry: "100x100>", convert_options: "-auto-orient" }, 
				medium: { geometry: "500x500>", convert_options: "-auto-orient" }, 
				large:  { geometry: "900x900>", convert_options: "-auto-orient" } },
			storage: :s3,
			s3_credentials: { 
				access_key_id: ENV['S3_ID'], 
				secret_access_key: ENV['S3_SECRET'], 
				bucket: ENV['S3_BUCKET'] },
			path: ":style/:id/:filename"

	scope :purchased_by_user, lambda { |user| joins(:order).where("orders.purchased_at IS NOT NULL AND pictures.user_id = ?", user.id) }

  validates_attachment_presence :pic
  validates_attachment_size :pic, less_than: 5.megabytes
  validates_attachment_content_type :pic, :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/tif', 'image/gif']
end
