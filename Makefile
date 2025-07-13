EC2_DIR := .ec2
S3_DIR := .s3

.PHONY: all clean

all: apply-ec2 apply-s3


init-ec2:
	@mkdir -p $(EC2_DIR)
	@cp ec2.tf $(EC2_DIR)/
	@cp -r modules/ $(EC2_DIR)/      # Copy modules folder
	@cd $(EC2_DIR) && terraform init

plan-ec2: init-ec2
	@cd $(EC2_DIR) && \
	terraform plan -lock=false -input=false | tee tf_plan.txt; \
	EXIT=$${PIPESTATUS[0]}; \
	exit $$EXIT


apply-ec2: init-ec2
	@cd $(EC2_DIR) && terraform apply -auto-approve

destroy-ec2:
	@cd $(EC2_DIR) && terraform destroy -auto-approve

init-s3:
	@mkdir -p $(S3_DIR)
	@cp s3.tf $(S3_DIR)/
	@cp -r modules/ $(S3_DIR)/
	@cd $(S3_DIR) && terraform init


plan-s3: init-s3
	@cd $(S3_DIR) && \
	terraform plan -lock=false -input=false | tee tf_plan.txt; \
	EXIT=$${PIPESTATUS[0]}; \
	exit $$EXIT

apply-s3: init-s3
	@cd $(S3_DIR) && terraform apply -auto-approve

destroy-s3:
	@cd $(S3_DIR) && terraform destroy -auto-approve

clean:
	rm -rf $(EC2_DIR) $(S3_DIR)

