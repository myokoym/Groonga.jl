function default_encoding()
  grn_encoding = ccall((:grn_get_default_encoding, libgroonga),
                       Ptr{Void}, ())
  encoding = ccall((:grn_encoding_to_string, libgroonga),
                   Ptr{UInt8}, (Ptr{Void},), grn_encoding)
  bytestring(encoding)
end
