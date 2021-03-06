require "import_csv"

# texts, movies テーブルを再生成（関連付くテーブルを含む）
%w[texts movies].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
end

email = "test@example.com"
password = "password"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: email) do |user|
  user.password = password
  puts "ユーザーの初期データインポートに成功しました。"
end

ImportCsv.text_data
ImportCsv.movie_data
AdminUser.find_or_create_by!(email: "admin@example.com") do |adminuser|
  adminuser.password = password
  adminuser.password_confirmation = password
  puts "管理ユーザーの初期データインポートに成功しました。"
end
