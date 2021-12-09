terraform {
  source = "git::ssh://git@xxxxxxxxxxxxxxxxxxxxx.git?ref=branch"
}

dependencies {
  paths = ["../eks"]
}

include {
  path = find_in_parent_folder()
}

inputs {
  cluster_name = "k8cluster-int"
}