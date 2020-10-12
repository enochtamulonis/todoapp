json.extract! todo_list_message, :id, :is_read, :todo_list_id, :created_at, :updated_at
json.url todo_list_message_url(todo_list_message, format: :json)
