output "id" {
  value       = "${aws_vpn_connection.conn.id}"
}
output "tun1_right_ip" {
  value       = "${aws_vpn_connection.conn.tunnel1_address}"
}
output "tun1_key" {
  value       = "${aws_vpn_connection.conn.tunnel1_preshared_key}"
}                                                                                                                                                                                                                  
output "tun2_right_ip" {                                                                                                                                                                                           
  value       = "${aws_vpn_connection.conn.tunnel2_address}"                                                                                                                                                       
}                                                                                                                                                                                                                  
output "tun2_key" {                                                                                                                                                                                                
  value       = "${aws_vpn_connection.conn.tunnel2_preshared_key}"                                                                                                                                                 
}                                                                                                                                                                                                                  
                                                                                                                                                                                                                   
output "tun1_cgw_ip" {                                                                                                                                                                                             
  value       = "${aws_vpn_connection.conn.tunnel1_cgw_inside_address}"                                                                                                                                            
}                                                                                                                                                                                                                  
output "tun1_vgw_ip" {                                                                                                                                                                                             
  value       = "${aws_vpn_connection.conn.tunnel1_vgw_inside_address}"                                                                                                                                            
}                                                                                                                                                                                                                  
output "tun2_cgw_ip" {                                                                                                                                                                                             
  value       = "${aws_vpn_connection.conn.tunnel2_cgw_inside_address}"                                                                                                                                            
}                                                                                                                                                                                                                  
output "tun2_vgw_ip" {                                                                                                                                                                                             
  value       = "${aws_vpn_connection.conn.tunnel2_vgw_inside_address}"                                                                                                                                            
}
output "tun1_right_asn" {
  value       = "${aws_vpn_connection.conn.tunnel1_bgp_asn}"
}
output "tun2_right_asn" {
  value       = "${aws_vpn_connection.conn.tunnel2_bgp_asn}"
}

output "config" {
  value       = "${aws_vpn_connection.conn.customer_gateway_configuration}"
}

