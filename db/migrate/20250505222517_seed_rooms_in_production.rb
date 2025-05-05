class SeedRoomsInProduction < ActiveRecord::Migration[8.0]
  def up
    load Rails.root.join('db/seeds.rb')
  end

  def down
    # Optional: remove seeded data if needed
  end
end
