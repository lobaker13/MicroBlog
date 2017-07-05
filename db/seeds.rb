Universe.create [(
  {id: 1, name: "Marvel", image: '/images/marvel.jpg'},
  {id: 2, name: "DC", image: '/images/DC.jpg'},
  )]

User.create [(
  {id: 1, first_name: "Captain", last_name: "America", email: "Captain_america@marvel.com", username: "captain" password: "throw_my_shield", super_power: "Patriotic", universe_id: 1}
  {id: 2, first_name: "Peter ", last_name: "Parker", email: "Web_slinger@marvel.com", username: "spiderman" password: "aunt_may", super_power: "Enhanced Physiology", universe_id: 1}
  {id: 3, first_name: "Bruce", last_name: "Wayne", email: "Rich_boy_with_toys@DC.com", username: "batman" password: "im_awesome", super_power: "Rich", universe_id: 2}
  #{id: 4, first_name: "Poison", last_name: "Ivy", email: "Itchy_plants@DC.com", username: "  " password: "plants_be_cool", super_power: " "}
  #{id: 5, first_name: "Scott", last_name: "Pym", email: "Ant_man@marvel.com", username: "  " password: "super_size_me", super_power: " "}
  #{id: 6, first_name: "Barry", last_name: "Allen", email: "Catch_me_if_you_can@DC.com", username: "  " password: "i_heart_iris", super_power: " "}
  #{id: 7, first_name: "Oliver", last_name: "Queen", email: "Straight_shooting@DC.com", username: "  " password: "failed_this_city", super_power: " "}
  #{id: 8, first_name: "Tony", last_name: "Stark", email: "Playboy_status@marvel.com", username: "  " password: "penny123", super_power: " "}
  #{id: 9, first_name: "Stephen", last_name: "Strange", email: "Dr_strange@marvel.com", username: "  " password: "chrono_surgeon", super_power: " "}
  #{id: 10, first_name: "James", last_name: "Howl", email: "Logan_the_coolest@marvel.com", username: "  " password: "blahblahjelly", super_power: " "}
  #{id: 11, first_name: "Diana", last_name: "Prince", email: "Lasso_time@DC.com", username: "  " password: "truth_be_told", super_power: " "}
  #{id: 12, first_name: "Clark", last_name: "Kent", email: "Do_you_even_lift@DC.com", username: "  " password: "kryptonite_sucks", super_power: " "}
  )]

Post.create [(
  {id: 1, user_id: 1, title: "Morals", body: "Always keep your priorities straight and do the right thing"}
  {id: 2, user_id: 2, title: "Exams", body: "Finals can be such a Loki.....am I right?.."}
  {id: 3, user_id: 3, title: "So I've heard...", body: "I heard that this Batman character is literally the best"}
)]

Comment.create [(
  {id: 1, user_id: 2, body: "What a lame post, Captain..."}
)]
