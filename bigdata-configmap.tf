variable "bigdata_map_roles" {
  description = "MapRoles for Config map by EKS cluster"
  type = map(list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  })))
  default = {
    "bigdata-eks-staging" = [
      {
        groups   = ["system:bootstrappers", "system:nodes"]
        rolearn  = "arn:aws:iam::806548670100:role/bigdata-eks-staging-main"
        username = "system:node:{{EC2PrivateDNSName}}"
      },
      {
        groups   = ["system:masters"]
        rolearn  = "arn:aws:iam::806548670100:role/AWSReservedSSO_dev_Power@Bigdata_3527b3c375cd4e9c"
        username = "bigdata_dev_Power@Bigdata"
      },
      {
        groups   = ["system:masters"]
        rolearn  = "arn:aws:iam::806548670100:role/AWSReservedSSO_sre_Admin@Bigdata_3c41847bbe07f86b"
        username = "bigdata_sre_Admin@Bigdata"
      },
      {
        groups   = ["system:masters"]
        rolearn  = "arn:aws:iam::806548670100:role/bigdata-mwaa_execution-role-dev"
        username = "mwaa-environment"
      },
    ],
    "bigdata-eks-production" = [
      {
        groups   = ["system:bootstrappers", "system:nodes"]
        rolearn  = "arn:aws:iam::806548670100:role/bigdata-eks-production-main"
        username = "system:node:{{EC2PrivateDNSName}}"
      },
      {
        groups   = ["system:masters"]
        rolearn  = "arn:aws:iam::806548670100:role/AWSReservedSSO_sre_Admin@Bigdata_3c41847bbe07f86b"
        username = "bigdata_sre_Admin@Bigdata"
      },
      {
        groups   = ["system:masters"]
        rolearn  = "arn:aws:iam::806548670100:role/bigdata-mwaa_execution-role-prod"
        username = "mwaa-environment"
      }
    ]
  }
}
