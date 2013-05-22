class CreateCommentvotes < ActiveRecord::Migration
  def change
    create_table :commentvotes do |c|
      c.integer   :user_id, :comment_id
      c.boolean   :vote
    end
  end
end
