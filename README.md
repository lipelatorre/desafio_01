
## Pré-requisitos de execução
- Ter o Terraform instalado:https://developer.hashicorp.com/terraform/downloads
- Ter configurado a AWS CLI no ambiente 


## Como executar

# 1 - Inicie o Terraform
terraform init

# 2 - Validação do código
terraform validate

# 3 - Formular a execução -> Inserir variáveis (sem criar ainda)
terraform plan -var="ssh_ip_range=SEU_IP/32" -var="aws_region=us-east-1"

# 4 - Criar a infraestrutura
terraform apply -auto-approve -var="ssh_ip_range=SEU_IP/32" -var="aws_region=us-east-1"

# 5 - Ver IP público
terraform output


# Limpando o lab

terraform destroy -auto-approve -var="ssh_ip_range=SEU_IP/32" -var="aws_region=us-east-1"


## Estrutura do projeto

desafio-terraform/
├── main.tf # Código principal chamando módulos
├── variables.tf # Variáveis de entrada
├── outputs.tf # Saídas do projeto
├── modules/ # Definição de módulos
│ ├── ec2/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── security_group/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf

## Descrição Desafio_01 - SRE

Este projeto lança uma t2.micro na AWS, utilizando Terraform com os seguintes requisitos:

- Instância Linux na AWS
- Segurança:
  - Porta 80 e 443 abertas para todos
  - Porta 22 liberada apenas para um range de IP informado
- Parametrização:
  - `ssh_ip_range`: Range de IP que pode acessar via SSH
  - `aws_region`: Região da AWS onde a instância será criada
- Saída: IP público da instância
- Extra: Instalação automática do Docker e execução de um container NGINX
