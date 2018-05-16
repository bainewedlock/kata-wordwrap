def wrap(text, w)
  return text if text.length <= w
  text_up_to_w = text[0..w]
  split_pos = text_up_to_w.rindex(' ') || w
  text[0...split_pos] + "\n" + wrap(text[split_pos..-1].lstrip, w)
end
