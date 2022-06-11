class Book < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :body, length: { maximum: 200 }, presence: true

def get_profile_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
    profile_image.variant(resize_to_limit: [width, height]).processed
end

 
  def correct_user
      @user = User.find(params[:id])
     redirect_to user_path(current_user) unless @user == current_user
    #user_path(current_user)で今ログインしている人のuser_pathに遷移される
  end
  
end
