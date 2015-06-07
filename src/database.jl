function db_create(context, path)
  db = ccall((:grn_db_create, libgroonga),
             Ptr{Void}, (Ptr{Void}, Ptr{UInt8},), context, path)
  if db == C_NULL
    error("Database open failed: $path")
  end
  db
end

function db_open(context, path)
  db = ccall((:grn_db_open, libgroonga),
        Ptr{Void}, (Ptr{Void}, Ptr{UInt8},), context, path)
  if db == C_NULL
    error("Database open failed: $path")
  end
  db
end
