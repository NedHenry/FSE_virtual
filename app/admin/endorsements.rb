ActiveAdmin.register Endorsement do
  permit_params :affiliate_id,:name,:caption,:enabled,:media_uri,:media_type, :banner, :logo, :endorsement_type, :weight, :link

  index do
    selectable_column
    id_column
    column :name
    column :caption
    column :enabled
    column :endorsement_type
    column :weight
    column :link
    column :banner
    column :logo
    actions
  end

  show do
    attributes_table do
      row :name
      row :caption
      row :link
      row :enabled
      row :endorsement_type
      row :weight
      row :banner do |e10t|
        image_tag url_for(e10t.banner.variant(resize: "200x300>")) if e10t.banner.present?
      end
      row :logo do |e10t|
        image_tag url_for(e10t.logo.variant(resize: "150x150>")) if e10t.logo.present?
      end
    end
    active_admin_comments
  end

  filter :name
  filter :enabled
  filter :media_type

  form do |f|
    f.inputs do
      f.input :name
      f.input :caption
      f.input :link
      f.input :enabled, as: :boolean
      f.input :endorsement_type
      f.input :weight
      f.input :banner, :as => :file
      f.input :logo, :as => :file
    end
    f.actions
  end

end
