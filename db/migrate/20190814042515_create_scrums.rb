class CreateScrums < ActiveRecord::Migration[5.2]
  def change
    create_table :scrums do |t|
      t.text :yesterday
      t.text :today
      t.text :blockers
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
