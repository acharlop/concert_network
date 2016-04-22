def generate(number)
  charset = Array('A'..'Z') + Array('a'..'z')
  Array.new(number) { charset.sample }.join
end

def generate_word
	generate(rand 3..9)
end

def generate_sentence
	(rand 10..20).times.collect {generate_word }.join(" ")
end

def generate_short
	(rand 1..5).times.collect {generate_word }.join(" ")
end

def rand_date
	(1..300).to_a.sample.days.from_now
end

venues = ["The Fillmore Miami Beach",
					"Awarehouse",
					"Olympia Theater",
					"Bayfron Park Ampitheatre",
					"Soho Studios"]

20.times do
	Concert.create(
		artist: generate_short ,
		venue: venues.sample , 
		city: "Miami",
		price: rand(0.0..500.99) ,
		date: rand_date ,
		description: generate_sentence
		)
end
