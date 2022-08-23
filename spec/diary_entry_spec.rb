require "diary_entry"

describe DiaryEntry do
  describe "#count_words" do
    it "returns 298 when called on object with content of 298 words" do
      diary_entry = DiaryEntry.new("23/08", "working " * 298)
      expect(diary_entry.count_words).to eq 298
    end
  end
end