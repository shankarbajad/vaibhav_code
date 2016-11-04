module CompaniesHelper
	def cities f
		cities = f.object.country ? country_cities(f.object.country) : country_cities('AF')
		return cities
	end

	def country_cities code		
		country = Country.find_by_code(code)
		country.cities.order(:name).map { |city| [city.name, city.code] }		
	end

	def countries f
		Country.all.order(:name).map{|country| [country.name, country.code]}
	end

	def video_url link
		if link.include? "vimeo.com"
			"https://player.vimeo.com/video/#{link.split("vimeo.com/")[1]}?badge=0"
		else
			"https://www.youtube.com/embed/#{link.split("v=")[1]}"
		end
	end
	
end
