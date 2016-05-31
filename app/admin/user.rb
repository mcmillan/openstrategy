ActiveAdmin.register User do
  index do
    column :name
    column :location
    column :bio
    column :admin
    column :community_enabled
    column :jobs_enabled
    actions
  end

  form do |f|
    inputs do
      input :name
      input :location
      input :bio
      input :admin
      input :community_enabled
      input :jobs_enabled
    end
    actions
  end

  permit_params :name, :location, :bio, :admin, :community_enabled, :jobs_enabled

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
