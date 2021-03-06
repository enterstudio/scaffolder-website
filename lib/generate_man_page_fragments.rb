def generate_man_page_fragments
  clear_dest

  Dir[source].each do |file|
    File.open(dest + '/' + File.basename(file) + '.html','w') do |out|
      out.puts "---"
      out.puts "  title: #{title_from(file)}"
      out.puts "  type: man-page"
      out.puts "---"
      out.puts `ronn --pipe --html --fragment #{file}`
    end
  end
end

private

def dest
  File.join(%W|#{content} markup man|)
end

def clear_dest
  Dir[File.join(dest,'*.html')].each{|file| File.delete file}
end

def source
  File.join(%W|#{content} code scaffolder-tools man *|)
end

def content
  File.join(%W|#{File.dirname(__FILE__)} .. content|)
end

def title_from(file)
  File.basename(file).gsub(/\.ronn/,'')
end
