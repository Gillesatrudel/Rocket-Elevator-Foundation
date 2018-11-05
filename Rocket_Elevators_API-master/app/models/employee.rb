class Employee < ApplicationRecord
  belongs_to :user
  has_many :batteries

  rails_admin do
    edit do
      exclude_fields :batteries
    end
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
