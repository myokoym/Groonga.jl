function expr_exec(context, grn_obj)
  ccall((:grn_expr_exec, libgroonga),
        Void,
        (Ptr{Void}, Ptr{Void}, Int),
        context,
        grn_obj,
        0)
end
