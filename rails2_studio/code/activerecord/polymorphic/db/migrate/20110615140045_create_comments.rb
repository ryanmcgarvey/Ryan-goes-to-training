class CreateComments < ActiveRecord::Migration
  def self.up
#START:create_table
    create_table :comments do |t|
      t.text       :content
      t.references :commentable, :polymorphic => true
      t.timestamps
    end
#END:create_table
  end

  def self.down
    drop_table :comments
  end
end
