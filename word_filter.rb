class WordFilter
  def initialize(filter_words)
    # NGWORDを複数にする。
    # wf = WordFilter.new('Arsenal')
    # wf = WordFilter.new(['Arsenal'])
    # wf = WordFilter.new(['Arsenal', 'hoge'])
    @filter_words = filter_words
    # あとからNGワードを変更する。
  end

  def detect(string)
    case
    when @filter_words.is_a?(Array)
    when @filter_words.is_a?(String)
      string.include?(@filter_words) unless string.nil?
    else
      raise 'Type Error'
    end
  end

  def censor(string)
    string.gsub(@filter_word, '<censored>')
  end
end

wf = WordFilter.new('Arsenal')
p wf.detect('t_wada: 昨日のArsenal vs Chelsea 熱かった!')
p wf.censor('t_wada: 昨日のArsenal vs Chelsea 熱かった!')

# wf = WordFilter.new('Arsenal, hoge')
# wf = WordFilter.new('Arsenal, hoge, fuga')
# wf = WordFilter.new('Arsenal hoge fuga')
# wf = WordFilter.new(['Arsenal'])
#
# p wf.detect('t_wada: 昨日のArsenal vs Chelsea 熱かった!')
# p wf.censor('t_wada: 昨日のArsenal vs Chelsea 熱かった!')
