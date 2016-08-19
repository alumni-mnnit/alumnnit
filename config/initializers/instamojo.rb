
require 'Instamojo-rb'

api = Instamojo::API.new("65fced5aa4dd50eeaf57f7679c1520a4", "a1c5e4cf827e058ef2a938b6bd41bbd7", "https://test.instamojo.com/api/1.1/")
INSTA_CLIENT = api.client
=begin
new_link = client.create_link do |link|
  link.title = 'Convention Registration Fee'
  link.description = 'Alumni Association of MNNIT Allahabad is organizing a convention.'
  link.currency = 'INR'
  link.base_price = 5000.00
  link.quantity = 0
  link.redirect_url = 'http://localhost:3000/convention_requests/new'
  link.start_date = "2016-11-12"
  link.end_date = "2016-11-13"
  link.venue = "M.P. Hall, MNNIT-Allahabad"

end

#new_link.reload!
=end