For all below steps Screenshots are included in Screenshots/ dir.

### 1. Set up SSH access:
My Ubuntu VM with 192.168.100.187 connected via Bridge Adapter (wl0) username=sean  
My CentOS VM with 192.168.100.185 connected via Bridge Adapter (wl0) username=seanconnery  
$ ssh-keygen  
$ ssh-copy-id sean:192.168.100.187  
$ ssh sean:192.168.100.187  

### 2. Wrote inventory file in inventory/hosts:
1) ubuntu group with one ip for my Ubuntu VM  
2) centos group with one ip for my CentOS VM  
3) servers group which includes both other 2 groups as children  
4) <ansible_user=user> <ansible_become_password=pswd> flags are used accordingly to enable root privilege access to execute all tasks.

### 3. Wrote playbook yaml file playbooks/install_nginx.yaml:
Important points:  
	1) __hosts: servers__ - used all servers (centos + ubuntu) as one group to send this playbook tasks.  
	2) __become: true__ - parameter to enable privileged root access to install and start services  
	3) __vars:__ - wrote http_port to listen, server ip and port, and nginx_server_name to curl  
	4) __when: ansible_os_family == ""__ - case check, if RedHat based (centos), then use yum task, else if Debian based (ubuntu), use apt task  
	5) writing config file. __mode: '0644'__ - file permissions for security  
	6) __notify: - restart nginx__ -> handler notifier to restart our service as we changed the config.  
	7) ensure the service is enabled and running  
	8) __handlers:__ ... - to restart the service  
	
### 4. Wrote nginx template config file in srv/nginx.j2 as jinja format:
NGINX conf. listens on port 80 and proxies requests to an upstream server located at {{ app_server_ip }}:{{ app_server_port }}. The server_name directive is set to {{ nginx_server_name }}, which is a variable defined in my playbook (example.com).

### 5. $ ansible-playbook -i inventory/hosts playbook/install_nginx.yaml -> Successfull output

### 6. Checked both of my target servers with following commands:
	$ systemctl status nginx
	$ ls -l /etc/nginx/nginx.conf
	$ cat /etc/nginx/nginx.conf
	$ curl example.com
