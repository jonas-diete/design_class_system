require "diary"
require "diary_entry"
require "todo_list"

describe Diary do
  describe "#add and #read_entries" do
    it "adds a new diary entry and returns it when read_entries is called" do
      diary = Diary.new
      entry1 = DiaryEntry.new("23/08", "Today was a great day.")
      diary.add_entry(entry1)
      expect(diary.read_entries).to eq ["Today was a great day."]
    end

    it "adds 2 new diary entries and returns them when read_entries is called" do
      diary = Diary.new
      entry1 = DiaryEntry.new("23/08", "Today was a great day.")
      diary.add_entry(entry1)
      entry2 = DiaryEntry.new("22/08", "Today was really fun.")
      diary.add_entry(entry2)
      expect(diary.read_entries).to eq ["Today was a great day.", "Today was really fun."]
    end
  end

  describe "#select_entry" do
    it "returns entry1, when passed 5 min and 100 wpm" do
      diary = Diary.new
      entry1 = DiaryEntry.new("23/08", "learning " * 500)
      diary.add_entry(entry1)
      entry2 = DiaryEntry.new("22/08", "working " * 300)
      diary.add_entry(entry2)
      expect(diary.select_entry(5, 100)).to eq entry1
    end

    it "returns entry4, when passed 6 min, 50 wpm." do
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
      expect(diary.select_entry(6, 50)).to eq entry4
    end
  end

  describe "#add_todo_list and #read_todo_list" do
    it "returns ['Go shopping', 'Paint the kitchen.']" do
      diary = Diary.new
      todo_list = TodoList.new
      todo_list.add_task("Go shopping.")
      todo_list.add_task("Paint the kitchen.")
      diary.add_todo_list(todo_list)
      expect(diary.read_todo_list).to eq ["Go shopping.", "Paint the kitchen."]
    end
  end

  describe "#find_phone_numbers" do
    it "returns a list of phone numbers in all diary entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("23/08", "Met John today. His number is 07335526641.")
      diary.add_entry(entry1)
      entry2 = DiaryEntry.new("22/08", "A great day.")
      diary.add_entry(entry2)
      entry3 = DiaryEntry.new("21/08", "Lisa (07883352311) was really helpful, but Henry (07332466443) annoyed me.")
      diary.add_entry(entry3)
      entry4 = DiaryEntry.new("20/08", "working " * 298)
      diary.add_entry(entry4)
      entry5 = DiaryEntry.new("19/08", "07331536457 is Richard's new number.")
      diary.add_entry(entry5)
      expect(diary.find_phone_numbers).to eq ["07335526641", "07883352311", "07332466443", "07331536457"]
    end
  end
end