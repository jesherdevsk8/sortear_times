class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string  :name, null: false
      t.string  :nickname
      t.integer :shirt_number
      t.boolean :active, default: false, null: false
      t.integer :score_goal

      t.timestamps
    end
  end
end
