module ContentWriter
  def write_new(handle, link, description)
    File.open('queue.txt', 'a+') do |f|
      f.write("#{handle}, #{link}, #{description}\n")
    end
  end
end
