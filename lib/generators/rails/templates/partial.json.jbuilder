json.cache! [<%= singular_table_name %>] do
<% for attribute in attributes -%>
<%- if attribute.name.to_s == 'name' -%>
  json.name (link_to(<%= singular_table_name %>.to_s, <%= singular_table_name %>))
<% else -%>
  json.<%= attribute.name %> <%= singular_table_name %>.<%= attribute.name %>
<% end -%>
<% end -%>
  json.created_at pl(<%= singular_table_name %>.created_at, format: :long)
  json.updated_at pl(<%= singular_table_name %>.updated_at, format: :long)
  json.actions render(partial: '<%= plural_table_name %>/actions', locals: {<%= singular_table_name %>: <%= singular_table_name %>}, formats: [:html])
end
