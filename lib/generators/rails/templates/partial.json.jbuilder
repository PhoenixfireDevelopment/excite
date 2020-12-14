json.cache! [<%= singular_table_name %>] do
  json.name (link_to(<%= singular_table_name %>.to_s, <%= singular_table_name %>))
<% for attribute in attributes -%>
  json.<%= attribute.name %> <%= singular_table_name %>.<%= attribute.name %>
<% end -%>
  json.actions render(partial: 'actions', locals: {<%= singular_table_name %>: <%= singular_table_name %>}, formats: [:html])
end
