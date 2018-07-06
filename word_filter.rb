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
    return false if string.nil?
    case
    when @filter_words.is_a?(Array)
      @filter_words.any? { |filter_word| string.include?(filter_word) }
    when @filter_words.is_a?(String)
      string.include?(@filter_words)
    else
      raise 'Type Error'
    end
  end

  def censor(string)
    case
    when @filter_words.is_a?(Array)
      @filter_words.inject(string) do |s, ng_word|
        s.gsub(ng_word, '<censored>')
      end
    when @filter_words.is_a?(String)
      string.gsub(@filter_words, '<censored>')
    else
      raise 'Type Error'
    end
  end
end

wf = WordFilter.new('Arsenal')
p wf.detect('t_wada: 昨日のArsenal vs Chelsea 熱かった!')
p wf.censor('t_wada: 昨日のArsenal vs Chelsea 熱かった!')

# wf = WordFilter.new('Arsenal, hoge')
# wf = WordFilter.new('Arsenal, hoge, fuga')
# wf = WordFilter.new('Arsenal hoge fuga')
puts '========== Array ======================='
# wf = WordFilter.new(['Arsenal', 'Chelsea'])
wf = WordFilter.new(['Arsenal'])
p wf.detect('t_wada: 昨日のArsenal vs Chelsea 熱かった!')

wf = WordFilter.new(['Arsenal', 'Chelsea'])
p wf.detect('t_wada: 昨日のArsenal vs Chelsea 熱かった!')
p wf.detect('t_wada: 昨日のvs Chelsea 熱かった!')
p wf.detect('')
p wf.detect('t_wada: 昨日のtest1vs test2 暑かった!')
p '-------------------------'
p wf.censor('t_wada: 昨日のArsenal vs Chelsea 熱かった!')
