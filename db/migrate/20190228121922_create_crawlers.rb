class CreateCrawlers < ActiveRecord::Migration[5.2]
  def change
    create_table :crawlers do |t|
      t.string :url
      t.text :body

      t.timestamps
    end
  end
end
