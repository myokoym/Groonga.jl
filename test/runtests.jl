using Groonga
using Base.Test

Groonga.init()
context = Groonga.ctx_open()

@test Groonga.default_encoding() == "utf8"

@test_throws ErrorException Groonga.db_create(context, "a/b/c/d/e")

dir = mktempdir()
database = Groonga.db_create(context, "$dir/test.db")
println(Groonga.execute_command(context, "status"))

Groonga.fin()
