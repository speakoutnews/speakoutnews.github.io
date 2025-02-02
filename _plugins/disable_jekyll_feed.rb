module Jekyll
  class DisableJekyllFeed < Generator
    priority :highest

    def generate(site)
      # Remove jekyll-feed from generators
      site.generators.reject! { |g| g.is_a?(JekyllFeed::Generator) } if defined?(JekyllFeed)
    end
  end
end

Jekyll::Hooks.register :site, :post_render do |site|
  # Remove 'feed-subscribe' from pages
  site.pages.each do |page|
    if page.output
      page.output.gsub!(/<p[^>]*class=["'][^"']*feed-subscribe[^"']*["'][^>]*>.*?<\/p>/m, '')
    end
  end

  # Remove 'feed-subscribe' from posts and collections
  site.documents.each do |doc|
    if doc.output
      doc.output.gsub!(/<p[^>]*class=["'][^"']*feed-subscribe[^"']*["'][^>]*>.*?<\/p>/m, '')
    end
  end
end
