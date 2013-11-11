module ApplicationHelper
	def full_title(page_title)
		str = "RoR Tutorial"
		str += " | #{page_title}" unless page_title.empty?
		str
	end
end
