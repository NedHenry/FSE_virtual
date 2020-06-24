class Page < ApplicationRecord

  def save
    slug = title.parameterize if slug.nil?
    unless File.file?(view_partial_path)
      File.open(view_partial_path, "w") {|f| f.write('<%= html.html_safe %>')}
    end
    super
  end

  def view_partial_name
    "page_#{slug}"
  end

  def view_partial_filename
    "_#{view_partial_name}.html.erb"
  end
  
  def view_partial_path
    File.join(Rails.root,"app/views/pages",view_partial_filename)
  end

end
