Universe.create([
  {id: 1, name: "Marvel", image: '/images/marvel.jpg'},
  {id: 2, name: "DC", image: '/images/DC.jpg'},
])

Power.create([

    {id: 1, description: "Strength"},
    {id: 2, description: "Speed"},
    {id: 3, description: "Flight"},
    {id: 4, description: "Reflexes"},
    {id: 5, description: "Regeneration"},
    {id: 6, description: "Invisibility"},
    {id: 7, description: "Telepathy"},
    {id: 8, description: "Telekinesis"},
    {id: 9, description: "Botany"},
    {id: 10, description: "Financial Security"},
    {id: 11, description: "Anatomical Size Manipulation"},
])

User.create ([
  {id: 1, first_name: "Captain", last_name: "America", email: "Captain_america@marvel.com", username: "captain", password: "throw_my_shield", power_id: 4, universe_id: 1},
  {id: 2, first_name: "Peter ", last_name: "Parker", email: "Web_slinger@marvel.com", username: "spiderman", password: "aunt_may", power_id: 4 , universe_id: 1},
  {id: 3, first_name: "Bruce", last_name: "Wayne", email: "Rich_boy_with_toys@DC.com", username: "batman", password: "im_awesome", power_id: 10 , universe_id: 2},
  {id: 4, first_name: "Poison", last_name: "Ivy", email: "Itchy_plants@DC.com", username: "KissOfDeath", password: "plants_be_cool", power_id: 9 , universe_id: 2},
  {id: 5, first_name: "Scott", last_name: "Pym", email: "Ant_man@marvel.com", username: "  ", password: "super_size_me", power_id: 11},
  {id: 6, first_name: "Barry", last_name: "Allen", email: "Catch_me_if_you_can@DC.com", username: "  ", password: "i_heart_iris", power_id: 2},
  # {id: 7, first_name: "Oliver", last_name: "Queen", email: "Straight_shooting@DC.com", username: "  " password: "failed_this_city", power_id:}
  # {id: 8, first_name: "Tony", last_name: "Stark", email: "Playboy_status@marvel.com", username: "  " password: "penny123", power_id:}
  # {id: 9, first_name: "Stephen", last_name: "Strange", email: "Dr_strange@marvel.com", username: "  " password: "chrono_surgeon", power_id:}
  # {id: 10, first_name: "James", last_name: "Howl", email: "Logan_the_coolest@marvel.com", username: "  " password: "blahblahjelly", power_id:}
  # {id: 11, first_name: "Diana", last_name: "Prince", email: "Lasso_time@DC.com", username: "  " password: "truth_be_told", power_id:}
  # {id: 12, first_name: "Clark", last_name: "Kent", email: "Do_you_even_lift@DC.com", username: "  " password: "kryptonite_sucks", power_id:}
  ])

Post.create ([
  {id: 1, user_id: 1, title: "Morals", body: "Always keep your priorities straight and do the right thing"},
  {id: 2, user_id: 2, title: "Exams", body: "Finals can be such a Loki.....am I right?.."},
  {id: 3, user_id: 3, title: "So I've heard...", body: "I heard that this Batman character is literally the best"},
  {id: 4, user_id: 6, title: "Irony", body: "I'm the fastest man alive, and I still miss the train. #!punctual"},
  {id: 5, user_id: 4, title: "Please Sign", body: "I will attach my petition later to ban Miracle-Gro from the market, I only need 1 million signatures. :)"},
  {id: 6, user_id: 5, title: "Not Compensating", body: "Size isn't everything ladies"},
  {id: 7, user_id: 1, title: "4th of July party", body: "Come celebrate our beautiful country's birth at my place for a BBQ! Don't drink and drive!"},
  ])

Comment.create ([
  {id: 1, post_id: 1, user_id: 2, body: "What a lame post, Captain..."},
])
