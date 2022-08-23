require "todo_list"

describe "#add_task, #mark_complete, #show_list" do
  it 'returns ["Paint the kitchen.", "Clean the bath."] when new tasks are added and one is marked as complete.' do
    todo_list = TodoList.new
    todo_list.add_task("Go shopping.")
    todo_list.add_task("Paint the kitchen.")
    todo_list.mark_complete("Go shopping.")
    todo_list.add_task("Clean the bath.")
    expect(todo_list.show_list).to eq ["Paint the kitchen.", "Clean the bath."]
  end
end