class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :discription

      t.timestamps
    end
  end
end
