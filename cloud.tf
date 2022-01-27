terraform { 
  cloud {
    organization = "YourTFCloudOrgName"

    workspaces {
      name = "your-tfcloud-workspace-name"
    }
  }  
}
