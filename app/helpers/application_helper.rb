module ApplicationHelper
	# Returns the full title on a per-page basis
	def full_title(page_title)
		base_title = "Storkypics"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	# Dynamically adds fields for nested forms
	def link_to_add_fields(name, f, association)
	    new_object = f.object.send(association).klass.new
	    id = new_object.object_id
	    fields = f.fields_for(association, new_object, child_index: id) do |builder|
	      render(association.to_s.singularize + "_fields", f: builder)
	    end
    	link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  	end

  	# Embed youtube video
	def youtube_embed(youtube_url)
	  if youtube_url[/youtu\.be\/([^\?]*)/]
	    youtube_id = $1
	  else
	    # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
	    youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
	    youtube_id = $5
	  end

	  %Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
	end
end
