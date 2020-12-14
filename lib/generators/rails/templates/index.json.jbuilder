json.sEcho params[:sEcho].to_i
json.iTotalRecords <%= class_name %>.count
json.iTotalDisplayRecords @<%= plural_table_name %>.total_count
json.set! :aaData do
  json.array! @<%= plural_table_name %>, partial: '<%= singular_table_name %>', as: :<%= singular_table_name %>
end
