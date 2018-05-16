require 'rspec'
require_relative 'wrap'

describe 'wrap' do
  it 'doesn''t wrap text that is shorter than the line length' do
    expect(wrap 'abcd', 5).to eq 'abcd'
  end
  it 'doesn''t wrap text that is exactly as long as the line length' do
    expect(wrap 'abcde', 5).to eq 'abcde'
  end
  it 'splits a single word if it is longer than the line length' do
    expect(wrap 'abcdef', 3).to eq "abc\ndef"
  end
  it 'replaces space with line break if it is exactly at the line end' do
    expect(wrap 'abc def', 3).to eq "abc\ndef"
  end
  it 'replaces space with line break if it is directly after the line end' do
    expect(wrap 'fugiat nulla pariatur. Excepteur', 22).to eq "fugiat nulla pariatur.\nExcepteur"
  end
  it 'replaces last space before line end if there is no space at the line end' do
    expect(wrap 'abc def', 4).to eq "abc\ndef"
  end
  it 'wraps more than one line' do
    expect(wrap 'this is wonderful', 4).to eq "this\nis\nwond\nerfu\nl"
  end

  it 'lorem ipsum #1' do
    input = "Lorem ipsum dolor sit amet, consetetursadipscing elitr."
    expected = "Lorem ipsum\ndolor sit\namet,\nconsetetursad\nipscing\nelitr."
    actual = wrap(input, 13)
    puts "<<#{actual}>>"
    expect(actual).to eq(expected)
  end
  it 'lorem ipsum #2' do
    input = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    expected = "Lorem ipsum dolor sit|amet, consectetur|adipisicing elit, sed|do eiusmod tempor|incididunt ut labore|et dolore magna|aliqua. Ut enim ad|minim veniam, quis|nostrud exercitation|ullamco laboris nisi|ut aliquip ex ea|commodo consequat.|Duis aute irure dolor|in reprehenderit in|voluptate velit esse|cillum dolore eu|fugiat nulla pariatur.|Excepteur sint|occaecat cupidatat non|proident, sunt in|culpa qui officia|deserunt mollit anim|id est laborum.".gsub('|',"\n")
    actual = wrap(input, 22)
    puts "<<#{actual}>>"
    expect(actual).to eq(expected)
  end
end
