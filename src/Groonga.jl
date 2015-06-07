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

end # module
