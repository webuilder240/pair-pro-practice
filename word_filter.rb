class WordFilter
  def initialize(filter_word)
    @filter_word = filter_word
  end

  def detect(string)
    p string.include?(@filter_word) unless string.nil?
  end

  def output
    pp @filter_word
  end
end

wf = WordFilter.new('test')
wf.detect('aaaaaaaa')
wf.detect('test')
wf.detect('aaaatestaaaaaaa')
wf.detect(' test ')
wf.detect(nil)
wf.output
