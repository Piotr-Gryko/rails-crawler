class SeedRooms < ActiveRecord::Migration[7.0]
  def up
    load Rails.root.join('db/seeds.rb')
  end

  def down
    # no-op
  end
end