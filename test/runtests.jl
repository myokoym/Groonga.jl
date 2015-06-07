using Groonga
using Base.Test

Groonga.init()
context = Groonga.ctx_open()

@test Groonga.default_encoding() == "utf8"

@test_throws ErrorException Groonga.db_create(context, "a/b/c/d/e")
@test_throws ErrorException Groonga.db_open(context, "a/b/c/d/e")

dir = mktempdir()
database = Groonga.db_create(context, "$dir/test.db")
println(Groonga.execute_command(context, "status"))

Groonga.execute_command(context, "table_create --name Site --flags TABLE_HASH_KEY --key_type ShortText")
println(Groonga.execute_command(context, "select --table Site"))

Groonga.execute_command(context, "column_create --table Site --name title --type ShortText")
println(Groonga.execute_command(context, "select --table Site"))

Groonga.execute_command(context, "load --table Site [{\"_key\":\"http://example.org/\",\"title\":\"This is test record 1!\"}, {\"_key\":\"http://example.net/\",\"title\":\"test record 2.\"}]")
println(Groonga.execute_command(context, "select --table Site --query _id:1 --output_columns _key,title,_score"))

Groonga.fin()
