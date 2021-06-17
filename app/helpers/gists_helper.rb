module GistsHelper

  def break_row(text)
    new_string = ''
    text.split("\n").each {|item| new_string += "<p>#{item}</p>"}
    new_string
  end

end