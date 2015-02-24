class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :article, index: true
      t.boolean :positive

      t.timestamps
    end
  end
end
