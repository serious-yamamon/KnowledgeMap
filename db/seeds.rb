# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"
#csvファイルを扱うためのgemを読み込む

CSV.foreach('db/csv/quizdata.csv') do |row|
#foreachは、ファイル（hoge.csv）の各行を引数として、ブロック(do~endまでを範囲とする『引数のかたまり』)を繰り返し実行する
#rowには、読み込まれた行が代入される

Database.create(

  :ques_s => row[0],
  :answer => row[1],
  :q_id => row[2],
  :list_name => row[3],
  :list_id => row[4],
  :fav => row[5],
  :check => row[6],
  :correct => row[7],
  :incorrect => row[8]
)
#usersテーブルの各カラムに、各行のn番目の値を代入している。

end
