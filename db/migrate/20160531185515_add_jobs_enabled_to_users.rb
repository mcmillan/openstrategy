class AddJobsEnabledToUsers < ActiveRecord::Migration
  def change
    add_column :users, :jobs_enabled, :boolean
  end
end
