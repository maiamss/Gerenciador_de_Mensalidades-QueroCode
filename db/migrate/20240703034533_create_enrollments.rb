class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.references :student, null: false, foreign_key: true
      t.integer :amount
      t.integer :installments
      t.integer :due_day

      t.timestamps
    end
  end
end
