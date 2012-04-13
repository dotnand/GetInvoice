# encoding: utf-8
ActiveAdmin::Views::Pages::Base.class_eval do
  private
  # Renders the content for the footer
  def build_footer
    div :id => "footer" do
      para "".html_safe
    end
  end
end