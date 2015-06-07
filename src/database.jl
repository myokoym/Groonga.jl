function db_open(context, path)
  ccall((:grn_db_open, libgroonga),
        Ptr{Void}, (Ptr{Void}, Ptr{UInt8},), context, path)
end
