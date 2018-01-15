10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Lorem ipsum dolor amet mustache shabby chic palo santo, kinfolk
    actually 90's snackwave schlitz ethical. Cronut retro try-hard VHS normcore.
    Portland blog deep v seitan. 3 wolf moon street art blog, narwhal cold-pressed
    single-origin coffee vaporware squid seitan disrupt. Hexagon freegan ramps
    paleo shaman stumptown green juice mumblecore coloring book hammock
    letterpress put a bird on it. Cold-pressed tilde fanny pack blue bottle
    scenester gentrify yr lomo man bun irony gluten-free iPhone."
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

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "My great service",
    body: "Lorem ipsum dolor amet mustache shabby chic palo santo, kinfolk
    actually 90's snackwave schlitz ethical. Cronut retro try-hard VHS normcore.
    Portland blog deep v seitan. 3 wolf moon street art blog, narwhal cold-pressed
    single-origin coffee vaporware squid seitan disrupt.",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
  )
end
puts "9 portfolio items created"
