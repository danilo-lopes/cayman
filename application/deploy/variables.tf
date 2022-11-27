variable applications_helm {
  description  = "Applications to deploy"
  type         = list(object({
    name       = string,
    version    = string,
    namespace  = string,
    chartName  = string
  }))

  default = [
    {
        name       = "web",
        version    = "v11",
        namespace  = "emojivoto",
        chartName  = "web"
    },
    {
        name       = "voting",
        version    = "v11",
        namespace  = "emojivoto",
        chartName  = "voting"
    },
    {
        name       = "vote-bot",
        version    = "v11",
        namespace  = "emojivoto",
        chartName  = "vote-bot"
    },
    {
        name       = "emoji",
        version    = "v11",
        namespace  = "emojivoto",
        chartName  = "emoji"
    },
  ]
}
