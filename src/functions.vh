
`ifndef __FUNCTIONS_VH__
`define __FUNCTIONS_VH__ 1

    function integer clog2b;
        input integer value;
        integer i;
        begin
            for(i = 0; value > 0; i = i + 1)
                value = value >> 1;
            clog2b = i;
        end
    endfunction

`endif

