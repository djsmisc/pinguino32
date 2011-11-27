print "; Definitions Imported from *.[ch] files\r\n";
while( <> ){
    if ( /#define\s+(\w+)\s+((0x)?[0-9a-fA-F]+)(\s|$)/ ){
        my ( $def, $val ) = ( $1, $2 );
        $val = oct($val) if ($val=~/^0/ );
        printf "$def equ 0x%x \r\n", $val; 
    }
}

