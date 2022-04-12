# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :string
#  due_date    :date
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_tasks_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Task < ApplicationRecord
  belongs_to :category

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_insensitive: false }
  validate :due_date_validation

  def due_date_validation
    return if due_date.blank?
    return if due_date > Date.today
    errors.add :due_date, I18n.t('task.errors.invalid_due_date')
  end
end
