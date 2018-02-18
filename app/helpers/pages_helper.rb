module PagesHelper
  def twitter_parser tweet
    # Regular expression that searches for any links in the tweet and removes periods or commas at the end
    regex = %r{
      \b
      (
        (?: [a-z][\w-]+:
         (?: /{1,3} | [a-z0-9%] ) |
          www\d{0,3}[.] |
          [a-z0-9.\-]+[.][a-z]{2,4}/
        )
        (?:
         [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
        )+
        (?:
          \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
          [^\s`!()\[\]{};:'".,<>?«»“”‘’]
        )
      )
    }ix

    # Take the urls and substitute a link into the tweet
    tweet.gsub(regex) do |url|
      "<a href='#{url}' target='_blank'>#{url}</a>"
    end.html_safe
  end
end
