function ctx_open(flags=0)
  ccall((:grn_ctx_open, libgroonga),
        Ptr{Void}, (Int,), flags)
end

function ctx_db(context)
  ccall((:grn_ctx_db, libgroonga),
        Ptr{Void}, (Ptr{Void},), context)
end

function ctx_get(context, command)
  ccall((:grn_ctx_get, libgroonga),
        Int,
        (Ptr{Void}, Ptr{UInt8}, Int),
        context,
        bytestring(command),
        length(command))
end

function ctx_send(context, command)
  ccall((:grn_ctx_send, libgroonga),
        Int,
        (Ptr{Void}, Ptr{UInt8}, Int, Int),
        context,
        bytestring(command),
        length(command),
        0)
end

function ctx_recv(context)
  if Groonga.ctx_db(context) == C_NULL
    error("Database is not opened.")
  end

  str = Array(Ptr{UInt8})
  str_len = Array(Int)
  flags = Array(Int)
  ccall((:grn_ctx_recv, libgroonga),
        Void,
        (Ptr{Void}, Ptr{Ptr{UInt8}}, Ptr{Int}, Ptr{Int}),
        context,
        str,
        str_len,
        flags)
  bytestring(str[], str_len[])
end
