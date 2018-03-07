#!/bin/bash
#******************************************************************************
#    AWS VPC Creation Script
#******************************************************************************
#
# SYNOPSIS
#    Automates the creation of a custom AWS VPC,
#	 The VPC spread out over several availability zones and consists of 2 public and a 2 private subnet, and a NAT gateway.
#
# DESCRIPTION
#    This shell script leverages the AWS Command Line Interface (AWS CLI) to
#    automatically create a custom VPC.  The script assumes the AWS CLI is
#    installed and configured with the necessary security credentials.
#==============================================================================
#   VARIABLES DEFINTION
#
#==============================================================================
AWS_REGION="us-west-2"
VPC_NAME="TOR-VPC"
VPC_CIDR="10.10.0.0/16"
TOR_SUBNET_PUBLIC_CIDR1="10.10.1.0/24"
TOR_SUBNET_PUBLIC_CIDR2="10.10.2.0/24"

TOR_SUBNET_PUBLIC_AZ1="us-west-2a"
TOR_SUBNET_PUBLIC_AZ2="us-west-2b"

TOR_SUBNET_PUBLIC_NAME1="TOR-10.10.1.0 - us-west-2a-public1"
TOR_SUBNET_PUBLIC_NAME2="TOR-10.10.2.0 - us-west-2b-public2"

TOR_SUBNET_PRIVATE_CIDR1="10.10.3.0/24"
TOR_SUBNET_PRIVATE_CIDR2="10.10.4.0/24"

TOR_SUBNET_PRIVATE_AZ1="us-west-2a"
TOR_SUBNET_PRIVATE_AZ2="us-west-2b"

TOR_SUBNET_PRIVATE_NAME1="TOR-10.10.3.0 - us-west-2a-private1"
TOR_SUBNET_PRIVATE_NAME2="TOR-10.10.4.0 - us-west-2b-private2"

