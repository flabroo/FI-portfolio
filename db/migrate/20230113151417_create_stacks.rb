class CreateStacks < ActiveRecord::Migration[7.0]
  def change
    create_table :stacks do |t|
      t.references :project, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
