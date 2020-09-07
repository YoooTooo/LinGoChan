crumb :root do
  link "ホーム", root_path
end

crumb :user do |user|
  link "ユーザー一覧", "/users"
  parent :root
end

crumb :show do |user|
  link user.name, user_path(user)
  parent :user
end

crumb :edit do |user|
  link "編集", edit_user_path(user)
  parent :show, user
end

crumb :subject_post do
  link "お題一覧", subject_posts_path
  parent :root
end

crumb :subject_post_show do |subject_post|
  link "ひとことの投稿", subject_post_path(subject_post)
  parent :subject_post
end

crumb :reply_post do
  link "ひとこと一覧", reply_posts_path
  parent :subject_post
end

crumb :reply_post_show do |reply_post|
  link "フィードバックの投稿", reply_post_path(reply_post)
  parent :subject_post_show, reply_post.subject_post
end

crumb :feedback_post do
  link "投稿一覧", feedback_posts_path
  parent :reply_post
end

crumb :feedback_post_show do |feedback_post|
  link "フィードバック", feedback_post_path(feedback_post)
  parent :reply_post_show, feedback_post.reply_post
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
