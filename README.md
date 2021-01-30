# lab-GKE

Esse laboratório tem como objetivo de fornecer uma ambiente para praticar a ferramenta Kubernetes usando o [GKE](https://cloud.google.com/kubernetes-engine?hl=pt-br)

Para inicializar o laboratório é necessário criar uma conta de serviço com os seguintes papeis

```text
Administrador de compute
Administrador de cluster do Kubernetes Engine
Usuário da conta de serviço
```

e habiliar as seguintes APIS

```text
https://console.developers.google.com/apis/api/container.googleapis.com/
https://console.developers.google.com/apis/api/compute.googleapis.com/
```

O Terraform irá instanciar cluster básico com 3 nodes cada um em uma região diferente. Para passar as credenciais basta popular a variável de ambiente **GOOGLE_APPLICATION_CREDENTIALS** com o caminho da keyfile.json.

```shell
export GOOGLE_APPLICATION_CREDENTIALS=/path/keyfile.json
```

## Inicializar o laboratório

Clonar o projeto

```shell
git clone https://github.com/DiegoBulhoes/lab-kubernetes
```

Renomeie o arquivo [terraform.tfvars.exemple](terraform.tfvars.exemple) para terraform.tfvars (nesse arquivo irá conter todas as variáveis para criar as instâncias no GCP).

Para inicializar os modulos, execute o seguinte comando:

```shell
terraform init
```

Para verificar se os arquivos possui algum erro de sintaxe ou de configuração das instâncias execute o seguinte comando:

```shell
terraform plan
```

Após a verificação do _plan_ execulte o seuinte comando para realizar o processo de instanciação

```shell
terraform apply
```

Se tudo estiver ok a saída será similar a esta:

```text
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

kubernetes_cluster_name = project-gke
region = us-central1
```
