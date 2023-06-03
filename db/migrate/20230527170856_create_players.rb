# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string  :name, null: false
      t.string  :nickname
      t.integer :shirt_number
      t.string  :status
      t.integer :score_goal, default: 0
      t.string  :position

      t.timestamps
    end
  end
end
