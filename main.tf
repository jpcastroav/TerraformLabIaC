terraform {
    required_providers {
        github = {
            source = "integrations/github"
            version = "~> 6.0"
        }
    }
}

provider "github" {}

resource "github_repository" "terraform_infra_arch_and_tic_gov" {
    name = "terraform_infra_arch_and_tic_gov"
    description = "Arquitectura de Infraestructura & Gobierno TIC - Repository creation example with Terraform "
    
    visibility = "public"
    
    template {
        owner = "hashicorp"
        repository = "terraform-provider-scaffolding-framework"
        include_all_branches = false
    }
}

resource "github_branch" "development" {
    repository = "terraform_infra_arch_and_tic_gov"
    branch = "development"
	depends_on = [github_repository.terraform_infra_arch_and_tic_gov]
}

resource "github_branch" "release" {
    repository = "terraform_infra_arch_and_tic_gov"
    branch = "release"
	depends_on = [github_repository.terraform_infra_arch_and_tic_gov]
}

resource "github_branch" "feature" {
    repository = "terraform_infra_arch_and_tic_gov"
    branch = "feature"
	depends_on = [github_repository.terraform_infra_arch_and_tic_gov]
}