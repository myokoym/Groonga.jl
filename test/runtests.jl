using Groonga
using Base.Test

Groonga.init()

@test Groonga.default_encoding() == "utf8"

Groonga.fin()
