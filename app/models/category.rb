# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
  has_many :tasks

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
