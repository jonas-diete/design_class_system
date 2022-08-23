class TodoList
  def initialize
    @todo_list = []
  end
  def add_task(task) 
    @todo_list << task
  end
  def mark_complete(task)
    @todo_list.delete(task)
  end
  def show_list
    @todo_list
  end
end