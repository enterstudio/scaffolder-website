include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo

def highlight
  "<pre class=\"class=prettyprint\">"
end

def endhighlight
  "</pre>"
end

def image(url,width=400)
  "<img src='#{relative_path_to(url)}' width=#{width}>"
end

def google_font(name,character_sets = [])
  unless character_sets.empty?
    name += ':'
    name += character_sets * ','
  end
  link = "http://fonts.googleapis.com/css?family=#{name}&amp;subset=latin"
  "<link href='#{link}' media='all' rel='stylesheet' type='text/css'>"
end

def stylesheet(location, media = 'screen,projection')
  "<link href='#{location}' media='#{media}' rel='stylesheet' type='text/css'>"
end
