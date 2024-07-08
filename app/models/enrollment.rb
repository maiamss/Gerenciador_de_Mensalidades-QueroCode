class Enrollment < ApplicationRecord
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :installments, presence: true, numericality: { greater_than: 1 }
    validates :due_day, presence:true, length: { in: 1..31 }
end
