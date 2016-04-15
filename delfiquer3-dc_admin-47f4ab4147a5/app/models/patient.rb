# == Schema Information
#
# Table name: patients
#
#  id                  :integer          not null, primary key
#  name                :string
#  address             :string
#  age                 :integer
#  doctor_id           :integer
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  size                :string
#  gender              :string
#  mass_index          :float
#  blood_type          :string
#

class Patient < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