TOR_IGW_NAME="TOR-IGW"
TOR_ROUTE_TABLE_NAME="TOR-EXTERNAL_RT"
VPC_ID="vpc-9cfd9ae5"
SUBNET_PUBLIC_ID="subnet-a4499edd"
SUBNET_PRIVATE_ID="subnet-69f90822"
IGW_ID="igw-df78fbb9"
ROUTE_TABLE_ID="rtb-2a811452"
#CHECK_FREQUENCY=5
#
#==============================================================================
#   MAIN CODE SECTION
#==============================================================================
#
#------------Create VPC---------------------------------
#echo "Creating VPC in preferred region..."
#VPC_ID=$(aws ec2 create-vpc \
#--cidr-block $VPC_CIDR \
#--region $AWS_REGION \
#--query 'Vpc.{Vpc:VpcId}' \
#--output text)
#echo "New vpc with id" 
#echo "$VPC_ID" 
#echo "created in $AWS_REGION." 
#
#----------------Add Name tag to VPC-------------------------------------------
#echo "Adding Name tag to VPC..."
#
#aws ec2 create-tags --resources $VPC_ID --tags "Key=Name,Value=$VPC_NAME" --region $AWS_REGION
#echo "VPC ID '$VPC_ID'"
#echo "name is '$VPC_NAME'."
#
# -----------------Create Public Subnet-------------------------------------------------
#echo "Creating Public Subnet..."
#
#SUBNET_PUBLIC_ID=$(aws ec2 create-subnet \
# --vpc-id $VPC_ID \
# --cidr-block $TOR_SUBNET_PUBLIC_CIDR \
#--availability-zone $TOR_SUBNET_PUBLIC_AZ \
#--region $AWS_REGION \
# --query 'Subnet.{Subnet:SubnetId}' \
#--output text)
#echo "Subnet ID "
#echo "$SUBNET_PUBLIC_ID"
#echo "CREATED in '$TOR_SUBNET_PUBLIC_AZ'" \
# "Availability Zone."
#
# ------------------Add Name tag to Public Subnet----------------------------------------------
#echo "Adding Name tag to Public Subnet..."
#
#aws ec2 create-tags \
#  --resources $SUBNET_PUBLIC_ID \
#  --tags "Key=Name,Value=$TOR_SUBNET_PUBLIC_NAME" \
#  --region $AWS_REGION
#echo "Subnet ID '$SUBNET_PUBLIC_ID' NAMED as" \
#  "'$TOR_SUBNET_PUBLIC_NAME'."
#
# -----------------Create Private Subnet---------------------------------------------------------------
#echo "Creating Private Subnet..."
#SUBNET_PRIVATE_ID=$(aws ec2 create-subnet \
#  --vpc-id $VPC_ID \
#  --cidr-block $TOR_SUBNET_PRIVATE_CIDR \
#  --availability-zone $TOR_SUBNET_PRIVATE_AZ \
#  --query 'Subnet.{Subnet:SubnetId}' \
#  --region $AWS_REGION \
#  --output text) 
#echo "Subnet ID "
#echo "$SUBNET_PRIVATE_ID" 
#echo "CREATED in '$TOR_SUBNET_PRIVATE_AZ'" \
#"Availability Zone."
#
#-----------------Add Name tag to Private Subnet-------------------------------------------------------------
#echo "Adding Name tag to Private Subnet..."
#aws ec2 create-tags \
#  --resources $SUBNET_PRIVATE_ID \
#  --tags "Key=Name,Value=$TOR_SUBNET_PRIVATE_NAME" \
#  --region $AWS_REGION
#echo "Subnet ID '$SUBNET_PRIVATE_ID' NAMED as" \
# "'$TOR_SUBNET_PRIVATE_NAME'."
# 
#-----------------Create Internet gateway----------------------------------------------------------------
#echo "Creating Internet Gateway..."
#IGW_ID=$(aws ec2 create-internet-gateway \
#  --query 'InternetGateway.{InternetGateway:InternetGatewayId}' \
#  --output text \
# --region $AWS_REGION)
#echo "Internet Gateway ID"
#echo "$IGW_ID" 
#echo "CREATED."
#
#-----------------Add Name tag to Internet gateway-------------------------------------------------------------
#echo "Adding Name tag to Internet gateway..."
#aws ec2 create-tags \
#  --resources $IGW_ID \
#  --tags "Key=Name,Value=$TOR_IGW_NAME" \
# --region $AWS_REGION
#echo "Defult Gateway '$IGW_ID' NAMED as" \
# "'$TOR_IGW_NAME'."
#
#-----------------Attach Internet gateway to VPC------------------------------------
#echo "Attaching Internet Gateway to VPC"
#aws ec2 attach-internet-gateway \
#  --vpc-id $VPC_ID \
#  --internet-gateway-id $IGW_ID \
#  --region $AWS_REGION
#echo "Internet Gateway ID '$IGW_ID' ATTACHED to VPC ID '$VPC_ID'."
#
#------------------Create Route Table-------------------------------------------------------------
#echo "Creating Route Table..."
#ROUTE_TABLE_ID=$(aws ec2 create-route-table \
#  --vpc-id $VPC_ID \
# --query 'RouteTable.{RouteTable:RouteTableId}' \
#  --output text \
#  --region $AWS_REGION)
#echo "Route Table ID"
#echo  "$ROUTE_TABLE_ID"
#echo  "CREATED."
#
#-----------------Add Name tag to Route table-------------------------------------------------------------
#echo "Adding Name tag to Route Table..."
#aws ec2 create-tags \
# --resources $ROUTE_TABLE_ID \
#  --tags "Key=Name,Value=$TOR_ROUTE_TABLE_NAME" \
# --region $AWS_REGION
#echo "Public Route Table'$ROUTE_TABLE_ID' NAMED as" \
# "'$TOR_ROUTE_TABLE_NAME'."
#
#----------------Create route to Internet Gateway-----------------------------------------------------
#echo "Creating route to Internet Gateway..."
#RESULT=$(aws ec2 create-route \
#  --route-table-id $ROUTE_TABLE_ID \
#  --destination-cidr-block 0.0.0.0/0 \
#  --gateway-id $IGW_ID \
#  --region $AWS_REGION)
#echo "  Route to '0.0.0.0/0' via Internet Gateway ID '$IGW_ID' ADDED to" \
# "Route Table ID '$ROUTE_TABLE_ID'."
#
#--------------------- Associate Public Subnet 1 with Route Table--------------------------------------------------------
#echo "Associating Public Subnet with Route Table..."
#RESULT=$(aws ec2 associate-route-table  \
#  --subnet-id $SUBNET_PUBLIC_ID \
#  --route-table-id $ROUTE_TABLE_ID \
#  --region $AWS_REGION)
#echo "  Public Subnet ID '$SUBNET_PUBLIC_ID' ASSOCIATED with Route Table ID" \
#  "'$ROUTE_TABLE_ID'."
#
#--------------------- Associate Public Subnet 2 with Route Table--------------------------------------------------------
#echo "Associating Public Subnet with Route Table..."
#RESULT=$(aws ec2 associate-route-table  \
#  --subnet-id $SUBNET_PUBLIC_ID \
#  --route-table-id $ROUTE_TABLE_ID \
#  --region $AWS_REGION)
#echo "  Public Subnet ID '$SUBNET_PUBLIC_ID' ASSOCIATED with Route Table ID" \
#  "'$ROUTE_TABLE_ID'."
#
#--------------------------Enable Auto-assign Public IP on Public Subnet----------------------------------------
#echo "Enabling Auto-assign Public IP on TOR-Public Subnet..."
aws ec2 modify-subnet-attribute \
  --subnet-id $SUBNET_PUBLIC_ID \
  --map-public-ip-on-launch \
  --region $AWS_REGION
echo "  'Auto-assign Public IP' ENABLED on TOR Public Subnet ID" \
  "'$SUBNET_PUBLIC_ID'."

-------------------------------------
A  
create public security group  "TOR-public-sg" on our VPC
Edit inbound rules on this security group (add HTTP(80) and HTTPS(443) with ISG on 0.0.0.0

creae private security group "TOR-private-sg" on our VPC
Edit inbound rules on this security group (add SSH(80) and MSSQL(3306) from source sg-6d775312  (public sg)

---------------------
#eb create
AWS code deploy
