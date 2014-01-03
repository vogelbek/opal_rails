class CreateAirplanes < ActiveRecord::Migration
  def change
    create_table :airplanes do |t|
      t.integer :altitude

      t.timestamps
    end
  end
end
