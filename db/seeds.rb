3.times do |topic|
  Topic.create!(title: "Topic #{topic}")
end

puts "3 Topics created!"

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Lorem ipsum dolor amet mustache shabby chic palo santo, kinfolk
    actually 90's snackwave schlitz ethical. Cronut retro try-hard VHS normcore.
    Portland blog deep v seitan. 3 wolf moon street art blog, narwhal cold-pressed
    single-origin coffee vaporware squid seitan disrupt. Hexagon freegan ramps
    paleo shaman stumptown green juice mumblecore coloring book hammock
    letterpress put a bird on it. Cold-pressed tilde fanny pack blue bottle
    scenester gentrify yr lomo man bun irony gluten-free iPhone.",
    topic_id: Topic.last.id
  )
end
puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 25
  )
end
puts "5 skills created"

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor amet mustache shabby chic palo santo, kinfolk
    actually 90's snackwave schlitz ethical. Cronut retro try-hard VHS normcore.
    Portland blog deep v seitan. 3 wolf moon street art blog, narwhal cold-pressed
    single-origin coffee vaporware squid seitan disrupt.",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Angular",
    body: "Lorem ipsum dolor amet mustache shabby chic palo santo, kinfolk
    actually 90's snackwave schlitz ethical. Cronut retro try-hard VHS normcore.
    Portland blog deep v seitan. 3 wolf moon street art blog, narwhal cold-pressed
    single-origin coffee vaporware squid seitan disrupt.",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
  )
end

puts "9 portfolio items created"


3.times do |technology|
  Portfolio.last.technologies.create!(name: "Technology #{technology}")
end

puts "3 technologies created!"
