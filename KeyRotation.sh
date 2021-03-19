## KeyGen and Add to Secrets Manager
ssh-keygen -t rsa -N "" -q -f keyname

aws secretsmanager create-secret --name keyname.pub \
    --description "Public key for keyname" \
    --secret-string file://keyname.pub
    
aws secretsmanager create-secret --name  \
    --description "Private key for keyname" \
    --secret-string file://keyname

## In Sessions Manager job run on targets, pull down pub key and add to authorized_keys 
aws secretsmanager get-secret-value --secret-id keyname.pub --query SecretString --output text > /home/ec2-user/.ssh/authorized_keys
