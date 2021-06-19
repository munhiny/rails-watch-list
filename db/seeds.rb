# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

buffer = open("http://tmdb.lewagon.com/movie/top_rated").read
result = JSON.parse(buffer)
movies = result['results']

movies.each { |movie| 

    title = movie['title']
    overview = movie['overview']
    poster_url = "https://image.tmdb.org/t/p/w500/" + movie['poster_path'].to_s
    rating = movie["vote_average"].to_i
    Movie.create(title: title ,overview: overview, poster_url: poster_url, rating: rating) 
}






