class WordFilter
  def initialize(filter_word)
    @filter_word = filter_word
  end

  def detect(string)
    p string.include?(@filter_word) unless string.nil?
  end

  def censor(string)
    string.gsub(@filter_word, '<censored>')
  end  
end

wf = WordFilter.new('test')
p wf.censor('testaatatteesttesta')
p wf.censor('')