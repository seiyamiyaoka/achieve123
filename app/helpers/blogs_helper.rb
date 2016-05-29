module BlogsHelper
  def currect_user(blog)
  if current_user.id == blog.user_id
link_to '詳細', blog
link_to '削除', blog, method: :delete, data: { confirm: '冒険の書を削除しますか?' }
else
end
end
end