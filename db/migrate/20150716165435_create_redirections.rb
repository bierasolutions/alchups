class CreateRedirections < ActiveRecord::Migration
  def change
    create_table :redirections do |t|
      t.string :target_url

      t.timestamps null: false
    end
  end
end
