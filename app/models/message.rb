class Message < ApplicationRecord
  belongs_to :todo_list
  has_rich_text :body

end
