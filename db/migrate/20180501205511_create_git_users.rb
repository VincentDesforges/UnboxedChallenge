class CreateGitUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :git_users do |t|
      t.string :username
      t.text :response
      t.string :favourite

      t.timestamps
    end
  end
end
