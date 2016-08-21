
require 'Instamojo-rb'

api = Instamojo::API.new("", "")
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
