class WordFilter
  def initialize(filter_word)
    @filter_word = filter_word
  end

  def detect(string)
    string.include?(@filter_word) unless string.nil?
  end

  def censor(string)
    string.gsub(@filter_word, '<censored>')
  end
end

wf = WordFilter.new('Arsenal')
p wf.detect('t_wada: 昨日のArsenal vs Chelsea 熱かった!')
p wf.censor('t_wada: 昨日のArsenal vs Chelsea 熱かった!')
