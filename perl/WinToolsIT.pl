use strict;
use warnings;
use Term::ANSIColor;


#use open ':std', ':encoding(CP850)';
#binmode STDOUT, ":encoding(CP850)";


my $ascii_art = <<'END_ART';

                             ^
                _______     ^^^
               |xxxxxxx|  _^^^^^_
               |xxxxxxx| | [][]  |
            ______xxxxx| |[][][] |
           |++++++|xxxx| | [][][]|      PaTaRY0T
           |++++++|xxxx| |[][][] |      2006/2025
           |++++++|_________ [][]| 
           |++++++|=|=|=|=|=| [] |                    
           |++++++|=|=|=|=|=|[][]|
___________|++HH++|  _HHHH__|   _________   _________  _________
         _______________   ______________      ______________
__________________  ___________    __________________    ____________

 _______           ________                   __      __  ______    __     
|       \         |        \                 |  \    /  \/      \  |  \    
| #######\ ______  \####### ______   ______  \##\  /  ##  #######\_| ##_   
| ##__/ ##|      \   | ##   |      \ /      \  \##\/  ##| ###\| ##   ## \  
| ##    ## \######\  | ##    \######\  ######\  \##  ## | ####\ ##\######  
| ####### /      ##  | ##   /      ## ##   \##   \####  | ##\##\## | ## __ 
| ##     |  #######  | ##  |  ####### ##         | ##   | ##_\### | ##|  \
| ##      \##    ##  | ##   \##    ## ##         | ##    \##  \###  \##  ##
 \##

END_ART

print $ascii_art;
# You don't need those colors
#print color('yellow');
#print color('reset');


my %programs = (
    "1"  => ["Component Services", "C:\\Windows\\System32\\compmgmt.msc", 1],
    "2"  => ["Computer Management", "C:\\Windows\\System32\\compmgmt.msc", 1],
    "3"  => ["Defragment and Optimize Drives", "C:\\Windows\\System32\\dfrgui.exe", 0],
    "4"  => ["Disk Cleanup", "C:\\Windows\\System32\\cleanmgr.exe", 0],
    "5"  => ["Event Viewer", "C:\\Windows\\System32\\eventvwr.msc", 0],
    "6"  => ["iSCSI Initiator", "C:\\Windows\\System32\\iscsicpl.exe", 0],
    "7"  => ["Local Security Policy", "C:\\Windows\\System32\\secpol.msc", 1],
    "8"  => ["ODBC Data Sources (32-bit)", "C:\\Windows\\System32\\odbcad32.exe", 0],
    "9"  => ["ODBC Data Sources (64-bit)", "C:\\Windows\\SysWOW64\\odbcad32.exe", 0],
    "10" => ["Performance Monitor", "C:\\Windows\\System32\\perfmon.msc", 0],
    "11" => ["Print Management", "C:\\Windows\\System32\\printmanagement.msc", 0],
    "12" => ["Recovery Drive", "C:\\Windows\\System32\\recdisc.exe", 0],
    "13" => ["Registry Editor", "C:\\Windows\\regedit.exe", 1],
    "14" => ["Resource Monitor", "C:\\Windows\\System32\\resmon.exe", 0],
    "15" => ["Services", "C:\\Windows\\System32\\services.msc", 1],
    "16" => ["System Configuration", "C:\\Windows\\System32\\msconfig.exe", 1],
    "17" => ["System Information", "C:\\Windows\\System32\\msinfo32.exe", 0],
    "18" => ["Task Scheduler", "C:\\Windows\\System32\\taskschd.msc", 0],
    "19" => ["Windows Defender Firewall", "C:\\Windows\\System32\\wf.msc", 1],
    "20" => ["Windows Memory Diagnostic", "C:\\Windows\\System32\\mdsched.exe", 0],
);


print "Select a program to open:\n";
for my $key (sort { $a <=> $b } keys %programs) {
    print "$key. $programs{$key}[0]\n";
}

print "Enter The Number: ";
chomp(my $PaTaRY0T = <STDIN>);

if (exists $programs{$PaTaRY0T}) {
    my ($name, $path, $needs_admin) = @{$programs{$PaTaRY0T}};
    my $cmd;

    if ($path =~ /\.msc$/i) {
        $cmd = qq(mmc "$path");
    } else {
        $cmd = qq("$path");
    }

   if ($needs_admin) {
    
    system("start powershell Start-Process $cmd -Verb RunAs");
} else {
    
    system("start $cmd");
}

    print "$name command executed.\n";
} else {
    print "Invalid choice.\n";
}