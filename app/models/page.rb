class Page < ApplicationRecord

  def save
    unless File.file?(view_partial_path)
      File.open(view_partial_path, "w") {}
    end
    super
  end

  def view_partial_name
    "page_#{title.parameterize}"
  end

  def view_partial_filename
    "_#{view_partial_name}.html.erb"
  end
  
  def view_partial_path
    File.join(Rails.root,"app/views/pages",view_partial_filename)
  end
  
end
