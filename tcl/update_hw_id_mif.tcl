

set proj_dir [get_project_directory]

source "$proj_dir/version/hw_version.tcl"

# Get current date/time
set now         [clock seconds]
set now_day     [string trimleft [clock format $now -format {%d}] "0"]
set now_month   [string trimleft [clock format $now -format {%m}] "0"]
set now_year    [string trimleft [clock format $now -format {%Y}] "0"]
set now_hour    [string trimleft [clock format $now -format {%H}] "0"]
set now_minutes [string trimleft [clock format $now -format {%M}] "0"]
set now_seconds [string trimleft [clock format $now -format {%S}] "0"]

set output_bytes [list]

# Write version information
lappend output_bytes [format "%02x" $hw_version_major]
lappend output_bytes [format "%02x" $hw_version_minor]
lappend output_bytes [format "%02x" $hw_version_patch]
lappend output_bytes [format "%02x" [expr $now_year / 256] ]
lappend output_bytes [format "%02x" [expr $now_year % 256] ]
lappend output_bytes [format "%02x" $now_month ]
lappend output_bytes [format "%02x" $now_day ]
lappend output_bytes [format "%02x" $now_hour ]
lappend output_bytes [format "%02x" $now_minutes ]
lappend output_bytes [format "%02x" $now_seconds ]

set output_file "$proj_dir/mem_init/hw_id.mif"

# Open the file for writing
set fh [open $output_file "w"]

puts $fh "WIDTH=8;"
puts $fh "DEPTH=1024;"
puts $fh "ADDRESS_RADIX=UNS;"
puts $fh "DATA_RADIX=HEX;"
puts $fh ""
puts $fh "CONTENT BEGIN"

set output_count 0

foreach byte $output_bytes {
    puts $fh "\t$output_count\t:\t$byte;"
    set output_count [expr $output_count + 1]
}

puts $fh "\t[$output_count..1023]\t:\t0;"
puts $fh "END;"

close $fh




