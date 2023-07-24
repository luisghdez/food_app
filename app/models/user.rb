class User < ApplicationRecord
  has_one :cart
  after_create :create_cart

  def create_cart
    my_cart = Cart.new
    my_cart.user = current_user
    my_cart.save
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
