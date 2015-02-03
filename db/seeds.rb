# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
publicworksexp = PublicWorksExp.create([{ name: 'SF Public Works' }, 
				{ name: 'San Francisco International Airport' },
				{ name: 'SF PUC' },
				{ name: 'Port of SF' },
				{ name: 'SFRA/OCII' },
				{ name: 'Caltrans' },
				{ name: 'City and County of SF Other Dept' },
				{ name: 'City of Oakland' },
				{ name: 'Alameda County' },
				{ name: 'State' },
				{ name: 'Federal' },
				{ name: 'Other' },
				{ name: 'None' }])


largestpublicworksproj = LargestPublicWorksProject.create([{ name: 'None' }, 
				{ name: 'Under $100k' },
				{ name: '$100k to $500k' },
				{ name: '$500k to $1M' },
				{ name: '$1M to $5M' },
				{ name: 'Over $5M' }])