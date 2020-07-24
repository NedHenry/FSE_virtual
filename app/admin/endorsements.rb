ActiveAdmin.register Endorsement do
  permit_params :affiliate_id,:name,:caption,:enabled,:media_uri,:media_type, :banner, :endorsement_type, :weight, :link

  index do
    selectable_column
    id_column
    column :name
    column :caption
    column :enabled
    column :endorsement_type
    column :weight
    column :link
    column :media_uri
    column :media_type
    column :banner
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
      f.input :affiliate_id
      f.input :endorsement_type
      f.input :weight
      f.input :media_uri
      f.input :media_type
      f.input :banner, :as => :file
    end
    f.actions
  end

end
