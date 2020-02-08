class Search < ApplicationRecord
    belongs_to :user
    has_one :interest
end

require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('https://www.builtinnyc.com/jobs'))

jobs = doc.css('div.left-col').collect do |job|
    job.css('h2.title').text
end

companies = doc.css('div.left-col').collect do |company|
    company.css('div.company-title').text
end

locations = doc.css('div.left-col').collect do |location|
    location.css('div.job-location').text
end