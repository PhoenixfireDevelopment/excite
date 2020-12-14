json.sEcho params[:sEcho].to_i
json.iTotalRecords @users.count
json.iTotalDisplayRecords @users.count
json.set! :aaData do
  json.array! @users, partial: 'show', as: :user
end
