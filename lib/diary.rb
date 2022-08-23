class Diary

  def initialize
    @entry_list = []
    @todo_list = []
  end

  def add_entry(entry)
    @entry_list << entry
  end

  def read_entries
    return @entry_list.map do |entry|
      entry.read_content
    end
  end

  def select_entry(min, wpm) 
    best_entry = nil
    @entry_list.each do |entry|
      next if entry.count_words > min * wpm
      if best_entry == nil || (min * wpm - entry.count_words) <  (min * wpm - best_entry.count_words)
        best_entry = entry
      end
    end
    return best_entry
  end

  def add_todo_list(todo_list)
    @todo_list = todo_list.show_list
  end

  def read_todo_list
    @todo_list
  end

  def find_phone_numbers
    phone_list = []
    @entry_list.each do |entry|
      entry.read_content.chars.each_with_index do |char, index|
        if char == "0"
          phone_list << entry.read_content[index, 11]
        end
      end
    end
  return phone_list
  end

end