flowchart LR

&nbsp; U\[User Browser] --> LB\[Azure LoadBalancer Service\\nfront-end]

&nbsp; LB --> FE\[front-end Deployment/Pods]



&nbsp; subgraph AKS\[Azure Kubernetes Service (AKS)]

&nbsp;   FE --> C\[carts]

&nbsp;   FE --> O\[orders]

&nbsp;   FE --> CAT\[catalogue]

&nbsp;   FE --> SH\[shipping]

&nbsp;   FE --> USR\[user]

&nbsp;   FE --> PAY\[payment]

&nbsp;   O --> MQ\[rabbitmq]

&nbsp;   C --> CDB\[(carts-db)]

&nbsp;   O --> ODB\[(orders-db)]

&nbsp;   CAT --> CATDB\[(catalogue-db)]

&nbsp;   USR --> UDB\[(user-db)]

&nbsp;   FE --> SDB\[(session-db)]

&nbsp; end



&nbsp; subgraph IaC\[OpenTofu (IaC)]

&nbsp;   IaC --> RG\[Resource Group]

&nbsp;   IaC --> AKS

&nbsp; end



