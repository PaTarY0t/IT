#require 'open3'

#No Need For This open3 <<<<

ascii_art = <<~ART

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
|       \\         |        \\                 |  \\    /  \\/      \\  |  \\    
| ▓▓▓▓▓▓▓\\ ______  \\▓▓▓▓▓▓▓▓ ______   ______  \\▓▓\\  /  ▓▓  ▓▓▓▓▓▓\\_| ▓▓_   
| ▓▓__/ ▓▓|      \\   | ▓▓   |      \\ /      \\  \\▓▓\\/  ▓▓| ▓▓▓\\| ▓▓   ▓▓ \\  
| ▓▓    ▓▓ \\▓▓▓▓▓▓\\  | ▓▓    \\▓▓▓▓▓▓\\  ▓▓▓▓▓▓\\  \\▓▓  ▓▓ | ▓▓▓▓\\ ▓▓\\▓▓▓▓▓▓  
| ▓▓▓▓▓▓▓ /      ▓▓  | ▓▓   /      ▓▓ ▓▓   \\▓▓   \\▓▓▓▓  | ▓▓\\▓▓\\▓▓ | ▓▓ __ 
| ▓▓     |  ▓▓▓▓▓▓▓  | ▓▓  |  ▓▓▓▓▓▓▓ ▓▓         | ▓▓   | ▓▓_\\▓▓▓▓ | ▓▓|  \\
| ▓▓      \\▓▓    ▓▓  | ▓▓   \\▓▓    ▓▓ ▓▓         | ▓▓    \\▓▓  \\▓▓▓  \\▓▓  ▓▓
 \\▓▓
ART

puts "\e[33m#{ascii_art}\e[0m" 

def run_program(path, needs_admin)
  cmd = path.downcase.end_with?('.msc') ? "mmc \"#{path}\"" : "\"#{path}\""
  if needs_admin
    system("powershell Start-Process #{cmd} -Verb RunAs")
  else
    system(cmd)
  end
end

programs = {
  "1" => ["Component Services", "C:\\Windows\\System32\\comexp.msc", true], 
  "2" => ["Computer Management", "C:\\Windows\\System32\\compmgmt.msc", true],
  "3" => ["Defragment and Optimize Drives", "C:\\Windows\\System32\\dfrgui.exe", false],
  "4" => ["Disk Cleanup", "C:\\Windows\\System32\\cleanmgr.exe", false],
  "5" => ["Event Viewer", "C:\\Windows\\System32\\eventvwr.msc", false],
  "6" => ["iSCSI Initiator", "C:\\Windows\\System32\\iscsicpl.exe", false],
  "7" => ["Local Security Policy", "C:\\Windows\\System32\\secpol.msc", true],
  "8" => ["ODBC Data Sources (32-bit)", "C:\\Windows\\System32\\odbcad32.exe", false],
  "9" => ["ODBC Data Sources (64-bit)", "C:\\Windows\\SysWOW64\\odbcad32.exe", false],
  "10" => ["Performance Monitor", "C:\\Windows\\System32\\perfmon.msc", false],
  "11" => ["Print Management", "C:\\Windows\\System32\\printmanagement.msc", false],
  "12" => ["Recovery Drive", "C:\\Windows\\System32\\recdisc.exe", false],
  "13" => ["Registry Editor", "C:\\Windows\\regedit.exe", true],
  "14" => ["Resource Monitor", "C:\\Windows\\System32\\resmon.exe", false],
  "15" => ["Services", "C:\\Windows\\System32\\services.msc", true],
  "16" => ["System Configuration", "C:\\Windows\\System32\\msconfig.exe", true],
  "17" => ["System Information", "C:\\Windows\\System32\\msinfo32.exe", false],
  "18" => ["Task Scheduler", "C:\\Windows\\System32\\taskschd.msc", false],
  "19" => ["Windows Defender Firewall", "C:\\Windows\\System32\\wf.msc", true],
  "20" => ["Windows Memory Diagnostic", "C:\\Windows\\System32\\mdsched.exe", false]
}


puts "\e[91mSelect a program to open:\e[0m"

programs.each do |key, (name, _, _)|
  puts "\e[33m#{key}.\e[0m \e[36m#{name}\e[0m" 
end


print "\e[90mEnter The Number: \e[0m"
PaTaRY0T = gets.chomp
if programs.key?(PaTaRY0T)
  program_name, program_path, needs_admin = programs[PaTaRY0T]
  begin
    run_program(program_path, needs_admin)
    puts "#{program_name} command executed."
  rescue => e
    puts "Error opening #{program_name}: #{e}"
  end
else
  puts "Invalid choice."
end
