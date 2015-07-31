# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  body            :text
#  conversation_id :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  image           :string
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
