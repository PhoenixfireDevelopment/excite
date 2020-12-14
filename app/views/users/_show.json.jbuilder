json.cache! [user] do
  json.last_name link_to(user.last_name, main_app.user_path(user))
  json.first_name user.first_name
  json.email user.email
  json.sign_in_count user.sign_in_count
  json.created_at pl(user.created_at, format: :long)
  json.updated_at pl(user.updated_at, format: :long)
  json.actions render(partial: 'users/actions', locals: { user: user }, formats: [:html])
end
