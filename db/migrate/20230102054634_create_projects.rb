class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :role
      t.string :kind
      t.string :url
      t.text :summary
      t.text :purpose
      t.text :explanation
      t.text :problems
      t.timestamps
    end
  end
end
