module ApplicationHelper
  def template_compiler(template_path)
    File.open(template_path).read.strip.gsub("\n","").gsub("'", %q(\\\')).html_safe
  end
end
