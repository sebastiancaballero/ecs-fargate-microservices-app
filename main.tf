module "network" {
  source = "./modules/network"
}

module "iam" {
  source = "./modules/iam"
}

module "alb" {
  source  = "./modules/alb"
  vpc_id  = module.network.vpc_id
  subnets = module.network.public_subnets
}

module "ecs" {
  source                    = "./modules/ecs"
  vpc_id                    = module.network.vpc_id
  subnets                   = module.network.public_subnets
  frontend_target_group_arn = module.alb.frontend_target_group_arn
  backend_target_group_arn  = module.alb.backend_target_group_arn
  execution_role_arn        = module.iam.execution_role_arn
  alb_sg_id                 = module.alb.alb_sg_id

  depends_on = [module.alb]
}