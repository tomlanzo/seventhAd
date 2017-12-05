class AddShortUrlToSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :short_url, :string
  end
end
