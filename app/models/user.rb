class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # has_attached_file :avatar, :styles => { :large => "400x400>", :medium => "200x200>", :thumb => "100x100>" }

  # validates_attachment :avatar, :presence => true, :content_type => { :content_type => "image/jpeg", :message => "Only JPEG formats allowed" }

end
