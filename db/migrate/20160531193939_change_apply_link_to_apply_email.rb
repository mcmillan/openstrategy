class ChangeApplyLinkToApplyEmail < ActiveRecord::Migration
  def change
    rename_column :jobs, :apply_link, :apply_email
  end
end
