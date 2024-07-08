class Bill < ApplicationRecord
    validates :amount, presence: true,  numericality: { greater_than: 0 }
    validates :due_date, presence: true
    validates :status, presence: true, inclusion: { in: %w(open pending paid), message: "Invalid status." }

    validate: check_date

    private 

    def check_date
        Date.parse(due_date.to_s)
    rescue ArgumentError, TypeError
        errors.add(:due_date, "Invalid date")
    end

end
