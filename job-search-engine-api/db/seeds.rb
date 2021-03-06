# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'
require 'rest-client'

doc = RestClient.get('https://www.meetup.com/topics/')
body = doc.body
main = body.split('<a name="Tech">')[1].split('<a name="Writing"')[0]
list = main.split('</a></div></li><li class="gridList-item"><div class="gridList-itemInner"><a class="link" href="')
cleanList = list.map{|item| item.split('">')[1]}
finishedList = cleanList[1..-2]

finishedList.each{|item| Interest.create(title: item)}

# builtinNyc jobs webscrape

doc = Nokogiri::HTML(open('https://www.builtinnyc.com/jobs'))

# job_titles = doc.css('div.left-col').collect do |job_title|
#     job_title.css('h2.title').text
# end

# companies = doc.css('div.left-col').collect do |company|
#     company.css('div.company-title').text
# end

# locations = doc.css('div.left-col').collect do |location|
#     location.css('div.job-location').text
# end

