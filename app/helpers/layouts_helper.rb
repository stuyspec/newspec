module LayoutsHelper
  def parent_layout(layout)
    @view_flow.set(:layout, output_buffer)
    output = render(:file => "layouts/#{layout}")
    self.output_buffer = ActionView::OutputBuffer.new(output)
  end

  def la(text, url)
    c = current_page?(url)
    link = if c
      link_to "#{text}<span class='sr-only' current>".html_safe, url
    else
      link_to text, url
    end
    return "<li#{' class="active"' if c}>#{link}</li>"
  end
end
