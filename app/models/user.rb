# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime
#  updated_at             :datetime
#  avatar                 :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  require 'open-uri'
  require 'meme_captain'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :conversations, :foreign_key => :sender_id

after_create :create_default_conversation

def meme
  open('http://i.memecaptain.com/src_images/Dv99KQ.jpg', 'rb') do |f|
    i = MemeCaptain.meme_top_bottom(f, 'test', '1 2 3')
    # i.display
    i.write('out.jpg')
  end
end

private

# for demo purposes




def create_default_conversation
  Conversation.create(sender_id: 1, recipient_id: self.id) unless self.id == 1
end

end
