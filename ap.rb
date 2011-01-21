require 'net/telnet'
require 'ping'

 $i = 2;
 $num = 254;

while $i < $num  do
   $host = '172.25.74.' + $i.to_s
   $e = Ping.pingecho($host, 1)
#  puts 'Ping 172.25.74.' + $i.to_s + ' result ' + $e.to_s
   if
     $e == true
     connect = Net::Telnet::new("Host" => $host,
                             "Timeout" => 10,
                             "Prompt" => /[$%#>] \z/n)
       # connect.login("root", "enfortit") { |c| print c }
       # connect.cmd("exit") { |c| print c }
     connect.login("root", "enfortit")  { |c| print c }
     connect.cmd("exit")  { |c| print c }
     connect.close

   end
#  puts $e
   $i += 1
 end








