from django.test import TestCase

# Create your tests here.


import os


def getip(ip, count):
    count = int(count)
    ip2 = int(ip.split('.')[-2])
    ip1 = int(ip.split('.')[-1])
    ip_before = '%s.%s' % (ip.split('.')[0], ip.split('.')[1])

    for i in range(0, count):
        new_ip1 = ip1 + i
        if 1 <= new_ip1 <= 254:
            wip = '%s.%s.%s' % (ip_before, str(ip2), str(new_ip1))
            strSql = '''INSERT INTO `YwzcWebSys`.`netmget_ipmanage` (`ip_addr`, `net_tags`, `sub_mask`, `gateway`, `use_object`, `remark`) 
                      VALUES ('%s', '%s', '255.255.255.0', '%s', '', '');
                        ''' % (wip,'192.168.171.0','	192.168.171.254' )
            print(strSql)

        else:
            new_ip2 = ip2 + int(new_ip1 / 254)
            new_ip1 = new_ip1 % 254 + 1
            wip = '%s.%s.%s' % (ip_before, str(new_ip2), str(new_ip1))
            strSql = '''INSERT INTO `YwzcWebSys`.`netmget_ipmanage` (`ip_addr`, `net_tags`, `sub_mask`, `gateway`, `use_object`, `remark`) 
                      VALUES ('%s', '%s', '255.255.255.0', '%s', '', '');
                        ''' % (wip,'192.168.171.0','	192.168.171.254' )
            print(strSql)



if __name__ == '__main__':
    getip('192.168.171.0', 255)