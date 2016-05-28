#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

## INPUTS
# Input de l'URL de départ
# print "URL de départ : "
# starting_url = gets.chomp
# while starting_url[0, 8] != "https://"
#     print "URL de départ : "
#     starting_url = gets.chomp
# end
#
# # Inpute de l'URL de fin
# print "URL d'arrivée : "
# ending_url = gets.chomp
# while ending_url[0, 8] != "https://"
#     print "URL d'arrivée : "
#     ending_url = gets.chomp
# end



# ## Début du script
# pathes = Array.new
# hrefs = Array.new
#
# def explorer url, array
# 	doc = Nokogiri::HTML(open(url))
#
# 	doc.css('#mw-content-text a').each do |a|
# 		href = a.attributes["href"].value
# 		if href[0, 6] == "/wiki/"
# 			href["/wiki/"] = ""
# 		else
# 			next
# 		end
# 		if !array.include? href
# 			array[array.length] = href
# 		end
# 	end
# end
#
# p explorer starting_url, hrefs




class WikiExplorer

	def initialize starting_url, ending_url
		@@starting_url = starting_url
		@@ending_url = ending_url
	end


	def find_path
		scan_page @@starting_url
		p @@hrefs
	end

	private
		def scan_page url
			@@hrefs = Array.new if defined? @@hrefs
			doc = Nokogiri::HTML(open(url))
			doc.css('#mw-content-text a').each do |a|
				href = a.attributes["href"].value
				if href[0, 6] === "/wiki/"
					href["/wiki/"] = ""
				else
					next
				end
				@@hrefs[array.length] = href if !@@hrefs.include? href
			end
		end

end

wiki = WikiExplorer.new "https://fr.wikipedia.org/wiki/Ruby                                    ", "https://fr.wikipedia.org/wiki/Python"
wiki.find_path
