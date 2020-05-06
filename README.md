# eks-practice

## work in progress

```bash
terraform init
terraform apply

# Error: the server could not find the requested resource (post configmaps)

  on .terraform/modules/eks/terraform-aws-eks-11.1.0/aws_auth.tf line 62, in resource "kubernetes_config_map" "aws_auth":
    62: resource "kubernetes_config_map" "aws_auth" {

aws eks update-kubeconfig --name <EKS_CLUSTER_NAME> --kubeconfig ./kubeconfig-eks.yaml

terraform apply
```

