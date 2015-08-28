class AddAttachmentLogoToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :products, :logo
  end
end
