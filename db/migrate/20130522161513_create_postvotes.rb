class CreatePostvotes < ActiveRecord::Migration
  def change
    create_table :postvotes do |p|
      p.integer   :user_id, :post_id
      p.boolean   :vote
    end
  end
end
