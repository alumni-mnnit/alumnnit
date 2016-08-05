class Search < ActiveRecord::Base

	def search_users
		users = User.all

		users = users.where(["fname LIKE ?","%#{fname}%"]) if fname.present?
		users = users.where(["lname LIKE ?","%#{lname}%"]) if lname.present?
		users = users.where(["degree LIKE ?",degree]) if degree.present? 
		users = users.where(["branch LIKE ?",branch]) if branch.present?
		users = users.where(["country LIKE ?","%#{country}%"]) if country.present?
		users = users.where(["year_of_passing LIKE ?","%#{year_of_passing}%"]) if year_of_passing.present?
		users = users.where(["city LIKE ?","%#{city}%"]) if city.present?
		users = users.where(["company LIKE ?","%#{company}%"]) if company.present?

		return users
	end

end
