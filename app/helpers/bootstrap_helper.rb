module BootstrapHelper

  # Bootstrap Icons
  # Examples: glyph(:ok), glyph(:zoom_in), glyph(:remove, :white)
  def glyph(*names)
    content_tag :i, nil, class: names.map{|name| "icon-#{name.to_s.gsub('_','-')}" }
  end

  # Sidebar Menu
  def nav_list
    haml_tag :ul, class: 'nav nav-list', data: {content: 'This is the menu' }, rel: 'popover' do
      haml_tag :li, 'Menu' ,class: 'nav-header'
      yield if block_given?
    end
  end
end