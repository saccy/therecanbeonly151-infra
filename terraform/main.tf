# NOTE: to destroy only one module: terraform destroy -target=module.app.digitalocean_app.hypertask-app -auto-approve

module "app" {
  source = "./app"
  # domain = var.domain
  # build_number = var.build_number
}
