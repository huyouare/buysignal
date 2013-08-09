class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, #:recoverable, 
         :rememberable, :trackable, :validatable

  validates_presence_of :name, :email

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :title, :body
	attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :phone, :mailing_address, :is_worker, :is_admin

	has_many :queries, :dependent => :destroy
end
