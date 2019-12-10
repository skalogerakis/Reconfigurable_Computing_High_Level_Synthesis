

#Return the target type
proc getTraceTarget {} {
    return "APU"
}

proc exportTraces {path_to_sds_trace} {
    #setup the output file
    set outfile [file join $path_to_sds_trace channel_0]
    set fp [open $outfile w]
    #configure for binary
    fconfigure $fp -translation binary

    #get path to previous directory (_sds)
    set path [file dirname $path_to_sds_trace]
    #get path to swstub folder
    set swstub_path [file join $path swstubs]
    #get path to the elf for the project
    set elf_path [glob -directory $swstub_path *.elf]

    #get address of trace count variable
    set count_addr [string range [exec mb-nm $elf_path | grep sds_trace_count] 0 7]
    #get address of trace pointer variable
    set traces_addr [string range [exec mb-nm $elf_path | grep sds_trace_array] 0 7]
    #get address of trace data array first value
    set traces [lindex [mrd 0x$traces_addr] 1]
    #get trace count value, convert to decimal
    set count [expr 0x[lindex [mrd 0x$count_addr] 1]]
    
    #convert trace addr into decimal
    set trace_dec [expr 0x$traces]
    
    #trace counter
    set cnt 0
    
    #readout traces & format
    while {$cnt < $count} {
	set cnt_16 [expr $cnt * 16]
	
	#calculate address (4 32-bit words (16 bytes) per trace entry)
	set addr [expr $trace_dec + $cnt_16]

	#extrace the data read
	set time_lower [expr 0x[lindex [mrd $addr] 1]]
	set time_upper [expr 0x[lindex [mrd [expr $addr + 4]] 1]]
	set type [expr 0x[lindex [mrd [expr $addr + 8]] 1]]
	set ID [expr 0x[lindex [mrd [expr $addr + 12]] 1]]

	#lookup $ID to get mapping info
	set name "dbg_name_$ID"
	#null terminate the string
	set name "$name\0"
	
	set file "dbg_file"
	#null terminate the string
	set file "$file\0"
	
	set line 9
	set column 42
	
		    
	#write type
	puts -nonewline $fp [binary format c [expr [expr $type & 0xFF000000] >> 24]]
	puts -nonewline $fp [binary format c [expr [expr $type & 0xFF0000] >> 16]]
	puts -nonewline $fp [binary format c [expr [expr $type & 0xFF00] >> 8]]
	puts -nonewline $fp [binary format c [expr $type & 0xFF]]
	#write upper 32 bits of timestamp
	puts -nonewline $fp [binary format c [expr [expr $time_upper & 0xFF000000] >> 24]]
	puts -nonewline $fp [binary format c [expr [expr $time_upper & 0xFF0000] >> 16]]
	puts -nonewline $fp [binary format c [expr [expr $time_upper & 0xFF00] >> 8]]
	puts -nonewline $fp [binary format c [expr $time_upper & 0xFF]]
	#write lower 32 bits of timestamp
	puts -nonewline $fp [binary format c [expr [expr $time_lower & 0xFF000000] >> 24]]
	puts -nonewline $fp [binary format c [expr [expr $time_lower & 0xFF0000] >> 16]]
	puts -nonewline $fp [binary format c [expr [expr $time_lower & 0xFF00] >> 8]]
	puts -nonewline $fp [binary format c [expr $time_lower & 0xFF]]
	#write name
	puts -nonewline $fp $name
	#write file
	puts -nonewline $fp $file
	#write line
	puts -nonewline $fp [binary format c [expr [expr $line & 0xFF000000] >> 24]]
	puts -nonewline $fp [binary format c [expr [expr $line & 0xFF0000] >> 16]]
	puts -nonewline $fp [binary format c [expr [expr $line & 0xFF00] >> 8]]
	puts -nonewline $fp [binary format c [expr $line & 0xFF]]
	#write column
	puts -nonewline $fp [binary format c [expr [expr $column & 0xFF000000] >> 24]]
	puts -nonewline $fp [binary format c [expr [expr $column & 0xFF0000] >> 16]]
	puts -nonewline $fp [binary format c [expr [expr $column & 0xFF00] >> 8]]
	puts -nonewline $fp [binary format c [expr $column & 0xFF]]
		
	#increment counter
	set cnt [expr $cnt + 1]
    }

    #close the output file
    close $fp

    #make the archive.zip file
    set time_str [regsub -all {[][ :]} [clock format [clock seconds]] _]
    set trace_dir [file join $path_to_sds_trace "archive_${time_str}"]
    file mkdir $trace_dir
    #move the channel and metadata files into subdir
    file rename -force $outfile [file join $trace_dir channel_0]
    file copy -force [file join $path_to_sds_trace metadata] [file join $trace_dir metadata]
    #we ship zip so it should exist in every installation
    set cur_path [pwd]
    cd $path_to_sds_trace
    exec zip -r "archive_${time_str}.zip" "archive_${time_str}"
    #delete the folder we made (and zipped)
    file delete -force $trace_dir
    cd $cur_path
}