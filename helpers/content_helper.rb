module ContentHelper
  def write_new(handle, link, description)
    File.open('queue.txt', 'a+') do |f|
      f.write("#{handle}, #{link}, #{description}\n")
    end
  end

  def read_queue
    queue = []
    File.readlines('queue.txt').each do |line|
      queue << line.gsub(/\n/, "").split(", ")
    end
    queue
  end
end
