json.extract! page, :id, :title, :description, :main_html, :slug, :created_at, :updated_at
json.url page_url(page, format: :json)
