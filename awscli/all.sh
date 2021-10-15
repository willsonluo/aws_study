aws ecr-public get-login-password \
--region us-east-1 \
| docker login --username AWS --password-stdin \
public.ecr.aws/j4c9y5v8

docker pull public.ecr.aws/j4c9y5v8/nginx-public:v1