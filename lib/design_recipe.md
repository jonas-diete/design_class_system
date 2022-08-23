# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_
    As a user
    So that I can record my experiences
    I want to keep a regular diary

    As a user
    So that I can reflect on my experiences
    I want to read my past diary entries

    As a user
    So that I can reflect on my experiences in my busy day
    I want to select diary entries to read based on how much time I have and my reading speed

    As a user
    So that I can keep track of my tasks
    I want to keep a todo list along with my diary

    As a user
    So that I can keep track of my contacts
    I want to see a list of all of the mobile phone numbers in all my diary entries
_

## 2. Design the Class System


```
┌───────────────────────┐  ┌──────────────────────────---┐
│ Diary                 │  │ DiaryEntry                  │
│                 ┌─────┼──►                             │
│ add_entry(entry)│     │  │ initialize(title, contents) │
│                       │  │                             │
│ read_entries          │  │ count_words                 │
│                       │  └──────────────────────────---┘
│ select_entry(min, wpm)│
│                       │
│ add_todo(todo_list)───┼─────┐
│                       │     │
│ find_phone_numbers    │  ┌──▼───────────────────────┐
└───────────────────────┘  │ TodoList                 │
                           │                          │
                           │ add_task(task)           │
                           │                          │
                           │ mark_complete(task)      │
                           └──────────────────────────┘


```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    @entry_list = [] # empty array
  end
  def add_entry(entry) # takes instance of DiaryEntry
    # entry gets added to entry_list
    # returns nothing
  end
  def read_entries
    # returns list of diary entry contents
  end
  def select_entry(min, wpm) # both are integers
    # returns one diary_entry that's closest (but not more) to the number of words the user has time to read
    # uses count_words of DiaryEntry class
  end
  def add_todo_list(todo_list) # takes instance of TodoList
    # todo list will be saved in a variable
  end
  def read_todo_list
    # returns the todo list
  end
  def find_phone_numbers
    # return list of phone numbers, that have been found in all diary entries
  end
end

class DiaryEntry
  def initialize(title, content)
    # save title and content
  end
  def count_words
    # returns number of words in that entry (Integer)
  end
end

class TodoList
  def initialize
    @todo_list = [] # empty array
  end
  def add_task(task) # task is string
    # task is added to @todo_list
  end
  def mark_complete(task) # task is string
    # task is deleted from @todo_list
  end
  def show_list
    # returning the list of incomplete tasks
  end
end

```
## 3. Create Examples as Integration Tests
_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._
```ruby

# test 1
# adds and reads an entry
diary = Diary.new
entry1 = DiaryEntry.new("23/08", "Today was a great day.")
diary.add_entry(entry1)
diary.read_entries # => ["Today was a great day."]

# test 2
# adds and reads entries
diary = Diary.new
entry1 = DiaryEntry.new("23/08", "Today was a great day.")
diary.add_entry(entry1)
entry2 = DiaryEntry.new("22/08", "Today was really fun.")
diary.add_entry(entry2)
diary.read_entries # => ["Today was a great day.", "Today was really fun."]

# test 3
# select a correct entry
diary = Diary.new
entry1 = DiaryEntry.new("23/08", "learning " * 500)
diary.add_entry(entry1)
entry2 = DiaryEntry.new("22/08", "working " * 300)
diary.add_entry(entry2)
diary.select_entry(5, 100) # => returns entry1

# test 4
# select a correct entry
diary = Diary.new
entry1 = DiaryEntry.new("23/08", "learning " * 500)
diary.add_entry(entry1)
entry2 = DiaryEntry.new("22/08", "working " * 306)
diary.add_entry(entry2)
entry3 = DiaryEntry.new("21/08", "working " * 250)
diary.add_entry(entry3)
entry4 = DiaryEntry.new("20/08", "working " * 298)
diary.add_entry(entry4)
entry5 = DiaryEntry.new("19/08", "working " * 184)
diary.add_entry(entry5)
diart.select_entry(6, 50) # => returns entry4

# test 5
# add and read todo list
diary = Diary.new
todo_list = TodoList.new
todo_list.add_task("Go shopping.")
todo_list.add_task("Paint the kitchen.")
diary.add_todo_list(todo_list)
diary.read_todo_list # => returns todo_list


# test 6
# Finds phone numbers in all diary entries
diary = Diary.new
entry1 = DiaryEntry.new("23/08", "Met John today. His number is 07335526641.")
diary.add_entry(entry1)
entry2 = DiaryEntry.new("22/08", "A great day.")
diary.add_entry(entry2)
entry3 = DiaryEntry.new("21/08", "Lisa (078833523115) was really helpful, but Henry (07332466443) annoyed me.")
diary.add_entry(entry3)
entry4 = DiaryEntry.new("20/08", "working " * 298)
diary.add_entry(entry4)
entry5 = DiaryEntry.new("19/08", "07331536457 is Richard's new number.")
diary.add_entry(entry5)
diary.find_phone_numbers # => returns ["07335526641", "078833523115", "07332466443", "07331536457"]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

# test 7
# counts words of one entry
diary_entry = DiaryEntry.new("working " * 298)
diary_entry.count_words # => returns 298


# test 8
# adds tasks, marks some as complete and shows list
todo_list = TodoList.new
todo_list.add_task("Go shopping.")
todo_list.add_task("Paint the kitchen.")
todo_list.mark_complete("Go shopping.")
todo_list.add_task("Clean the bath.")
todo_list.show_list # => returns ["Paint the kitchen.", "Clean the bath."]

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._