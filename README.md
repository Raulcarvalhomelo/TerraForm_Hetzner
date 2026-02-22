# Terraform — Hetzner Cloud (HCloud)

Provisionamento automatizado de servidores na **Hetzner Cloud** utilizando **Terraform**, seguindo práticas profissionais de **Infraestrutura como Código (IaC)**.

---

## 📌 Visão Geral

Este projeto permite criar e gerenciar servidores na Hetzner Cloud de forma declarativa, garantindo:

* Reprodutibilidade da infraestrutura
* Controle de versão
* Execução consistente entre ambientes
* Separação segura entre código e credenciais

---

## 🏗️ Funcionamento

Fluxo básico de execução:

```text
Código Terraform → terraform plan → terraform apply → Infraestrutura provisionada
```

O Terraform utiliza o provider oficial da Hetzner para criação e gerenciamento dos recursos.

---

## ✅ Pré-requisitos

* Conta na Hetzner Cloud
* API Token com permissão de leitura/escrita
* Terraform **>= 1.6**
* PowerShell (exemplos abaixo)
* Git (opcional)

---

## 📁 Estrutura do Projeto

```text
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example   # modelo de variáveis
├── .terraform.lock.hcl        # controle de versão dos providers
└── README.md
```

---

## ⚙️ Configuração de Variáveis

O projeto **não armazena valores sensíveis no repositório**.

As variáveis são declaradas em `variables.tf` e devem receber valores localmente.

### 1️⃣ Criar arquivo local

Copie o arquivo de exemplo:

```powershell
copy terraform.tfvars.example terraform.tfvars
```

---

### 2️⃣ Editar o arquivo `terraform.tfvars`

```hcl
HCLOUD_TOKEN = "seu_token_hcloud"
SERVER_TYPE  = "cx23"
SERVER_NAME  = "meu-servidor"
```

⚠️ Este arquivo contém dados sensíveis e **não deve ser versionado**.

---

## 🔐 Alternativa (Recomendado) — Variáveis de Ambiente

Em ambientes profissionais e CI/CD, utiliza-se variáveis de ambiente.

### PowerShell (Windows)

```powershell
$env:TF_VAR_HCLOUD_TOKEN="seu_token"
$env:TF_VAR_SERVER_TYPE="cx23"
$env:TF_VAR_SERVER_NAME="meu-servidor"
```

O Terraform detecta automaticamente essas variáveis.

---

## 🚀 Instalação e Execução

```powershell
# Inicializar Terraform
terraform init

# Validar arquivos
terraform validate

# Visualizar mudanças
terraform plan

# Aplicar infraestrutura
terraform apply
```

Aplicação sem confirmação:

```powershell
terraform apply -auto-approve
```

---

## 🔄 Ciclo de Uso

1. Alterar arquivos `.tf` ou variáveis
2. Executar:

```powershell
terraform plan
```

3. Aplicar mudanças:

```powershell
terraform apply
```

---

## 💣 Destruir Recursos

```powershell
terraform destroy
```

ou:

```powershell
terraform destroy -auto-approve
```

---

## 🧰 Comandos Úteis

```powershell
terraform fmt -recursive
terraform validate
terraform providers
terraform state list
terraform output
```

---

## 🔒 Segurança e Boas Práticas

* ❌ Nunca versionar tokens ou secrets
* ✅ Utilizar variáveis de ambiente (`TF_VAR_*`)
* ✅ Versionar `.terraform.lock.hcl`
* ✅ Revisar alterações com `terraform plan`
* ✅ Manter arquivos de exemplo (`*.example`)

---

## 📦 Versionamento (Git)

### ✅ Arquivos versionados

```text
*.tf
README.md
terraform.tfvars.example
.terraform.lock.hcl
```

### ❌ Arquivos ignorados

```text
.terraform/
*.tfstate*
terraform.tfvars
```

Exemplo `.gitignore`:

```text
.terraform/
*.tfstate*
terraform.tfvars
```

---

## ☁️ Publicar no GitHub

```bash
git init
git add .
git commit -m "Infra: Terraform Hetzner"
git branch -M main
git remote add origin https://github.com/<usuario>/<repositorio>.git
git push -u origin main
```

---

## 📤 Outputs

Após o provisionamento:

```powershell
terraform output
```

---

## ⚠️ Mensagens Comuns

**Only 'yes' will be accepted**
→ Confirmação padrão do `terraform apply`.

**Enter a value**
→ Variável não definida. Configure via:

* `terraform.tfvars`
* variável ambiente `TF_VAR_*`
* parâmetro `-var`

**No changes. Infrastructure matches configuration**
→ Infraestrutura já sincronizada.

---

## 📚 Práticas DevOps Aplicadas

* Infraestrutura declarativa (IaC)
* Controle de dependências via lockfile
* Separação entre código e configuração
* Execução reproduzível entre ambientes
* Preparado para CI/CD

---

## 📎 Referências e Recursos Úteis

Documentação oficial e materiais auxiliares utilizados neste projeto.

### Hetzner Cloud
- Documentação oficial:
  https://docs.hetzner.com/cloud/
  https://github.com/hetznercloud


- Servidores:
  https://docs.hetzner.com/cloud/servers/

- Locations e Datacenters:
  https://docs.hetzner.com/cloud/general/locations/#what-datacenters-are-there

- Tipos de servidores (Server Types):
  https://docs.hetzner.com/cloud/servers/overview/
  https://docs.hetzner.com/cloud/servers/overview/#server-types
  https://www.hetzner.com/cloud/#pricing

- Provider Terraform Hetzner:
  https://registry.terraform.io/providers/hetznercloud/hcloud/latest

### Terraform

- Documentação oficial:
  https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs

- Boas práticas:
  https://developer.hashicorp.com/terraform/language/style



## 🤝 Contribuição

1. Criar branch
2. Realizar alterações
3. Executar `terraform fmt` e `terraform validate`
4. Abrir Pull Request

---

## 📄 Licença

Uso educacional e experimental. Ajuste conforme necessidade do projeto.
