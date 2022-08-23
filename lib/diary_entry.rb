class DiaryEntry
  def initialize(title, content)
    @title = title
    @content = content
  end
  def read_content
    return @content
  end
  def count_words
    @content.split.size
  end
end