infra:
	terraform init
	terraform apply -auto-approve

ansible:
# 	ansible-playbook -i $(tool_name)-internal.vishnureddy.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=$(tool_name) -e vault_token=$(vault_token) main.yml

	ansible-playbook -i 172.31.14.180, -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=vault -e vault_token=172.31.14.180 main.yml



