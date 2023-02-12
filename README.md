# infrastructure_engineering_home_exercice

For developing the required infrastructure steps i want to take is to:

1. create a VPC in which i want to creeate my infrastructure in.

2. create a private and public. One will have the ec2 instances and the other will have a nat gateway.

3. create an internet gateway to connect to the internet. 

4. create a nat gateway to allow the instances in the private subnet to connect to internet

5. create a route table that route internet connections through the internet gateway

6. create a route table that route traffic for private ec2 instance throught the nat gateway.

7. create a security group that allow incoming and outgiong http request to the network 

8. create the ec2 instances inside the private subnet.

Both the private and public will be created in the same availability zone. After numerous tries and tests of load balancers, i decided to use an elastic load balancer in the public subnet

9. create the elastic load balancer with the rules and the health check to be performed on the ec2 instances.

the dev_dir is a directory where i a developing the infrstructure.
