json.extract! task, :id, :create_time, :name, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
