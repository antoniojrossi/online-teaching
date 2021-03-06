class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :teacher, null: false, foreign_key: true, index: true
      t.references :votable, polymorphic: true

      t.timestamps
    end
  end
end
