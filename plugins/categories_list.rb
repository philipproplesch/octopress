module Jekyll
  class CategoryListTag < Liquid::Tag
    def render(context)
      html = ""
      site = context.registers[:site]

      dir = site.config['category_dir']

      html << "<ul id='categories'>\n"

      site.categories.keys.sort.each do |category|
        posts_in_category = site.categories[category].size
        #html << "<li><a href='/#{dir}/#{category.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase}/'>#{category} (#{posts_in_category})</a></li>\n"
        html << "<li><a href='/#{dir}/#{category.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase}/'>#{category}</a></li>\n"
      end

      html << "</ul>\n"

      html
    end
  end
end

Liquid::Template.register_tag('category_list', Jekyll::CategoryListTag)