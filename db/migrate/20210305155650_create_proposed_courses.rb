class CreateProposedCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :proposed_courses do |t|
      t.references :teacher, null: false, foreign_key: true, index: true
      t.references :course, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
