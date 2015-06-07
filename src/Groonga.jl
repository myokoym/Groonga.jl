module Groonga

using Compat

include("../deps/deps.jl")

@assert isdefined(:libgroonga)

function init()
  ccall((:grn_init, libgroonga),
        Void, ())
end

function fin()
  ccall((:grn_fin, libgroonga),
        Void, ())
end

include("context.jl")
include("database.jl")
include("encoding.jl")
include("expression.jl")

function execute_command(context, command)
  Groonga.ctx_send(context, command)
  Groonga.ctx_recv(context)
end

end # module
