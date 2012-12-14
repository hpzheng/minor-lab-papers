module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, :child_index => id) do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to(name, '#', :class => "add_fields", :data => {:id => id, :fields => fields.gsub("\n", "")})
  end

=begin
  def construct_active_nav(opts={})
    opts.each do |key, value|
    if controller.controller_name == 'value[0]'
      html << "<li class='active'><%= link_to #{value[1]}, #{kkkk
  end

# On condition mute text in show view
  def
    some code goes here
    input name and attribute to test

=end
end
